UPDATE `creature` SET `wander_distance` = 15, `MovementType` = 1 WHERE `guid` = 66744;
UPDATE `creature` SET `wander_distance` = 10, `MovementType` = 1 WHERE `guid` = 66745;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` IN (18584,18585,18586);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (18584,18585,18586);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18584,0,0,0,0,0,100,0,15000,15000,15000,15000,0,11,31705,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Sal''salabim - IC - Cast ''Magnetic Pull'''),
(18584,0,1,2,62,0,100,0,7725,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Sal''salabim - On Gossip Option 0 Selected - Close Gossip'),
(18584,0,2,3,61,0,100,0,0,0,0,0,0,2,90,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sal''salabim - Linked - Set Faction ''Demon'''),
(18584,0,3,4,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Sal''salabim - Linked - Say Line 0'),
(18584,0,4,5,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Sal''salabim - Linked - Start Attack (Invoker)'),
(18584,0,5,0,61,0,100,0,0,0,0,0,0,42,0,19,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sal''salabim - Linked - Set Invincibility HP 19%'),
(18584,0,6,7,2,0,100,1,0,20,0,0,0,15,10004,0,0,0,0,0,24,0,0,0,0,0,0,0,0,'Sal''salabim - On Health Between 0-20% - Quest Credit ''Patience and Understanding'''),
(18584,0,7,8,61,0,100,0,0,0,0,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sal''salabim - Linked - Reset Faction'),
(18584,0,8,0,61,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Sal''salabim - Linked - Evade'),
(18584,0,9,0,25,0,100,0,0,0,0,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sal''salabim - On Reset - Reset Faction'),

(18585,0,0,0,0,0,100,0,5000,5000,15000,15000,0,11,10966,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Raliq the Drunk - IC - Cast ''Uppercut'''),
(18585,0,1,2,62,0,100,0,7729,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Raliq the Drunk - On Gossip Option 0 Selected - Close Gossip'),
(18585,0,2,3,61,0,100,0,0,0,0,0,0,2,45,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raliq the Drunk - Linked - Set Faction ''Ogre'''),
(18585,0,3,4,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Raliq the Drunk - Linked - Say Line 0'),
(18585,0,4,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Raliq the Drunk - Linked - Start Attack (Invoker)'),
(18585,0,5,0,25,0,100,0,0,0,0,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raliq the Drunk - On Reset - Reset Faction'),

(18586,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Coosh''coosh - OOC - Cast ''Lightning Shield'''),
(18586,0,1,0,0,0,100,0,0,0,3000,3000,0,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Coosh''coosh - IC - Cast ''Lightning Bolt'''),
(18586,0,2,3,62,0,100,0,7730,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Coosh''coosh - On Gossip Option 0 Selected - Close Gossip'),
(18586,0,3,4,61,0,100,0,0,0,0,0,0,2,45,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Coosh''coosh - Linked - Set Faction ''Ogre'''),
(18586,0,4,5,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Coosh''coosh - Linked - Say Line 0'),
(18586,0,5,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Coosh''coosh - Linked - Start Attack (Invoker)'),
(18586,0,6,0,25,0,100,0,0,0,0,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Coosh''coosh - On Reset - Reset Faction');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (7725,7729,7730,7732);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,7725,0,0,0,47,0,10004,8,0,0,0,0,'Creature ''Sal''salabim'' - Group 0: Show gossip option 0 if quest ''Patience and Understanding'' is in progress'),

(15,7729,0,0,0,47,0,10009,8,0,0,0,0,'Creature ''Raliq the Drunk'' - Group 0: Show gossip option 0 if quest ''Crackin'' Some Skulls'' is in progress'),
(15,7729,0,0,0,2,0,25767,1,1,1,0,0,'Creature ''Raliq the Drunk'' - Group 0: Show gossip option 0 if item ''Raliq''s Debt'' is not in the inventory or in the bank'),

(15,7730,0,0,0,47,0,10009,8,0,0,0,0,'Creature ''Coosh''coosh'' - Group 0: Show gossip option 0 if quest ''Crackin'' Some Skulls'' is in progress'),
(15,7730,0,0,0,2,0,25768,1,1,1,0,0,'Creature ''Coosh''coosh'' - Group 0: Show gossip option 0 if item ''Coosh''coosh''s Debt'' is not in the inventory or in the bank'),

(15,7732,0,0,0,47,0,10009,8,0,0,0,0,'Creature ''Floon'' - Group 0: Show gossip option 0 if quest ''Crackin'' Some Skulls'' is in progress'),
(15,7732,0,0,0,2,0,25769,1,1,1,0,0,'Creature ''Floon'' - Group 0: Show gossip option 0 if item ''Floon''s Debt'' is not in the inventory or in the bank');
