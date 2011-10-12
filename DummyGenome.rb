class DummyGenome < BitInt
  def initialize(bits)
    self.sized(bits)
  end
  
  def reproduce(mates)
    mate = mates.random
    uniform_crossover(mate).mutate(0.25)
  end

  def fitness
    rand(65)
  end
end
