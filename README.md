# Self-Organizing Maps
Small experiments with self-organizing map (SOM) in Torch7.

# Cyclic Tour
Let SOM use a 2D-grid in order to find a tour in the travelling salesman
problem.

![tsp](https://github.com/mharrys/som/raw/master/img/tsp_demo.gif)

# Topological Ordering of Animal Species
Consider the following species in lexical order:

    antelop
    ape
    bat
    bear
    beetle
    butterfly
    camel
    cat
    crocodile
    dog
    dragonfly
    duck
    elephant
    frog
    giraffe
    grasshopper
    horse
    housefly
    hyena
    kangaroo
    lion
    moskito
    ostrich
    pelican
    penguin
    pig
    rabbit
    rat
    seaturtle
    skunk
    spider
    walrus

Let SOM assign a natural order to objects characterized by a large number of
attributes:

    grasshopper
    beetle
    dragonfly
    butterfly
    moskito
    housefly
    spider
    duck
    pelican
    penguin
    ostrich
    frog
    seaturtle
    crocodile
    walrus
    bear
    hyena
    dog
    lion
    cat
    ape
    skunk
    rat
    bat
    elephant
    kangaroo
    rabbit
    antelop
    horse
    pig
    camel
    giraffe

Note for example that the insects are now sorted close together.

References
==========
KTH notes.
