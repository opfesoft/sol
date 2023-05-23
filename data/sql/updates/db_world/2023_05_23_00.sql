UPDATE `quest_template_addon` SET `SpecialFlags` = `SpecialFlags` & ~2 WHERE `ID` = 10248;
UPDATE `creature_template` SET `speed_run` = 1.71429, `flags_extra` = `flags_extra` | 2097152 WHERE `entry` = 19851;

DELETE FROM `creature_text` WHERE `CreatureId` IN (19851,19570,19849);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(19851,0,0,'I AM DEATH!  PREPARE YOUR TOWN FOR ANNIHILATION!',14,0,100,0,0,0,17455,0,'Negatron'),
(19851,1,0,'YOUR SAD ATTEMPT AT CREATING A FEL REAVER TO STOP ME HAS FAILED!  NOW, ON TO AREA 52!',14,0,100,0,0,0,17468,0,'Negatron'),
(19851,2,0,'HAHAHA!  YOUR FEEBLE ROCKET IS DESTROYED!  I''LL RETURN LATER TO FINISH OFF THE REST OF YOUR PUNY TOWN!',14,0,100,0,0,0,17466,0,'Negatron'),

(19570,0,0,'Oh no!  The X-52 Nether-Rocket is being attacked!  Guards!  Guards!',14,0,100,5,0,0,17474,0,'Rocket-Chief Fuselage'),

(19849,0,0,'The %s, having fought the good fight, falls to pieces.',16,0,100,0,0,0,18587,0,'Scrap Reaver X6000');

UPDATE `gameobject_template_addon` SET `isLarge` = 1 WHERE `entry` = 183987;

