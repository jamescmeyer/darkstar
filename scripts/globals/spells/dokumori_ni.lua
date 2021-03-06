-----------------------------------------
-- Spell: Dokumori: Ni
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local effect = EFFECT_POISON;
    -- Base Stats
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    --Duration Calculation
    local duration = 120;
    local params = {};
    params.attribute = MOD_INT;
    params.skillType = NINJUTSU_SKILL;
    params.bonus = 0;
    duration = duration * applyResistance(caster, target, spell, params);
    local power = 10;

    --Calculates resist chanve from Reist Blind
    if (target:hasStatusEffect(effect)) then
        spell:setMsg(75); -- no effect
        return effect;
    end

    if (math.random(0,100) >= target:getMod(MOD_POISONRES)) then
        if (duration >= 60) then
            if (target:addStatusEffect(effect,power,3,duration)) then
                spell:setMsg(236);
            else
                spell:setMsg(75);
            end
        else
            spell:setMsg(85);
        end
    else
        spell:setMsg(284);
    end
    return effect;
end;