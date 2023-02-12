UPDATE `creature_template_addon` SET `auras` = NULL WHERE `entry` IN (19952,35008,35602);

UPDATE `creature_addon` SET `auras` = NULL WHERE `guid` IN (
63260,63261,63262,63263,63279,63280,63281,63282,63283,63284,63285,17821,17839,17841,17844,17845,17848,17858,17881,17882,
17892,17904,17915,17916,17970,18007,18013,18125,18193,18257,18295,18398,18406,18412,18426,18467,19064,19071,19076,19103,
19104,19126,19127,19130,19156,19157,19158,19159,19160,19163,19164,19165,19166,19169,19173,19181,19185,527,528,626,628,762,
1093,25735,25736,26170,26293,26295,26296,26302,2241,2316,2321,29810,38319,38320,38325,44928,44940,44980,30038,44762,44771,
49450,49451,51324,51328,51330,51334,36169,36170,36171,36172,36173,36176,36177,36096,47736,47741,47751,47760,47765,47766,
47772,47773,90633,90636,90644,90645,90649,90820,90823,90825,90832,90833,47601,90604,90620,91026,47774,54168,54169,54170,
63456,63459,63465,63470,63471,63486,63492,71105,71108,71116,71118,71120,71122,71124,30707,31269,31275,31568);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (35008,8409);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (35008,8409,17713);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 8915 AND `id` = 7;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(35008,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12544,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sawemba- OOC - Cast ''Frost Armor'''),
(35008,0,1,0,0,0,100,0,1000,2000,3000,4000,0,11,20692,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sawemba - IC - Cast ''Fireball'''),
(35008,0,2,0,0,0,100,0,4000,6000,6000,8000,0,11,38534,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sawemba - IC - Cast ''Frostbolt'''),
(35008,0,3,0,0,0,100,0,8000,12000,15000,20000,0,11,38896,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sawemba - IC - Cast ''Polymorph'''),

(8409,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12544,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Caravan Master Tset - OOC - Cast ''Frost Armor'''),
(8409,0,1,0,0,0,100,0,2000,3000,3500,4000,0,11,21369,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Caravan Master Tset - IC - Cast ''Frostbolt'''),
(8409,0,2,0,9,0,100,0,0,8,13000,15000,0,11,11831,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Caravan Master Tset - Within 0-8 Range - Cast ''Frost Nova'''),

(8915,0,7,0,1,0,100,0,0,0,1000,1000,0,11,12544,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Twilight''s Hammer Ambassador - OOC - Cast ''Frost Armor'''),

(17713,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12544,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodcursed Naga - OOC - Cast ''Frost Armor'''),
(17713,0,1,0,0,0,100,0,2000,3000,3500,4000,0,11,20792,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bloodcursed Naga - IC - Cast ''Frostbolt''');
