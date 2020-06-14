module Rstd::RefineFalse
  refine FalseClass do
    def present?
      false
    end
  end
end
