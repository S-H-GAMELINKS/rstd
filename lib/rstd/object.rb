module Rstd::RefineObject
  refine Object do
    def present?
      true
    end

    def blank?
      false
    end
  end
end