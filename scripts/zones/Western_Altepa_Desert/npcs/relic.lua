-----------------------------------
-- Area: Western Altepa Desert
--  NPC: <this space intentionally left blank>
-- !pos -152 -16 20 125
-----------------------------------
local ID = zones[xi.zone.WESTERN_ALTEPA_DESERT]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if
        player:getCharVar("RELIC_IN_PROGRESS") == xi.items.OGRE_KILLER and
        npcUtil.tradeHas(trade, { xi.items.RIMILALA_STRIPESHELL, xi.items.RUNAEIC_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE, xi.items.OGRE_KILLER })
    then
        player:startEvent(205, xi.items.GUTTLER)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if
        csid == 205 and
        npcUtil.giveItem(player, { xi.items.GUTTLER, { xi.items.LUNGO_NANGO_JADESHELL, 30 } })
    then
        player:confirmTrade()
        player:setCharVar("RELIC_IN_PROGRESS", 0)
    end
end

return entity
