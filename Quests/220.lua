-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:16 PM

local QuestID = 220;
local ReqClv = 14;
local ReqJlv = 0;
local NextQuest = 221;
local RewZeny = 536;
local RewCxp = 1215;
local RewJxp = 477;
local RewWxp = 0;
local RewItem1 = 1700113;
local RewItem2 = 0;
local RewItemCount1 = 13;
local RewItemCount2 = 0;
local StepID = 0;

-- Modify steps below for gameplay

function QUEST_START(cid)
	Saga.AddStep(cid, QuestID, 22001);
	Saga.AddStep(cid, QuestID, 22002);
	Saga.AddStep(cid, QuestID, 22003);
	Saga.AddStep(cid, QuestID, 22004);
	Saga.InsertQuest(cid, QuestID, 1);
	return 0;
end

function QUEST_FINISH(cid)
	-- Gives all rewards
	Saga.GiveItem(cid, RewItem1, RewItemCount1);
	Saga.GiveZeny(cid, RewZeny);
	Saga.GiveExp(cid, RewCxp, RewJxp, RewWxp);
	Saga.InsertQuest(cid, QuestID, 1);
	return 0;
end

function QUEST_CANCEL(cid)
	return 0;
end

function QUEST_STEP_1(cid, StepID)
	-- Talk with Regina Salisbury
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1010);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1010 then
		Saga.GeneralDialog(cid, 3090);
		Saga.SubstepComplete(cid, QuestID, StepID, 1);
	end
	
	-- Check if all substeps are completed
	for i = 1, 1 do
		if Saga.IsSubStepCompleted(cid, QuestID, StepID, i) == false then
			return -1;
		end
	end
	
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, StepID);
	return 0;
end

function QUEST_STEP_2(cid, StepID)
	-- Get 6 Chonchon Fry Wings
	Saga.FindQuestItem(cid, QuestID, StepID, 10076, 4007, 8000, 6, 1);
	Saga.FindQuestItem(cid, QuestID, StepID, 10077, 4007, 8000, 6, 1);
	Saga.FindQuestItem(cid, QuestID, StepID, 10078, 4007, 8000, 6, 1);
	
	-- Check if all substeps are completed
	for i = 1, 1 do
		if Saga.IsSubStepCompleted(cid, QuestID, StepID, i) == false then
			return -1;
		end
	end
	
	Saga.StepComplete(cid, QuestID, StepID);
	return 0;
end

function QUEST_STEP_3(cid, StepID)
	-- Receive Achim's Hammer from Hollgran
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1011);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1011 then
		Saga.GeneralDialog(cid, 3093);
	
		local freeslots = Saga.FreeInventoryCount(cid, 0);
		if freeslots > 0 then
			Saga.NpcGiveItem(cid, 4008, 1);
			Saga.SubstepComplete(cid, QuestID, StepID, 1);
		end
	end
	
	-- Check if all substeps are completed
	for i = 1, 1 do
		if Saga.IsSubStepCompleted(cid, QuestID, StepID, i) == false then
			return -1;
		end
	end
	
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, StepID);
	return 0;
end

function QUEST_STEP_4(cid, StepID)
	-- Talk with Regina Salisbury
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1010);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1010 then
		Saga.GeneralDialog(cid, 3096);
	
		local ItemCountA = Saga.CheckUserInventory(cid, 4007);
		local ItemCountB = Saga.CheckUserInventory(cid, 4008);
		if ItemCountA > 5 and ItemCountB > 0 then
			Saga.NpcTakeItem(cid, 4007, 1);
			Saga.NpcTakeItem(cid, 4008, 1);
			Saga.SubstepComplete(cid, QuestID, StepID, 1);
		end
	end
	
	-- Check if all substeps are completed
	for i = 1, 1 do
		if Saga.IsSubStepCompleted(cid, QuestID, StepID, i) == false then
			return -1;
		end
	end
	
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, StepID);
	Saga.QuestComplete(cid, QuestID);
	return -1;
end

function QUEST_CHECK(cid)
	local CurStepID = Saga.GetStepIndex(cid, QuestID);
	local StepID = CurStepID;
	local ret = -1;

	if CurStepID == 22001 then
		ret = QUEST_STEP_1(cid, StepID);
	elseif CurStepID == 22002 then
		ret = QUEST_STEP_2(cid, StepID);
	elseif CurStepID == 22003 then
		ret = QUEST_STEP_2(cid, StepID);
	elseif CurStepID == 22004 then
		ret = QUEST_STEP_2(cid, StepID);
	end
	
	if ret == 0 then
		QUEST_CHECK(cid);
	end
	
	return ret;
end
