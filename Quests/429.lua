-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:18 PM

local QuestID = 429;
local ReqClv = 31;
local ReqJlv = 0;
local NextQuest = 0;
local RewZeny = 1199;
local RewCxp = 7860;
local RewJxp = 3132;
local RewWxp = 0;
local RewItem1 = 1700115;
local RewItem2 = 0;
local RewItemCount1 = 2;
local RewItemCount2 = 0;
local StepID = 0;

-- Modify steps below for gameplay

function QUEST_START(cid)
	Saga.AddStep(cid, QuestID, 42901);
	Saga.AddStep(cid, QuestID, 42902);
	Saga.AddStep(cid, QuestID, 42903);
	Saga.InsertQuest(cid, QuestID, 1);
	return 0;
end

function QUEST_FINISH(cid)
	-- Gives all rewards
	local freeslots = Saga.FreeInventoryCount(cid, 0);
	if freeslots > 0 then
		Saga.GiveZeny(cid, RewZeny);
		Saga.GiveExp(cid, RewCxp, RewJxp, RewWxp);
		Saga.GiveItem(cid, RewItem1, RewItemCount1);
		return 0;
	else
		Saga.EmptyInventory(cid);
		return -1;
	end
end

function QUEST_CANCEL(cid)
	return 0;
end

function QUEST_STEP_1(cid, StepID)
	-- Talk to ?
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1123);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1123 then
		Saga.GeneralDialog(cid, 4733);
		Saga.SubstepComplete(cid, QuestID, 501, 1);
	end
	
	-- Check if all substeps are completed
	for i = 1, 1 do
		if Saga.IsSubStepCompleted(cid, QuestID, 501, i) == false then
			return -1;
		end
	end
	
	-- Clear waypoints
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, 501);
	return 0;
end

function QUEST_STEP_2(cid, StepID)
	-- Collect 'Pinoly Hopper's Horn' (7)
	Saga.FindQuestItem(cid, QuestID, StepID, 10324, 4239, 8000, 7, 1);
	Saga.FindQuestItem(cid, QuestID, StepID, 10325, 4239, 8000, 7, 1);
	
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
	-- Deliver horn to Binta
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1123);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1123 then
		Saga.GeneralDialog(cid, 4738);
	
		local ItemCountA = Saga.CheckUserInventory(cid, 4239);
		if ItemCountA > 6 then
			Saga.NpcTakeItem(cid, 4239, 7);
			Saga.SubstepComplete(cid, QuestID, StepID, 1);
		else
			Saga.ItemNotFound(cid);
		end
	end
	
	-- Check if all substeps are completed
	for i = 1, 1 do
		if Saga.IsSubStepCompleted(cid, QuestID, StepID, i) == false then
			return -1;
		end
	end
	
	-- Clear waypoints
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, StepID);
	Saga.QuestComplete(cid, QuestID);
	return -1;
end

function QUEST_CHECK(cid)
	-- Check all steps for progress
	local CurStepID = Saga.GetStepIndex(cid, QuestID);
	local ret = -1;
	local StepID = CurStepID;
	
	if CurStepID == 42901 then
		ret = QUEST_STEP_1(cid, StepID);
	elseif CurStepID == 42902 then
		ret = QUEST_STEP_2(cid, StepID);
	elseif CurStepID == 42903 then
		ret = QUEST_STEP_3(cid, StepID);
	end
	
	if ret == 0 then
		QUEST_CHECK(cid);
	end
	
	return ret;
end
