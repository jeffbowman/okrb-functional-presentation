require "delegate"

class BitIntAbuseError; end

class BitInt < DelegateClass(Integer)
  def self.sized(bits)
    subclass = Class.new(self)
    subclass.const_set(:BIT_SIZE, bits)
    return subclass
  end

  def initialize(value)
    raise BitIntAbuseError.new("Please subclass BitInt!") if self.class == BitInt
    raise BitIntAbuseError.new("BitInt values must be positive") if value.to_i < 0
    super(value)
  end
  
  def bit_size
    self.class::BIT_SIZE
  end

  def uniform_crossover(other); self.class.new(super(other)); end
  def p_crossover(other); self.class.new(super(other)); end
  def point_crossover(other, n); self.class.new(super(other, n)); end
  def mutate(prob); self.class.new(super(prob)); end
end