DELETE FROM `gameobject` WHERE `guid` BETWEEN 3009177 AND 3009182;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3009177,183987,530,0,0,1,1,3030.14,3656.8,159.494,0.157079,0,0,0,0,-1,100,1,0),
(3009178,183987,530,0,0,1,1,3047.64,3668.25,158.137,0.0174525,0,0,0,0,-1,100,1,0),
(3009179,183987,530,0,0,1,1,3029.78,3677.49,158.65,1.3439,0,0,0,0,-1,100,1,0),
(3009180,183987,530,0,0,1,1,3038.23,3670.4,197.789,6.07375,0,0,0,0,-1,100,1,0),
(3009181,183987,530,0,0,1,1,3042.36,3667.04,180.622,4.7473,0,0,0,0,-1,100,1,0),
(3009182,183987,530,0,0,1,1,3031.68,3671.53,180.868,0.698131,0,0,0,0,-1,100,1,0);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (20484,20485,19570,19849);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (19832,19851,19541,20484,20485,-70614,19737,19570,19849);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1983200,1983201,1985100,1985101,1985102,1985103,1985104,1984900);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19832,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Vomisa, Ph.T. - On Respawn - Set Active On'),
(19832,0,1,0,1,0,100,0,3600000,7200000,3600000,7200000,0,80,1983200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Vomisa, Ph.T. - OOC - Call Timed Action List'),
(19832,0,2,0,19,0,100,0,10248,0,0,0,0,80,1983201,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Vomisa, Ph.T. - On Quest ''You, Robot'' Accepted - Call Timed Action List'),
(19832,0,3,0,38,1,100,0,1,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Vomisa, Ph.T. - On Data Set 1 1 (Event Phase 1) - Say Line 0'),

(1983200,9,0,0,0,0,100,0,0,0,0,0,0,215,0,0,0,0,0,0,8,0,0,0,0,3141.73,3254.34,0,0,'Doctor Vomisa, Ph.T. - On Script - Load Grid (Negatron Position)'),
(1983200,9,1,0,0,0,100,0,3000,3000,0,0,0,70,0,0,0,0,0,0,10,70976,19851,1,2,0,0,0,0,'Doctor Vomisa, Ph.T. - On Script - Respawn Target (Negatron)'),

(1983201,9,0,0,0,0,100,0,0,0,0,0,0,215,0,0,0,0,0,0,8,0,0,0,0,3141.73,3254.34,0,0,'Doctor Vomisa, Ph.T. - On Script - Load Grid (Negatron Position)'),
(1983201,9,1,0,0,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,70975,19849,1,2,0,0,0,0,'Doctor Vomisa, Ph.T. - On Script - Respawn Target (Scrap Reaver X6000)'),
(1983201,9,2,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Vomisa, Ph.T. - On Script - Set Event Phase 1'),
(1983201,9,3,0,0,0,100,0,3000,3000,0,0,0,70,0,0,0,0,0,0,10,70976,19851,1,2,0,0,0,0,'Doctor Vomisa, Ph.T. - On Script - Respawn Target (Negatron)'),
(1983201,9,4,0,0,0,100,0,7000,7000,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Vomisa, Ph.T. - On Script - Set Event Phase 0'),

(19851,0,0,0,11,0,100,0,0,0,0,0,0,80,1985100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Respawn - Call Timed Action List'),
(19851,0,1,0,9,0,100,0,8,25,15000,21000,1,11,35570,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Negatron - Within 8-25 Range - Cast ''Charge'''),
(19851,0,2,0,9,0,100,0,0,5,8000,12000,0,11,34625,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Negatron - Within 0-5 Range - Cast ''Demolish'''),
(19851,0,3,0,0,0,100,0,15000,19000,21000,25000,0,11,35565,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - IC - Cast ''Earthquake'''),
(19851,0,4,0,2,0,100,0,0,50,16000,22000,0,11,34624,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - Between 0-50% Health - Cast ''Frenzy'''),
(19851,0,5,0,17,0,100,0,33045,0,0,0,0,85,34427,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Negatron - On Summoned Unit ''ELM General Purpose Bunny Large (scale x5)'' - Invoker Cast ''Ethereal Teleport'''),
(19851,0,6,0,34,0,100,0,2,22,0,0,0,80,1985101,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On WP 23 Reached - Call Timed Action List'),
(19851,0,7,0,34,1,100,0,2,23,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On WP 24 Reached (Event Phase 1) - Say Line 1'),
(19851,0,8,0,34,0,100,0,2,58,0,0,0,80,1985102,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On WP 59 Reached - Call Timed Action List'),
(19851,0,9,0,34,0,100,0,2,61,0,0,0,80,1985103,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On WP 62 Reached - Call Timed Action List'),
(19851,0,10,0,34,0,100,0,2,64,0,0,0,80,1985104,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On WP 65 Reached - Call Timed Action List'),
(19851,0,11,0,38,0,100,0,1,1,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Data Set 1 1 - Set Event Phase 1'),
(19851,0,12,0,6,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,70975,19849,1,1,0,0,0,0,'Negatron - On Death - Set Data 1 1 (Scrap Reaver X6000)'),

(1985100,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Script - Set Active On'),
(1985100,9,1,0,0,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Script - Disable Event Phase Reset'),
(1985100,9,2,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Script - Set Event Phase 0'),
(1985100,9,3,0,0,0,100,0,0,0,0,0,0,116,60,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Respawn - Set Corpse Delay'),
(1985100,9,4,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1985100,9,5,0,0,0,100,0,0,0,0,0,0,42,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Script - Set Invincibility HP 0'),
(1985100,9,6,0,0,0,100,0,0,0,0,0,0,12,33045,3,3000,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Script - Summon Creature ''ELM General Purpose Bunny Large (scale x5)'''),
(1985100,9,7,0,0,0,100,0,6000,6000,0,0,0,45,1,1,0,0,0,0,10,70967,19832,1,1,0,0,0,0,'Negatron - On Script - Set Data 1 1 (Doctor Vomisa, Ph.T.)'),

(1985101,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Script - Say Line 0'),
(1985101,9,1,0,0,0,100,0,6000,6000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1985101,9,2,0,0,0,100,0,10000,10000,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),

(1985102,9,0,0,0,0,100,0,1000,1000,0,0,0,12,33045,3,3000,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Script - Summon Creature ''ELM General Purpose Bunny Large (scale x5)'''),
(1985102,9,1,0,0,0,100,0,500,500,0,0,0,12,33045,3,3000,0,0,0,8,0,0,0,0,3042.93,3623.34,143.309,1.74894,'Negatron - On Script - Summon Creature ''ELM General Purpose Bunny Large (scale x5)'''),
(1985102,9,2,0,0,0,100,0,500,500,0,0,0,62,530,0,0,0,0,0,1,0,0,0,0,3042.93,3623.34,143.309,1.74894,'Negatron - On Script - Teleport'),

(1985103,9,0,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,70009,19570,1,1,0,0,0,0,'Negatron - On Script - Set Data 1 1 (Rocket-Chief Fuselage)'),
(1985103,9,1,0,0,0,100,0,0,0,0,0,0,45,3,3,0,0,0,0,11,19737,30,1,0,0,0,0,0,'Negatron - On Script - Set Data 3 3 (Engineering Crewmember)'),
(1985103,9,2,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,10,70731,19776,1,1,0,0,0,0,'Negatron - On Script - Force Despawn (Experimental Pilot)'),
(1985103,9,3,0,0,0,100,0,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1985103,9,4,0,0,0,100,0,0,0,0,0,0,42,0,30,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Script - Set Invincibility HP 30%'),
(1985103,9,5,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,72508,20484,1,1,0,0,0,0,'Negatron - On Script - Set Data 1 1 (Area 52 Big Bruiser)'),
(1985103,9,6,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,72507,20484,1,1,0,0,0,0,'Negatron - On Script - Set Data 1 1 (Area 52 Big Bruiser)'),
(1985103,9,7,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,72511,20485,1,1,0,0,0,0,'Negatron - On Script - Set Data 1 1 (Area 52 Bruiser)'),
(1985103,9,8,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,72516,20485,1,1,0,0,0,0,'Negatron - On Script - Set Data 1 1 (Area 52 Bruiser)'),
(1985103,9,9,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,72518,20485,1,1,0,0,0,0,'Negatron - On Script - Set Data 1 1 (Area 52 Bruiser)'),
(1985103,9,10,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,69949,19541,1,1,0,0,0,0,'Negatron - On Script - Set Data 1 1 (Netherstorm Agent)'),
(1985103,9,11,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,69950,19541,1,1,0,0,0,0,'Negatron - On Script - Set Data 1 1 (Netherstorm Agent)'),

(1985104,9,0,0,0,0,100,0,1000,1000,0,0,0,5,54,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Script - Play Emote ''ONESHOT_SPECIALATTACK1H'''),
(1985104,9,1,0,0,0,100,0,1000,1000,0,0,0,70,60,0,0,0,0,0,15,183987,60,0,0,0,0,0,0,'Negatron - On Script - Respawn Target (Rocket Fire)'),
(1985104,9,2,0,0,0,100,0,1000,1000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Script - Say Line 2'),
(1985104,9,3,0,0,0,100,0,5000,5000,0,0,0,12,33045,3,3000,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Script - Summon Creature ''ELM General Purpose Bunny Large (scale x5)'''),
(1985104,9,4,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,10,70009,19570,1,1,0,0,0,0,'Negatron - On Script - Set Data 2 2 (Rocket-Chief Fuselage)'),
(1985104,9,5,0,0,0,100,0,500,500,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negatron - On Script - Force Despawn'),

(19541,0,0,0,1,0,100,0,180000,360000,180000,360000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Netherstorm Agent - OOC - Say Line 0'),
(19541,0,1,0,9,0,100,0,5,30,2000,3000,1,11,36246,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Netherstorm Agent - Within 5-30 Range - Cast ''Shoot Tech Gun'''),
(19541,0,2,3,38,0,100,0,1,1,0,0,0,2,1770,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Netherstorm Agent - On Data Set 1 1 - Set Faction ''Actor Good'''),
(19541,0,3,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Netherstorm Agent - Linked - Start Attack (Invoker)'),

(20484,0,0,0,38,0,100,0,1,1,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Area 52 Big Bruiser - On Data Set 1 1 - Start Attack (Invoker)'),

(20485,0,0,0,38,0,100,0,1,1,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Area 52 Bruiser - On Data Set 1 1 - Start Attack (Invoker)'),

(19737,0,0,0,38,0,100,0,1,1,0,0,0,66,0,0,0,0,0,0,10,70731,19776,1,1,0,0,0,0,'Engineering Crewmember - On Data Set 1 1 - Set Orientation (Experimental Pilot)'),
(19737,0,1,0,38,0,100,0,2,2,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Engineering Crewmember - On Data Set 2 2 - Reset Orientation'),
(19737,0,2,3,38,0,100,0,3,3,0,0,0,67,1,20000,30000,0,0,0,1,0,0,0,0,0,0,0,0,'Engineering Crewmember - On Data Set 3 3 - Create Timed Event 1'),
(19737,0,3,4,61,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Engineering Crewmember - Linked - Set Emote State ''ONESHOT_NONE'''),
(19737,0,4,5,61,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Engineering Crewmember - Linked - Set Run On'),
(19737,0,5,0,61,0,100,0,0,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Engineering Crewmember - Enable Random Movement'),
(19737,0,6,0,59,0,100,0,1,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Engineering Crewmember - On Timed Event 1 Triggered - Force Despawn'),

(19570,0,0,1,38,0,100,0,1,1,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rocket-Chief Fuselage - On Data Set 1 1 - Set Active On'),
(19570,0,1,2,61,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rocket-Chief Fuselage - Linked - Set Run On'),
(19570,0,2,3,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rocket-Chief Fuselage - Linked - Say Line 0'),
(19570,0,3,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,3062.39,3661.39,143.091,0,'Rocket-Chief Fuselage - Linked - Move To Point 1'),
(19570,0,4,5,34,0,100,0,8,1,0,0,0,66,1,0,0,0,0,0,8,0,0,0,0,0,0,0,3.74016,'Rocket-Chief Fuselage - On Point 1 Reached - Set Orientation'),
(19570,0,5,0,61,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rocket-Chief Fuselage - Linked - Set Run Off'),
(19570,0,6,0,38,0,100,0,2,2,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rocket-Chief Fuselage - On Data Set 2 2 - Evade'),
(19570,0,7,0,21,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rocket-Chief Fuselage - On Reached Home - Set Active Off'),

(19849,0,0,1,11,0,100,0,0,0,0,0,0,116,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scrap Reaver X6000 - On Respawn - Set Corpse Delay'),
(19849,0,1,2,61,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scrap Reaver X6000 - Linked - Disable Event Phase Reset'),
(19849,0,2,3,61,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scrap Reaver X6000 - Linked - Set Event Phase 0'),
(19849,0,3,0,61,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scrap Reaver X6000 - Linked - Set ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(19849,0,4,5,8,0,100,0,34630,0,0,0,0,64,1,0,0,0,0,0,16,0,0,0,0,0,0,0,0,'Scrap Reaver X6000 - On Spellhit ''Scrap Reaver X6000'' - Store Targetlist 1 (Invoker Party)'),
(19849,0,5,6,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scrap Reaver X6000 - Linked - Set Event Phase 1'),
(19849,0,6,0,61,0,100,0,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scrap Reaver X6000 - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(19849,0,7,0,38,1,100,0,1,1,0,0,0,80,1984900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scrap Reaver X6000 - On Data Set 1 1 (Event Phase 1) - Call Timed Action List'),
(19849,0,8,0,6,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,70976,19851,1,1,0,0,0,0,'Scrap Reaver X6000 - On Death - Set Data 1 1 (Negatron)'),
(19849,0,9,0,23,1,100,0,34630,0,1000,1000,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scrap Reaver X6000 - On Has No Aura ''Scrap Reaver X6000'' (Event Phase 1) - Die'),

(1984900,9,0,0,0,0,100,0,0,0,0,0,0,33,19851,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Scrap Reaver X6000 - On Script - Quest Credit ''Negatron'' (Stored Targetlist 1)'),
(1984900,9,1,0,0,0,100,0,5000,5000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scrap Reaver X6000 - On Script - Say Line 0'),
(1984900,9,2,0,0,0,100,0,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scrap Reaver X6000 - On Script - Die');

UPDATE `creature` SET `spawntimesecs` = -1, `MovementType` = 2 WHERE `guid` = 70976;

DELETE FROM `creature_addon` WHERE `guid` = 70976;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(70976,709760,0,0,4097,0,1,NULL);

DELETE FROM `waypoint_data` WHERE `id` = 709760;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(709760,1,3141.73,3254.34,106.65,1.90543,3000,1,0,0,100,0),
(709760,2,3139.39,3261.07,108.43,NULL,0,1,0,0,100,0),
(709760,3,3137.33,3267.01,110.253,NULL,0,1,0,0,100,0),
(709760,4,3135.56,3272.09,111.251,NULL,0,1,0,0,100,0),
(709760,5,3133.65,3277.59,110.94,NULL,0,1,0,0,100,0),
(709760,6,3131.74,3283.1,109.686,NULL,0,1,0,0,100,0),
(709760,7,3129.9,3288.39,107.628,NULL,0,1,0,0,100,0),
(709760,8,3127.99,3293.9,107.86,NULL,0,1,0,0,100,0),
(709760,9,3126.45,3298.31,109.846,NULL,0,1,0,0,100,0),
(709760,10,3124.96,3302.61,111.099,NULL,0,1,0,0,100,0),
(709760,11,3123.09,3308,111.391,NULL,0,1,0,0,100,0),
(709760,12,3120.98,3314.07,110.849,NULL,0,1,0,0,100,0),
(709760,13,3118.22,3322,109.664,NULL,0,1,0,0,100,0),
(709760,14,3115.43,3330.04,108.703,NULL,0,1,0,0,100,0),
(709760,15,3113.13,3336.66,107.523,NULL,0,1,0,0,100,0),
(709760,16,3111.18,3342.28,106.795,NULL,0,1,0,0,100,0),
(709760,17,3108.61,3349.66,106.387,NULL,0,1,0,0,100,0),
(709760,18,3106.16,3356.72,105.008,NULL,0,1,0,0,100,0),
(709760,19,3104.33,3362.01,104.54,NULL,0,1,0,0,100,0),
(709760,20,3102.14,3368.29,105.329,NULL,0,1,0,0,100,0),
(709760,21,3100.5,3373.03,106.077,NULL,0,1,0,0,100,0),
(709760,22,3099.12,3377,106.225,NULL,0,1,0,0,100,0),
(709760,23,3097.52,3381.6,105.776,NULL,16000,1,0,0,100,0),
(709760,24,3091.53,3384.21,104.799,NULL,0,1,0,0,100,0),
(709760,25,3084.05,3387.48,104.694,NULL,0,1,0,0,100,0),
(709760,26,3076.67,3390.7,104.76,NULL,0,1,0,0,100,0),
(709760,27,3069.29,3393.92,105.063,NULL,0,1,0,0,100,0),
(709760,28,3062.88,3396.73,105.519,NULL,0,1,0,0,100,0),
(709760,29,3057.65,3399.01,105.756,NULL,0,1,0,0,100,0),
(709760,30,3051.01,3401.91,105.883,NULL,0,1,0,0,100,0),
(709760,31,3046.24,3403.99,106.422,NULL,0,1,0,0,100,0),
(709760,32,3047.1,3411.88,107.835,NULL,0,1,0,0,100,0),
(709760,33,3047.96,3419.88,109.657,NULL,0,1,0,0,100,0),
(709760,34,3048.82,3427.77,111.742,NULL,0,1,0,0,100,0),
(709760,35,3049.69,3435.78,113.454,NULL,0,1,0,0,100,0),
(709760,36,3050.45,3442.83,115.198,NULL,0,1,0,0,100,0),
(709760,37,3051.16,3449.32,116.944,NULL,0,1,0,0,100,0),
(709760,38,3052.16,3458.49,119.475,NULL,0,1,0,0,100,0),
(709760,39,3049.25,3463.82,121.24,NULL,0,1,0,0,100,0),
(709760,40,3045.62,3470.47,123.842,NULL,0,1,0,0,100,0),
(709760,41,3041.32,3478.36,127.506,NULL,0,1,0,0,100,0),
(709760,42,3037.19,3485.93,131.249,NULL,0,1,0,0,100,0),
(709760,43,3033.56,3492.58,134.985,NULL,0,1,0,0,100,0),
(709760,44,3029.77,3499.54,138.488,NULL,0,1,0,0,100,0),
(709760,45,3026.08,3506.31,141.399,NULL,0,1,0,0,100,0),
(709760,46,3023.18,3511.62,143.083,NULL,0,1,0,0,100,0),
(709760,47,3019.98,3517.48,143.776,NULL,0,1,0,0,100,0),
(709760,48,3017.13,3522.71,144.121,NULL,0,1,0,0,100,0),
(709760,49,3020.08,3530.32,143.757,NULL,0,1,0,0,100,0),
(709760,50,3022.99,3537.82,143.49,NULL,0,1,0,0,100,0),
(709760,51,3025.61,3544.56,143.608,NULL,0,1,0,0,100,0),
(709760,52,3027.76,3550.1,143.977,NULL,0,1,0,0,100,0),
(709760,53,3030.71,3557.72,143.429,NULL,0,1,0,0,100,0),
(709760,54,3033.91,3565.98,143.263,NULL,0,1,0,0,100,0),
(709760,55,3036.74,3573.28,143.183,NULL,0,1,0,0,100,0),
(709760,56,3043.16,3579.4,143.181,NULL,0,1,0,0,100,0),
(709760,57,3049.17,3585.14,143.33,NULL,0,1,0,0,100,0),
(709760,58,3047.46,3592.05,143.343,NULL,0,1,0,0,100,0),
(709760,59,3045.52,3599.91,143.19,NULL,3000,1,0,0,100,0),
(709760,60,3042.93,3623.34,143.309,NULL,0,1,0,0,100,0),
(709760,61,3041.47,3631.49,143.246,NULL,0,1,0,0,100,0),
(709760,62,3039.98,3639.75,143.351,NULL,0,1,0,0,100,0),
(709760,63,3038.96,3645.41,142.785,NULL,0,1,0,0,100,0),
(709760,64,3038.07,3650.35,143.544,NULL,0,1,0,0,100,0),
(709760,65,3037.1,3655.71,143.368,NULL,60000,1,0,0,100,0);
