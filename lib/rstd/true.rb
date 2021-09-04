module Rstd::RefineTrue
  refine TrueClass do
    def present?
      true
    end

    def blank?
      false
    end

    def true?
      true
    end
  end
end
