UPDATE `creature_template` SET `ScriptName` = '', `AIName` = 'SmartAI' WHERE `entry` IN (18588,22095,22307,22419);
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 19679;
UPDATE `gameobject_template` SET `ScriptName` = '', `AIName` = 'SmartGameObjectAI' WHERE `entry` = 185913;

DELETE FROM `gossip_menu` WHERE `MenuID` = 8021 AND `TextID` = 9895;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(8021,9895);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (18588,22095,22307,22419);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 185913;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18588,0,0,0,0,0,100,0,2000,2000,30000,30000,0,11,6726,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Floon - IC - Cast ''Silence'''),
(18588,0,1,0,0,0,100,0,4000,4000,5000,5000,0,11,9672,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Floon - IC - Cast ''Frostbolt'''),
(18588,0,2,0,0,0,100,0,9000,9000,20000,20000,0,11,11831,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Floon - IC - Cast ''Frost Nova'''),
(18588,0,3,4,62,0,100,0,7731,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Floon - On Gossip Option 0 Selected - Close Gossip'),
(18588,0,4,5,61,0,100,0,0,0,0,0,0,2,1738,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Floon - Linked - Set Faction ''Arrakoa'''),
(18588,0,5,6,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Floon - Linked - Say Line 0'),
(18588,0,6,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Floon - Linked - Start Attack (Invoker)'),
(18588,0,7,0,25,0,100,0,0,0,0,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Floon - On Reset - Set Default Faction'),

(22095,0,0,0,0,0,100,0,15000,20000,32000,38000,0,11,39000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infested Root-Walker - IC - Cast ''Regrowth'''),
(22095,0,1,0,6,0,75,0,0,0,0,0,0,11,39130,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infested Root-Walker - On Just Died - Cast ''Summon Wood Mites'' (CONDITION_QUESTSTATE)'),

(22307,0,0,0,0,0,100,0,0,5,12000,18000,0,11,15548,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rotting Forest-Rager - IC - Cast ''Thunderclap'''),
(22307,0,1,0,6,0,75,0,0,0,0,0,0,11,39134,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rotting Forest-Rager - On Just Died - Cast ''Summon Lots Of Wood Mites'' (CONDITION_QUESTSTATE)'),

(22419,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wood Mite - On Just Summoned - Set Active On'),
(22419,0,1,0,61,0,100,0,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wood Mite - Linked - Enable Random Movement'),

(185913,1,0,4,62,0,100,0,8660,0,0,0,0,85,40632,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Skull Pile - On Gossip Option 0 Selected - Invoker Cast ''Summon Gezzarak the Huntress'''),
(185913,1,1,4,62,0,100,0,8660,1,0,0,0,85,40642,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Skull Pile - On Gossip Option 1 Selected - Invoker Cast ''Summon Darkscreecher Akkarai'''),
(185913,1,2,4,62,0,100,0,8660,2,0,0,0,85,40640,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Skull Pile - On Gossip Option 2 Selected - Invoker Cast ''Summon Karrog'''),
(185913,1,3,4,62,0,100,0,8660,3,0,0,0,85,40644,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Skull Pile - On Gossip Option 3 Selected - Invoker Cast ''Summon Vakkiz the Windrager'''),
(185913,1,4,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Skull Pile - On Gossip Option Selected - Close Gossip');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (22095,22307) AND `SourceId` = 0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` IN (8660,7732,8021);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,7732,0,0,0,47,0,10009,8,0,0,0,0,'Creature ''Floon'' - Group 0: Show gossip option 0 if quest ''Crackin'' Some Skulls'' is in progress'),

(22,2,22095,0,0,47,0,10896,8,0,0,0,0,'Creature ''Infested Root-Walker'' - Group 0: Execute SAI ID 1 if quest ''The Infested Protectors'' is in progress'),

(22,2,22307,0,0,47,0,10896,8,0,0,0,0,'Creature ''Rotting Forest-Rager'' - Group 0: Execute SAI ID 1 if quest ''The Infested Protectors'' is in progress'),

(14,8660,11057,0,0,2,0,32620,1,0,0,0,0,'GO ''Skull Pile'' - Group 0: Show gossip menu text 11057 if item ''Time-Lost Scroll'' is in the inventory'),
(14,8660,10888,0,0,2,0,32620,1,0,1,0,0,'GO ''Skull Pile'' - Group 0: Show gossip menu text 10888 if item ''Time-Lost Scroll'' is not in the inventory'),

(15,8660,0,0,0,2,0,32620,10,0,0,0,0,'GO ''Skull Pile'' - Group 0: Show gossip option 0 if item ''Time-Lost Scroll'' (Count: 10) is in the inventory'),
(15,8660,1,0,0,2,0,32620,10,0,0,0,0,'GO ''Skull Pile'' - Group 0: Show gossip option 1 if item ''Time-Lost Scroll'' (Count: 10) is in the inventory'),
(15,8660,2,0,0,2,0,32620,10,0,0,0,0,'GO ''Skull Pile'' - Group 0: Show gossip option 2 if item ''Time-Lost Scroll'' (Count: 10) is in the inventory'),
(15,8660,3,0,0,2,0,32620,10,0,0,0,0,'GO ''Skull Pile'' - Group 0: Show gossip option 3 if item ''Time-Lost Scroll'' (Count: 10) is in the inventory'),

(14,8021,9895,0,0,5,0,933,240,0,1,0,0,'Creature ''"Slim"'' - Group 0: Show gossip menu text 9895 if not at least friendly with The Consortium'),
(14,8021,9896,0,0,5,0,933,240,0,0,0,0,'Creature ''"Slim"'' - Group 0: Show gossip menu text 9896 if at least friendly with The Consortium'),
(15,8021,0,0,0,5,0,933,240,0,0,0,0,'Creature ''"Slim"'' - Group 0: Show gossip option 0 if at least friendly with The Consortium');
