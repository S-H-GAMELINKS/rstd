module Rstd::RefineNilClass
  refine NilClass do
    def present?
      false
    end
  end
end