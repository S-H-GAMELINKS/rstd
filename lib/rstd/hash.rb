module Rstd::RefineHash

  # @!method refine_method()
  # @param [Symbol] method_id define method symbol.
  # @yield method implements.
  # @return [Module] return refined module.
  #
  # @example Dynamic refine method.
  #       using Hash.refine_method(:halo){ puts "halo" }
  #       {}.halo
  #       # => "halo"
  # @!scope module
  refine Hash do
    class << Hash
      def refine_method(method_id, &expr)
        Module.new do
          refine Hash do
            define_method(method_id, &expr)
          end
        end
      end
    end
  end

  # @!method has_pair?()
  #   +has_pair?+ check to if hash instance has key and value pair.
  #
  #       {:key => 42}.has_pair?(:key, 42)
  #       # => true
  refine Hash do
    def has_pair?(key, value)
      has_key?(key) && has_value?(value)
    end
  end
end