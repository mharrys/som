require "cities"
require "gnuplot"
require "torch"

cities = 10
rows = 12 -- number of output nodes
weights = torch.randn(rows, 2) * 0.5

eta = 0.3
epochs = 80
neighborhood = (torch.ones(2) * 5):cat(torch.ones(3) * 2):cat(torch.ones(4)):cat(torch.zeros(71))

-- Return row index for closest distance to attribute vector.
function closest(p, weights, rows)
    local distances = torch.zeros(rows)
    for row = 1, rows do
        distances[row] = torch.sum(torch.pow(p - weights[row], 2))
    end
    _, i = torch.min(distances, 1)
    return torch.squeeze(i)
end

-- Return tour from weights that connects first and last point.
function tourcycle(weights, rows)
    local tour = torch.Tensor(rows + 1, 2)
    tour[{{1, rows}}] = weights
    tour[rows + 1] = tour[1]
    return tour
end

-- Return tour from weights that are closest to the cities.
function tourfinal(weights, rows, city, cities)
    local tour = torch.zeros(cities + 1, 2)
    local current = 1
    for row = 1, rows do
        local w = weights[row]
        for c = 1, cities do
            local p = city[c]
            local d = torch.sum(torch.pow(p - w, 2))
            if d < 1e-3 then
                tour[current] = w
                current = current + 1
                break
            end
        end
        if current > cities + 1 then break end
    end
    tour[cities + 1] = tour[1]
    -- remove points that did not make it close enough
    tour = tour[tour:ne(0)]
    return tour:reshape(tour:size()[1] / 2, 2)
end

for epoch = 1, epochs do
    for c = 1, cities do
        -- find row in weight matrix which has the shortest distance to
        -- attribute vector p
        local p = city[c]
        local i = closest(p, weights, rows)
        -- update weights in neighborhood
        local neighbors = neighborhood[epoch]
        for n = (i - neighbors), (i + neighbors) do
            ncirc = n % rows
            ncirc = ncirc == 0 and rows or ncirc -- first and last are neighbors
            weights[ncirc] = weights[ncirc] + (p - weights[ncirc]) * eta
        end
    end
    -- prevent attempts to capture more than one city
    if epoch > epochs * 0.5 then
        local capturer = {}
        for c = 1, cities do
            local p = city[c]
            capturer[c] = closest(p, weights, rows)
        end
        table.sort(capturer)
        for c = 2, cities do
            if capturer[c - 1] == capturer[c]  then
                local row = capturer[c]
                local r = torch.randn(2) * 0.01
                weights[row] = weights[row] + r
            end
        end
    end
    gnuplot.title("SOM: Current tour")
    gnuplot.axis({0, 1, 0, 1})
    gnuplot.plot({tourcycle(weights, rows)}, {city, "+"})
    os.execute("sleep 0.05") -- slow down for plot animation
end

local tour = tourfinal(weights, rows, city, cities)
if tour:size()[1] ~= cities + 1 then
    print("#error: could not find complete tour")
else
    gnuplot.title("SOM: Final tour")
    gnuplot.axis({0, 1, 0, 1})
    gnuplot.plot({tourcycle(weights, rows)}, {city, "+"}, {tour, "-"})
end
