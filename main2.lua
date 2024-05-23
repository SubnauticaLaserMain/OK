local Workspace = game:GetService('Workspace')
local Camera = Workspace.CurrentCamera
local worldToViewportPoint = Camera.worldToViewportPoint


shared.VapeIndependent = true
shared.CustomSaveVape = "name of file to save"
local GuiLibrary = loadstring(game:HttpGet('https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua', true))()


local Combat = GuiLibrary.ObjectsThatCanBeSaved.CombatWindow.Api
local Blatant = GuiLibrary.ObjectsThatCanBeSaved.BlatantWindow.Api
local Render = GuiLibrary.ObjectsThatCanBeSaved.RenderWindow.Api
local Utility = GuiLibrary.ObjectsThatCanBeSaved.UtilityWindow.Api
local World = GuiLibrary.ObjectsThatCanBeSaved.WorldWindow.Api



local IsLoaded = false



Render.CreateOptionsButton({
    Name = 'ItemESP',
    Function = function(callback)
        if callback then
            while callback and task.wait(1) do
                local a = Workspace:getDescendants()
                local items = {}


                --- First Check
                for i = 1, #a do
                    if a[i].Name == 'ItemPickupScript' and a[i].Parent:findFirstChild('ClickDetector') then
                        table.insert(items, a[i].Parent)
                    end
                end






                for i = 1, #items do
                    if not items[i]:FindFirstChild('ESP') then
                        local Hilight = Instance.new('Highlight', items[i])


                        Hilight.Name = 'ESP'
                        Hilight.Adornee = items[i]
                        Hilight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        Hilight.FillTransparency = 0.5
                        Hilight.FillColor = items[i].Color
                    end
                end
            end
        else
            local a = Workspace:getDescendants()
            local items = {}


            --- First Check
            for i = 1, #a do
                if a[i].Name == 'ItemPickupScript' and a[i].Parent:findFirstChild('ClickDetector') then
                    table.insert(items, a[i].Parent)
                end
            end


            for i = 1, #items do
                if items[i]:FindFirstChild('ESP') then
                    items[i].ESP:Destroy()
                end
            end
        end
    end,
    HoverText = 'Apply ESP to Items',
    Default = false
})




local PlayerEnabled = {Enabled = true}
local PiggySelected = {Enabled = true}



local PlayerESP = Render.CreateOptionsButton({
    Name = 'ESP',
    Function = function(callback)
        if callback then
            local IsPlayer = false


            for i, v in Workspace.PeppaNPC:GetChildren() do
                if v and v.ClassName == 'Model' then
                    IsPlayer = false
                    break
                else
                    IsPlayer = true
                    break
                end
            end


            if IsPlayer then
                local Piggy = {}


                for i, v in game:GetService('Players'):GetPlayers() do
                    local Humanoid = v.Character:WaitForChild('Humanoid', 10)


                    if Humanoid.Health == math.huge then
                        table.insert(Piggy, v)
                    end
                end



                if Piggy then
                    while wait(1) do
                        for i = 1, #Piggy do
                            if not Piggy[i]:FindFirstChild('ESP') then
                                local Hilight = Instance.new('Highlight', Piggy[i])

                                Hilight.Adornee = Piggy[i]
                                Hilight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                Hilight.FillTransparency = 0.5
                                Hilight.FillColor = Color3.new(1, 1, 1)
                                Hilight.Name = 'ESP'
                            end
                        end
                    end
                end
            else
                local Piggy = {}


                for i, v in Workspace.PeppaNPC:GetChildren() do
                    if v and v.ClassName == 'Model' then
                        table.insert(Piggy, v)
                    end
                end


                if Piggy then
                    while wait(1) do
                        for i = 1, #Piggy do
                            if not Piggy[i]:FindFirstChild('ESP') then
                                local Hilight = Instance.new('Highlight', Piggy[i])

                                Hilight.Adornee = Piggy[i]
                                Hilight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                Hilight.FillTransparency = 0.5
                                Hilight.FillColor = Color3.new(1, 1, 1)
                                Hilight.Name = 'ESP'
                            end
                        end
                    end
                end
            end
        else
            for i, v in Workspace:getDescendants() do
                if v.Name == 'ESP' and v.ClassName == 'Highlight' then
                    v:Destroy()
                    break
                end
            end
        end
    end,
    HoverText = 'Apply ESP to ALL Selected Players'
})




PlayerEnabled = PlayerESP.CreateToggle({
    Name = 'Players',
    Function = function(callback) end,
    HoverText = 'Apply to Players',
    Default = true
})



PiggySelected = PlayerESP.CreateToggle({
    Name = 'Piggys',
    Function = function(callback) end,
    HoverText = 'Apply to Piggy(s)',
    Default = true
})









-- loadstring(game:HttpGet('https://raw.githubusercontent.com/SubnauticaLaserMain/OK/main/main2.lua', true))()


