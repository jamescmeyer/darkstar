-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  MOB: Sewer_Syrup
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Sewer_Syrup's Window Open Time
    local wait = math.random(7200,14400);
    SetServerVariable("[POP]Sewer_Syrup", os.time() + wait); -- 2-4 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Sewer_Syrup");
    SetServerVariable("[PH]Sewer_Syrup", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

