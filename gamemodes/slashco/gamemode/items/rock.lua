local SlashCoItems = SlashCoItems

SlashCoItems.Rock = {}
SlashCoItems.Rock.Model = "models/slashco/items/rock.mdl"
SlashCoItems.Rock.Name = "The Rock"
SlashCoItems.Rock.EntClass = "sc_rock"
SlashCoItems.Rock.Icon = "slashco/ui/icons/items/item_7"
SlashCoItems.Rock.Price = 30
SlashCoItems.Rock.Description = "An ornamented stone of crude plutonium.\nWhile it's held, your footsteps will not make any noise, however\nyou will be unable to sprint."
SlashCoItems.Rock.CamPos = Vector(50,0,0)
SlashCoItems.Rock.ChangesSpeed = true
SlashCoItems.Rock.IsSpawnable = true
SlashCoItems.Rock.OnDrop = function(ply)
    SlashCoItems.Rock.OnSwitchFrom(ply)
    local droppeditem = SlashCo.CreateItem(SlashCoItems.Rock.EntClass, ply:LocalToWorld(Vector(0, 0, 60)), ply:LocalToWorldAngles(Angle(0, 0, 0)))
    Entity(droppeditem):GetPhysicsObject():SetVelocity(ply:GetAimVector() * 250)
    SlashCo.CurRound.Items[droppeditem] = true
end
SlashCoItems.Rock.OnSwitchFrom = function(ply)
    timer.Simple(0.25, function()
        local item = ply:GetNWString("item2", "none")
        if item == "none" then
            item = ply:GetNWString("item", "none")
        end
        if not SlashCoItems[item] or not SlashCoItems[item].ChangesSpeed then
            ply:SetRunSpeed(300)
        end
    end)
end
SlashCoItems.Rock.OnPickUp = function(ply)
    ply:SetRunSpeed(200)
end
SlashCoItems.Rock.ViewModel = {
    model = "models/slashco/items/rock.mdl",
    pos = Vector(64, 0, -6),
    angle = Angle(45, -70, -120),
    size = Vector(0.5, 0.5, 0.5),
    color = Color(255, 255, 255, 255),
    surpresslightning = false,
    material = "",
    skin = 0,
    bodygroup = {}
}
