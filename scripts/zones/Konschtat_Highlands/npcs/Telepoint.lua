-----------------------------------
-- Area: Konschtat Highlands
--  NPC: Telepoint
-- !pos 220.000 19.104 300.000 106
-----------------------------------
local ID = zones[xi.zone.KONSCHTAT_HIGHLANDS]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- Trade any normal crystal for a faded crystal.
    local item = trade:getItemId()
    if
        trade:getItemCount() == 1 and
        item >= xi.items.FIRE_CRYSTAL and
        item <= xi.items.DARK_CRYSTAL and
        npcUtil.giveItem(player, xi.items.FADED_CRYSTAL)
    then
        player:tradeComplete()
    end
end

entity.onTrigger = function(player, npc)
    if not player:hasKeyItem(xi.ki.DEM_GATE_CRYSTAL) then
        player:startEvent(101)
    else
        player:messageSpecial(ID.text.ALREADY_OBTAINED_TELE)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 101 then
        npcUtil.giveKeyItem(player, xi.ki.DEM_GATE_CRYSTAL)
    end
end

return entity
