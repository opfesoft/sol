DELETE FROM `creature_text` WHERE `CreatureId` = 7363;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(7363,0,0,'%s releases the flawless draenethyst sphere, allowing it to hover before him.',16,0,100,0,0,0,3441,0,'Kum''isha the Collector'),
(7363,1,0,'%s chants in an unknown tongue.',16,0,100,0,0,0,3442,0,'Kum''isha the Collector'),
(7363,2,0,'Success, the rift is open!! My brethren, rise and return home! The Outland awaits!',14,0,100,0,0,0,3475,0,'Kum''isha the Collector'),
(7363,3,0,'Hurry brothers! You must go now! I do not know how much longer the rift will remain open!',12,0,100,0,0,0,3476,0,'Kum''isha the Collector'),
(7363,4,0,'And now you know why I live in a crater.',12,0,100,0,0,0,3477,0,'Kum''isha the Collector');

DELETE FROM `gossip_menu` WHERE `MenuID` = 752 AND `TextID` = 1303;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(752,1303);

DELETE FROM `creature_summon_groups` WHERE `summonerId` = 7363;
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`)
VALUES
(7363,0,1,7401,-11303.2,-2989.65,5.53587,2.83237,8,0),
(7363,0,1,7401,-11309.1,-2972.41,8.33972,3.24362,8,0),
(7363,0,1,7401,-11317,-2978.34,5.48171,3.21221,8,0),
(7363,0,1,7401,-11328.8,-2979.58,6.07384,3.19257,8,0),
(7363,0,1,7401,-11321.9,-2974.86,7.56403,3.30645,8,0);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (7363,7401);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (7363,7401);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 736300;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(7363,0,0,0,20,0,100,0,2521,0,0,0,0,80,736300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kum''isha the Collector - On Quest ''To Serve Kum''isha'' Rewarded - Call Timed Action List'),

(736300,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kum''isha the Collector - On Script - Set Active On'),
(736300,9,1,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kum''isha the Collector - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(736300,9,2,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,1.03552,'Kum''isha the Collector - On Script - Set Orientation'),
(736300,9,3,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kum''isha the Collector - On Script - Say Line 0'),
(736300,9,4,0,0,0,100,0,0,0,0,0,0,12,7364,8,0,0,0,0,8,0,0,0,0,-11359.4,-2977.5,-0.447796,4.13626,'Kum''isha the Collector - On Script - Summon Creature ''Flawless Draenethyst Sphere'''),
(736300,9,5,0,0,0,100,0,4000,4000,0,0,0,11,65633,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kum''isha the Collector - On Script - Cast ''Arcane Cast Visual'''),
(736300,9,6,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kum''isha the Collector - On Script - Say Line 1'),
(736300,9,7,0,0,0,100,0,3000,3000,0,0,0,50,137167,26,0,0,0,0,8,0,0,0,0,-11359.4,-2977.5,-0.447796,0.185707,'Kum''isha the Collector - On Script - Summon Gameobject ''Nether Rift'''),
(736300,9,8,0,0,0,100,0,2000,2000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kum''isha the Collector - On Script - Say Line 2'),
(736300,9,9,0,0,0,100,0,0,0,0,0,0,107,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kum''isha the Collector - On Script - Summon Creature Group 1'),
(736300,9,10,0,0,0,100,0,10000,10000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kum''isha the Collector - On Script - Say Line 3'),
(736300,9,11,0,0,0,100,0,15000,15000,0,0,0,86,58538,0,19,7364,0,0,1,0,0,0,0,0,0,0,0,'Kum''isha the Collector - On Script - Cross Cast ''Arcane Explosion Visual'''),
(736300,9,12,0,0,0,100,0,500,500,0,0,0,41,0,0,0,0,0,0,19,7364,0,0,0,0,0,0,0,'Kum''isha the Collector - On Script - Despawn Creature ''Flawless Draenethyst Sphere'''),
(736300,9,13,0,0,0,100,0,3000,3000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kum''isha the Collector - On Script - Say Line 4'),
(736300,9,14,0,0,0,100,0,5000,5000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kum''isha the Collector - On Script - Reset Orientation'),
(736300,9,15,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kum''isha the Collector - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(736300,9,16,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kum''isha the Collector - On Script - Set Active Off'),

(7401,0,0,0,54,0,100,0,0,0,0,0,0,53,0,7401,0,0,0,0,1,0,0,0,0,0,0,0,0,'Draenei Refugee - On Just Summoned - Start WP Movement'),
(7401,0,1,2,58,0,100,0,0,0,0,0,0,11,51347,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Draenei Refugee - On WP Path Ended - Cast ''Teleport Visual Only'''),
(7401,0,2,0,61,0,100,0,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Draenei Refugee - Linked - Force Despawn');

DELETE FROM `waypoints` WHERE `entry` = 7401;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(7401,1,-11336.5,-2981.66,2.98413,'Draenei Refugee (Quest ''To Serve Kum''isha'')'),
(7401,2,-11342.5,-2980.58,2.5666,NULL),
(7401,3,-11346.9,-2979.77,2.71708,NULL),
(7401,4,-11351.4,-2978.95,1.89313,NULL),
(7401,5,-11359.4,-2977.5,-0.447796,NULL);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 752;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,752,1302,0,0,47,0,2521,64,0,1,0,0,'Kum''isha the Collector - Group 0: Show gossip text 1302 if quest ''To Serve Kum''isha'' is not rewarded'),
(14,752,1303,0,0,47,0,2521,64,0,0,0,0,'Kum''isha the Collector - Group 0: Show gossip text 1303 if quest ''To Serve Kum''isha'' is rewarded');
