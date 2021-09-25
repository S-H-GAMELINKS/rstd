module Rstd::RefineArray
  refine Array do

    class << Array
      def refine_method(method_id, &expr)
        Module.new do
          refine Array do
            define_method(method_id, &expr)
          end
        end
      end
    end

    def first_last(length = 1, reversed: false)
      if reversed
        [self.first(length).reverse, self.last(length).reverse]
      else
        [self.first(length), self.last(length)]
      end
    end

    def rsum(length = self.length)
      self.last(length).sum
    end

    def lsum(length = self.length)
      self.first(length).sum
    end

    def rsort
      self.sort.reverse
    end

    def to_range
      0..(self.size - 1)
    end

    def delete_first(length = 1)
      self - self.first(length)
    end

    def delete_last(length = 1)
      self - self.last(length)
    end

    def all?(value)
      self.all_values_dup? && self.first == value
    end

    def all_values_dup?
      self.uniq.size == 1 ? true : false
    end

    def all_nil?
      self.all_values_dup? && self.uniq.first.nil?
    end

    def present?
      if self.empty? || self.all_nil?
        false
      else
        true
      end
    end

    def blank?
      !self.present?
    end

    def has?(value)
      self.include?(value)
    end

    def has_bool?
      self.include?(true) || self.include?(false)
    end

    def has_str?
      self.map{|v| v.is_a?(String) }.count(true) != 0
    end

    def has_num?
      self.map{|v| v.is_a?(Integer) || v.is_a?(Float) || v.is_a?(Complex) || v.is_a?(Rational)}.count(true) != 0
    end

    def has_nil?
      self.map{|v| v.is_a?(NilClass)}.count(true) != 0
    end
  end
end
