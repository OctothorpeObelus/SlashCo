local SlashCo = SlashCo

SlashCo.OnSlasherSpawned = function(ply)

    local plyid = ply:SteamID64()

    ply:SetRunSpeed(SlashCo.CurRound.SlasherData[plyid].ProwlSpeed)
    ply:SetWalkSpeed(SlashCo.CurRound.SlasherData[plyid].ProwlSpeed)

    local slid = SlashCo.CurRound.SlasherData[plyid].SlasherID

    if slid == 3 then

        PlayGlobalSound("slashco/slasher/trollge_breathing.wav",50,ply)

    end

    if slid == 5 then

        ply:SetViewOffset( Vector(0,0,20) )
        ply:SetCurrentViewOffset( Vector(0,0,20) )

    end

    if slid == 6 then

        SlashCo.CurRound.SlasherData[plyid].SlasherValue1 = 1

    end

    if slid == 6 then

        SlashCo.CurRound.SlasherData[plyid].SlasherValue1 = 1

    end

    if slid == 7 then

        SlashCo.CurRound.SlasherData[plyid].SlasherValue1 = 0

        ply:SetColor(Color(0,0,0,0))
        ply:DrawShadow(false)
		ply:SetRenderMode(RENDERMODE_TRANSALPHA)
		ply:SetNoDraw(true)

    end

    if slid == 8 then

        ply:SetViewOffset( Vector(0,0,85) )

        ply:SetCurrentViewOffset( Vector(0,0,85) )

        PlayGlobalSound("slashco/slasher/borgmire_heartbeat.wav",50,ply)

    end

    if slid == 9 then

        ply:SetViewOffset( Vector(0,0,20) )

        ply:SetCurrentViewOffset( Vector(0,0,20) )

        PlayGlobalSound("slashco/slasher/manspider_idle.wav",50,ply)

    end

    if slid == 10 then

        ply:SetViewOffset( Vector(0,0,100) )

        ply:SetCurrentViewOffset( Vector(0,0,100) )

    end

    if slid == 11 then

        PlayGlobalSound("slashco/slasher/abomignat_breathing.wav",65,ply)

    end

    if slid == 12 then

        local clone = ents.Create( "sc_crimclone" )

        clone:SetPos( ply:GetPos() )
        clone:SetAngles( ply:GetAngles() )
        clone.AssignedSlasher = ply:SteamID64()
        clone.IsMain = true
        clone:Spawn()
        clone:Activate()

        ply:SetColor(Color(0,0,0,0))
        ply:DrawShadow(false)
		ply:SetRenderMode(RENDERMODE_TRANSALPHA)
		ply:SetNoDraw(true)

    end

    if slid == 13 then

        SlashCo.SmileyIdle(ply)

    end

end

SlashCo.SmileyIdle = function(slasher)

    if not slasher:GetNWBool("InSlasherChaseMode") then 
        slasher:EmitSound("slashco/slasher/freesmiley_idle"..math.random(1,7)..".mp3")     
    end

    timer.Simple(math.random(3,5), function()

        SlashCo.SmileyIdle(slasher)
    
    end)
    

end

SlashCo.InsertSlasherToTable = function(id)

    SlashCo.CurRound.SlasherData[id] = {
        SlasherID = 0,
        NAME = "",
        Model = "",
        GasCanMod = 0,
        ProwlSpeed = 150,
        ChaseSpeed = 295,
        Perception = 1.0,
        Eyesight = 5,
        KillDistance = 120,
        ChaseRange = 700,
        CurrentChaseTick = 0.0,
        ChaseDuration = 10.0,
        ChaseActivationCooldown = 0,
        ChaseCooldown = 3,
        CanChase = true,
        CanKill = true,
        KillDelay = 1.5,
        KillDelayTick = 0.0,
        ChaseMusic = "",
        KillSound = "",
        IsChasing = false,
        SlasherValue1 = 0,
        SlasherValue2 = 0,
        SlasherValue3 = 0,
        SlasherValue4 = 0,
        SlasherValue5 = 0,
        SteamID = id
    }

    table.insert(SlashCo.CurRound.SlasherData.AllSlashers, { s_id = id})

end

