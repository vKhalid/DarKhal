-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Castilchat
-- Starts Quest: Trial Size Trial by Ice
-- !pos -186 0 107 231
-----------------------------------
local ID = zones[xi.zone.NORTHERN_SAN_DORIA]
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local count = trade:getItemCount()
    if
        trade:hasItemQty(xi.items.MINI_TUNING_FORK_OF_ICE, 1) and
        player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.TRIAL_SIZE_TRIAL_BY_ICE) == QUEST_ACCEPTED and
        player:getMainJob() == xi.job.SMN and
        count == 1
    then -- Trade mini fork of ice
        player:startEvent(734, 0, xi.items.MINI_TUNING_FORK_OF_ICE, 4, 20)
    end
end

entity.onTrigger = function(player, npc)
    local trialSizeByIce = player:getQuestStatus(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.TRIAL_SIZE_TRIAL_BY_ICE)

    if
        player:getMainLvl() >= 20 and
        player:getMainJob() == xi.job.SMN and
        trialSizeByIce == QUEST_AVAILABLE and
        player:getFameLevel(xi.quest.fame_area.SANDORIA) >= 2
    then -- Requires player to be Summoner at least lvl 20
        player:startEvent(733, 0, xi.items.MINI_TUNING_FORK_OF_ICE, 4, 20)     --mini tuning fork of ice, zone, level
    elseif trialSizeByIce == QUEST_ACCEPTED then
        local iceFork = player:hasItem(xi.items.MINI_TUNING_FORK_OF_ICE)

        if iceFork then
            player:startEvent(708) --Dialogue given to remind player to be prepared
        else
            player:startEvent(737, 0, xi.items.MINI_TUNING_FORK_OF_ICE, 4, 20) -- Need another mini tuning fork
        end
    elseif trialSizeByIce == QUEST_COMPLETED then
        player:startEvent(736) -- Defeated Avatar
    else
        player:startEvent(711) -- Standard dialog
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    if csid == 733 and option == 1 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.items.MINI_TUNING_FORK_OF_ICE)
        else
            player:addQuest(xi.quest.log_id.SANDORIA, xi.quest.id.sandoria.TRIAL_SIZE_TRIAL_BY_ICE)
            player:addItem(xi.items.MINI_TUNING_FORK_OF_ICE)
            player:messageSpecial(ID.text.ITEM_OBTAINED, xi.items.MINI_TUNING_FORK_OF_ICE)
        end
    elseif csid == 734 and option == 0 or csid == 737 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, xi.items.MINI_TUNING_FORK_OF_ICE)
        else
            player:addItem(xi.items.MINI_TUNING_FORK_OF_ICE)
            player:messageSpecial(ID.text.ITEM_OBTAINED, xi.items.MINI_TUNING_FORK_OF_ICE)
        end
    elseif csid == 734 and option == 1 then
        xi.teleport.to(player, xi.teleport.id.CLOISTER_OF_FROST)
    end
end

return entity
