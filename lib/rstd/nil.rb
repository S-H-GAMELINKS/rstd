module Rstd::RefineNilClass
  # @!method present?()
  #   +present?+ always return false.
  #
  #       v = nil
  #       v.present?
  #       # => false
  refine NilClass do
    def present?
      false
    end
  end

  # @!method blank?()
  #   +blank?+ always return false.
  #
  #       v = nil
  #       v.blank?
  #       # => false
  refine NilClass do
    def blank?
      true
    end
  end
end