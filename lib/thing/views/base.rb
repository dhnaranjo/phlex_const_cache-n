require "phlex"

module Views
  class Base < Phlex::View
    def method_missing(name, *args, **kwargs, &block)
      klass = ComponentRegistry.instance.fetch(name, self.class)
      render klass.new(*args, **kwargs), &block
    end
  end
end
