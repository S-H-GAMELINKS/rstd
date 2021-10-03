module Rstd::RefineTrue
  # @!method refine_method()
  # @param [Symbol] method_id define method symbol.
  # @yield method implements.
  # @return [Module] return refined module.
  #
  # @example Dynamic refine method.
  #       using TrueClass.refine_method(:halo){ puts "halo" }
  #       true.halo
  #       # => "halo"
  # @!scope module
  refine TrueClass do
    class << TrueClass
      def refine_method(method_id, &expr)
        Module.new do
          refine TrueClass do
            define_method(method_id, &expr)
          end
        end
      end
    end
  end

  # @!method present?()
  #   +present?+ always return true.
  #
  #       v = true
  #       v.present?
  #       # => true
  refine TrueClass do
    def present?
      true
    end
  end

  # @!method blank?()
  #   +blank?+ always return false.
  #
  #       v = true
  #       v.blank?
  #       # => false
  refine TrueClass do
    def blank?
      false
    end
  end

  # @!method true?()
  #   +true?+ always return false.
  #
  #       v = true
  #       v.true?
  #       # => true
  refine TrueClass do
    def true?
      true
    end
  end
end
