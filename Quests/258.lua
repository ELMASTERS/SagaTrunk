-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:16 PM

local QuestID = 258;
local ReqClv = 19;
local ReqJlv = 0;
local NextQuest = 259;
local RewZeny = 791;
local RewCxp = 2350;
local RewJxp = 950;
local RewWxp = 0;
local RewItem1 = 1700114;
local RewItem2 = 0;
local RewItemCount1 = 4;
local RewItemCount2 = 0;
local StepID = 0;

-- Modify steps below for gameplay

function QUEST_START(cid)
	-- Initialize all quest steps
	Saga.AddStep(cid, QuestID, 25801);
	Saga.AddStep(cid, QuestID, 25802);
	Saga.AddStep(cid, QuestID, 25803);

	Saga.InsertQuest(cid, QuestID, 1);
	return 0;
end

function QUEST_FINISH(cid)
	Saga.GiveZeny(cid, RewZeny);
	Saga.GiveExp(cid, RewCxp, RewJxp, RewWxp);
	Saga.GiveItem(cid, RewItem1, RewItemCount1);

	Saga.InsertQuest(cid, NextQuest, 1);
	return 0;
end

function QUEST_CANCEL(cid)
	return 0;
end

function QUEST_STEP_1(cid, StepID)
	--Talk with Niahong
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1156);

	--Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1156 then
		Saga.GeneralDialog(cid, 2743);
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
	--Eliminate Pirate Red Cape Cat;Eliminate Footpad Red Cape Cat;
	Saga.Eliminate(cid, QuestID, StepID, 10106, 4, 1);
	Saga.Eliminate(cid, QuestID, StepID, 10107, 4, 1);

	Saga.Eliminate(cid, QuestID, StepID, 10102, 4, 2);
	Saga.Eliminate(cid, QuestID, StepID, 10103, 4, 2);

	-- Check if all substeps are completed
	for i = 1, 2 do
		if Saga.IsSubStepCompleted(cid, QuestID, StepID, i) == false then
			return -1;
		end
	end

	Saga.StepComplete(cid, QuestID, StepID);
	return 0;
end

function QUEST_STEP_3(cid, StepID)
	--Report to Niahong
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1156);

	--Check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1156 then
		Saga.GeneralDialog(cid, 2746);
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

	if CurStepID == 25801 then
		ret = QUEST_STEP_1(cid, StepID);
	elseif CurStepID == 25802 then
		ret = QUEST_STEP_2(cid, StepID);
	elseif CurStepID == 25803 then
		ret = QUEST_STEP_3(cid, StepID);
	end

	if ret == 0 then
		QUEST_CHECK(cid);
	end

	return ret;
end
