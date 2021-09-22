module Rstd::RefineObject
  refine Object do

    def refine_method?(method)
      raise "Object#refine_method? is not supported" if RUBY_VERSION > "2.4" && "2.7" > RUBY_VERSION 
      if method.is_a?(Symbol)
        if self.respond_to?(method)
          method_obj = self.method(method)
          return method_obj.to_s =~ /refinement/ ? true : false
        else
          raise NotImplementedError, "#{method} is not implemented"
        end
      else
        raise ArgumentError, "you can given arguments only Symbol"
      end
    end

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