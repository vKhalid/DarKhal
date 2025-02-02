-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm_ophanim (???)
-- Spawns Ophanim
-- !pos -195 -16 -165 45
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_TAHRONGI]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.OPHANIM, { xi.items.SHRIVELED_WING, xi.items.TARNISHED_PINCER, xi.items.BLOODSHOT_HECTEYE })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.SHRIVELED_WING, xi.items.TARNISHED_PINCER, xi.items.BLOODSHOT_HECTEYE })
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
