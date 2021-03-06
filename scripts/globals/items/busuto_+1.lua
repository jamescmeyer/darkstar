-----------------------------------------
-- ID: 16927
-- Item: Busuto
-- Additional Effect: Poison
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 15;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_WATER,0) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(EFFECT_POISON, 4, 3, 30);
        return SUBEFFECT_POISON, msgBasic.ADD_EFFECT_STATUS, EFFECT_POISON;
    end
end;