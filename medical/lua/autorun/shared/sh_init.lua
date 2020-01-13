function chance(min, max) -- Add to shared
    rand = math.random(min, max)
    if rand == min then -- We use min because it is a constant that will always give us the correct value
        return true
    else 
        return false
    end
end