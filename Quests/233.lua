-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:16 PM

local QuestID = 233;
local ReqClv = 15;
local ReqJlv = 0;
local NextQuest = 234;
local RewZeny = 380;
local RewCxp = 1125;
local RewJxp = 0;
local RewWxp = 0;
local RewItem1 = 1700113;
local RewItem2 = 0;
local RewItemCount1 = 7;
local RewItemCount2 = 0;
local StepID = 0;

-- Modify steps below for gameplay

function QUEST_START(cid)
	Saga.AddStep(cid, QuestID, 23301);
	Saga.AddStep(cid, QuestID, 23302);
	Saga.AddStep(cid, QuestID, 23303);
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
	-- Visit Achim
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1080);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1080 then
		Saga.GeneralDialog(cid, 2638);
	
		local freeslots = Saga.FreeInventoryCount(cid, 0);
		if freeslots > 0 then
			Saga.NpcGiveItem(cid, 4020, 1);
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
	-- Talk with Mainhared Anselm
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1006);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1006 then
		Saga.GeneralDialog(cid, 2641);

		local ItemCountA = Saga.CheckUserInventory(cid, 4020);
		local freeslots = Saga.FreeInventoryCount(cid, 0);
		if ItemCountA > 0 and freeslots > 0 then
			Saga.NpcTakeItem(cid, 4020, 1);
			Saga.NpcGiveItem(cid, 4021, 1);
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
	-- Talk with Monika Reynolds
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1012);
	
	-- Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1012 then
		Saga.GeneralDialog(cid, 2644);
	
		local ItemCountA = Saga.CheckUserInventory(cid, 4020);
		if ItemCountA > 0 then
			Saga.NpcTakeItem(cid, 4021, 1);
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

	if CurStepID == 23301 then
		ret = QUEST_STEP_1(cid, StepID);
	elseif CurStepID == 23302 then
		ret = QUEST_STEP_2(cid, StepID);
	elseif CurStepID == 23303 then
		ret = QUEST_STEP_3(cid, StepID);
	end
	
	if ret == 0 then
		QUEST_CHECK(cid);
	end
	
	return ret;
end
