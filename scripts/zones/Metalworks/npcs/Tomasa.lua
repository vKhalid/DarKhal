-----------------------------------
-- Area: Metalworks
--  NPC: Tomasa
-- Standard Merchant NPC
-----------------------------------
local ID = zones[xi.zone.METALWORKS]
-----------------------------------
local entity = {}

local pathNodes =
{
    { x = -13, y = -10, z = -19, rotation = 0, wait = 4000 },
    { z = -29, rotation = 0, wait = 4000 },
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(xi.path.first(pathNodes))
    npc:pathThrough(pathNodes, xi.path.flag.PATROL)
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        xi.items.LOAF_OF_IRON_BREAD,         104, 3,
        xi.items.BRETZEL,                     24, 2,
        xi.items.SAUSAGE_ROLL,               291, 1,
        xi.items.BAKED_POPOTO,               332, 3,
        xi.items.SAUSAGE,                    162, 2,
        xi.items.HARD_BOILED_EGG,             83, 1,
        xi.items.BOWL_OF_PEBBLE_SOUP,        208, 3,
        xi.items.BOWL_OF_EGG_SOUP,          3432, 1,
        xi.items.FLASK_OF_DISTILLED_WATER,    12, 3,
        xi.items.BOTTLE_OF_MELON_JUICE,     1144, 2,
        xi.items.BOTTLE_OF_PINEAPPLE_JUICE,  416, 1,
    }

    player:showText(npc, ID.text.TOMASA_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
