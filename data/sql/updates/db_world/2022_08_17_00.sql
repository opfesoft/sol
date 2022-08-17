-- Frosthold: Keep phasing after "The Brothers Bronzebeard" is rewarded
UPDATE `spell_area` SET `quest_start_status` = 74 WHERE `spell` = 55783 AND `area` = 4428;

-- Velog Icebellow: Add spawn to be shown after "The Brothers Bronzebeard" is in progress or rewarded
DELETE FROM `creature` WHERE `guid` = 3009094;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3009094,30401,571,0,0,1,4,0,1,6653.1,-310.577,989.468,1.79769,300,0,63000,0,0,0,0,0,0);

-- Frosthold creatures & GOs: Adjust phase (except Yorg Stormheart & Velog Icebellow)
UPDATE `creature` SET `phaseMask` = 5 WHERE `guid` IN (98837,98948,98949,98950,98951,98955,98956,98957,98960,99005,99185,99196,100071,100369,100458,100483,100834,101713,101714,101715,115705,117624,117665,117740,117792,117818,120108,200835,101801);
UPDATE `gameobject` SET `phaseMask` = 5 WHERE `guid` IN (57486,57512,57528,57536,58417,58418,58527,59922,59923,59924,59925,59952,60953,67970,67971,67975,80321,80573,80574,80575,80576,80937,80938,87587);

-- Brann Bronzebeard: Remove obsolete creature text
DELETE FROM `creature_text` WHERE `CreatureID` = 30405 AND `GroupID` = 8;

-- Norgannon's Binding: Fix phasing
UPDATE `gameobject` SET `phaseMask` = 7 WHERE `guid` = 59333;

