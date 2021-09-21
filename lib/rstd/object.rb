module Rstd::RefineObject
  refine Object do
    def present?
      true
    end

    def blank?
      false
    end

    def true?
      true
    end

    def false?
      false
    end
  end
end