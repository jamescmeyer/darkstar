-----------------------------------------
-- Spell: Lowing
-- Gives enemies within range a powerful disease that prevents recovery of HP and MP
-- Spell cost: 66 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 2
-- Stat Bonus: HP-5
-- Level: 71
-- Casting Time: 7 seconds
-- Recast Time: 56 seconds
-- Magic Bursts on: Liquefaction, Fusion, and Light
-- Combos: Clear Mind
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnMagicCastingCheck
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

    local params = {};
    params.attribute = MOD_INT;
    params.skillType = BLUE_SKILL;
    params.effect = EFFECT_PLAGUE;
    local resist = applyResistance(caster, target, spell, params);
    local duration = 60 * resist;
    local power = 5;
    
    if (resist > 0.5) then -- Do it!
        if (target:addStatusEffect(params.effect,power,0,duration)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end;

    return params.effect; 
end;