-- Creteus: Hide after "The Brothers Bronzebeard" is rewarded
UPDATE `creature_addon` SET `auras` = '60921' WHERE `guid` = 104811;
DELETE FROM `spell_area` WHERE `spell` = 60922 AND `area` IN (4431,4432);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`)
VALUES
(60922,4431,0,12973,0,0,2,1,0,11),
(60922,4432,0,12973,0,0,2,1,0,11);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (30382,30134,30136,30502,30405,30408,30411);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 3040500;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(30382,0,0,1,19,0,100,0,12973,0,0,0,0,11,56558,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann Bronzebeard - On Quest ''The Brothers Bronzebeard'' Accepted - Cast ''Summon Flying Machine'''),
(30382,0,1,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann Bronzebeard - Linked - Force Despawn'),

(30134,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann''s Flying Machine - On Respawn - Disable Event Phase Reset'),
(30134,0,1,2,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann''s Flying Machine - Linked - Set Active On'),
(30134,0,2,0,61,0,100,0,0,0,0,0,0,67,1,60000,60000,0,0,0,1,0,0,0,0,0,0,0,0,'Brann''s Flying Machine - Linked - Create Timed Event 1'),
(30134,0,3,4,27,0,100,0,0,0,0,0,0,53,1,30134,0,0,500,0,7,0,0,0,0,0,0,0,0,'Brann''s Flying Machine - On Passenger Board - Start WP Movement (CONDITION_OBJECT_ENTRY_GUID)'),
(30134,0,4,5,61,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann''s Flying Machine - Linked - Remove Timed Event 1'),
(30134,0,5,6,61,0,100,0,0,0,0,0,0,18,16777216,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann''s Flying Machine - Linked - Set ''UNIT_FLAG_PLAYER_CONTROLLED'''),
(30134,0,6,7,61,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann''s Flying Machine - Linked - Disable Attack'),
(30134,0,7,8,61,0,100,0,0,0,0,0,0,44,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann''s Flying Machine - Linked - Set Phase Mask'),
(30134,0,8,9,61,0,100,0,0,0,0,0,0,44,7,0,0,0,0,0,29,1,0,0,0,0,0,0,0,'Brann''s Flying Machine - Linked - Set Phase Mask (Passenger Seat 0)'),
(30134,0,9,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann''s Flying Machine - Linked - Set Event Phase 1'),
(30134,0,10,0,28,0,100,0,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann''s Flying Machine - On Passenger Remove - Despawn (CONDITION_OBJECT_ENTRY_GUID)'),
(30134,0,11,0,40,0,100,0,2,0,0,0,0,1,0,0,0,0,0,0,19,30107,5,0,0,0,0,0,0,'Brann''s Flying Machine - On WP 2 Reached - Say Line 0 (Brann Bronzebeard)'),
(30134,0,12,0,40,0,100,0,8,0,0,0,0,1,1,0,0,0,0,0,19,30107,5,0,0,0,0,0,0,'Brann''s Flying Machine - On WP 8 Reached - Say Line 1 (Brann Bronzebeard)'),
(30134,0,13,0,40,0,100,0,16,0,0,0,0,1,2,0,0,0,0,0,19,30107,5,0,0,0,0,0,0,'Brann''s Flying Machine - On WP 16 Reached - Say Line 2 (Brann Bronzebeard)'),
(30134,0,14,0,40,0,100,0,22,0,0,0,0,1,3,0,0,0,0,0,19,30107,5,0,0,0,0,0,0,'Brann''s Flying Machine - On WP 22 Reached - Say Line 3 (Brann Bronzebeard)'),
(30134,0,15,0,40,0,100,0,37,0,0,0,0,1,4,0,0,0,0,0,19,30107,5,0,0,0,0,0,0,'Brann''s Flying Machine - On WP 37 Reached - Say Line 4 (Brann Bronzebeard)'),
(30134,0,16,0,40,0,100,0,47,0,0,0,0,1,5,0,0,0,0,0,19,30107,5,0,0,0,0,0,0,'Brann''s Flying Machine - On WP 47 Reached - Say Line 5 (Brann Bronzebeard)'),
(30134,0,17,0,40,0,100,0,53,0,0,0,0,1,6,0,0,0,0,0,19,30107,5,0,0,0,0,0,0,'Brann''s Flying Machine - On WP 53 Reached - Say Line 6 (Brann Bronzebeard)'),
(30134,0,18,0,40,0,100,0,57,0,0,0,0,1,7,0,0,0,0,0,19,30107,5,0,0,0,0,0,0,'Brann''s Flying Machine - On WP 57 Reached - Say Line 7 (Brann Bronzebeard)'),
(30134,0,19,0,40,0,100,0,65,0,0,0,0,1,8,0,0,0,0,0,19,30107,5,0,0,0,0,0,0,'Brann''s Flying Machine - On WP 65 Reached - Say Line 8 (Brann Bronzebeard)'),
(30134,0,20,21,40,0,100,0,72,0,0,0,0,28,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann''s Flying Machine - On WP 72 Reached - Remove All Auras'),
(30134,0,21,0,61,0,100,0,0,0,0,0,0,11,56675,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann''s Flying Machine - Linked - Cast ''Summon Brann Bronzebeard'''),
(30134,0,22,23,28,0,100,0,0,0,3,0,0,41,1000,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Brann''s Flying Machine - On Passenger Seat 3 Removed - Force Despawn (Invoker)'),
(30134,0,23,24,61,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann''s Flying Machine - Linked - Set Event Phase 2'),
(30134,0,24,0,61,0,100,0,0,0,0,0,0,67,2,10000,10000,0,0,0,1,0,0,0,0,0,0,0,0,'Brann''s Flying Machine - Linked - Create Timed Event 2'),
(30134,0,25,0,59,0,100,0,2,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann''s Flying Machine - On Timed Event 2 Triggered - Set Event Phase 1'),
(30134,0,26,0,60,1,100,0,5000,5000,5000,5000,0,45,1,1,0,0,0,0,19,30136,35,0,0,0,0,0,0,'Brann''s Flying Machine - On Update - Set Data 1 1 (Stormforged Soldier) (CONDITION_HAS_EMPTY_SEAT) (Event Phase 1)'),
(30134,0,27,0,59,0,100,0,1,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann''s Flying Machine - On Timed Event 1 Triggered - Force Despawn'),

(30136,0,0,0,11,0,100,0,0,0,0,0,0,11,29651,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stormforged Soldier - On Respawn - Cast ''Dual Wield'''),
(30136,0,1,0,1,0,100,0,5000,5000,5000,5000,0,49,0,0,0,0,0,0,19,30134,0,0,0,0,0,0,0,'Stormforged Soldier - OOC - Start Attack (Brann''s Flying Machine)'),
(30136,0,2,0,0,0,100,0,1000,3000,2000,5000,0,11,56622,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Stormforged Soldier - On IC Update - Cast ''Thunder Orb'' (CONDITION_AURA)'),
(30136,0,3,0,0,0,40,0,1000,3000,2000,5000,0,11,56621,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Stormforged Soldier - On IC Update - Cast ''Thunder Orb'' (CONDITION_AURA)'),
(30136,0,4,0,38,0,100,0,1,1,0,0,0,11,55089,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Stormforged Soldier - On Data Set 1 1 - Cast ''Mount Brann''s Flying Machine'' (Invoker)'),
(30136,0,5,0,6,0,100,0,0,0,0,0,0,203,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stormforged Soldier - On Death - Exit Vehicle'),

(30405,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann Bronzebeard - On Just Summoned - Set Active On'),
(30405,0,1,0,61,0,100,0,0,0,0,0,0,80,3040500,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann Bronzebeard - Linked - Call Timed Action List'),

(3040500,9,0,0,0,0,100,0,0,0,0,0,0,11,56676,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Cast ''Summon Yorg Stormheart'''),
(3040500,9,1,0,0,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Set Run Off'),
(3040500,9,2,0,0,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,6692.69,-300.59,989.4,0,'Brann Bronzebeard - On Script - Move To Position'),
(3040500,9,3,0,0,0,100,0,10000,10000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 0'),
(3040500,9,4,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,19,30408,10,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Store Target 1 (Yorg Stormheart)'),
(3040500,9,5,0,0,0,100,0,6000,6000,0,0,0,1,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 0 (Stored Target 1)'),
(3040500,9,6,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 1'),
(3040500,9,7,0,0,0,100,0,6000,6000,0,0,0,1,1,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 1 (Stored Target 1)'),
(3040500,9,8,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 2 (Stored Target 1)'),
(3040500,9,9,0,0,0,100,0,4000,4000,0,0,0,1,3,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 3 (Stored Target 1)'),
(3040500,9,10,0,0,0,100,0,2000,2000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 2'),
(3040500,9,11,0,0,0,100,0,7000,7000,0,0,0,1,4,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 4 (Stored Target 1)'),
(3040500,9,12,0,0,0,100,0,7000,7000,0,0,0,1,5,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 5 (Stored Target 1)'),
(3040500,9,13,0,0,0,100,0,4000,4000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 3'),
(3040500,9,14,0,0,0,100,0,8000,8000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 4'),
(3040500,9,15,0,0,0,100,0,4000,4000,0,0,0,11,56697,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Cast ''Summon Magni Bronzebeard'''),
(3040500,9,16,0,0,0,100,0,0,0,0,0,0,64,2,0,0,0,0,0,19,30411,100,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Store Target 2 (Magni Bronzebeard)'),
(3040500,9,17,0,0,0,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 0 (Stored Target 2)'),
(3040500,9,18,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Set Data 1 1 (Stored Target 1)'),
(3040500,9,19,0,0,0,100,0,4000,4000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 5'),
(3040500,9,20,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Set Orientation (Stored Target 2)'),
(3040500,9,21,0,0,0,100,0,3000,3000,0,0,0,1,1,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 1 (Stored Target 2)'),
(3040500,9,22,0,0,0,100,0,3000,3000,0,0,0,45,2,2,0,0,0,0,12,2,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Set Data 2 2 (Stored Target 2)'),
(3040500,9,23,0,0,0,100,0,4000,4000,0,0,0,45,3,3,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Set Data 3 3 (Stored Target 1)'),
(3040500,9,24,0,0,0,100,0,0,0,0,0,0,45,3,3,0,0,0,0,12,2,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Set Data 3 3 (Stored Target 2)'),
(3040500,9,25,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Set Orientation (Stored Target 1)'),
(3040500,9,26,0,0,0,100,0,1000,1000,0,0,0,1,6,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 6 (Stored Target 1)'),
(3040500,9,27,0,0,0,100,0,4000,4000,0,0,0,1,2,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 2 (Stored Target 2)'),
(3040500,9,28,0,0,0,100,0,9000,9000,0,0,0,1,7,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 7 (Stored Target 1)'),
(3040500,9,29,0,0,0,100,0,4000,4000,0,0,0,1,3,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 3 (Stored Target 2)'),
(3040500,9,30,0,0,0,100,0,8000,8000,0,0,0,1,8,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 8 (Stored Target 1)'),
(3040500,9,31,0,0,0,100,0,8000,8000,0,0,0,1,9,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 9 (Stored Target 1)'),
(3040500,9,32,0,0,0,100,0,2000,2000,0,0,0,1,4,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 4 (Stored Target 2)'),
(3040500,9,33,0,0,0,100,0,2000,2000,0,0,0,1,5,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 5 (Stored Target 2)'),
(3040500,9,34,0,0,0,100,0,5000,5000,0,0,0,1,10,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 10 (Stored Target 1)'),
(3040500,9,35,0,0,0,100,0,9000,9000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 6'),
(3040500,9,36,0,0,0,100,0,4000,4000,0,0,0,1,11,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 11 (Stored Target 1)'),
(3040500,9,37,0,0,0,100,0,9000,9000,0,0,0,1,6,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 6 (Stored Target 2)'),
(3040500,9,38,0,0,0,100,0,7000,7000,0,0,0,1,12,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 12 (Stored Target 1)'),
(3040500,9,39,0,0,0,100,0,4000,4000,0,0,0,1,7,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 7 (Stored Target 2)'),
(3040500,9,40,0,0,0,100,0,4000,4000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 7'),
(3040500,9,41,0,0,0,100,0,7000,7000,0,0,0,1,13,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 13 (Stored Target 1)'),
(3040500,9,42,0,0,0,100,0,2000,2000,0,0,0,5,2,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Play Emote ''ONESHOT_BOW'' (Stored Target 1)'),
(3040500,9,43,0,0,0,100,0,3000,3000,0,0,0,1,8,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Say Line 8 (Stored Target 2)'),
(3040500,9,44,0,0,0,100,0,2000,2000,0,0,0,45,4,4,0,0,0,0,12,1,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Set Data 4 4 (Stored Target 1)'),
(3040500,9,45,0,0,0,100,0,2000,2000,0,0,0,5,70,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Play Emote ''ONESHOT_WAVE_NOSHEATHE'''),
(3040500,9,46,0,0,0,100,0,3000,3000,0,0,0,41,0,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Force Despawn (Stored Target 2)'),
(3040500,9,47,0,0,0,100,0,0,0,0,0,0,15,12973,0,0,0,0,0,18,50,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Quest Credit ''The Brothers Bronzebeard'''),
(3040500,9,48,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brann Bronzebeard - On Script - Force Despawn'),

(30408,0,0,1,54,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Yorg Stormheart - On Just Summoned - Set Run Off'),
(30408,0,1,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,6689.55,-300.58,989.35,0,'Yorg Stormheart - Linked - Move To Position'),
(30408,0,2,0,38,0,100,0,1,1,0,0,0,66,0,0,0,0,0,0,19,30411,50,0,0,0,0,0,0,'Yorg Stormheart - On Data Set 1 1 - Set Orientation (Magni Bronzebeard)'),
(30408,0,3,0,38,0,100,0,3,3,0,0,0,66,0,0,0,0,0,0,19,30411,10,0,0,0,0,0,0,'Yorg Stormheart - On Data Set 3 3 - Set Orientation (Magni Bronzebeard)'),
(30408,0,4,5,38,0,100,0,4,4,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Yorg Stormheart - On Data Set 4 4 - Set Run On'),
(30408,0,5,6,61,0,100,0,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Yorg Stormheart - Linked - Force Despawn'),
(30408,0,6,0,61,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,6657.3,-298.03,987.78,0,'Yorg Stormheart - Linked - Move To Position'),

(30411,0,0,0,54,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magni Bronzebeard - On Just Summoned - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(30411,0,1,0,38,0,100,0,2,2,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,6691.96,-296.59,989.16,0,'Magni Bronzebeard - On Data Set 2 2 - Move To Position'),
(30411,0,2,0,38,0,100,0,3,3,0,0,0,66,0,0,0,0,0,0,19,30408,10,0,0,0,0,0,0,'Magni Bronzebeard - On Data Set 3 3 - Set Orientation (Yorg Stormheart)'),
(30411,0,3,0,60,0,100,1,11000,11000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,6663.36,-295.16,988,0,'Magni Bronzebeard - On Update - Move To Position (No Repeat)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (13,18) AND `SourceEntry` IN (55089,56603);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (30134,30136) AND `SourceId` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(18,30134,55089,0,0,31,0,3,30136,0,0,0,0,'Brann''s Flying Machine - Group 0: Spellclick ''Mount Brann''s Flying Machine'' only allowed for ''Stormforged Soldier'''),
(18,30134,56603,0,0,31,0,4,0,0,0,0,0,'Brann''s Flying Machine - Group 0: Spellclick ''Mount Brann''s Flying Machine'' only allowed for player'),
(13,1,55089,0,0,31,0,3,30134,0,0,0,0,'Spell ''Mount Brann''s Flying Machine'' - Group 0: Implicit target creature ''Brann''s Flying Machine'''),

(22,4,30134,0,0,31,0,4,0,0,0,0,0,'Brann''s Flying Machine - Group 0: Execute SAI ID 3 only if invoker is player'),
(22,11,30134,0,0,31,0,4,0,0,0,0,0,'Brann''s Flying Machine - Group 0: Execute SAI ID 10 only if invoker is player'),
(22,27,30134,0,0,151,1,0,0,0,0,0,0,'Brann''s Flying Machine - Group 0: Execute SAI ID 26 only if has empty seat'),

(22,3,30136,0,0,1,1,55089,1,0,1,0,0,'Stormforged Soldier - Group 0: Execute SAI ID 2 only if has no aura ''Mount Brann''s Flying Machine'''),
(22,4,30136,0,0,1,1,55089,1,0,1,0,0,'Stormforged Soldier - Group 0: Execute SAI ID 3 only if has no aura ''Mount Brann''s Flying Machine''');
