-----------------------------------
-- The Gobbiebag Part IV
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
    questId            = xi.quest.id.jeuno.THE_GOBBIEBAG_PART_IV,
    prerequisite       = xi.quest.id.jeuno.THE_GOBBIEBAG_PART_III,
    message            = lowerJeunoID.text.INVENTORY_INCREASED,
    startInventorySize = 45,
    fame               = 1,
    tradeStew          = xi.items.BOWL_OF_GOBLIN_STEW_880,

    tradeItems =
    {
        xi.items.CERMET_CHUNK,
        xi.items.DARKSTEEL_INGOT,
        xi.items.SQUARE_OF_SILK_CLOTH,
        xi.items.GOSHENITE,
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
