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
            while callback and wait(1) do
                for i, v in game:GetService('Players'):GetPlayers() do
                    local Character = v.Character or v.CharacterAdded:Wait()


                    if not Character:FindFirstChild('ESP') then
                        local a = Instance.new('Highlight', Character)


                        a.Name = 'ESP'
                        a.FillTransparency = 0.5
                        a.FillColor = Color3.new(1, 1, 1)
                        a.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        a.Adornee = Character
                    end
                end
            end
        else
            for i, v in game:GetService('Players'):GetPlayers() do
                local Character = v.Character or v.CharacterAdded:Wait()


                if Character:FindFirstChild('ESP') then
                    Character.ESP:Destroy()
                end
            end
        end
    end,
    HoverText = 'Apply ESP to ALL Selected Players'
})




Render.CreateOptionsButton({
    Name = 'BotESP',
    Function = function(callback) 
        if callback then
            while callback and wait(1) do
                local Bots = {}


                if game.PlaceId == 5661005779 then
                    for i, v in Workspace.PiggyNPC:GetChildren() do
                        if v and v.ClassName == 'Model' then
                            table.insert(Bots, v)
                        else
                            continue
                        end
                    end
                else
                    for i, v in Workspace.PeppaNPC:GetChildren() do
                        if v and v.ClassName == 'Model' then
                            table.insert(Bots, v)
                        else
                            continue
                        end
                    end
                end


                if not Bots[1] then
                    continue
                else
                    for i = 1, #Bots do
                        if not Bots[i]:FindFirstChild('ESP') then
                            local ESP = Instance.new('Highlight', Bots[i])


                            ESP.Adornee = Bots[i]
                            ESP.FillTransparency = 0.5
                            ESP.FillColor = Color3.new(1, 1, 1)
                            ESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            ESP.Name = 'ESP'


                            

                            local character = Bots[i]



                            local head = character:WaitForChild("Head")

                            -- Create BillboardGui
                            local billboardGui = Instance.new("BillboardGui")
                            billboardGui.Name = "NameTag"
                            billboardGui.Adornee = head
                            billboardGui.Size = UDim2.new(0, 200, 0, 50)
                            billboardGui.StudsOffset = Vector3.new(0, 2, 0)  -- Offset the BillboardGui above the player's head
                            billboardGui.AlwaysOnTop = true

                            -- Create TextLabel
                            local textLabel = Instance.new("TextLabel")
                            textLabel.Parent = billboardGui
                            textLabel.Size = UDim2.new(1, 0, 1, 0)
                            textLabel.BackgroundTransparency = 1
                            textLabel.Text = 'Bot'
                            textLabel.TextColor3 = Color3.new(1, 1, 1)  -- White text
                            textLabel.TextStrokeTransparency = 0.5
                        --    textLabel.TextScaled = true
                            textLabel.TextSize = 14.0

                            -- Parent the BillboardGui to the character's head
                            billboardGui.Parent = head
                        end
                    end
                end
            end
        else
            if game.PlaceId == 5661005779 then
                for i, v in Workspace.PiggyNPC:GetChildren() do
                    if v and v.ClassName == 'Model' then
                        if v:FindFirstChild('ESP') then
                            v:FindFirstChild('ESP'):Destroy()
                        end
                    end
                end
            else
                for i, v in Workspace.PeppaNPC:GetChildren() do
                    if v and v.ClassName == 'Model' then
                        if v:FindFirstChild('ESP') then
                            v:FindFirstChild('ESP'):Destroy()
                        end
                    end
                end
            end
        end
    end,
    HoverText = 'Apply ESP to Bots',
    Default = false
})











-- loadstring(game:HttpGet('https://raw.githubusercontent.com/SubnauticaLaserMain/OK/main/main2.lua', true))()


