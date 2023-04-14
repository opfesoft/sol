UPDATE `spell_dbc` SET `Effect1` = 28, -- SPELL_EFFECT_SUMMON
`EffectImplicitTargetA1` = 72,         -- TARGET_DEST_CASTER_RANDOM
`EffectRadiusIndex1` = 15,             -- EFFECT_RADIUS_3_YARDS
`EffectMiscValueB1` = 64               -- see SummonProperties.dbc ID 64
WHERE `ID` = 37947;

DELETE FROM `gossip_menu_option` WHERE `MenuID` = 30008;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 30008;

UPDATE `creature` SET `modelid` = 20577, `spawntimesecs` = -1 WHERE `guid` = 77278;

UPDATE `creature` SET `position_x` = -4601.84, `position_y` = 1816.82, `position_z` = 163.857, `wander_distance` = 15, `MovementType` = 1 WHERE `guid` = 70929;
UPDATE `creature` SET `position_x` = -4600.76, `position_y` = 1850.92, `position_z` = 154.796, `wander_distance` = 15, `MovementType` = 1 WHERE `guid` = 70930;
UPDATE `creature` SET `position_x` = -4571.05, `position_y` = 1866.17, `position_z` = 155.319, `wander_distance` = 15, `MovementType` = 1 WHERE `guid` = 70931;
UPDATE `creature` SET `position_x` = -4541.59, `position_y` = 1991.72, `position_z` = 123.116, `wander_distance` = 15, `MovementType` = 1 WHERE `guid` = 70932;
UPDATE `creature` SET `position_x` = -4530.94, `position_y` = 1899.71, `position_z` = 158.983, `wander_distance` = 15, `MovementType` = 1 WHERE `guid` = 70933;

DELETE FROM `creature` WHERE `guid` BETWEEN 3009362 AND 3009365;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3009362,19823,530,0,0,1,1,0,0,-4486.58,1998.88,112.765,0.113942,300,15,1,0,1,0,0,0,0),
(3009363,19823,530,0,0,1,1,0,0,-4522.88,2112.3,35.8911,0.221064,300,10,1,0,1,0,0,0,0),
(3009364,19823,530,0,0,1,1,0,0,-4561.13,2024.76,92.2968,5.31829,300,15,1,0,1,0,0,0,0),
(3009365,19823,530,0,0,1,1,0,0,-4405.04,2341.02,27.7084,0.071826,300,10,1,0,1,0,0,0,0);

