-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_tefenet (???)
-- Spawns Tefenet
-- !pos -127 15 239 45
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_TAHRONGI]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.TEFENET, { xi.items.SHOCKING_WHISKER })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.SHOCKING_WHISKER })
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
