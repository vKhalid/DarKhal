-----------------------------------
-- Area: Valley of Sorrows
--  NPC: <this space intentionally left blank>
-- !pos -14 -3 56 128
-----------------------------------
local ID = zones[xi.zone.VALLEY_OF_SORROWS]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getCharVar("RELIC_IN_PROGRESS") == xi.items.MILLENNIUM_HORN and
        npcUtil.tradeHas(trade, { xi.items.RIMILALA_STRIPESHELL, xi.items.MYSTERIAL_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE, xi.items.MILLENNIUM_HORN })
    then
        -- currency, shard, necropsyche, stage 4
        player:startEvent(15, xi.items.GJALLARHORN)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if
        csid == 15 and
        npcUtil.giveItem(player, { xi.items.GJALLARHORN, { xi.items.LUNGO_NANGO_JADESHELL, 30 } })
    then
        player:confirmTrade()
        player:setCharVar("RELIC_IN_PROGRESS", 0)
    end
end

return entity
