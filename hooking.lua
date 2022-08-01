if newcclosure then
local gmt = getrawmetatable(game)
local oldIndex = gmt.__index
setreadonly(gmt,false)

gmt.__index = newcclosure(function(Self,Key)
if tostring(Self) == "Head" and tostring(Key) == "Transparency" then
    return 0
elseif Self == game.Players.LocalPlayer and tostring(Key) == "Name" then
      return game:GetService("Players").LocalPlayer.Name
end
return oldIndex(Self,Key)
end)
  
elseif protect_function then
    local gmt = getrawmetatable(game)
    local oldIndex = gmt.__index
    setreadonly(gmt,false)

    gmt.__index = protect(function(Self,Key)
if tostring(Self) == "Head" and tostring(Key) == "Transparency" then
   return 0
elseif Self == game.Players.LocalPlayer and tostring(Key) == "Name" then
      return game:GetService("Players").LocalPlayer.Name
end
return oldIndex(Self,Key)
end)
end
