Classes and code to use in presentation about functional programming
for the OK Ruby Group.

For the GeneticAlgorithm, run as:

    DummyGenome6 = DummyGenome.sized(6)
    ga = GeneticAlgorithm.new(10, 4) { DummyGenome6.new(rand(8)) }
    ga.run 10

