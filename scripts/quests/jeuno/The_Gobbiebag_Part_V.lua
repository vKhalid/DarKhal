-----------------------------------
-- The Gobbiebag Part V
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
    questId            = xi.quest.id.jeuno.THE_GOBBIEBAG_PART_V,
    prerequisite       = xi.quest.id.jeuno.THE_GOBBIEBAG_PART_IV,
    message            = lowerJeunoID.text.INVENTORY_INCREASED,
    startInventorySize = 50,
    fame               = 3,
    tradeStew          = xi.items.BOWL_OF_GOBLIN_STEW_880,

    tradeItems =
    {
        xi.items.RHODONITE,
        xi.items.PAKTONG_INGOT,
        xi.items.SQUARE_OF_MOBLINWEAVE,
        xi.items.SQUARE_OF_BUGARD_LEATHER,
    },

    reward =
    {
        fame = 30,
        fameArea = xi.quest.fame_area.JEUNO,
        title = xi.title.GREEDALOX,
    },
}

local quest = xi.jeuno.helpers.GobbiebagQuest:new(params)

return quest
