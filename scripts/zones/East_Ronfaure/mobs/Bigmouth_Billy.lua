-----------------------------------
-- Area: East Ronfaure (101)
--  NM:  Bigmouth_Billy
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

    -- Set Bigmouth_Billy's Window Open Time
    local wait = math.random(3600,7200);
    SetServerVariable("[POP]Bigmouth_Billy", os.time() + wait); -- 1-2 hours
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Bigmouth_Billy");
    SetServerVariable("[PH]Bigmouth_Billy", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

