module Views
  module Components
    class ActualHeading < Base
      include RegisterableComponent

      def template(&)
        h1(style: "color: red;", &)
      end
    end
  end
end
