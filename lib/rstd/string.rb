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
  end
end