SlashCo.SelectSlasher = function(id, pid)

    local plyid = plyid

    if isstring( pid ) then plyid = pid else plyid = tostring(pid) end

    if SlashCo.CurRound.SlasherData[plyid] == nil then print("[SlashCo] ERROR! Could not select the slasher!") return end

    SlashCo.CurRound.SlasherData[plyid].SlasherID = SlashCo.SlasherData[id].ID
    SlashCo.CurRound.SlasherData[plyid].NAME = SlashCo.SlasherData[id].NAME
    SlashCo.CurRound.SlasherData[plyid].Model = SlashCo.SlasherData[id].Model
    SlashCo.CurRound.SlasherData[plyid].GasCanMod = SlashCo.SlasherData[id].GasCanMod
    SlashCo.CurRound.SlasherData[plyid].ProwlSpeed = SlashCo.SlasherData[id].ProwlSpeed 
    SlashCo.CurRound.SlasherData[plyid].ChaseSpeed = SlashCo.SlasherData[id].ChaseSpeed
    SlashCo.CurRound.SlasherData[plyid].Perception = SlashCo.SlasherData[id].Perception
    SlashCo.CurRound.SlasherData[plyid].Eyesight = SlashCo.SlasherData[id].Eyesight
    SlashCo.CurRound.SlasherData[plyid].KillDistance = SlashCo.SlasherData[id].KillDistance
    SlashCo.CurRound.SlasherData[plyid].ChaseRange = SlashCo.SlasherData[id].ChaseRange
    SlashCo.CurRound.SlasherData[plyid].ChaseRadius = SlashCo.SlasherData[id].ChaseRadius
    SlashCo.CurRound.SlasherData[plyid].ChaseDuration = SlashCo.SlasherData[id].ChaseDuration
    SlashCo.CurRound.SlasherData[plyid].ChaseCooldown = SlashCo.SlasherData[id].ChaseCooldown
    SlashCo.CurRound.SlasherData[plyid].KillDelay = SlashCo.SlasherData[id].KillDelay
    SlashCo.CurRound.SlasherData[plyid].ChaseMusic = SlashCo.SlasherData[id].ChaseMusic
    SlashCo.CurRound.SlasherData[plyid].KillSound = SlashCo.SlasherData[id].KillSound
    SlashCo.CurRound.SlasherData[plyid].JumpscareDuration = SlashCo.SlasherData[id].JumpscareDuration

    if CLIENT then
        SlashCo.CurRound.SlasherData[plyid].SlasherID = SlashCo.SlasherData[id].ID
        SlashCo.CurRound.SlasherData[plyid].NAME = SlashCo.SlasherData[id].NAME
        SlashCo.CurRound.SlasherData[plyid].Model = SlashCo.SlasherData[id].Model
        SlashCo.CurRound.SlasherData[plyid].GasCanMod = SlashCo.SlasherData[id].GasCanMod
        SlashCo.CurRound.SlasherData[plyid].ProwlSpeed = SlashCo.SlasherData[id].ProwlSpeed 
        SlashCo.CurRound.SlasherData[plyid].ChaseSpeed = SlashCo.SlasherData[id].ChaseSpeed
        SlashCo.CurRound.SlasherData[plyid].Perception = SlashCo.SlasherData[id].Perception
        SlashCo.CurRound.SlasherData[plyid].Eyesight = SlashCo.SlasherData[id].Eyesight
        SlashCo.CurRound.SlasherData[plyid].KillDistance = SlashCo.SlasherData[id].KillDistance
        SlashCo.CurRound.SlasherData[plyid].ChaseRange = SlashCo.SlasherData[id].ChaseRange
        SlashCo.CurRound.SlasherData[plyid].ChaseRadius = SlashCo.SlasherData[id].ChaseRadius
        SlashCo.CurRound.SlasherData[plyid].ChaseDuration = SlashCo.SlasherData[id].ChaseDuration
        SlashCo.CurRound.SlasherData[plyid].ChaseCooldown = SlashCo.SlasherData[id].ChaseCooldown
        SlashCo.CurRound.SlasherData[plyid].KillDelay = SlashCo.SlasherData[id].KillDelay
        SlashCo.CurRound.SlasherData[plyid].ChaseMusic = SlashCo.SlasherData[id].ChaseMusic
        SlashCo.CurRound.SlasherData[plyid].KillSound = SlashCo.SlasherData[id].KillSound
        SlashCo.CurRound.SlasherData[plyid].JumpscareDuration = SlashCo.SlasherData[id].JumpscareDuration
    end

end

SlashCo.PrepareSlasherForSpawning = function()

    --[[

    If the Difficulty is Hard, the Slasher immediately spawns with them. On other difficulties the Slasher has a spawn delay.
    (1,2 - 30 seconds), (0 - 60 seconds) 
    (The Delay is cancelled once the Survivors have performed any kind of action on a Generator). 
    The Slasher will spawn at a spawn point furthest away from the Survivors.

    ]]

if SERVER then

    local delay = 1

    --local idoffirst = firstid
    --local idofsecond = secondid

    print("[SlashCo] Current Difficulty: "..SlashCo.CurRound.Difficulty)
    print("int Difficulty: "..SlashCo.Difficulty.INTERMEDIATE )

    delay = 1 +( (4 - SlashCo.CurRound.Difficulty ) ) * 20

    print("[SlashCo] Slasher set to spawn in "..delay.." seconds.")

    timer.Simple(delay, function()
        SlashCo.SpawnSlasher()
    end)

end

end

local SlasherSpawned

SlashCo.SpawnSlasher = function()

    if SERVER then

        if not SlasherSpawned then

            print("[SlashCo] Spawning Slasher...")

            if SlashCo.CurRound.SlashersToBeSpawned then

                for _, p in ipairs(SlashCo.CurRound.SlashersToBeSpawned) do
                    rand = math.random( 1, #SlashCo.CurConfig.Spawnpoints.Slasher)

                    local pos = Vector(SlashCo.CurConfig.Spawnpoints.Slasher[rand].pos[1],SlashCo.CurConfig.Spawnpoints.Slasher[rand].pos[2],SlashCo.CurConfig.Spawnpoints.Slasher[rand].pos[3])
                    local ang = Angle( 0, SlashCo.CurConfig.Spawnpoints.Slasher[rand].ang ,0 )

                    p:SetTeam(TEAM_SLASHER)
                    p:Spawn()
                    p:SetPos( pos )
                    p:SetAngles( ang )

                    SlashCo.BroadcastSlasherData()

                    SlashCo.OnSlasherSpawned(p)
                end

                SlasherSpawned = true

            else

                print("[SlashCo] Error! Cannot spawn Slasher as they are not prepared for spawning or the player was not assigned correctly!")

            end

        end

    end

end