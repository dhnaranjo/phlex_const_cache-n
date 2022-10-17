module Views
  module RegisterableComponent
    def self.included(base)
      ComponentRegistry.instance.register(base)
    end
  end
end
