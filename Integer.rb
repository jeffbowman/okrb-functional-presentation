require "Enumerable"

class Integer
  def bit_size
    raise "bit_size only valid for positive integers" if self < 0
    to_s(2).size
  end

  def uniform_crossover(other)
    max_bit_size = [self.bit_size, other.bit_size].max
    decison = rand(2**max_bit_size)
    crossover_when(other) { |i| decison[i] == 0 }
  end

  def p_crossover(n)
    ->(other) {
      possible_points = (0...self.bit_size).to_a
      points = []
      n.times { points.push(possible_points.delete_at(rand(possible_points.size))) }
      crossover_when(other) { |i| points.include?(i) }
    }
  end
  
  def point_crossover(other, n)
    p_crossover(n)[other]
  end

  def crossover_when(other)
    max_bit_size = [self.bit_size, other.bit_size].max
    one, two = self, other
    result = (0...max_bit_size).inject(0) do |total, i|
      one, two = two, one if  yield(i)
      total + (2**i * one.to_i[i])
    end
  end

  def mutate(prob)
    decistion = rand(2**bit_size)
    mutated = (0...bit_size).map{ |i| decistion[i] == 0 ? self[i] : self[i] ^ 1 }
    mutated.bits_to_int
  end
end
