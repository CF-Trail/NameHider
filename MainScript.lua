if not getgenv().Config then
    getgenv().Config = {
    Headless = true,

    FakeName = "Protected",
    FakeId = 1, -- input id
}
end
oldUserId = game:GetService("Players").LocalPlayer.UserId
oldName = game:GetService("Players").LocalPlayer.Name
oldDisplayName = game:GetService("Players").LocalPlayer.DisplayName

for i,v in next, game:GetDescendants() do
if v:IsA("TextBox") or v:IsA("TextLabel") or v:IsA("TextButton") then
if string.find(v.Text,oldName) or string.find(v.Text,oldDisplayName) or string.find(v.Text,oldUserId) then
v.Text = getgenv().Config.FakeName
end
elseif v.Name == oldName or v.Name == oldDisplayName or v.Name == oldUserId then
    v.Name = getgenv().Config.FakeName
end
end
game.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("TextBox") or descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
        descendant.Changed:Connect(function()
            if string.find(descendant.Text,oldName) or string.find(descendant.Text,oldDisplayName) or string.find(descendant.Text,oldUserId) then
                descendant.Text = getgenv().Config.FakeName
            end
         end)
        if string.find(descendant.Text,oldName) or string.find(descendant.Text,oldDisplayName) or string.find(descendant.Text,oldUserId) then
            descendant.Text = getgenv().Config.FakeName
        end
     elseif descendant.Name == oldName or descendant.Name == oldDisplayName or descendant.Name == oldUserId then
        descendant.Name = getgenv().Config.FakeName
     end
end)

for i,v in next, game:GetDescendants() do
    if v:IsA("TextBox") or v:IsA("TextLabel") or v:IsA("TextButton") then
       v.Changed:Connect(function(property)
            if string.find(v.Text,oldName) or string.find(v.Text,oldDisplayName) or string.find(v.Text,oldUserId) then
                v.Text = getgenv().Config.FakeName
            end
       end)
    end
end
--[[
game.Players.LocalPlayer.Name = getgenv().FakeName
]]
game:GetService("Players").LocalPlayer.DisplayName = getgenv().Config.FakeName
game:GetService("Players").LocalPlayer.CharacterAppearanceId = getgenv().Config.FakeId
--[[
game.Players.LocalPlayer.Character.Name = getgenv().FakeName
game.Players.LocalPlayer.UserId = getgenv().UserId
]]

if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Head") and getgenv().Config.Headless == true then
    while wait(2) do
    workspace:WaitForChild(game:GetService("Players").LocalPlayer.Name):WaitForChild("Head")
    game:GetService("Players").LocalPlayer.Character.Head.Transparency = 1
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Head"):FindFirstChildOfClass("Decal") then
    game:GetService("Players").LocalPlayer.Character.Head:FindFirstChildOfClass("Decal"):Destroy()
    end
end
end
