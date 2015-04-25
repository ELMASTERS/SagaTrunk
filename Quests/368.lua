-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:18 PM

local QuestID = 368;
local ReqClv = 25;
local ReqJlv = 0;
local NextQuest = 369;
local RewZeny = 1224;
local RewCxp = 3383;
local RewJxp = 0;
local RewWxp = 0;
local RewItem1 = 0;
local RewItem2 = 0;
local RewItemCount1 = 0;
local RewItemCount2 = 0;
local StepID = 0;

-- Modify steps below for gameplay

function QUEST_START(cid)
	Saga.AddStep(cid, QuestID, 36801);
	Saga.AddStep(cid, QuestID, 36802);
	Saga.AddStep(cid, QuestID, 36803);
	Saga.AddStep(cid, QuestID, 36804);
	Saga.AddStep(cid, QuestID, 36805);
	Saga.InsertQuest(cid, QuestID, 1);
	return 0;
end

function QUEST_FINISH(cid)
	-- Gives all rewards
	Saga.GiveItem(cid, RewItem1, RewItemCount1);
	Saga.GiveZeny(cid, RewZeny);
	Saga.GiveExp(cid, RewCxp, RewJxp, RewWxp);
	Saga.InsertQuest(cid, NextQuest, 1);
	return 0;
end

function QUEST_CANCEL(cid)
	return 0;
end

function QUEST_STEP_1(cid, StepID)
	-- Talk with Chayenne
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1022);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1022 then
		Saga.GeneralDialog(cid, 3672);
	
		local freeslots = Saga.FreeInventoryCount(cid, 0);
		if freeslots > 0 then
			Saga.NpcGiveItem(cid, 4210, 3);
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

function QUEST_STEP_2(cid, StepID)
	-- Deliver Present to Gretchel Ortrud
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1025);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1025 then
		Saga.GeneralDialog(cid, 3675);
	
		local ItemCountA = Saga.CheckUserInventory(cid, 4210);
		if ItemCountA > 0 then
			Saga.NpcTakeItem(cid, 4210, 1);
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

function QUEST_STEP_3(cid, StepID)
	-- Deliver 'Present' to Derek
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1021);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1021 then
		Saga.GeneralDialog(cid, 3582);
	
		local ItemCountA = Saga.CheckUserInventory(cid, 4210);
		if ItemCountA > 0 then
			Saga.NpcTakeItem(cid, 4210, 1);
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
	-- Deliver 'Present' to Ireyneal
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1023);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1023 then
		Saga.GeneralDialog(cid, 3678);

		local ItemCountA = Saga.CheckUserInventory(cid, 4210);
		if ItemCountA > 0 then
			Saga.NpcTakeItem(cid, 4210, 1);
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

function QUEST_STEP_5(cid, StepID)
	-- Talk with Chayenne
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1022);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1022 then
		Saga.GeneralDialog(cid, 3681);
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
	Saga.QuestComplete(cid, QuestID);
	return -1;
end

function QUEST_CHECK(cid)
	local CurStepID = Saga.GetStepIndex(cid, QuestID);
	local StepID = CurStepID;
	local ret = -1;

	if CurStepID == 36801 then
		ret = QUEST_STEP_1(cid, StepID);
	elseif CurStepID == 36802 then
		ret = QUEST_STEP_2(cid, StepID);
	elseif CurStepID == 36803 then
		ret = QUEST_STEP_3(cid, StepID);
	elseif CurStepID == 36804 then
		ret = QUEST_STEP_4(cid, StepID);
	elseif CurStepID == 36805 then
		ret = QUEST_STEP_5(cid, StepID);
	end
	
	if ret == 0 then
		QUEST_CHECK(cid);
	end
	
	return ret;
end
