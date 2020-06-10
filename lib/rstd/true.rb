module Rstd::RefineTrue
  refine TrueClass do
    def present?
      true
    end

    def blank?
      false
    end
  end
end
