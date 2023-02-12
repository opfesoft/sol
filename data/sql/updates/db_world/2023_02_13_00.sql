UPDATE `creature_template_addon` SET `auras` = NULL WHERE `entry` IN (7438,7440,9397,17160,19945,19985,21453,21663,29690,29733,30179);

UPDATE `creature_addon` SET `auras` = NULL WHERE `guid` IN (
34157,38711,43587,31125,31338,31364,31369,31458,31487,31492,31521,31522,31525,31606,31616,31623,31626,31627,31729,31731,33685,34018,31126,31339,
31365,31459,31488,31493,31523,31542,31615,31618,31620,31621,31625,31628,33762,33904,34008,34012,34016,36501,36514,41029,41030,41031,41032,41034,
41065,41066,41067,41068,41069,41070,41071,41072,41074,41076,41077,41078,41080,41081,41082,41083,91020,58656,58657,58658,58659,58671,58672,62205,
62208,62209,62213,63927,63933,65894,65898,65902,65904,65960,65966,65967,65968,65972,65973,66897,71283,71284,71285,71286,71287,71288,71289,71290,
73902,73903,73905,74458,74460,74461,74462,74463,74465,74466,74467,74468,75201,75202,75204,75205,75206,75208,75212,75214,75794,75796,75797,75800,
133505,129492,129496,129497,129498,129499,128916,128921,128925,128927,128966,128969,128972,128975,128980,130005,130007,130010,130012,130015,
130016,130017,130018,130029,130030,128584,129688,129698,129700,129701,129703,129705,129706,129707,129708,129713,129716,129718,129720,129721,
129807,129808,129809,129810,129811,129812,132052);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (6138,9397);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (6138,17327,18450,9397,17160,29690,29733);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 18077 AND `id` = 0;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 21720 AND `id` = 2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6138,0,0,0,0,0,100,0,4000,7000,6000,9000,0,11,11824,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Arkkoran Oracle - IC - Cast ''Shock'''),
(6138,0,1,0,74,0,100,0,0,50,16000,21000,40,11,11986,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Arkkoran Oracle - On Friendly Between 0-50% Health - Cast ''Healing Wave'''),
(6138,0,2,0,1,0,100,0,0,0,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arkkoran Oracle - OOC - Cast ''Lightning Shield'''),
(6138,0,3,0,16,0,100,0,12550,1,15000,30000,0,11,12550,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arkkoran Oracle - On Friendly Unit Missing Buff ''Lightning Shield'' - Cast ''Lightning Shield'''),

(17327,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blacksilt Tidecaller - OOC - Cast ''Lightning Shield'''),
(17327,0,1,0,0,0,100,0,4000,7000,15000,19000,0,11,12160,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blacksilt Tidecaller - IC - Cast ''Rejuvenation'''),

(18077,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Umbrafen Oracle - OOC - Cast ''Lightning Shield'''),

(18450,0,0,0,4,0,100,0,0,0,0,0,0,11,32924,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shienor Sorcerer - On Aggro - Cast ''Power of Kran''aish'''),
(18450,0,1,0,0,0,100,0,0,0,3400,4800,0,11,26098,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Shienor Sorcerer - IC - Cast ''Lightning Bolt'''),
(18450,0,2,0,0,0,100,0,6000,10000,12000,16000,0,11,32907,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Shienor Sorcerer - IC - Cast ''Arakkoa Blast'''),
(18450,0,3,0,0,0,100,0,10000,14000,18000,25000,0,11,6728,0,0,0,0,0,6,0,0,0,0,0,0,0,0,'Shienor Sorcerer - IC - Cast ''Enveloping Winds'''),

(21720,0,2,0,1,0,100,0,0,0,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dragonmaw Shaman - OOC - Cast ''Lightning Shield'''),

(9397,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Living Storm - OOC - Cast ''Lightning Shield'''),

(17160,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Living Cyclone - OOC - Cast ''Lightning Shield'''),

(29690,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Rageclaw - OOC - Cast ''Lightning Shield'''),

(29733,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Elder Shaman Moky - OOC - Cast ''Lightning Shield''');
