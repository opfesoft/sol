DELETE FROM `creature_text` WHERE `CreatureId` IN (22281,23353,23354,23355);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(22281,0,0,'I am older than you can fathom.  Show some respect!',14,0,100,0,0,0,21688,0,'Galvanoth'),
(22281,0,1,'As I shall consume your flesh, so too shall the Burning Legion consume your people!',14,0,100,0,0,0,21689,0,'Galvanoth'),
(22281,0,2,'I will make your death a quick one, $n.',14,0,100,0,0,0,21692,0,'Galvanoth'),
(22281,0,3,'May whatever god you believe in have mercy on you.  For I will show you none.',14,0,100,0,0,0,21694,0,'Galvanoth'),
(22281,0,4,'Eager to die, are we?',14,0,100,0,0,0,21697,0,'Galvanoth'),
(22281,0,5,'Your death is at hand, $n.  Savor these last moments.',14,0,100,0,0,0,21702,0,'Galvanoth'),
(22281,0,6,'You dare summon me?  Your insolence will be punished.',14,0,100,0,0,0,21721,0,'Galvanoth'),

(23353,0,0,'I am older than you can fathom.  Show some respect!',14,0,100,0,0,0,21688,0,'Braxxus'),
(23353,0,1,'As I shall consume your flesh, so too shall the Burning Legion consume your people!',14,0,100,0,0,0,21689,0,'Braxxus'),
(23353,0,2,'I will make your death a quick one, $n.',14,0,100,0,0,0,21692,0,'Braxxus'),
(23353,0,3,'May whatever god you believe in have mercy on you.  For I will show you none.',14,0,100,0,0,0,21694,0,'Braxxus'),
(23353,0,4,'Eager to die, are we?',14,0,100,0,0,0,21697,0,'Braxxus'),
(23353,0,5,'Your death is at hand, $n.  Savor these last moments.',14,0,100,0,0,0,21702,0,'Braxxus'),
(23353,0,6,'You dare summon me?  Your insolence will be punished.',14,0,100,0,0,0,21721,0,'Braxxus'),

(23354,0,0,'I am older than you can fathom.  Show some respect!',14,0,100,0,0,0,21688,0,'Mo''arg Incinerator'),
(23354,0,1,'As I shall consume your flesh, so too shall the Burning Legion consume your people!',14,0,100,0,0,0,21689,0,'Mo''arg Incinerator'),
(23354,0,2,'I will make your death a quick one, $n.',14,0,100,0,0,0,21692,0,'Mo''arg Incinerator'),
(23354,0,3,'May whatever god you believe in have mercy on you.  For I will show you none.',14,0,100,0,0,0,21694,0,'Mo''arg Incinerator'),
(23354,0,4,'Eager to die, are we?',14,0,100,0,0,0,21697,0,'Mo''arg Incinerator'),
(23354,0,5,'Your death is at hand, $n.  Savor these last moments.',14,0,100,0,0,0,21702,0,'Mo''arg Incinerator'),
(23354,0,6,'You dare summon me?  Your insolence will be punished.',14,0,100,0,0,0,21721,0,'Mo''arg Incinerator'),

