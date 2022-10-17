module Views
  module Components
    class Heading < Base
      include RegisterableComponent

      def template(&)
        ActualHeading(&)
        Components_ActualHeading(&)
        Views_Components_ActualHeading(&)
      end
    end
  end
end
