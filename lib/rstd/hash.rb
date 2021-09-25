module Rstd::RefineHash
  refine Hash do

    class << Hash
      def refine_method(method_id, &expr)
        Module.new do
          refine Hash do
            define_method(method_id, &expr)
          end
        end
      end
    end

    def has_pair?(key, value)
      has_key?(key) && has_value?(value)
    end
  end
end