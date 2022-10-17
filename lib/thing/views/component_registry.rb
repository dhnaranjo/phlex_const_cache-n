require "singleton"

module Views
  class ComponentRegistry
    include Singleton

    def initialize
      @components = {}
    end

    def register(component)
      parts = component.name.split("::")
      path_pairs = parts.size.times.map { |n| [parts[0, n], parts[n, parts.size]] }
      root, *nested = path_pairs.map { |pair| pair.map(&method(:serialize))  }

      @components[root.last] = component
      nested.each do |(parent, child)|
        @components[parent] ||= {}
        @components[parent][child] = component
      end
    end

    def fetch(component_name, context)
      parts = context.name.split("::")
      part_count = parts.size
      component = part_count.times
                       .lazy
                       .map { |n| parts.first(parts.size - n) }
                       .map(&method(:serialize))
                       .reject { |path| @components[path].nil? }
                       .reject { |path| @components[path].is_a? Class }
                       .map { |path| @components[path][component_name] }
                       .find(&:itself)

      component ||= @components[component_name]
    end

    def serialize(parts)
      parts.join("_").to_sym
    end
  end
end
