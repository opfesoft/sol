DELETE FROM `creature` WHERE `guid` BETWEEN 3009153 AND 3009161; -- Add Invisible Stalkers
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3009153,15214,593,0,0,1,1,0,0,-6.41,0.26,6.10,3.18,120,0,1,0,0,0,0,0,0),  -- "The Maiden's Fancy"
(3009154,15214,584,0,0,1,1,0,0,-6.41,-0.01,6.10,3.16,120,0,1,0,0,0,0,0,0), -- "The Lady Mehley"
(3009155,15214,582,0,0,1,1,0,0,1.31,0.06,4.92,3.16,120,0,1,0,0,0,0,0,0),   -- "Moonspray"
(3009156,15214,588,0,0,1,1,0,0,-6.50,0.00,6.10,3.18,120,0,1,0,0,0,0,0,0),  -- "The Bravery"
(3009157,15214,587,0,0,1,1,0,0,0.98,0.04,4.89,3.17,120,0,1,0,0,0,0,0,0),   -- "Feathermoon Ferry"
(3009158,15214,586,0,0,1,1,0,0,1.32,0.06,4.92,3.20,120,0,1,0,0,0,0,0,0),   -- "Elune's Blessing"
(3009159,15214,612,0,0,1,1,0,0,2.49,-0.15,9.41,3.17,120,0,1,0,0,0,0,0,0),  -- "Northspear"
(3009160,15214,594,0,0,1,1,0,0,-7.02,-0.13,8.73,3.20,120,0,1,0,0,0,0,0,0), -- "Sister Mercy"
(3009161,15214,614,0,0,1,1,0,0,2.61,-0.08,9.42,3.16,120,0,1,0,0,0,0,0,0);  -- "The Kraken"

DELETE FROM `event_scripts` WHERE `id` IN (16397,16398,10301,10302,16395,16396,19030,19031,16399,16400,16401,16402,19123,19124,16522,19032,19033) AND `command` = 16;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
-- "The Maiden's Fancy", arrival in Booty Bay (Stranglethorn Vale)
(16397,0,16,5495,0,15214,50,0,0,0),
-- "The Maiden's Fancy", arrival in Ratchet (Barrens)
(16398,0,16,5495,0,15214,50,0,0,0),
-- "The Lady Mehley", arrival in Menethil Harbor (Wetlands)
(10301,0,16,5495,0,15214,50,0,0,0),
-- "The Lady Mehley", arrival in Theramore Isle (Dustwallow Marsh)
(10302,0,16,5495,0,15214,50,0,0,0),
-- "Moonspray", arrival in Auberdine (Darkshore)
(16395,0,16,5495,0,15214,50,0,0,0),
-- "Moonspray", arrival in Rut'theran Village (Teldrassil)
(16396,0,16,5495,0,15214,50,0,0,0),
-- "The Bravery", arrival in Stormwind Harbor (Elwynn Forest)
(19030,0,16,5495,0,15214,50,0,0,0),
-- "The Bravery", arrival in Auberdine (Darkshore)
(19031,0,16,5495,0,15214,50,0,0,0),
-- "Feathermoon Ferry", arrival in Feathermoon Stronghold (Feralas)
(16399,0,16,5495,0,15214,50,0,0,0),
-- "Feathermoon Ferry", arrival in Forgotten Coast (Feralas)
(16400,0,16,5495,0,15214,50,0,0,0),
-- "Elune's Blessing", arrival in Auberdine (Darkshore)
(16401,0,16,5495,0,15214,50,0,0,0),
-- "Elune's Blessing", arrival in Valaar's Berth (Azuremyst Isle)
(16402,0,16,5495,0,15214,50,0,0,0),
-- "Northspear", arrival in Valgarde (Howling Fjord)
(19123,0,16,5495,0,15214,50,0,0,0),
-- "Northspear", arrival in Menethil Harbor (Wetlands)
(19124,0,16,5495,0,15214,50,0,0,0),
-- "Sister Mercy", arrival in Garvan's Reef (Howling Fjord)
(16522,0,16,5495,0,15214,50,0,0,0),
-- "The Kraken", arrival in Stormwind Harbor (Elwynn Forest)
(19032,0,16,5495,0,15214,50,0,0,0),
-- "The Kraken", arrival in Valiance Keep (Borean Tundra)
(19033,0,16,5495,0,15214,50,0,0,0);
