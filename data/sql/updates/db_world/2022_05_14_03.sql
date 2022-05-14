UPDATE `npc_text` SET `text0_0` = 'In the time before time, what the usurpers would later call the First Age of Creation, my master and his siblings ruled over this world. It was they, the Old Gods, who created all.$B$BAnd it was they who would ultimately be cast down by those that would call themselves Shapers.' WHERE `ID` = 6843;
UPDATE `npc_text` SET `text0_0` = 'Their manifest forms weak from eons of battle, imprisoned beneath the world - the world that they themselves created - the corruption of the Titan Shapers would permeate through the surface and befoul the Old Gods.$B$BIt was then and there that the brothers did turn. For five millennia a battle was fought at the core of this world.' WHERE `ID` = 6844;
UPDATE `npc_text` SET `text0_0` = 'It was during the Elemental Sundering that the Firelord, Ragnaros, would seek to consume my Lord, Thunderaan, Prince of Air.$B$B<Demitrian bows his head, his face contorted in rage.>$B$BSpeak his name and I shall decorate this ravaged camp with your entrails. Be silent and listen.' WHERE `ID` = 6867;
UPDATE `npc_text` SET `text0_0` = 'What little remained of Thunderaan''s essence was stored within a talisman of elemental binding. Ragnaros then shattered the talisman in two flawless pieces. The pieces assigned to his Lieutenants...' WHERE `ID` = 6870;

DELETE FROM `gossip_menu` WHERE `MenuID` IN (5675,5689,5688,5687,5702,5701,5704,5703,5779,5780,5781,5783);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(5675,6812), -- No Bindings of the Windseeker
(5675,6954), -- One or both Bindings of the Windseeker

-- No Bindings of the Windseeker
(5689,6842),
(5688,6843),
(5687,6844),
(5702,6867),
(5701,6868),
(5704,6869),
(5703,6870),

-- One or both Bindings of the Windseeker
(5780,6955),
(5781,6956),
(5783,6958);

DELETE FROM `gossip_menu_option` WHERE `MenuID` IN (5675,5689,5688,5687,5702,5701,5704,5703,5779,5780,5781,5783);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(5675,0,0,'What do you know of it?',9296,1,1,5689,0,0,0,NULL,0,0), -- No Bindings of the Windseeker
(5675,1,0,'What must be done?',9547,1,1,5780,0,0,0,NULL,0,0),      -- One or both Bindings of the Windseeker

-- No Bindings of the Windseeker
(5689,0,0,'I am listening, Demitrian.',9298,1,1,5688,0,0,0,NULL,0,0),
(5688,0,0,'Continue, please.',9300,1,1,5687,0,0,0,NULL,0,0),
(5687,0,0,'A battle?',9330,1,1,5702,0,0,0,NULL,0,0),
(5702,0,0,'<Nod>.',9332,1,1,5701,0,0,0,NULL,0,0),
(5701,0,0,'Caught unaware? How?',9334,1,1,5704,0,0,0,NULL,0,0),
(5704,0,0,'So what did Ragnaros do next?',9336,1,1,5703,0,0,0,NULL,0,0),

-- One or both Bindings of the Windseeker
(5780,0,0,'The Firelord and all who dare stand in my way shall reel from my wrath.',9549,1,1,5781,0,0,0,NULL,0,0),
(5781,0,0,'I shall scour the earth for this Earthshaper. What of the essence?',9552,1,1,5783,0,0,0,NULL,0,0),
(5783,0,0,'Give me the vessel, Highlord.',9554,1,1,0,0,0,0,NULL,0,0);

DELETE FROM `creature_text` WHERE `CreatureId` = 14435;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(14435,0,0,'Well done, servant. For so long I have been held captive within the prison of the Firelord. I am once more free to feast upon the out world! The land shall once more be ravaged by the force of the Wind Seeker!',14,0,100,0,0,0,9570,0,'Prince Thunderaan'),
(14435,1,0,'Ah, and the fool who freed me shall be among the first to quell my immense hunger.',14,0,100,0,0,0,9571,0,'Prince Thunderaan'),
(14435,2,0,'My power is discombobulatingly devastating! It is ludicrous that these mortals even attempt to enter my realm!',14,0,100,0,0,0,9572,0,'Prince Thunderaan');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 14435;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (14347,14435);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1443500;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14347,0,0,1,62,0,100,0,5783,0,0,0,0,85,22958,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Highlord Demitrian - On Gossip Selected - Invoker Cast ''Summon Vessel of Rebirth DND'''),
(14347,0,1,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Highlord Demitrian - Linked - Close Gossip'),
(14347,0,2,0,20,0,100,0,7786,0,0,0,0,12,14435,6,3600000,0,0,0,8,0,0,0,0,-6241.77,1717.14,4.25042,0.680879,'Highlord Demitrian - On Quest ''Thunderaan the Windseeker'' Rewarded - Summon Creature ''Prince Thunderaan'''),

