-----------------------------------
-- The Gobbiebag Part I
-----------------------------------
--  Log ID: 3, Quest ID: 27
--  NPC: Bluffnix:  !pos -43 6 -115 245
-----------------------------------
require('scripts/quests/jeuno/helpers')
-----------------------------------
local lowerJeunoID = zones[xi.zone.LOWER_JEUNO]
-----------------------------------

local params =
{
    questId            = xi.quest.id.jeuno.THE_GOBBIEBAG_PART_I,
    prerequisite       = nil,
    message            = lowerJeunoID.text.INVENTORY_INCREASED,
    startInventorySize = 30,
    fame               = 1,
    tradeStew          = xi.items.BOWL_OF_GOBLIN_STEW_880,

    tradeItems =
    {
        xi.items.SQUARE_OF_DHALMEL_LEATHER,
        xi.items.STEEL_INGOT,
        xi.items.SQUARE_OF_LINEN_CLOTH,
        xi.items.PERIDOT,
    },

    reward =
    {
        fame = 30,
        fameArea = xi.quest.fame_area.JEUNO,
        title = nil,
    },
}

local quest = xi.jeuno.helpers.GobbiebagQuest:new(params)

return quest
