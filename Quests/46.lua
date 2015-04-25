-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:15 PM
--Spanner 7/25/08

local QuestID = 46;
local ReqClv = 13;
local ReqJlv = 0;
local NextQuest = 0;
local RewZeny = 900;
local RewCxp = 1400;
local RewJxp = 0;
local RewWxp = 0;
local RewItem1 = 1700113;
local RewItem2 = 0;
local RewItemCount1 = 12;
local RewItemCount2 = 0;

-- Modify steps below for gameplay

function QUEST_START(cid)
	Saga.AddStep(cid, QuestID, 4601);
	Saga.AddStep(cid, QuestID, 4602);
	Saga.AddStep(cid, QuestID, 4603);
	Saga.AddStep(cid, QuestID, 4604);
	Saga.AddStep(cid, QuestID, 4605);
	Saga.AddStep(cid, QuestID, 4606);
	Saga.AddStep(cid, QuestID, 4607);
	Saga.InsertQuest(cid, QuestID, 1);
	return 0;
end
function QUEST_FINISH(cid)
	local freeslots = Saga.FreeInventoryCount(cid, 0);
	if freeslots > 1 then
	Saga.GiveZeny(cid, RewZeny);
	Saga.GiveExp(cid, RewCxp, RewJxp, RewWxp);
	Saga.GiveItem(cid, RewItem1, RewItemCount1);
	Saga.GiveItem(cid, RewItem2, RewItemCount2);
	return 0;
	else
	return -1;
	end

end

function QUEST_CANCEL(cid)
	return 0;
end

function QUEST_STEP_1(cid, StepID)
	--Talk with Zarko Ruzzoli
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1005);
	--check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1005
	then
	Saga.GeneralDialog(cid, 377);
	Saga.SubstepComplete(cid, QuestID, StepID, 1);
	end

	end
	--check if all substeps are complete
	for i = 1, 1 do
	if Saga.IsSubStepCompleted(cid, QuestID, StepID, i) == false
	then
	return -1;
	end

	end
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, StepID);
	return 0;
end

function QUEST_STEP_2(cid, StepID)
	--Talk with Misha Berardini
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1000);
	--check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1000
	then
	Saga.GeneralDialog(cid, 380);
	Saga.SubstepComplete(cid, QuestID, StepID, 1);
	end

	end
	--check if all substeps are complete
	for i = 1, 1 do
	if Saga.IsSubStepCompleted(cid, QuestID, StepID, i) == false
	then
	return -1;
	end

	end
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, StepID);
	return 0;
end

function QUEST_STEP_3(cid, StepID)
	--Talk with Klaret Natali
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1001);
	--check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1001
	then
	Saga.GeneralDialog(cid, 383);
	Saga.SubstepComplete(cid, QuestID, StepID, 1);
	end

	end
	--check if all substeps are complete
	for i = 1, 1 do
	if Saga.IsSubStepCompleted(cid, QuestID, StepID, i) == false
	then
	return -1;
	end

	end
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, StepID);
	return 0;
end

function QUEST_STEP_4(cid, StepID)
	--Talk with Shelphy Adriana
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1002);
	--check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1002
	then
	Saga.GeneralDialog(cid, 386);
	Saga.SubstepComplete(cid, QuestID, StepID, 1);
	end

	end
	--check if all substeps are complete
	for i = 1, 1 do
	if Saga.IsSubStepCompleted(cid, QuestID, StepID, i) == false
	then
	return -1;
	end

	end
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, StepID);
	return 0;
end

function QUEST_STEP_5(cid, StepID)
	--Talk with Averro Reinhold
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1004);
	--check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1004
	then
	Saga.GeneralDialog(cid, 389);
	Saga.SubstepComplete(cid, QuestID, StepID, 1);
	end

	end
	--check if all substeps are complete
	for i = 1, 1 do
	if Saga.IsSubStepCompleted(cid, QuestID, StepID, i) == false
	then
	return -1;
	end

	end
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, StepID);
	return 0;
end

function QUEST_STEP_6(cid, StepID)
	--Talk with Scacciano Morrigan
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1003);
	--check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1003
	then
	Saga.GeneralDialog(cid, 392);
	Saga.SubstepComplete(cid, QuestID, StepID, 1);
	end

	end
	--check if all substeps are complete
	for i = 1, 1 do
	if Saga.IsSubStepCompleted(cid, QuestID, StepID, i) == false
	then
	return -1;
	end

	end
	Saga.ClearWaypoints(cid, QuestID);
	Saga.StepComplete(cid, QuestID, StepID);
	return 0;
end

function QUEST_STEP_7(cid, StepID)
	--Talk with Scacciano Morrigan
	Saga.AddWaypoint(cid, QuestID, StepID, 1, 1003);
	--check for completion
	local ret = Saga.GetNPCIndex(cid);
	if ret == 1003
	then
	Saga.GeneralDialog(cid, 2294);
	Saga.SubstepComplete(cid, QuestID, StepID, 1);
	end

	end
	--check if all substeps are complete
	for i = 1, 1 do
	if Saga.IsSubStepCompleted(cid, QuestID, StepID, i) == false
	then
	return -1;
	end

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

	if CurStepID == 4601 then
		ret = QUEST_STEP_1(cid, StepID);
	elseif CurStepID == 4602 then
		ret = QUEST_STEP_2(cid, StepID);
	elseif CurStepID == 4603 then
		ret = QUEST_STEP_3(cid, StepID);
	elseif CurStepID == 4604 then
		ret = QUEST_STEP_4(cid, StepID);
	elseif CurStepID == 4605 then
		ret = QUEST_STEP_5(cid, StepID);
	elseif CurStepID == 4606 then
		ret = QUEST_STEP_6(cid, StepID);
	elseif CurStepID == 4607 then
		ret = QUEST_STEP_7(cid, StepID);
	end

	if ret == 0 then
		QUEST_CHECK(cid);
	end

	return ret;
end
