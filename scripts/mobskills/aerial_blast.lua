-----------------------------------
-- Aerial Blast
-- Deals wind elemental damage to enemies within area of effect.
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local dmgmod = 3
    local info   = xi.mobskills.mobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 9, xi.magic.ele.WIND, dmgmod, xi.mobskills.magicalTpBonus.NO_EFFECT, 1)
    local dmg    = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.WIND, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.WIND)

    return dmg
end

return mobskillObject
