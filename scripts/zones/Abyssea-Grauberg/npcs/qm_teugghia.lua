-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm_teugghia (???)
-- Spawns Teugghia
-- !pos -68 -6 656 254
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_GRAUBERG]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.TEUGGHIA, { xi.items.NAIADS_LOCK, xi.items.UNSEELIE_EYE })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.NAIADS_LOCK, xi.items.UNSEELIE_EYE })
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
