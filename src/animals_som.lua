require "animals"
require "torch"

animals = 32
attribs = 84
rows = 100 -- number of output nodes
weights = torch.randn(rows, attribs)

eta = 0.2
epochs = 30
neighborhood = 50
step = neighborhood / epochs

-- Return row index for closest distance to attribute vector.
function closest(p, weights, rows)
    local distances = torch.zeros(rows)
    for row = 1, rows do
        distances[row] = torch.sum(torch.pow(p - weights[row], 2))
    end
    _, i = torch.min(distances, 1)
    return torch.squeeze(i)
end

for epoch = 1, epochs do
    for a = 1, animals do
        -- find row in weight matrix which has the shortest distance to
        -- attribute vector p
        local p = props[a]
        local i = closest(p, weights, rows)
        -- decrease number of neighbors to update at each epoch
        local neighbors = math.floor(neighborhood - (epoch * step))
        local nstart = math.max(1, i - neighbors)
        local nend = math.min(rows, i + neighbors)
        -- update weights
        for n = nstart, nend do
            weights[n] = weights[n] + (p - weights[n]) * eta
        end
    end
end

-- closest row for each animal attribute vector.
local pos = torch.zeros(animals)
for a = 1, animals do
    pos[a] = closest(props[a], weights, rows)
end

-- convert values in position array to array of indices which prints values in
-- the position array in order
local order = {}
for i = 1, rows do
    local indices = pos:eq(i)
    for j = 1, indices:size()[1] do
        if indices[j] == 1 then
            table.insert(order, j)
        end
    end
end

-- print animale names, animals that are similar will be close in the list
for a = 1, animals do
    print(snames[order[a]])
end
