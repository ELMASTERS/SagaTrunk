-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:14 PM

local QuestID = 34;
local ReqClv = 12;
local ReqJlv = 0;
local NextQuest = 0;
local RewZeny = 700;
local RewCxp = 1300;
local RewJxp = 0;
local RewWxp = 0;
local RewItem1 = 1700113;
local RewItem2 = 0;
local RewItemCount1 = 8;
local RewItemCount2 = 0;

function QUEST_VERIFY(cid)
	Saga.GeneralDialog(cid, 298);
	return 0;
end

-- Modify steps below for gameplay

function QUEST_START(cid)
	-- Initialize all quest steps
	-- Initialize all starting navigation points
	Saga.AddStep(cid, QuestID, 3401);
	Saga.AddStep(cid, QuestID, 3402);
	Saga.AddStep(cid, QuestID, 3403);
	Saga.InsertQuest(cid, QuestID, 2);
	return 0;
end

function QUEST_FINISH(cid)
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
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1001);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1001 then
		Saga.GeneralDialog(cid, 298);
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
	-- Talk to zarko
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1005);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1005 then
		local freeslots = Saga.FreeInventoryCount(cid, 0);
		if freeslots > 0 then
			Saga.GeneralDialog(cid, 301);
			Saga.NpcGiveItem(cid, 2607, 1);
			Saga.SubstepComplete(cid, QuestID, StepID, 1);
		end
	end
	
	-- Check if all substeps are completed
	if Saga.IsSubStepCompleted(cid, QuestID, StepID, 1) == false then
		return -1;
	end
	
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, StepID);
	return 0;
end

function QUEST_STEP_3(cid, StepID)
	-- Talk to klaret
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1001);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1001 then
		Saga.GeneralDialog(cid, 304);
		Saga.NpcTakeItem(cid, 2607, 1);
		Saga.SubstepComplete(cid, QuestID, StepID, 1);
	end
	
	-- Check if all substeps are completed
	if Saga.IsSubStepCompleted(cid, QuestID, StepID, 1) == false then
		return -1;
	end
	
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

	if CurStepID == 3401 then
		ret = QUEST_STEP_1(cid, StepID);
	elseif CurStepID == 3402 then
		ret = QUEST_STEP_2(cid, StepID);
	elseif CurStepID == 3403 then
		ret = QUEST_STEP_3(cid, StepID);
	end

	if ret == 0 then
		QUEST_CHECK(cid);
	end

	return -1;
end
