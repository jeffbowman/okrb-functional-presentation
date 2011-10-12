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

  def point_crossover(other, n)
    possible_points = (0...bit_size).to_a
    points = []
    n.times { points.push(possible_points.delete_at(rand(possible_points.size))) }
    crossover_when(other) { |i| points.include?(i) }
  end
  

  def one_point_crossover(other)
    point_crossover(other, 1)
  end
  def two_point_crossover(other)
    point_crossover(other, 2)
  end

  # def self.p_crossover(n)
  #   ->(other) {
  #     possible_points = (0...bit_size).to_a
  #     points = []
  #     n.times { points.push(possible_points.delete_at(rand(possible_points.size))) }
  #     crossover_when(other) { |i| points.include?(i) }
  #   }
  # end
  
  # def point_crossover(other, n)
  #   p_crossover(n)[other]
  # end

  # @one_point_crossover = p_crossover(1)
  # @two_point_crossover = p_crossover(2)
  
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
