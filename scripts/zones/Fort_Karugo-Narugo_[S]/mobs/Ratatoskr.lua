-----------------------------------
-- Area: Fort Karugo-Narugo [S]
--   NM: Ratatoskr
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 522)
end

return entity
