-- Saga is Licensed under Creative Commons Attribution-NonCommerial-ShareAlike 3.0 License
-- http://creativecommons.org/licenses/by-nc-sa/3.0/
-- Generated By Quest Extractor on 2/8/2008 3:46:15 PM

local QuestID = 150;
local ReqClv = 10;
local ReqJlv = 0;
local NextQuest = 0;
local RewZeny = 430;
local RewCxp = 767;
local RewJxp = 303;
local RewWxp = 0;
local RewItem1 = 1700113;
local RewItem2 = 1700069;
local RewItemCount1 = 11;
local RewItemCount2 = 1;

-- Modify steps below for gameplay

function QUEST_START(cid)
	-- Initialize all quest steps
	-- Initialize all starting navigation points
	return 0;
end

function QUEST_FINISH(cid)
	Saga.GiveZeny(cid, RewZeny);
	Saga.GiveExp(cid, RewCxp, RewJxp, RewWxp);
	return 0;
end

function QUEST_CANCEL(cid)
	return 0;
end

function QUEST_CHECK(cid)
	-- Check all steps for progress
	local CurStepID = Saga.GetStepIndex(cid, QuestID);
	-- TODO: Add code to check all progress
	return -1;
end
