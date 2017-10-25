module Lmx
  # builder = Lmx::Builder.new
  #
  # builder.build do
  #   node_catalog do
  #     node_book id: 1 do
  #       node_author { content 'Hugo, Victor' }
  #     end
  #   end
  # end
  #
  # or
  #
  # builder.build do
  #   node :catalog do
  #     node :book, id: 1 do
  #       node(:author) { content 'Hugo, Victor' }
  #     end
  #   end
  # end
  # => "<catalog><book id=\"1\"><author>Hugo, Victor</author></book></catalog>"
  class Builder
    attr_reader :xml

    def build(&block)
      @xml = ''
      instance_eval(&block)
    end

    def method_missing(m, *args, &block)
      node = match_node(m.to_s)
      return super unless node

      node(node, args[0] || {}, &block)
    end

    def respond_to_missing?(m, _include_private)
      m.to_s.start_with?(method_prefix) || super
    end

    private

    def add_node(name, attrs)
      start_node = "#{name} #{parse_attributes(attrs)}".strip

      @xml << "<#{start_node}>"
      yield if block_given?
      @xml << "</#{name}>"
    end

    def parse_attributes(attrs)
      attrs.each_with_object('') do |(k, v), obj|
        obj << "#{k}=\"#{v}\" "
      end.strip
    end

    def content(value)
      @xml << value
    end

    def match_node(name)
      name.to_s =~ /#{method_prefix}(.*)/
      Regexp.last_match[1]
    end

    def method_prefix
      'node_'
    end

    def node(name, **args, &block)
      add_node(name, args, &block)
    end
  end
end
