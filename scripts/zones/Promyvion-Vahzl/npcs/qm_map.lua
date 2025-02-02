-----------------------------------
-- Area: Promyvion-Vahzl
--  NPC: ??? (map acquisition)
-- TODO: QM moves every 20-30 minutes. need retail cap of all possible positions
-- known positions include:
-- !pos 252.000 -2.326 -119.994 22
-----------------------------------
local ID = zones[xi.zone.PROMYVION_VAHZL]
-----------------------------------
local entity = {}

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.EERIE_GREEN_GLOW)
end

entity.onTrade = function(player, npc, trade)
    if
        npcUtil.tradeHas(trade, xi.items.WHITE_MEMOSPHERE) and
        not player:hasKeyItem(xi.ki.MAP_OF_PROMYVION_VAHZL)
    then
        player:startEvent(48)
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 48 then
        player:confirmTrade()
        npcUtil.giveKeyItem(player, xi.ki.MAP_OF_PROMYVION_VAHZL)
    end
end

return entity
