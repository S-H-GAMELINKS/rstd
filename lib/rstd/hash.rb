module Rstd::RefineHash
  refine Hash do
    def has_pair?(key, value)
      has_key?(key) && has_value?(value)
    end
  end
end