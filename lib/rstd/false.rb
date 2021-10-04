module Rstd::RefineFalse

  # @!method present?()
  #   +present?+ always return false.
  #
  #       v = false
  #       v.present?
  #       # => false
  refine FalseClass do
    def present?
      false
    end
  end

  # @!method blank?()
  #   +blank?+ always return true.
  #
  #       v = false
  #       v.blank?
  #       # => true
  refine FalseClass do
    def blank?
      true
    end
  end
end
