DELETE FROM `spell_scripts` WHERE `id` = 48347;
INSERT INTO `spell_scripts` (`id`, `effIndex`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(48347,0,0,15,48351,0,0,0,0,0,0),
(48347,0,0,15,48352,0,0,0,0,0,0),
(48347,0,0,15,48353,0,0,0,0,0,0),
(48347,0,0,15,48354,0,0,0,0,0,0),
(48347,0,0,15,48354,0,0,0,0,0,0),
(48347,0,0,15,48354,0,0,0,0,0,0),
(48347,0,0,15,48354,0,0,0,0,0,0),
(48347,0,0,15,52687,0,0,0,0,0,0);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 27331;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27331,0,0,1,8,0,100,0,48345,0,0,0,0,33,27331,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Bombard the Ballistae Kill Credit Bunny - On Spellhit ''Siegesmith Bombs'' - Quest Credit ''Bombard the Ballistae'''),
(27331,0,1,2,61,0,100,0,0,0,0,0,0,11,48347,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bombard the Ballistae Kill Credit Bunny - Linked - Cast ''Bombard the Ballistae: FX Master'''),
(27331,0,2,3,61,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,20,188673,5,0,0,0,0,0,0,'Bombard the Ballistae Kill Credit Bunny - Linked - Despawn GO (New Hearthglen Ballista)'),
(27331,0,3,0,61,0,100,0,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bombard the Ballistae Kill Credit Bunny - Linked - Force Despawn');
