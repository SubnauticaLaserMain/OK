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
