print("loading")
local plr = game.Player.LocalPlayer
local backpack = plr.Character
local tools = backpack:GetChildren()
local Gun = nil

local ZombieFolder = game.workspace:WaitForChild("Zombie Storage")

for i = 1, #tools do
  print(tools[i].Name)
  if tools[i]:FindFirstChild("GunController") then
    Gun = tools[i]
    break
  end
  wait(0.01)
end

if tools[i] == nil then
  print("you have no guns equiped")
else
  print("Firing")
  while wait(0.001) do
local zombies = ZombieFolder:GetChildren()
  for i = 1,#zombies do
      wait(0.001)

    local args = {
      [1] = {
        ["LaserProperties"] = {
            [1] = {
                [1] = Enum.Material.Plastic,
                [2] = BrickColor.new(1009),
                [3] = Vector3.new(0.5942633748054504, 0.35889309644699097, -0.719754695892334),
                [4] = CFrame.new(-462.7703857421875, 16.48139190673828, -699.1487426757812, 0.7711131572723389, -0.2285100519657135, -0.5942790508270264, -1.4901159417490817e-08, 0.9333765506744385, -0.3588986396789551, 0.6366980671882629, 0.27675145864486694, 0.7197390198707581),
                [5] = Vector3.new(-460.8253479003906, 17.656057357788086, -701.5045166015625),
                [6] = 90,
                [7] = true,
                [8] = Vector3.new(-0.46408265829086304, 0.07861568033695221, 0.8822963237762451)
            }
        },
          ["RealTool"] = game:GetService("Players").LocalPlayer.Character:FindFirstChild(Gun.Name),
          ["Tool"] = game:GetService("Players").LocalPlayer.Character:FindFirstChild(Gun.Name),
          ["HumanoidTables"] = {
              [1] = {
                  ["HeadHits"] = 2,
                  ["THumanoid"] = zombies[i]:WaitForChild("Humanoid")
                  ["BodyHits"] = 0
              }
          }
      }
  }

  game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WeaponEvent"):FireServer(unpack(args))
  end
  end
end
