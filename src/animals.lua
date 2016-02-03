require "torch"

-- Species
antelop = 1
ape = 2
bat = 3
bear = 4
beetle = 5
butterfly = 6
camel = 7
cat = 8
crocodile = 9
dog = 10
dragonfly = 11
duck = 12
elephant = 13
frog = 14
giraffe = 15
grasshopper = 16
horse = 17
housefly = 18
hyena = 19
kangaroo = 20
lion = 21
moskito = 22
ostrich = 23
pelican = 24
penguin = 25
pig = 26
rabbit = 27
rat = 28
seaturtle = 29
skunk = 30
spider = 31
walrus = 32

snames = {
    "antelop",
    "ape",
    "bat",
    "bear",
    "beetle",
    "butterfly",
    "camel",
    "cat",
    "crocodile",
    "dog",
    "dragonfly",
    "duck",
    "elephant",
    "frog",
    "giraffe",
    "grasshopper",
    "horse",
    "housefly",
    "hyena",
    "kangaroo",
    "lion",
    "moskito",
    "ostrich",
    "pelican",
    "penguin",
    "pig",
    "rabbit",
    "rat",
    "seaturtle",
    "skunk",
    "spider",
    "walrus"
}

-- Properties
antlered = 1
articulations = 2
barks = 3
big = 4
bigears = 5
biting = 6
black = 7
blood = 8
brown = 9
climbing = 10
cns = 11
coldblooded = 12
curltail = 13
digging = 14
eatsanimals = 15
eatsanything = 16
eatscarrion = 17
eatsfish = 18
eatsflies = 19
eatsgarbage = 20
eatsgrass = 21
eggs = 22
eightlegged = 23
exoskeleton = 24
extremelysmall = 25
fatbody = 26
feathers = 27
feelerless = 28
feelers = 29
flying = 30
fourlegged = 31
fourwinged = 32
fur = 33
gibbous = 34
gnawteeth = 35
green = 36
grey = 37
hoofs = 38
humanlike = 39
jumping = 40
landliving = 41
lightbrown = 42
lissom = 43
livingoffspring = 44
longneck = 45
longnosed = 46
medium = 47
moving = 48
nervoussystem = 49
nib = 50
notflying = 51
oddtoed = 52
oxygenconsuming = 53
pairtoed = 54
pink = 55
pipetrakeas = 56
plates = 57
pouch = 58
proboscis = 59
robust = 60
ruminanting = 61
running = 62
shell = 63
shortnosed = 64
shorttail = 65
sixlegged = 66
small = 67
smellsterrible = 68
spine = 69
tail = 70
thinbody = 71
trakeas = 72
tusked = 73
twolegged = 74
twowinged = 75
warmblooded = 76
waterliving = 77
verybig = 78
verylongears = 79
verysmall = 80
white = 81
wingless = 82
wings = 83
yellow = 84

props = torch.zeros(32, 84)
function prop(index, ps)
    props[index]:indexFill(1, torch.LongTensor(ps), 1)
end

prop(bat, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, fur, livingoffspring, landliving, fourlegged, flying, eatsflies,
verysmall, grey, tail})

prop(rat, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, fur, livingoffspring, gnawteeth, tail, landliving, fourlegged,
eatsgarbage, small, brown})

prop(rabbit, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, fur, livingoffspring, landliving, fourlegged, jumping, shorttail,
eatsgrass, gnawteeth, verylongears, small, white})

prop(elephant, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, fur, livingoffspring, fourlegged, landliving, eatsgrass, robust,
bigears, proboscis, tusked, tail, verybig, grey})

prop(horse, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, fur, livingoffspring, fourlegged, hoofs, eatsgrass, landliving,
oddtoed, running, big, brown, tail})

prop(antelop, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, fur, livingoffspring, fourlegged, hoofs, shorttail, eatsgrass,
pairtoed, landliving, ruminanting, lissom, antlered, running, medium,
lightbrown})

prop(giraffe, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, fur, livingoffspring, fourlegged, hoofs, eatsgrass, pairtoed,
landliving, ruminanting, longneck, tail, big, yellow})

