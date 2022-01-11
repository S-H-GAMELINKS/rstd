module Rstd::RefineKernel
  refine Kernel do
    def refine_method(klass, method_id, &expr)
      Module.new do
        refine klass do
          define_method method_id.to_sym, &expr
        end
      end
    end
  end

  # @!method import()
  # @param [Symbol|String] Class name(symbol or string).
  # @return [Array] return import Class's.
  #
  # @example import some class's.
  #       import('json', 'JSON::State', 'JSON::Parser') in [c1, c2]
  #       p c1.name
  #       # => "JSON::Ext::Generator::State"
  #       p c2.name
  #       # => "JSON::Ext::Parser"
  # @!scope module
  refine Kernel do
    def import(path, *import_classes)
      raise "Kernel#import is not supported" if RUBY_VERSION > "2.4" && "2.7" > RUBY_VERSION 
      require path

      klasses = []

      import_classes.each do |klass|
        klasses.unshift Object.const_get(klass)
      end

      return klasses.reverse
    end
  end
end
