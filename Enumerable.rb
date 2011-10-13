module Enumerable
  def random
    self[rand(size)]
  end

  def bits_to_int
    (0...size).inject(0) { |total, i| total + (self[i] * 2**i) }
  end
end
