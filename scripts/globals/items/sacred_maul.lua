-----------------------------------------
-- ID: 18392
-- Item: Sacred Maul
-- Additional Effect: Light Damage
-- Enchantment: "Enlight"
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 5;

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local dmg = math.random(7,21);
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        dmg = addBonusesAbility(player, ELE_LIGHT, target, dmg, params);
        dmg = dmg * applyResistanceAddEffect(player,target,ELE_LIGHT,0);
        dmg = adjustForTarget(target,dmg,ELE_LIGHT);
        dmg = finalMagicNonSpellAdjustments(player,target,ELE_LIGHT,dmg);

        local message = msgBasic.ADD_EFFECT_DMG;
        if (dmg < 0) then
            message = msgBasic.ADD_EFFECT_HEAL;
        end

        return SUBEFFECT_LIGHT_DAMAGE,message,dmg;
    end
end;

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    local effect = EFFECT_ENLIGHT;
    doEnspell(target,target,nil,effect);
end;