(23355,0,0,'I am older than you can fathom.  Show some respect!',14,0,100,0,0,0,21688,0,'Zarcsin'),
(23355,0,1,'As I shall consume your flesh, so too shall the Burning Legion consume your people!',14,0,100,0,0,0,21689,0,'Zarcsin'),
(23355,0,2,'I will make your death a quick one, $n.',14,0,100,0,0,0,21692,0,'Zarcsin'),
(23355,0,3,'May whatever god you believe in have mercy on you.  For I will show you none.',14,0,100,0,0,0,21694,0,'Zarcsin'),
(23355,0,4,'Eager to die, are we?',14,0,100,0,0,0,21697,0,'Zarcsin'),
(23355,0,5,'Your death is at hand, $n.  Savor these last moments.',14,0,100,0,0,0,21702,0,'Zarcsin'),
(23355,0,6,'You dare summon me?  Your insolence will be punished.',14,0,100,0,0,0,21721,0,'Zarcsin');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (22281,23353,23354,23355);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 185927;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (18592700,18592701,18592702,18592703,2228100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(185927,1,0,1,62,0,100,0,8671,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Fel Crystal Prism - On Gossip Option 0 Selected - Store Target 1 (Invoker)'),
(185927,1,1,2,61,0,100,0,0,0,0,0,0,57,32569,35,0,0,0,0,12,1,0,0,0,0,0,0,0,'Fel Crystal Prism - Linked - Remove Item ''Apexis Shard'' (Stored Target 1)'),
(185927,1,2,3,61,0,100,0,0,0,0,0,0,244,1,2,3,4,0,0,1,0,0,0,0,0,0,0,0,'Fel Crystal Prism - Linked - Trigger Random Timed Event'),
(185927,1,3,4,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Fel Crystal Prism - Linked - Close Gossip'),
(185927,1,4,0,61,0,100,0,0,0,0,0,0,233,300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Crystal Prism - Linked - Despawn GO'),
(185927,1,5,0,59,0,100,0,1,0,0,0,0,12,22281,1,300000,0,10,10,1,0,0,0,0,0,0,0,0,'Fel Crystal Prism - On Timed Event 1 Triggered - Summon Creature ''Galvanoth'''),
(185927,1,6,0,59,0,100,0,2,0,0,0,0,12,23353,1,300000,0,10,10,1,0,0,0,0,0,0,0,0,'Fel Crystal Prism - On Timed Event 2 Triggered - Summon Creature ''Braxxus'''),
(185927,1,7,0,59,0,100,0,3,0,0,0,0,12,23354,1,300000,0,10,10,1,0,0,0,0,0,0,0,0,'Fel Crystal Prism - On Timed Event 3 Triggered - Summon Creature ''Mo''arg Incinerator'''),
(185927,1,8,0,59,0,100,0,4,0,0,0,0,12,23355,1,300000,0,10,10,1,0,0,0,0,0,0,0,0,'Fel Crystal Prism - On Timed Event 4 Triggered - Summon Creature ''Zarcsin'''),
(185927,1,9,10,17,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Fel Crystal Prism - On Summoned Unit - Send Target 1 (Invoker)'),
(185927,1,10,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Fel Crystal Prism - Linked - Set Data 1 1 (Invoker)'),

(22281,0,0,0,54,0,100,0,0,0,0,0,0,80,2228100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Galvanoth - On Just Summoned - Call Timed Action List'),
(22281,0,1,0,38,0,100,0,1,1,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Galvanoth - On Data Set 1 1 - Say Line 0'),
(22281,0,2,0,0,0,100,0,1000,3000,8000,11000,0,11,39139,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Galvanoth - IC - Cast ''Fel Flamestike'''),
(22281,0,3,0,0,0,100,0,13000,23000,13000,23000,0,11,38750,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Galvanoth - IC - Cast ''War Stomp'' (CONDITION_DISTANCE_TO)'),
(22281,0,4,0,0,0,100,0,0,0,11000,18000,0,11,15708,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Galvanoth - IC - Cast ''Mortal Strike'''),

(2228100,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Galvanoth - On Script - Set Active On'),
(2228100,9,1,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Galvanoth - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2228100,9,2,0,0,0,100,0,5000,5000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Galvanoth - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2228100,9,3,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Galvanoth - On Script - Start Attack (Stored Target 1)'),

(23353,0,0,0,54,0,100,0,0,0,0,0,0,80,2228100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Braxxus - On Just Summoned - Call Timed Action List'),
(23353,0,1,0,38,0,100,0,1,1,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Braxxus - On Data Set 1 1 - Say Line 0'),
(23353,0,2,0,9,0,100,0,0,5,12000,18000,0,11,41437,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Braxxus - Within 0-5 Range - Cast ''Double Breath'''),
(23353,0,3,0,0,0,100,0,1000,3000,7000,8000,0,11,41439,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Braxxus - IC - Cast ''Mangle'''),
(23353,0,4,0,0,0,100,0,9000,15000,15000,25000,0,11,41436,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Braxxus - IC - Cast ''Panic'''),

(23354,0,0,0,54,0,100,0,0,0,0,0,0,80,2228100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mo''arg Incinerator - On Just Summoned - Call Timed Action List'),
(23354,0,1,0,38,0,100,0,1,1,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Mo''arg Incinerator - On Data Set 1 1 - Say Line 0'),
(23354,0,2,0,0,0,100,0,15000,25000,15000,25000,0,11,44431,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mo''arg Incinerator - IC - Cast ''Acid Geyser'''),
(23354,0,3,0,9,0,100,0,10,60,10000,15000,0,11,36606,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mo''arg Incinerator - Within 10-60 Range - Cast ''Mighty Charge'''),
(23354,0,4,0,0,0,100,0,5000,10000,15000,25000,0,11,25174,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mo''arg Incinerator - IC - Cast ''Sundering Cleave'''),

(23355,0,0,0,54,0,100,0,0,0,0,0,0,80,2228100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zarcsin - On Just Summoned - Call Timed Action List'),
(23355,0,1,0,38,0,100,0,1,1,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Zarcsin - On Data Set 1 1 - Say Line 0'),
(23355,0,2,0,9,0,100,0,0,5,15000,25000,0,11,41444,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Zarcsin - Within 0-5 Range - Cast ''Fel Flames'''),
(23355,0,3,0,2,0,100,0,0,50,0,0,0,11,41447,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zarcsin - Between 0-50% Health - Cast ''Enrage''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 22281 AND `SourceId` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,4,22281,0,0,35,1,2,1,4,0,0,0,'Creature ''Galvanoth'' - Group 0: Execute SAI ID 3 only if distance to victim is <= 1');
