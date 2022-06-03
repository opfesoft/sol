DELETE FROM `gossip_menu` WHERE `MenuID` = 6942 AND `TextID` = 8233;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(6942,8233);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 6942;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,6942,8232,0,0,47,0,8890,64,0,1,0,0,'Magister Duskwither - Group 0: Show gossip menu text 8232 if quest ''Word from the Spire'' is not rewarded'),
(14,6942,8233,0,0,47,0,8890,64,0,0,0,0,'Magister Duskwither - Group 0: Show gossip menu text 8233 if quest ''Word from the Spire'' is rewarded');

DELETE FROM `gameobject` WHERE `guid` IN (3009031,3009032);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3009031,181012,530,0,0,1,1,9049.71,-7434.27,84.6563,2.09439,0,0,0,0,-1,100,1,0),
(3009032,181013,530,0,0,1,1,9049.71,-7434.27,85.137,1.25664,0,0,0,0,-1,100,1,0);

DELETE FROM `creature_equip_template` WHERE `CreatureID` = 15951 AND `ID` = 2;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`)
VALUES
(15951,2,12751,0,0,0);

DELETE FROM `spell_target_position` WHERE `ID` = 26660;
INSERT INTO `spell_target_position` (`ID`, `EffectIndex`, `MapID`, `PositionX`, `PositionY`, `PositionZ`, `Orientation`, `VerifiedBuild`)
VALUES
(26660,0,530,9049.71,-7434.27,84.6563,0,0);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 15951;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1595100;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(15951,0,0,0,20,0,100,0,8891,0,0,0,0,80,1595100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Duskwither - On Quest ''Abandoned Investigations'' Rewarded - Call Timed Action List'),

(1595100,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Duskwither - On Script - Remove NPC Flag'),
(1595100,9,1,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Duskwither - On Script - Set Active On'),
(1595100,9,2,0,0,0,100,0,3000,3000,0,0,0,71,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Duskwither - On Script - Equip Template ID 2'),
(1595100,9,3,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0.784539,'Magister Duskwither - On Script - Set Orientation'),
(1595100,9,4,0,0,0,100,0,2000,2000,0,0,0,5,61,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Duskwither - On Script - Play Emote ''ONESHOT_ATTACKTHROWN'''),
(1595100,9,5,0,0,0,100,0,0,0,0,0,0,71,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Duskwither - On Script - Remove Equip'),
(1595100,9,6,0,0,0,100,0,1000,1000,0,0,0,70,13,0,0,0,0,0,14,3009031,181012,0,0,0,0,0,0,'Magister Duskwither - On Script - Respawn GO ''Magister Duskwither''s Journal'''),
(1595100,9,7,0,0,0,100,0,3000,3000,0,0,0,11,26660,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Duskwither - On Script - Cast ''Duskwither''s Fireball'''),
(1595100,9,8,0,0,0,100,0,4000,4000,0,0,0,70,12,0,0,0,0,0,14,3009032,181013,0,0,0,0,0,0,'Magister Duskwither - On Script - Respawn GO ''Fire'''),
(1595100,9,9,0,0,0,100,0,2000,2000,0,0,0,71,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Duskwither - On Script - Equip Template ID 1'),
(1595100,9,10,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Duskwither - On Script - Say Line 1'),
(1595100,9,11,0,0,0,100,0,6000,6000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Duskwither - On Script - Reset Orientation'),
(1595100,9,12,0,0,0,100,0,4000,4000,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Duskwither - On Script - Add NPC Flag'),
(1595100,9,13,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Duskwither - On Script - Set Active Off');
