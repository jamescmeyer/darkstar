-----------------------------------
-- Area: East Ronfaure
--  MOB: Pugil
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/East_Ronfaure/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,64,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local mobID = mob:getID();

    if (Swamfisk_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Swamfisk");
        if (ToD <= os.time() and GetMobAction(Swamfisk) == 0) then
            if (math.random(1,15) == 5) then
                UpdateNMSpawnPoint(Swamfisk);
                GetMobByID(Swamfisk):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Swamfisk", mobID);
                DisallowRespawn(mobID, true);
            end
        end
    end

end;
