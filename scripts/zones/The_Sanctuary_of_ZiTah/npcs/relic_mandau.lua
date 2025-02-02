-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  NPC: <this space intentionally left blank>
-- !pos 646 -2 -165 121
-----------------------------------
local ID = zones[xi.zone.THE_SANCTUARY_OF_ZITAH]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local currentRelic = player:getCharVar("RELIC_IN_PROGRESS")

    -- Mandau
    if
        currentRelic == xi.items.BATARDEAU and
        npcUtil.tradeHas(trade, { xi.items.TEN_THOUSAND_BYNE_BILL, xi.items.ORNATE_FRAGMENT, xi.items.SHARD_OF_NECROPSYCHE, xi.items.BATARDEAU })
    then
        -- currency, shard, necropsyche, stage 4
        player:startEvent(207, xi.items.MANDAU)
    end
end

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if
        csid == 207 and
        npcUtil.giveItem(player, { xi.items.MANDAU, { xi.items.ONE_HUNDRED_BYNE_BILL, 30 } })
    then
        player:confirmTrade()
        player:setCharVar("RELIC_IN_PROGRESS", 0)
    end
end

return entity
