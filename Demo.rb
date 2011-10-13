if $:.select { |element| element == File.dirname(__FILE__) }.size == 0
  $:.push(".")
end

require "Integer"
require "BitInt"
require "DummyGenome"
require "GeneticAlgorithm"

DG6 = DummyGenome.sized(6)
ga = GeneticAlgorithm.new(10, 4) { DG6.new(rand(8)) }
puts "#{ga.run 10}"
