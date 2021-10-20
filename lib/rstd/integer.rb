module Rstd::RefineInteger
  # @!method refine_method()
  # @param [Symbol] method_id define method symbol.
  # @yield method implements.
  # @return [Module] return refined module.
  #
  # @example Dynamic refine method.
  #       using Integer.refine_method(:halo){ puts "halo" }
  #       42.halo
  #       # => "halo"
  # @!scope module
  refine Integer do
    class << Integer
      def refine_method(method_id, &expr)
        Module.new do
          refine Integer do
            define_method(method_id, &expr)
          end
        end
      end
    end
  end

  # @!method inc()
  #   +inc+ always return increments value.
  #
  #       41.inc
  #       # => 42
  refine Integer do
    def inc
      self.succ
    end
  end

  # @!method dec()
  #   +dec+ always return decrements value.
  #
  #       43.inc
  #       # => 42
  refine Integer do
    def dec
      self.pred
    end
  end

  # @!method mod(other)
  #   +mod+ return +self+ modulo +other+ as real number value.
  #
  #       42.mod(40)
  #       # => 2
  refine Integer do
    def mod(num)
      self % num
    end
  end

  # @!method pow(num = 2)
  #   +pow+ return power of +self+ value.
  #
  #       7.(3)
  #       # => 343
  refine Integer do
    def pow(num = 2)
      self**num
    end
  end
end