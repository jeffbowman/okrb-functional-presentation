Classes and code to use in presentation about functional programming
for the OK Ruby Group.

For the GeneticAlgorithm, run as:

    ga = GeneticAlgorithm.new(10, 4) { DummyGenome.new(rand(8)) }
    ga.run 10

