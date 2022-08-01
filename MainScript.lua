--[[local Config = {
    Headless = true,
    Korblox = true, -- ONLY R15

    FakeName = "Protected",
    FakeId = 1, -- input id
}
]]

oldUserId = game.Players.LocalPlayer.UserId
oldName = game.Players.LocalPlayer.Name
oldDisplayName = game.Players.LocalPlayer.DisplayName

for i,v in next, game:GetDescendants() do
if v:IsA("TextBox") or v:IsA("TextLabel") or v:IsA("TextButton") then
if string.find(v.Text,oldName) or string.find(v.Text,oldDisplayName) or string.find(v.Text,oldUserId) then
v.Text = Config.FakeName
end
elseif v.Name == oldName or v.Name == oldDisplayName or v.Name == oldUserId then
    v.Name = Config.FakeName
end
end
game.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("TextBox") or descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
        if string.find(descendant.Text,oldName) or string.find(descendant.Text,oldDisplayName) or string.find(descendant.Text,oldUserId) then
            descendant.Text = Config.FakeName
        end
     elseif descendant.Name == oldName or descendant.Name == oldDisplayName or descendant.Name == oldUserId then
        descendant.Name = Config.FakeName
     end
end)
--[[
game.Players.LocalPlayer.Name = getgenv().FakeName
]]
game.Players.LocalPlayer.DisplayName = Config.FakeName
game.Players.LocalPlayer.CharacterAppearanceId = Config.FakeId
--[[
game.Players.LocalPlayer.Character.Name = getgenv().FakeName
game.Players.LocalPlayer.UserId = getgenv().UserId
]]

if game.Players.LocalPlayer.Character:FindFirstChild("Head") and Config.Headless == true then
    while wait(2) do
    workspace:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("Head")
    game.Players.LocalPlayer.Character.Head.Transparency = 1
    if game.Players.LocalPlayer.Character:FindFirstChild("Head"):FindFirstChildOfClass("Decal") then
    game.Players.LocalPlayer.Character.Head:FindFirstChildOfClass("Decal"):Destroy()
    end
end
end

if workspace:WaitForChild(game.Players.LocalPlayer.Name):FindFirstChild("Left Leg") and Config.Korblox == true and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").RigType == "R15" then
while wait(3) do
    workspace:WaitForChild(game.Players.LocalPlayer.Name)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CF-Trail/NameHider/main/CharacterAppearance/FakeKorblox"))()
end
end
