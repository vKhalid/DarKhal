-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Namtar
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 369)
    xi.regime.checkRegime(player, mob, 805, 2, xi.regime.type.GROUNDS)
end

return entity