(14435,0,0,0,54,0,100,0,0,0,0,0,0,80,1443500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Thunderaan - On Just Summoned - Call Timed Action List'),
(14435,0,1,0,4,0,100,0,0,0,0,0,0,1,2,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Prince Thunderaan - On Aggro - Say Line 2'),
(14435,0,2,0,0,0,100,0,11000,15000,12000,20000,0,11,23009,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Thunderaan - IC - Cast ''Tendrils of Air'''),
(14435,0,3,0,0,0,100,0,5000,7000,8000,11000,0,11,23011,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Thunderaan - IC - Cast ''Tears of the Wind Seeker'''),

(1443500,9,0,0,0,0,100,0,0,0,0,0,0,11,20568,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Thunderaan - On Script - Cast ''Ragnaros Emerge'''),
(1443500,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Thunderaan - On Script - Say Line 0'),
(1443500,9,2,0,0,0,100,0,13000,13000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Thunderaan - On Script - Say Line 1');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` IN (5675,5703);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,5675,6954,0,0,2,0,18564,1,0,0,0,0,'Highlord Demitrian - Group 0: Show gossip text 6954 if item ''Bindings of the Windseeker (Right)'' is in the inventory'),
(14,5675,6954,0,0,47,0,7785,1,0,0,0,0,'Highlord Demitrian - Group 0: Show gossip text 6954 if quest ''Examine the vessel'' is not taken'),
(14,5675,6954,0,1,2,0,18563,1,0,0,0,0,'Highlord Demitrian - Group 1: Show gossip text 6954 if item ''Bindings of the Windseeker (Left)'' is in the inventory'),
(14,5675,6954,0,1,47,0,7785,1,0,0,0,0,'Highlord Demitrian - Group 1: Show gossip text 6954 if quest ''Examine the vessel'' is not taken'),

(14,5675,6812,0,0,2,0,18564,1,0,1,0,0,'Highlord Demitrian - Group 0: Show gossip text 6812 if item ''Bindings of the Windseeker (Right)'' is not in the inventory'),
(14,5675,6812,0,0,2,0,18563,1,0,1,0,0,'Highlord Demitrian - Group 0: Show gossip text 6812 if item ''Bindings of the Windseeker (Left)'' is not in the inventory'),
(14,5675,6812,0,1,47,0,7785,1,0,1,0,0,'Highlord Demitrian - Group 1: Show gossip text 6812 if quest ''Examine the vessel'' is taken'),

(15,5675,0,0,0,2,0,18563,1,0,1,0,0,'Highlord Demitrian - Group 0: Show gossip option 0 if item ''Bindings of the Windseeker (Left)'' is not in the inventory'),
(15,5675,0,0,0,2,0,18564,1,0,1,0,0,'Highlord Demitrian - Group 0: Show gossip option 0 if item ''Bindings of the Windseeker (Right)'' is not in the inventory'),
(15,5675,0,0,0,47,0,7785,1,0,0,0,0,'Highlord Demitrian - Group 0: Show gossip option 0 if quest ''Examine the vessel'' is not taken'),

(15,5675,1,0,0,2,0,18564,1,0,0,0,0,'Highlord Demitrian - Group 0: Show gossip option 1 if item ''Bindings of the Windseeker (Right)'' is in the inventory'),
(15,5675,1,0,0,47,0,7785,1,0,0,0,0,'Highlord Demitrian - Group 0: Show gossip option 1 if quest ''Examine the vessel'' is not taken'),
(15,5675,1,0,1,2,0,18563,1,0,0,0,0,'Highlord Demitrian - Group 1: Show gossip option 1 if item ''Bindings of the Windseeker (Left)'' is in the inventory'),
(15,5675,1,0,1,47,0,7785,1,0,0,0,0,'Highlord Demitrian - Group 1: Show gossip option 1 if quest ''Examine the vessel'' is not taken');
