-----------------------------------
-- Area: Pashhow_Marshlands(S)
--  NPC: ??? (Kinepikwa)
-- Allow player to spawn Kinepikwa with Peiste pellets
-----------------------------------
local ID = zones[xi.zone.PASHHOW_MARSHLANDS_S]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        npcUtil.tradeHas(trade, xi.items.JAR_OF_PEISTE_PELLETS) and
        npcUtil.popFromQM(player, npc, ID.mob.KINEPIKWA, { hide = 0 })
    then
        player:confirmTrade()
    end
end

entity.onTrigger = function(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