prop(camel, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, fur, livingoffspring, fourlegged, hoofs, eatsgrass, pairtoed,
landliving, gibbous, tail, big, yellow})

prop(pig, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, fur, livingoffspring, fourlegged, hoofs, eatsgrass, pairtoed,
landliving, digging, tail, curltail, big, pink})

prop(walrus, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, fur, livingoffspring, fourlegged, eatsanimals, waterliving,
tusked, verybig, brown})

prop(skunk, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, fur, livingoffspring, fourlegged, landliving, eatscarrion, tail,
smellsterrible, medium, black})

prop(hyena, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, fur, livingoffspring, fourlegged, landliving, longnosed,
shorttail, eatscarrion, medium, brown})

prop(dog, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, fur, livingoffspring, fourlegged, eatsanimals, landliving,
longnosed, tail, lissom, medium, brown, barks})

prop(bear, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, fur, livingoffspring, fourlegged, shorttail, eatsanimals,
landliving, longnosed, robust, big, brown})

prop(lion, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, fur, livingoffspring, fourlegged, eatsanimals, landliving,
shortnosed, tail, lissom, climbing, big, yellow})

prop(cat, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, fur, livingoffspring, fourlegged, eatsanimals, landliving,
shortnosed, tail, lissom, climbing, small, black})

prop(ape, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, fur, livingoffspring, landliving, shorttail, eatsanything,
twolegged, shortnosed, humanlike, big, black})

prop(kangaroo, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, fur, landliving, fourlegged, livingoffspring, pouch, jumping,
eatsgrass, medium, tail, lightbrown})

prop(duck, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, wings, nib, twolegged, feathers, eggs, flying, eatsgrass, small,
white})

prop(pelican, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, wings, nib, twolegged, feathers, eggs, flying, eatsfish, medium,
white})

prop(penguin, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, wings, nib, twolegged, feathers, eggs, notflying, eatsfish,
waterliving, small, black})

prop(ostrich, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
warmblooded, wings, nib, twolegged, feathers, eggs, notflying, eatsgrass,
running, big, black})

prop(crocodile, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
coldblooded, eggs, tail, waterliving, fourlegged, plates, eatsanimals, brown,
big, tail})

prop(seaturtle, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
coldblooded, eggs, tail, shell, fourlegged, eatsgrass, waterliving, big,
brown})

prop(frog, {oxygenconsuming, moving, nervoussystem, spine, cns, blood,
coldblooded, waterliving, fourlegged, eggs, verysmall, jumping, eatsflies,
green})

prop(housefly, {oxygenconsuming, moving, nervoussystem, exoskeleton,
articulations, eggs, extremelysmall, trakeas, feelers, sixlegged, wings,
flying, proboscis, twowinged, fatbody, black})

prop(moskito, {oxygenconsuming, moving, nervoussystem, exoskeleton,
articulations, eggs, extremelysmall, trakeas, feelers, sixlegged, wings,
flying, proboscis, twowinged, thinbody, lightbrown})

prop(butterfly, {oxygenconsuming, moving, nervoussystem, exoskeleton,
articulations, eggs, extremelysmall, trakeas, feelers, sixlegged, wings,
flying, proboscis, fourwinged, fatbody, yellow})

prop(beetle, {oxygenconsuming, moving, nervoussystem, exoskeleton,
articulations, eggs, extremelysmall, trakeas, feelers, sixlegged, wings,
flying, biting, fourwinged, fatbody, black, shell})

prop(dragonfly, {oxygenconsuming, moving, nervoussystem, exoskeleton,
articulations, eggs, extremelysmall, trakeas, feelers, sixlegged, wings,
flying, biting, fourwinged, thinbody, brown})

prop(grasshopper, {oxygenconsuming, moving, nervoussystem, exoskeleton,
articulations, eggs, extremelysmall, trakeas, feelers, sixlegged, wings,
fourwinged, flying, biting, jumping, fatbody, green})

prop(spider, {oxygenconsuming, moving, nervoussystem, exoskeleton,
articulations, eggs, extremelysmall, wingless, pipetrakeas, feelerless,
eightlegged, fatbody, black})