DELETE FROM `creature_text` WHERE `CreatureId` = 22054;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(22054,0,0,'Brashly you have attacked my children, Illidan! The pact is broken. Giant will never side with elf! NEVER!',14,0,100,0,0,0,19737,2,'Behemothon, King of the Colossi'),
(22054,1,0,'%s roars in defiance.',16,0,100,0,0,3685,19739,2,'Behemothon, King of the Colossi');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (21936,22054);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (19823,21936,21769,21773,22054);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2205400,2176900,2177300);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19823,0,0,0,2,0,100,1,0,75,0,0,0,11,37947,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crazed Colossus - Between 0-75% Health - Cast ''Summon Crazed Shardling'' (No Repeat)'),
(19823,0,1,0,2,0,100,1,0,50,0,0,0,11,37947,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crazed Colossus - Between 0-50% Health - Cast ''Summon Crazed Shardling'' (No Repeat)'),
(19823,0,2,0,2,0,100,1,0,25,0,0,0,11,37947,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crazed Colossus - Between 0-25% Health - Cast ''Summon Crazed Shardling'' (No Repeat)'),
(19823,0,3,0,6,0,100,0,0,0,0,0,0,11,38223,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Crazed Colossus - On Death - Cast ''Quest Credit: Crazed Colossus'' (Invoker)'),

(21936,0,0,0,0,0,100,1,3000,6000,0,0,0,11,34970,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crazed Shardling - IC - Cast ''Frenzy'' (No Repeat)'),
(21936,0,1,0,1,0,100,1,1000,2000,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Crazed Shardling - OOC - Start Attack (Closest Player) (No Repeat)'),

(21769,0,0,0,1,0,100,0,120000,120000,300000,300000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Overlord Or''barokh - OOC - Say Line 0'),
(21769,0,1,0,1,0,100,0,123000,123000,303000,303000,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Overlord Or''barokh - OOC - Say Line 1'),
(21769,0,2,0,1,0,100,0,129000,129000,309000,309000,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Overlord Or''barokh - OOC - Say Line 2'),
(21769,0,3,4,62,0,100,0,8443,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Overlord Or''barokh - On Gossip Option 0 Selected - Close Gossip'),
(21769,0,4,0,61,0,100,0,0,0,0,0,0,85,38172,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Overlord Or''barokh - Linked - Invoker Cast ''Create Kor''kron Flare Gun'''),
(21769,0,5,0,20,0,100,0,10769,0,0,0,0,80,2176900,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Overlord Or''barokh - On Quest ''Dissension Amongst the Ranks... (Horde)'' Rewarded - Call Timed Action List'),

(2176900,9,0,0,0,0,100,0,0,0,0,0,0,215,0,0,0,0,0,0,8,0,0,0,0,-4229.63,1438.53,0,0,'Overlord Or''barokh - On Script - Load Grid (Behemothon, King of the Colossi Position)'),
(2176900,9,1,0,0,0,100,0,3000,3000,0,0,0,48,1,0,0,0,0,0,10,77278,22054,1,0,0,0,0,0,'Overlord Or''barokh - On Script - Set Active On (Behemothon, King of the Colossi)'),
(2176900,9,2,0,0,0,100,0,3000,3000,0,0,0,70,0,0,0,0,0,0,10,77278,22054,1,0,0,0,0,0,'Overlord Or''barokh - On Script - Respawn Target (Behemothon, King of the Colossi)'),

(21773,0,0,0,1,0,100,0,120000,120000,200000,260000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thane Yoregar - OOC - Say Line 0'),
(21773,0,1,2,62,0,100,0,8457,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Thane Yoregar - On Gossip Option 0 Selected - Close Gossip'),
(21773,0,2,0,61,0,100,0,0,0,0,0,0,85,38251,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Thane Yoregar - Linked - Invoker Cast ''Create Wildhammer Flare Gun'''),
(21773,0,3,0,20,0,100,0,10776,0,0,0,0,80,2177300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thane Yoregar - On Quest ''Dissension Amongst the Ranks... (Alliance)'' Rewarded - Call Timed Action List'),

(2177300,9,0,0,0,0,100,0,0,0,0,0,0,215,0,0,0,0,0,0,8,0,0,0,0,-4229.63,1438.53,0,0,'Thane Yoregar - On Script - Load Grid (Behemothon, King of the Colossi Position)'),
(2177300,9,1,0,0,0,100,0,3000,3000,0,0,0,48,1,0,0,0,0,0,10,77278,22054,1,0,0,0,0,0,'Thane Yoregar - On Script - Set Active On (Behemothon, King of the Colossi)'),
(2177300,9,2,0,0,0,100,0,3000,3000,0,0,0,70,0,0,0,0,0,0,10,77278,22054,1,0,0,0,0,0,'Thane Yoregar - On Script - Respawn Target (Behemothon, King of the Colossi)'),

(22054,0,0,0,11,0,100,0,0,0,0,0,0,80,2205400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Behemothon, King of the Colossi - On Respawn - Call Timed Action List'),

(2205400,9,0,0,0,0,100,0,0,0,0,0,0,41,60000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Behemothon, King of the Colossi - On Script - Force Despawn'),
(2205400,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Behemothon, King of the Colossi - On Script - Say Line 0'),
(2205400,9,2,0,0,0,100,0,6000,6000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Behemothon, King of the Colossi - On Script - Say Line 1');
