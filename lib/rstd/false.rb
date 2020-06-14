module Rstd::RefineFalse
  refine FalseClass do
    def present?
      false
    end

    def blank?
      true
    end
  end
end
