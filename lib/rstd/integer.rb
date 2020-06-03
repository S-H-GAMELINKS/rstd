module Rstd::RefineInteger
  refine Integer do
    def inc
      self.succ
    end
  end
end