-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm_xiabalba (???)
-- Spawns Xiabalba
-- !pos -487 -168 211 254
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_GRAUBERG]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.XIABALBA, { xi.items.DECAYING_MOLAR })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.items.DECAYING_MOLAR })
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
