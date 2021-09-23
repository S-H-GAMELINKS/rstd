module Rstd::RefineKernel
  refine Kernel do
    def refine_method(klass, method_id, expr)
      Module.new do
        refine klass do
          define_method method_id.to_sym, expr
        end
      end
    end
  end
end
