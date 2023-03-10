DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (28244,28175,28176,28177,28178,28333);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2824400,2817500,2817600,2817700,2817800,2833300);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(28244,0,0,1,20,0,100,0,12584,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eitrigg - On Quest ''Pure Evil'' Rewarded - Set Active On'),
(28244,0,1,2,61,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eitrigg - Linked - Remove NPC Flags'),
(28244,0,2,3,61,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,19,28175,0,0,0,0,0,0,0,'Eitrigg - Linked - Remove NPC Flags (Crusade Commander Korfax)'),
(28244,0,3,4,61,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,19,28176,0,0,0,0,0,0,0,'Eitrigg - Linked - Remove NPC Flags (Rimblat Earthshatter)'),
(28244,0,4,5,61,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,19,28177,0,0,0,0,0,0,0,'Eitrigg - Linked - Remove NPC Flags (Rayne)'),
(28244,0,5,6,61,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,19,28178,0,0,0,0,0,0,0,'Eitrigg - Linked - Remove NPC Flags (Avenger Metz)'),
(28244,0,6,7,61,0,100,0,0,0,0,0,0,1,6,0,0,0,0,0,19,28178,0,0,0,0,0,0,0,'Eitrigg - Linked - Say Line 6 (Avenger Metz)'),
(28244,0,7,0,61,0,100,0,0,0,0,0,0,53,0,28244,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eitrigg - Linked - Start WP Movement'),
(28244,0,8,0,40,0,100,0,3,28244,0,0,0,80,2824400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eitrigg - On WP 3 Reached - Call Timed Action List'),
(28244,0,9,10,58,0,100,0,0,28244,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eitrigg - On WP Path Ended - Evade'),
(28244,0,10,11,61,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eitrigg - Linked - Add NPC Flags'),
(28244,0,11,12,61,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,19,28175,0,0,0,0,0,0,0,'Eitrigg - Linked - Add NPC Flags (Crusade Commander Korfax)'),
(28244,0,12,13,61,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,19,28176,0,0,0,0,0,0,0,'Eitrigg - Linked - Add NPC Flags (Rimblat Earthshatter)'),
(28244,0,13,14,61,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,19,28177,0,0,0,0,0,0,0,'Eitrigg - Linked - Add NPC Flags (Rayne)'),
(28244,0,14,15,61,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,19,28178,0,0,0,0,0,0,0,'Eitrigg - Linked - Add NPC Flags (Avenger Metz)'),
(28244,0,15,0,61,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eitrigg - Linked - Set Active Off'),

(2824400,9,0,0,0,0,100,0,0,0,0,0,0,54,119000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eitrigg - On Script - Pause WP Movement'),
(2824400,9,1,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eitrigg - On Script - Say Line 0'),
(2824400,9,2,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,28333,0,0,0,0,0,0,0,'Eitrigg - On Script - Set Data 1 1 (ELM General Purpose Bunny (scale x0.25))'),
(2824400,9,3,0,0,0,100,0,6000,6000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eitrigg - On Script - Say Line 1'),
(2824400,9,4,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,19,28175,0,0,0,0,0,0,0,'Eitrigg - On Script - Set Data 1 1 (Crusade Commander Korfax)'),
(2824400,9,5,0,0,0,100,0,3000,3000,0,0,0,45,2,2,0,0,0,0,19,28175,0,0,0,0,0,0,0,'Eitrigg - On Script - Set Data 2 2 (Crusade Commander Korfax)'),
(2824400,9,6,0,0,0,100,0,16000,16000,0,0,0,1,0,0,0,0,0,0,19,28178,0,0,0,0,0,0,0,'Eitrigg - On Script - Say Line 0 (Avenger Metz)'),
(2824400,9,7,0,0,0,100,0,12000,12000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eitrigg - On Script - Say Line 2'),
(2824400,9,8,0,0,0,100,0,6000,6000,0,0,0,45,1,1,0,0,0,0,19,28176,0,0,0,0,0,0,0,'Eitrigg - On Script - Set Data 1 1 (Rimblat Earthshatter)'),
(2824400,9,9,0,0,0,100,0,8000,8000,0,0,0,45,1,1,0,0,0,0,19,28177,0,0,0,0,0,0,0,'Eitrigg - On Script - Set Data 1 1 (Rayne)'),
(2824400,9,10,0,0,0,100,0,13000,13000,0,0,0,1,1,0,0,0,0,0,19,28178,0,0,0,0,0,0,0,'Eitrigg - On Script - Say Line 1 (Avenger Metz)'),
(2824400,9,11,0,0,0,100,0,5000,5000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eitrigg - On Script - Say Line 3'),
(2824400,9,12,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,19,28178,0,0,0,0,0,0,0,'Eitrigg - On Script - Say Line 2 (Avenger Metz)'),
(2824400,9,13,0,0,0,100,0,3000,3000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eitrigg - On Script - Say Line 4'),
(2824400,9,14,0,0,0,100,0,5000,5000,0,0,0,45,1,1,0,0,0,0,19,28178,0,0,0,0,0,0,0,'Eitrigg - On Script - Set Data 1 1 (Avenger Metz)'),
(2824400,9,15,0,0,0,100,0,11000,11000,0,0,0,1,4,0,0,0,0,0,19,28175,0,0,0,0,0,0,0,'Eitrigg - On Script - Say Line 4 (Crusade Commander Korfax)'),
(2824400,9,16,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,19,28177,0,0,0,0,0,0,0,'Eitrigg - On Script - Say Line 1 (Rayne)'),
(2824400,9,17,0,0,0,100,0,0,0,0,0,0,1,5,0,0,0,0,0,19,28178,0,0,0,0,0,0,0,'Eitrigg - On Script - Say Line 5 (Avenger Metz)'),
(2824400,9,18,0,0,0,100,0,6000,6000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eitrigg - On Script - Say Line 5'),
(2824400,9,19,0,0,0,100,0,3000,3000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eitrigg - On Script - Say Line 6'),
(2824400,9,20,0,0,0,100,0,6000,6000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eitrigg - On Script - Say Line 7'),
(2824400,9,21,0,0,0,100,0,6000,6000,0,0,0,1,6,0,0,0,0,0,19,28178,0,0,0,0,0,0,0,'Eitrigg - On Script - Say Line 6 (Avenger Metz)'),
(2824400,9,22,0,0,0,100,0,1000,1000,0,0,0,45,2,2,0,0,0,0,19,28333,0,0,0,0,0,0,0,'Eitrigg - On Script - Set Data 2 2 (ELM General Purpose Bunny (scale x0.25))'),

(28175,0,0,0,38,0,100,0,1,1,0,0,0,66,0,0,0,0,0,0,19,28244,0,0,0,0,0,0,0,'Crusade Commander Korfax - On Data Set 1 1 - Set Orientation (Eitrigg)'),
(28175,0,1,2,38,0,100,0,2,2,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusade Commander Korfax - On Data Set 2 2 - Say Line 0'),
(28175,0,2,0,61,0,100,0,0,0,0,0,0,53,0,28175,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusade Commander Korfax - Linked - Start WP'),
(28175,0,3,0,40,0,100,0,1,28175,0,0,0,80,2817500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusade Commander Korfax - On WP 1 Reached - Call Timed Action List'),
(28175,0,4,0,58,0,100,0,0,28175,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusade Commander Korfax - On WP Path Ended - Evade'),

(2817500,9,0,0,0,0,100,0,0,0,0,0,0,54,19000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusade Commander Korfax - On Script - Pause WP Movement'),
(2817500,9,1,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,19,28333,0,0,0,0,0,0,0,'Crusade Commander Korfax - On Script - Set Orientation (ELM General Purpose Bunny (scale x0.25))'),
(2817500,9,2,0,0,0,100,0,2000,2000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusade Commander Korfax - On Script - Say Line 1'),
(2817500,9,3,0,0,0,100,0,6000,6000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusade Commander Korfax - On Script - Say Line 2'),
(2817500,9,4,0,0,0,100,0,1000,1000,0,0,0,11,51396,0,0,0,0,0,19,28333,0,0,0,0,0,0,0,'Crusade Commander Korfax - On Script - Cast ''Pure Evil: Korfax''s Cleave'' (ELM General Purpose Bunny (scale x0.25))'),
(2817500,9,5,0,0,0,100,0,2000,2000,0,0,0,11,51396,0,0,0,0,0,19,28333,0,0,0,0,0,0,0,'Crusade Commander Korfax - On Script - Cast ''Pure Evil: Korfax''s Cleave'' (ELM General Purpose Bunny (scale x0.25))'),
(2817500,9,6,0,0,0,100,0,2000,2000,0,0,0,11,51396,0,0,0,0,0,19,28333,0,0,0,0,0,0,0,'Crusade Commander Korfax - On Script - Cast ''Pure Evil: Korfax''s Cleave'' (ELM General Purpose Bunny (scale x0.25))'),
(2817500,9,7,0,0,0,100,0,1000,1000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusade Commander Korfax - On Script - Say Line 3'),

(28176,0,0,0,38,0,100,0,1,1,0,0,0,80,2817600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rimblat Earthshatter - On Data Set 1 1 - Call Timed Action List'),

(2817600,9,0,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,19,28333,0,0,0,0,0,0,0,'Rimblat Earthshatter - On Script - Set Orientation (ELM General Purpose Bunny (scale x0.25))'),
(2817600,9,1,0,0,0,100,0,6000,6000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rimblat Earthshatter - On Script - Say Line 0'),
(2817600,9,2,0,0,0,100,0,0,0,0,0,0,11,51380,0,0,0,0,0,19,28333,0,0,0,0,0,0,0,'Rimblat Earthshatter - On Script - Cast ''Lightning & Ice Channeling'' (ELM General Purpose Bunny (scale x0.25))'),
(2817600,9,3,0,0,0,100,0,5000,5000,0,0,0,45,5,5,0,0,0,0,19,28333,0,0,0,0,0,0,0,'Rimblat Earthshatter - On Script - Set Data 5 5 (ELM General Purpose Bunny (scale x0.25))'),
(2817600,9,4,0,0,0,100,0,5000,5000,0,0,0,28,51380,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rimblat Earthshatter - On Script - Remove Aura ''Lightning & Ice Channeling'''),
(2817600,9,5,0,0,0,100,0,1000,1000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rimblat Earthshatter - On Script - Say Line 1'),
(2817600,9,6,0,0,0,100,0,5000,5000,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rimblat Earthshatter - On Script - Evade'),

(28177,0,0,0,38,0,100,0,1,1,0,0,0,80,2817700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rayne - On Data Set 1 1 - Call Timed Action List'),

(2817700,9,0,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,19,28333,0,0,0,0,0,0,0,'Rayne - On Script - Set Orientation (ELM General Purpose Bunny (scale x0.25))'),
(2817700,9,1,0,0,0,100,0,500,500,0,0,0,11,28892,0,0,0,0,0,19,28333,0,0,0,0,0,0,0,'Rayne - On Script - Cast ''Nature Channeling'' (ELM General Purpose Bunny (scale x0.25))'),
(2817700,9,2,0,0,0,100,0,500,500,0,0,0,45,3,3,0,0,0,0,19,28333,0,0,0,0,0,0,0,'Rayne - On Script - Set Data 3 3 (ELM General Purpose Bunny (scale x0.25))'),
(2817700,9,3,0,0,0,100,0,10000,10000,0,0,0,28,28892,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rayne - On Script - Remove Aura ''Nature Channeling'''),
(2817700,9,4,0,0,0,100,0,100,100,0,0,0,45,4,4,0,0,0,0,19,28333,0,0,0,0,0,0,0,'Rayne - On Script - Set Data 4 4 (ELM General Purpose Bunny (scale x0.25))'),
(2817700,9,5,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rayne - On Script - Say Line 0'),
(2817700,9,6,0,0,0,100,0,5000,5000,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rayne - On Script - Evade'),

(28178,0,0,0,38,0,100,0,1,1,0,0,0,80,2817800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Avenger Metz - On Data Set 1 1 - Call Timed Action List'),

(2817800,9,0,0,0,0,100,0,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Avenger Metz - On Script - Say Line 3'),
(2817800,9,1,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,19,28333,0,0,0,0,0,0,0,'Avenger Metz - On Script - Set Orientation (ELM General Purpose Bunny (scale x0.25))'),
(2817800,9,2,0,0,0,100,0,500,500,0,0,0,11,51384,0,0,0,0,0,19,28333,0,0,0,0,0,0,0,'Avenger Metz - On Script - Cast ''Hammer of Wrath'' (ELM General Purpose Bunny (scale x0.25))'),
(2817800,9,4,0,0,0,100,0,3000,3000,0,0,0,45,6,6,0,0,0,0,19,28333,0,0,0,0,0,0,0,'Avenger Metz - On Script - Set Data 6 6 (ELM General Purpose Bunny (scale x0.25))'),
(2817800,9,5,0,0,0,100,0,3000,3000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Avenger Metz - On Script - Say Line 4'),
(2817800,9,6,0,0,0,100,0,5000,5000,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Avenger Metz - On Script - Evade'),

(28333,0,0,0,38,0,100,0,1,1,0,0,0,11,32567,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'ELM General Purpose Bunny (scale x0.25) - On Data Set 1 1 - Cast ''Green Banish State'''),
(28333,0,1,0,38,0,100,0,2,2,0,0,0,28,32567,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'ELM General Purpose Bunny (scale x0.25) - On Data Set 2 2 - Remove Aura ''Green Banish State'''),
(28333,0,2,0,38,0,100,0,3,3,0,0,0,11,51367,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'ELM General Purpose Bunny (scale x0.25) - On Data Set 3 3 - Cast ''Pure Evil: Entangling Roots Visual'''),
(28333,0,3,0,38,0,100,0,4,4,0,0,0,28,51367,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'ELM General Purpose Bunny (scale x0.25) - On Data Set 4 4 - Remove Aura ''Pure Evil: Entangling Roots Visual'''),
(28333,0,4,0,38,0,100,0,5,5,0,0,0,11,35487,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'ELM General Purpose Bunny (scale x0.25) - On Data Set 5 5 - Cast ''Seed of Revitalization Lightning Cloud Visual'''),
(28333,0,5,0,38,0,100,0,6,6,0,0,0,80,2833300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'ELM General Purpose Bunny (scale x0.25) - On Data Set 6 6 - Call Timed Action List'),

(2833300,9,0,0,0,0,100,0,0,0,0,0,0,11,51394,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'ELM General Purpose Bunny (scale x0.25) - On Script - Cast ''Decimate State'''),
(2833300,9,1,0,0,0,100,0,6000,6000,0,0,0,11,51393,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'ELM General Purpose Bunny (scale x0.25) - On Script - Cast ''Pure Evil: Saronite Knockback'''),
(2833300,9,2,0,0,0,100,0,0,0,0,0,0,28,51394,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'ELM General Purpose Bunny (scale x0.25) - On Script - Remove Aura ''Decimate State''');
