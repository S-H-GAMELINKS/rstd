module Rstd::RefineKernel
  refine Kernel do
    def refine_method(klass, method_id, expr)
      Module.new{
        refine klass do
          define_method method_id.to_sym do |*args|
            expr.call(args)
          end
        end
      }
    end
  end
end
