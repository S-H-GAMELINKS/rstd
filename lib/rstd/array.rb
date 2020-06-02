module Rstd
  refine Array do
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
  end
end
