---------------------------------------------
-- Prishe Item 2
---------------------------------------------
package.loaded["scripts/zones/Empyreal_Paradox/TextIDs"] = nil;
---------------------------------------------
require("scripts/zones/Empyreal_Paradox/TextIDs");
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:hasStatusEffect(EFFECT_PHYSICAL_SHIELD) or target:hasStatusEffect(EFFECT_MAGIC_SHIELD)) then
        return 1;
    elseif (mob:hasStatusEffect(EFFECT_PLAGUE) or mob:hasStatusEffect(EFFECT_CURSE_I) or mob:hasStatusEffect(EFFECT_MUTE)) then
        return 0;
    elseif (math.random() < 0.25) then
        return 1;
    end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    skill:setMsg(msgBasic.NONE);
    if (mob:hasStatusEffect(EFFECT_PLAGUE) or mob:hasStatusEffect(EFFECT_CURSE_I) or mob:hasStatusEffect(EFFECT_MUTE)) then
        -- use Remedy!
        mob:messageText(mob, PRISHE_TEXT + 12, false);
        mob:delStatusEffect(EFFECT_PLAGUE);
        mob:delStatusEffect(EFFECT_CURSE_I);
        mob:delStatusEffect(EFFECT_MUTE);
    elseif (math.random() < 0.5) then
        -- Carnal Incense!
        mob:messageText(mob, PRISHE_TEXT + 10, false);
        mob:addStatusEffect(EFFECT_PHYSICAL_SHIELD, 0, 0, 30);
    else
        -- Spiritual Incense!
        mob:messageText(mob, PRISHE_TEXT + 11, false);
        mob:addStatusEffect(EFFECT_MAGIC_SHIELD, 0, 0, 30);
    end
    return 0;
end;
