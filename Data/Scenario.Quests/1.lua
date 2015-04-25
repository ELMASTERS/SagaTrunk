-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:14 PM

local QuestID = 1;

-- Modify steps below for gameplay

function QUEST_START(cid)
	-- Start Quest
	Saga.AddStep(cid, QuestID, 101);
	Saga.QuestStart(cid, QuestID);
	return 0;
end

function QUEST_FINISH(cid)
	-- Start Next Quest
	Saga.QuestStart(cid, 2);
	return 0;
end

function QUEST_STEP_1(cid)
     Saga.StartEvent(cid, 10101);	
     Saga.StepComplete(cid, QuestID, 101);
     Saga.QuestComplete(cid, QuestID);
     return -1; 
end

function QUEST_CHECK(cid)
	-- Check all steps for progress
	local CurStepID = Saga.GetStepIndex(cid, QuestID);
	local ret = -1;

	if CurStepID == 101 then
		ret = QUEST_STEP_1(cid);
	end

	if ret == 0 then
		QUEST_CHECK(cid);
	end

	return -1;
end

