-----------------------------------
-- Area: Middle Delkfutt's Tower
--   NM: Ophion
-----------------------------------
mixins = { require("scripts/mixins/job_special") }
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, optParams)
    xi.hunts.checkHunt(mob, player, 337)
end

return entity
