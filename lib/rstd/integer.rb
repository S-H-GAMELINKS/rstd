module Rstd::RefineInteger
  refine Integer do
    def inc
      self.succ
    end

    def dec
      self.pred
    end

    def mod(num)
      self % num
    end
  end
end