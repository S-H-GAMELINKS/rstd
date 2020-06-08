module Rstd::RefineNilClass
  refine NilClass do
    def present?
      false
    end

    def blank?
      true
    end
  end
end