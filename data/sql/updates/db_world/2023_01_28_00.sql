DELETE FROM `creature_template_addon` WHERE `entry` IN (6193,6196);
UPDATE `creature_addon` SET `bytes2` = 1, `isLarge` = 0 WHERE `guid` IN (35340,35363,35389,35391,35440,35448,35552,35958,35997);
UPDATE `creature_addon` SET `isLarge` = 0 WHERE `guid` IN (
35352,35353,35354,35355,35356,35357,35358,35359,35360,35361,35362,35364,35365,35366,35367,35368,
35369,35370,35371,35372,35373,35374,35508,35509,35510,35511,35513,35514,35515,35516,35517,35518,
35519,35520,35521,35522,35523,35524,35525,35526,35527,35528,35529,35530,35531,35532,35533,35534,
35535,35536,35537,35538,35539,35540,35541,35542,35543,35544,35545,35546,35547,35548,35549,35550,
35551,35553,35554,35555,35556,35557,35558,35559,35560,35561,35562,35563,35564,35565,35566,35567,
35568,35569,35570,35571,35572);

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` IN (6190,6193,6194,6195,6196,7885,7886,16479);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (6190,6193,6194,6195,6196,7885,7886,16479);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 619000;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6190,0,0,0,8,0,100,1,118,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Warrior - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6190,0,1,0,8,0,100,1,12824,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Warrior - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6190,0,2,0,8,0,100,1,12825,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Warrior - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6190,0,3,0,8,0,100,1,12826,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Warrior - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6190,0,4,0,0,0,100,0,6000,9000,11000,15000,0,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Spitelash Warrior - IC - Cast ''Disarm'''),

(619000,9,0,0,0,0,100,0,4000,4000,0,0,0,11,28406,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Warrior - On Script - Cast ''Polymorph Backfire'''),
(619000,9,1,0,0,0,100,0,0,0,0,0,0,11,53421,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Warrior - On Script - Cast ''Submerge'''),
(619000,9,2,0,0,0,100,0,0,0,0,0,0,11,60034,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Warrior - On Script - Cast ''Smoke'''),
(619000,9,3,0,0,0,100,0,3000,3000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Warrior - On Script - Force Despawn'),

(6193,0,0,0,8,0,100,1,118,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Screamer - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6193,0,1,0,8,0,100,1,12824,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Screamer - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6193,0,2,0,8,0,100,1,12825,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Screamer - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6193,0,3,0,8,0,100,1,12826,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Screamer - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6193,0,4,0,0,0,100,0,7000,9000,12000,15000,0,11,3589,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Screamer - IC - Cast ''Deafening Screech'''),
(6193,0,5,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Spitelash Screamer - Between 0-15% Health - Flee For Assist (No Repeat)'),

(6194,0,0,0,8,0,100,1,118,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Serpent Guard - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6194,0,1,0,8,0,100,1,12824,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Serpent Guard - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6194,0,2,0,8,0,100,1,12825,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Serpent Guard - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6194,0,3,0,8,0,100,1,12826,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Serpent Guard - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6194,0,4,0,0,0,100,0,6000,8000,9000,13000,0,11,25710,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Spitelash Serpent Guard - IC - Cast ''Heroic Strike'''),
(6194,0,5,0,13,0,100,0,20000,30000,0,0,0,11,34783,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Serpent Guard - On Victim Casting - Cast ''Spell Reflection'''),

(6195,0,0,0,8,0,100,1,118,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Siren - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6195,0,1,0,8,0,100,1,12824,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Siren - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6195,0,2,0,8,0,100,1,12825,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Siren - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6195,0,3,0,8,0,100,1,12826,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Siren - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6195,0,4,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Spitelash Siren - Within 5-30 Range - Cast ''Shoot'''),
(6195,0,5,0,0,0,100,0,3000,5000,12000,16000,0,11,12551,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Spitelash Siren - IC - Cast ''Frost Shot'''),
(6195,0,6,0,9,0,100,0,0,8,13000,15000,0,11,11831,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Siren - Within 0-8 Range - Cast ''Frost Nova'''),
(6195,0,7,0,74,0,100,0,0,50,12000,17000,40,11,11640,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Spitelash Siren - On Friendly Between 0-50% Health - Cast ''Renew'''),
(6195,0,8,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Spitelash Siren - Between 0-15% Health - Flee For Assist (No Repeat)'),

(6196,0,0,0,8,0,100,1,118,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Myrmidon - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6196,0,1,0,8,0,100,1,12824,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Myrmidon - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6196,0,2,0,8,0,100,1,12825,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Myrmidon - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6196,0,3,0,8,0,100,1,12826,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Myrmidon - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(6196,0,4,0,0,0,100,0,5000,7000,6000,9000,0,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Spitelash Myrmidon - IC - Cast ''Strike'''),

(7885,0,0,0,8,0,100,1,118,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Battlemaster - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(7885,0,1,0,8,0,100,1,12824,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Battlemaster - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(7885,0,2,0,8,0,100,1,12825,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Battlemaster - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(7885,0,3,0,8,0,100,1,12826,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Battlemaster - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(7885,0,4,0,9,0,100,1,5,30,0,0,0,11,22120,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Spitelash Battlemaster - Within 5-30 Range - Cast ''Charge'' (No Repeat)'),

(7886,0,0,0,8,0,100,1,118,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Enchantress - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(7886,0,1,0,8,0,100,1,12824,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Enchantress - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(7886,0,2,0,8,0,100,1,12825,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Enchantress - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(7886,0,3,0,8,0,100,1,12826,0,0,0,0,80,619000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Enchantress - On Spellhit ''Polymorph'' - Call Timed Action List (No Repeat)'),
(7886,0,4,0,0,0,100,0,0,0,2400,3800,0,11,15790,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Spitelash Enchantress - IC - Cast ''Arcane Missiles'''),
(7886,0,5,0,0,0,100,0,5000,9000,18000,24000,0,11,3443,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spitelash Enchantress - IC - Cast ''Enchanted Quickness'''),
(7886,0,6,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Spitelash Enchantress - Between 0-15% Health - Flee For Assist (No Repeat)'),

(16479,0,0,1,1,0,100,1,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Polymorph Clone - OOC - Set React State ''Passive'''),
(16479,0,1,0,61,0,100,1,0,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Polymorph Clone - OOC - Enable Random Movement');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (6190,6193,6194,6195,6196,7885,7886) AND `SourceId` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,6190,0,0,47,0,9364,8,0,0,0,0,'Spitelash Warrior - Group 0: Execute SAI ID 0 if quest ''Fragmented Magic'' is in progress'),
(22,2,6190,0,0,47,0,9364,8,0,0,0,0,'Spitelash Warrior - Group 0: Execute SAI ID 1 if quest ''Fragmented Magic'' is in progress'),
(22,3,6190,0,0,47,0,9364,8,0,0,0,0,'Spitelash Warrior - Group 0: Execute SAI ID 2 if quest ''Fragmented Magic'' is in progress'),
(22,4,6190,0,0,47,0,9364,8,0,0,0,0,'Spitelash Warrior - Group 0: Execute SAI ID 3 if quest ''Fragmented Magic'' is in progress'),

(22,1,6193,0,0,47,0,9364,8,0,0,0,0,'Spitelash Screamer - Group 0: Execute SAI ID 0 if quest ''Fragmented Magic'' is in progress'),
(22,2,6193,0,0,47,0,9364,8,0,0,0,0,'Spitelash Screamer - Group 0: Execute SAI ID 1 if quest ''Fragmented Magic'' is in progress'),
(22,3,6193,0,0,47,0,9364,8,0,0,0,0,'Spitelash Screamer - Group 0: Execute SAI ID 2 if quest ''Fragmented Magic'' is in progress'),
(22,4,6193,0,0,47,0,9364,8,0,0,0,0,'Spitelash Screamer - Group 0: Execute SAI ID 3 if quest ''Fragmented Magic'' is in progress'),

(22,1,6194,0,0,47,0,9364,8,0,0,0,0,'Spitelash Serpent Guard - Group 0: Execute SAI ID 0 if quest ''Fragmented Magic'' is in progress'),
(22,2,6194,0,0,47,0,9364,8,0,0,0,0,'Spitelash Serpent Guard - Group 0: Execute SAI ID 1 if quest ''Fragmented Magic'' is in progress'),
(22,3,6194,0,0,47,0,9364,8,0,0,0,0,'Spitelash Serpent Guard - Group 0: Execute SAI ID 2 if quest ''Fragmented Magic'' is in progress'),
(22,4,6194,0,0,47,0,9364,8,0,0,0,0,'Spitelash Serpent Guard - Group 0: Execute SAI ID 3 if quest ''Fragmented Magic'' is in progress'),

(22,1,6195,0,0,47,0,9364,8,0,0,0,0,'Spitelash Siren - Group 0: Execute SAI ID 0 if quest ''Fragmented Magic'' is in progress'),
(22,2,6195,0,0,47,0,9364,8,0,0,0,0,'Spitelash Siren - Group 0: Execute SAI ID 1 if quest ''Fragmented Magic'' is in progress'),
(22,3,6195,0,0,47,0,9364,8,0,0,0,0,'Spitelash Siren - Group 0: Execute SAI ID 2 if quest ''Fragmented Magic'' is in progress'),
(22,4,6195,0,0,47,0,9364,8,0,0,0,0,'Spitelash Siren - Group 0: Execute SAI ID 3 if quest ''Fragmented Magic'' is in progress'),

(22,1,6196,0,0,47,0,9364,8,0,0,0,0,'Spitelash Myrmidon - Group 0: Execute SAI ID 0 if quest ''Fragmented Magic'' is in progress'),
(22,2,6196,0,0,47,0,9364,8,0,0,0,0,'Spitelash Myrmidon - Group 0: Execute SAI ID 1 if quest ''Fragmented Magic'' is in progress'),
(22,3,6196,0,0,47,0,9364,8,0,0,0,0,'Spitelash Myrmidon - Group 0: Execute SAI ID 2 if quest ''Fragmented Magic'' is in progress'),
(22,4,6196,0,0,47,0,9364,8,0,0,0,0,'Spitelash Myrmidon - Group 0: Execute SAI ID 3 if quest ''Fragmented Magic'' is in progress'),

(22,1,7885,0,0,47,0,9364,8,0,0,0,0,'Spitelash Battlemaster - Group 0: Execute SAI ID 0 if quest ''Fragmented Magic'' is in progress'),
(22,2,7885,0,0,47,0,9364,8,0,0,0,0,'Spitelash Battlemaster - Group 0: Execute SAI ID 1 if quest ''Fragmented Magic'' is in progress'),
(22,3,7885,0,0,47,0,9364,8,0,0,0,0,'Spitelash Battlemaster - Group 0: Execute SAI ID 2 if quest ''Fragmented Magic'' is in progress'),
(22,4,7885,0,0,47,0,9364,8,0,0,0,0,'Spitelash Battlemaster - Group 0: Execute SAI ID 3 if quest ''Fragmented Magic'' is in progress'),

(22,1,7886,0,0,47,0,9364,8,0,0,0,0,'Spitelash Enchantress - Group 0: Execute SAI ID 0 if quest ''Fragmented Magic'' is in progress'),
(22,2,7886,0,0,47,0,9364,8,0,0,0,0,'Spitelash Enchantress - Group 0: Execute SAI ID 1 if quest ''Fragmented Magic'' is in progress'),
(22,3,7886,0,0,47,0,9364,8,0,0,0,0,'Spitelash Enchantress - Group 0: Execute SAI ID 2 if quest ''Fragmented Magic'' is in progress'),
(22,4,7886,0,0,47,0,9364,8,0,0,0,0,'Spitelash Enchantress - Group 0: Execute SAI ID 3 if quest ''Fragmented Magic'' is in progress');
