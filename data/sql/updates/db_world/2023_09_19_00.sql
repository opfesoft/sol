DELETE FROM `spell_script_names` WHERE `spell_id` IN (38986,38987);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
(38986,'spell_gen_focused_bursts'),
(38987,'spell_gen_focused_bursts');

DELETE FROM `creature_template_addon` WHERE `entry` = 20888;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(20888,0,0,0,0,0,0,'17467');

DELETE FROM `creature_text` WHERE `CreatureId` IN (20888,22825,22826,22827,22828);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(20888,0,0,'The gateway of your oblivion has been opened! The blood tide rises.',12,8,100,0,0,0,20443,0,'Solus the Eternal'),
(20888,0,1,'A thousand and one ways that all spell out your demise!',12,0,100,0,0,0,20444,0,'Solus the Eternal'),

(22825,0,0,'Death! Only death awaits!',12,8,100,0,0,0,20449,0,'Matron Li-sahar'),
(22825,0,1,'Give us a kissss...',12,0,100,0,0,0,20450,0,'Matron Li-sahar'),

(22826,0,0,'WUT! DA KING IS BACK, BABY!',12,0,100,0,0,0,20445,0,'King Dorfbruiser'),
(22826,0,1,'In Outland, lunch open prison for you! What a world! Time to eat!',12,0,100,0,0,0,20446,0,'King Dorfbruiser'),

(22827,0,0,'Look into my eyes... Find your death within...',12,0,100,0,0,0,20441,0,'Gorgolon'),
(22827,0,1,'FREE! FREE TO DEVOUR ALL THAT STAND IN THE WAY OF LORD ILLIDAN!',12,0,100,0,0,0,20442,0,'Gorgolon'),

(22828,0,0,'Only flesh and blood...',12,0,100,0,0,0,20447,0,'Trelopades'),
(22828,0,1,'For the Deceiver! For Kil''jaeden!',12,0,100,0,0,0,20448,0,'Trelopades');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (20888,22825,22826,22827,22828);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (20888,22825,22826,22827,22828);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20888,0,0,1,4,0,100,0,0,0,0,0,0,206,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Solus the Eternal - On Aggro - Set Caster Combat Distance'),
(20888,0,1,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Solus the Eternal - On Aggro - Say Line 0'),
(20888,0,2,0,9,0,100,0,0,40,4000,5000,0,11,31618,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Solus the Eternal - IC - Cast ''Shadow Bolt'''),
(20888,0,3,0,0,0,100,0,0,0,25000,35000,0,11,36778,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Solus the Eternal - IC - Cast ''Soul Steal'''),
(20888,0,4,0,9,0,100,0,0,15,15000,25000,0,11,36786,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Solus the Eternal - Within 0-15 Range - Cast ''Soul Chill'''),

(22825,0,0,0,4,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Matron Li-sahar - On Aggro - Say Line 0'),
(22825,0,1,0,9,0,100,0,0,7,10000,20000,0,11,33501,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Matron Li-sahar - Within 0-7 Range - Cast ''Shadow Nova'''),
(22825,0,2,0,0,0,100,0,5000,10000,30000,40000,0,11,33493,32,0,1,0,0,2,0,0,0,0,0,0,0,0,'Matron Li-sahar - IC - Cast ''Mark of Malice'''),

(22826,0,0,0,4,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'King Dorfbruiser - On Aggro - Say Line 0'),
(22826,0,1,0,0,0,100,0,15000,30000,30000,50000,0,11,33238,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'King Dorfbruiser - IC - Cast ''Whirlwind'''),
(22826,0,2,0,0,0,100,0,5000,15000,5000,15000,0,11,43673,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'King Dorfbruiser - IC - Cast ''Mighty Blow'''),

(22827,0,0,0,4,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gorgolon the All-seeing - On Aggro - Say Line 0'),
(22827,0,1,0,0,0,100,0,10000,20000,10000,20000,0,11,34322,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gorgolon the All-seeing - IC - Cast ''Psychic Scream'''),
(22827,0,2,0,0,0,100,0,10000,20000,10000,20000,0,11,17287,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gorgolon the All-seeing - IC - Cast ''Mind Blast'''),
(22827,0,3,0,0,0,100,0,2000,5000,20000,30000,0,11,38985,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Gorgolon the All-seeing - IC - Cast ''Focused Bursts'''),

(22828,0,0,0,4,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Trelopades - On Aggro - Say Line 0'),
(22828,0,1,0,0,0,100,0,2000,5000,7000,15000,0,11,22859,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Trelopades - IC - Cast ''Mortal Cleave'''),
(22828,0,2,0,0,0,100,0,10000,20000,20000,30000,0,11,33508,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Trelopades - IC - Cast ''Rain of Fire'''),
(22828,0,3,0,0,0,100,0,5000,15000,15000,25000,0,11,36835,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Trelopades - IC - Cast ''War Stomp''');
