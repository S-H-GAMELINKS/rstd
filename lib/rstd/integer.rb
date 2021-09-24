module Rstd::RefineInteger
  refine Integer do

    class << Integer
      def refine_method(method_id, &expr)
        Module.new do
          refine Integer do
            define_method(method_id, &expr)
          end
        end
      end
    end

    def inc
      self.succ
    end

    def dec
      self.pred
    end

    def mod(num)
      self % num
    end

    def pow(num = 2)
      self**num
    end
  end
end