module Rstd::RefineString
  refine String do
    def first(pos = 0)
      if pos > 0
        self[0..(pos - 1)]
      elsif pos < 0
        self[0..pos]
      else
        self[0]
      end
    end

    def last(pos = 0)
      if pos > 0
        pos > self.size ? self[0..-1] : self[-pos..-1]
      elsif pos < 0
        -pos > self.size ? "" : self[0..-(pos + 1)]
      else
        self[-1]
      end
    end

    def has?(pattern)
      self.include?(pattern)
    end
  end
end
