-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_muscaliet (???)
-- Spawns Muscaliet
-- !pos 253 46 291 45
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_TAHRONGI]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.MUSCALIET, { xi.items.RESILIENT_MANE, xi.items.SMOOTH_WHISKER })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.RESILIENT_MANE, xi.items.SMOOTH_WHISKER })
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
