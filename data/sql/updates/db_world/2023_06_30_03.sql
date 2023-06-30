DELETE FROM `creature_text` WHERE `CreatureId` IN (20216,22199);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(20216,0,0,'%s grows massively powerful!',16,0,100,0,0,0,20101,0,'Grulloc'),
(20216,1,0,'Me hungry!',14,0,100,0,0,0,19842,0,'Grulloc'),
(20216,1,1,'Me like soft bacon!',14,0,100,0,0,0,20258,0,'Grulloc'),
(20216,1,2,'Mmm, other white meat!',14,0,100,0,0,0,19844,0,'Grulloc'),
(20216,1,3,'Porkchops!',14,0,100,0,0,0,19857,0,'Grulloc'),
(20216,2,0,'Grulloc having lots of fun!',14,0,100,0,0,0,19841,0,'Grulloc'),
(20216,2,1,'Me keep piggy as pet!',14,0,100,0,0,0,20259,0,'Grulloc'),
(20216,2,2,'Piggy stop!',14,0,100,0,0,0,19845,0,'Grulloc'),
(20216,2,3,'You be Grulloc''s friend!',14,0,100,0,0,0,19843,0,'Grulloc'),
(20216,3,0,'Where piggy go?!',14,0,100,0,0,0,19846,0,'Grulloc'),

(22199,0,0,'%s becomes enraged!',16,0,100,0,0,0,24144,0,'Slaag');

UPDATE `creature_template` SET `speed_run` = 1.64286, `mechanic_immune_mask` = `mechanic_immune_mask` | 67108864 WHERE `entry` = 22114;
UPDATE `event_scripts` SET `dataint` = 1 WHERE `id` = 14274;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (20216,22114,20600,22199);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20216,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grulloc - On Respawn - Disable Event Phase Reset'),
(20216,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grulloc - Linked - Set Event Phase 1'),
(20216,0,2,3,0,1,100,0,10000,20000,18000,28000,0,11,38771,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grulloc - IC (Event Phase 1) - Cast ''Burning Rage'''),
(20216,0,3,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grulloc - Linked - Say Line 0'),
(20216,0,4,0,0,1,100,0,5000,9000,12000,17000,0,11,21055,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Grulloc - IC (Event Phase 1) - Cast ''Crush Armor'''),
(20216,0,5,0,0,1,100,0,6000,17000,5000,10000,0,11,38772,32,0,0,0,0,5,0,0,0,0,0,0,0,0,'Grulloc - IC (Event Phase 1) - Cast ''Grievous Wound'''),
(20216,0,6,0,6,0,100,0,0,0,0,0,0,11,39890,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grulloc - On Death - Cast ''Grulloc: Summon Grulloc`s Dragon Skull Chest'''),
(20216,0,7,8,8,0,100,0,38360,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Grulloc - On Spellhit ''Huffer Threatens Grulloc'' - Start Attack (Invoker)'),
(20216,0,8,9,61,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grulloc - Linked - Set Event Phase 2'),
(20216,0,9,10,61,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grulloc - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'''),
(20216,0,10,11,61,0,100,0,0,0,0,0,0,117,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grulloc - Linked - Disable Evade'),
(20216,0,11,12,61,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grulloc - Linked - Disable Auto Attack'),
(20216,0,12,0,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grulloc - Linked - Say Line 1'),
(20216,0,13,14,38,2,100,0,1,1,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grulloc - On Data 1 1 (Event Phase 2) - Say Line 3'),
(20216,0,14,15,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grulloc - Linked - Set Event Phase 1'),
(20216,0,15,16,61,0,100,0,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grulloc - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),
(20216,0,16,17,61,0,100,0,0,0,0,0,0,117,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grulloc - Linked - Enable Evade'),
(20216,0,17,18,61,0,100,0,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grulloc - Linked - Enable Auto Attack'),
(20216,0,18,0,61,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grulloc - Linked - Evade'),

(22114,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Huffer - On Just Summoned - Set Active On'),
(22114,0,1,2,61,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Huffer - Linked - Set React State ''Passive'''),
(22114,0,2,0,61,0,100,0,0,0,0,0,0,53,1,22114,0,0,0,0,1,0,0,0,0,0,0,0,0,'Huffer - Linked - Start WP Movement'),
(22114,0,3,4,40,0,100,0,5,0,0,0,0,54,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Huffer - On WP 5 Reached - Pause WP Movement'),
(22114,0,4,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Huffer - Linked - Set Event Phase 1'),
(22114,0,5,0,60,1,100,257,2500,2500,0,0,0,11,38360,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Huffer - On Update (No Repeat, No Reset) - Cast ''Huffer Threatens Grulloc'''),
(22114,0,6,0,40,0,100,0,9,0,0,0,0,1,2,0,0,0,0,0,19,20216,0,0,0,0,0,0,0,'Huffer - On WP 9 Reached - Say Line 2 (Grulloc)'),
(22114,0,7,0,40,0,100,0,21,0,0,0,0,1,2,0,0,0,0,0,19,20216,0,0,0,0,0,0,0,'Huffer - On WP 21 Reached - Say Line 2 (Grulloc)'),
(22114,0,8,9,40,0,100,0,30,0,0,0,0,45,1,1,0,0,0,0,19,20216,0,0,0,0,0,0,0,'Huffer - On WP 30 Reached - Set Data 1 1 (Grulloc)'),
(22114,0,9,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Huffer - Linked - Force Despawn'),

(20600,0,0,0,0,0,100,0,3000,6000,8000,12000,0,11,38770,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Maggoc - IC - Cast ''Mortal Wound'''),
(20600,0,1,0,0,0,100,0,3000,6000,5000,10000,0,11,38777,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Maggoc - IC - Cast ''Rock Rumble'''),
(20600,0,2,0,0,0,100,0,4000,7000,5000,10000,0,11,42139,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Maggoc - IC - Cast ''Boulder'''),
(20600,0,3,4,2,0,100,0,0,30,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maggoc - Between 0-30% Health - Say Line 0'),
(20600,0,4,0,61,0,100,0,0,0,0,0,0,11,40743,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maggoc - Linked - Cast ''Frenzy'''),
(20600,0,5,0,6,0,100,0,0,0,0,0,0,11,39891,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maggoc - On Death - Cast ''Maggoc: Summon Maggoc`s Treasure Chest'''),

(22199,0,0,1,0,0,100,0,20000,30000,20000,30000,0,11,33958,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slaag - IC - Cast ''Enrage'''),
(22199,0,1,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slaag - Linked - Say Line 0'),
(22199,0,2,0,0,0,100,0,27000,32000,27000,32000,0,11,21909,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slaag - IC - Cast ''Dust Field'''),
(22199,0,3,0,6,0,100,0,0,0,0,0,0,11,39898,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slaag - On Death - Cast ''Slaag: Summon Slaag`s Standard Chest''');
