module Rstd::RefineTrue
  refine TrueClass do

    class << TrueClass
      def refine_method(method_id, &expr)
        Module.new do
          refine TrueClass do
            define_method(method_id, &expr)
          end
        end
      end
    end

    def present?
      true
    end

    def blank?
      false
    end

    def true?
      true
    end
  end
end
