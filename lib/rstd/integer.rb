module Rstd::RefineInteger
  refine Integer do
    def inc
      self.succ
    end

    def dec
      self.pred
    end
  end
end