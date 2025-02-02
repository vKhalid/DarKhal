-----------------------------------
-- Area: Port San d'Oria
--  NPC: Vounebariont
-- Starts and Finishes Quest: Thick Shells
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.THICK_SHELLS) ~= QUEST_AVAILABLE then
        if
            trade:hasItemQty(xi.items.BEETLE_SHELL, 5) and
            trade:getItemCount() == 5
        then
            player:startEvent(514)
        end
    end
end

entity.onTrigger = function(player, npc)
    if player:getFameLevel(xi.quest.fame_area.SANDORIA) >= 2 then
        player:startEvent(516)
    else
        player:startEvent(568)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 516 then
        if player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.THICK_SHELLS) == QUEST_AVAILABLE then
            player:addQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.THICK_SHELLS)
        end
    elseif csid == 514 then
        if player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.THICK_SHELLS) == QUEST_ACCEPTED then
            player:completeQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.THICK_SHELLS)
            player:addFame(xi.quest.fame_area.SANDORIA, 30)
        else
            player:addFame(xi.quest.fame_area.SANDORIA, 5)
        end

        player:tradeComplete()
        player:addTitle(xi.title.BUG_CATCHER)
        npcUtil.giveCurrency(player, 'gil', 750)
    end
end

return entity
