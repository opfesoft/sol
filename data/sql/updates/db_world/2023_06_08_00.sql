DELETE FROM `creature_text` WHERE `CreatureId` = 9458;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(9458,0,0,'For the Horde!',12,1,100,0,0,0,4921,0,'Horde Axe Thrower'),
(9458,0,1,'Defend the bunkers!',12,1,100,0,0,0,4922,0,'Horde Axe Thrower'),
(9458,0,2,'The invaders are here!',12,1,100,0,0,0,4923,0,'Horde Axe Thrower'),
(9458,0,3,'Beware!  The Kolkar attack!',12,1,100,0,0,0,4924,0,'Horde Axe Thrower'),
(9458,0,4,'Our foes will fall!',12,1,100,0,0,0,4925,0,'Horde Axe Thrower');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (9098,9458,9523);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(9098,0,0,0,0,0,100,0,0,0,1100,3000,0,11,13748,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scarshield Spellbinder - IC - Cast ''Arcane Bolt'''),
(9098,0,1,0,0,0,100,0,5000,15000,15000,20000,0,11,15785,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scarshield Spellbinder - IC - Cast ''Mana Burn'''),
(9098,0,2,0,13,0,100,0,10000,20000,0,0,0,11,15122,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Scarshield Spellbinder - On Target Casting - Cast ''Counterspell'''),
(9098,0,3,0,16,0,100,0,15123,30,3000,6000,0,11,15123,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Scarshield Spellbinder - On Friendly Unit Missing Buff ''Resist Fire'' - Cast ''Resist Fire'''),

(9458,0,0,0,54,0,100,0,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Axe Thrower - On Just Summoned - Enable Random Movement'),
(9458,0,1,0,0,0,100,0,0,0,2300,3900,0,11,10277,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Horde Axe Thrower - IC - Cast ''Throw'''),
(9458,0,2,0,6,0,100,0,0,0,0,0,0,12,9458,1,450000,0,0,0,8,0,0,0,0,-293.212,-1912.51,91.6673,1.42794,'Horde Axe Thrower - On Death - Summon Creature ''Horde Axe Thrower'''),
(9458,0,3,0,4,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Axe Thrower - On Aggro - Say Line 0'),

(9523,0,0,0,54,0,100,0,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kolkar Stormseer - On Just Summoned - Enable Random Movement'),
(9523,0,1,0,0,0,100,0,0,0,3400,4800,0,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kolkar Stormseer - IC - Cast ''Lightning Bolt'''),
(9523,0,2,0,0,0,100,0,10000,15000,15000,20000,0,11,6535,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kolkar Stormseer - IC - Cast ''Lightning Cloud''');
