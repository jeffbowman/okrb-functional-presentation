if $:.select { |element| element == File.dirname(__FILE__) }.size == 0
  $:.push(".")
end

require "Integer"
require "BitInt"

class DummyGenome < BitInt
  def reproduce(mates)
    mate = mates.random
    # uniform_crossover(mate).mutate(0.25)
    one_point_crossover = p_crossover(1)
    one_point_crossover[mate].mutate(0.25)
  end

  def fitness
    rand(65)
  end
end
