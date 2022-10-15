DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (-4481,-2283,844,862,1415,1533,1839,1885,1910,2172,2175,2184,2541,2754,2944,3056,3068,3513,3658,3662,4686,5477,5807,5842,5928,5933,5934,6118,7015,7137,8210,8215,8216,8217,8218,8278,8280,8281,8660,10199,10200,10358,10647,10666,10825,11688,12431,12433,13896,14234,14266,14273,14276,14278,14363,14365,14367,14375,14376,14377,14378,14379,14380,14423,14429,14438,14439,14440,14441,14442,14447,14491,14842,14843,14857,15196,15937,16162,16320,16321,16340,16733,17058,17210,17247,18103,18257,18482,18680,18688,18692,18694,18733,18856,19354,20932,24271,25415,36224,36225,36226) AND `id` = 0;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (1137,1366,1654,1656,1805,2332,3237,3396,3473,4687,5314,5347,5354,5829,5831,5835,6228,6498,6500,7044,7045,7046,8923,8976,9082,10639,10640,10643,14221,14267,14340,14428,14431,14432,14473,14478,15642,17475,18647,19400,32358) AND `id` = 1;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (519,574,1037,1368,2258,2447,2611,3667,3773,3937,5349,10202,10641,10642,10826,11896,11897,14232,14471,14479,15643,16184,16246,16326,18258,18259,18411,18696,23873,24914,27009,27161,32447) AND `id` = 2;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (2452,2453,2612,3943,5841,6584,8201,8304,10119,10559,10662,10807,10827,12899,16245,19657,32485) AND `id` = 3;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (520,1140,5830,7846,12900,16357,18686,20685,28890) AND `id` = 4;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 20600 AND `id` = 6;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 12337 AND `id` = 8;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 18678 AND `id` = 11;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 14461 AND `id` = 30;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 14454 AND `id` = 31;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 14457 AND `id` = 32;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 14464 AND `id` = 43;

UPDATE `creature_template` SET `AIName` = '' WHERE `entry` IN (840,848,861,869,874,887,1742,2478,2952,3291,3341,3474,3537,4166,4548,5312,5725,5797,6499,7847,8924,10676,11748,11807,14223,14269,14275,14277,14490,14866,15372,16221,19068,20772,22060,24812,25228,28243,30013);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (840,848,861,869,874,887,-80263,-79875,1742,-15545,-15544,2478,-301300,-301292,-93615,2952,3291,3341,3474,-19362,3537,-14049,-14048,-14042,-14034,-14032,-14018,-14010,4548,5312,5725,5797,-3878,6499,7847,-5768,8924,10676,11748,11807,14223,14269,14275,14277,14490,14866,15372,16221,-57594,-57965,-65511,-65508,-68371,-68369,20772,-74121,22060,24812,-94400,25228,28243,30013);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (861,862,2952,15372,15642,15643,16162,16221,16320,16321,16326,16340,17247,25415,25417,25419);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceGroup` = 1 AND `SourceEntry` IN (17058,24271);

UPDATE `smart_scripts` SET `link` = 0 WHERE `source_type` = 0 AND `entryorguid` IN (1366,19400) AND `id` = 0;
UPDATE `smart_scripts` SET `link` = 0 WHERE `source_type` = 0 AND `entryorguid` = 1368 AND `id` = 1;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (572,4339,17664,25417,25419) AND `id` IN (0,1);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(572,0,0,0,11,0,100,0,0,0,0,0,0,67,1,5000,5000,0,0,0,1,0,0,0,0,0,0,0,0,'Leprithus - On Respawn - Create Timed Event 1 (CONDITION_OBJECT_ENTRY_GUID)'),

(4339,0,0,0,11,0,100,0,0,0,0,0,0,208,2,0,4,0,0,0,1,0,0,0,0,0,0,0,0,'Brimgore - On Respawn - Add Immunity Type ''IMMUNITY_SCHOOL'' Value ''SPELL_SCHOOL_MASK_FIRE'''),

(17664,0,1,2,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Matis the Cruel - On Respawn - Disable Event Phase Reset');
