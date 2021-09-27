-- DB update 2021_09_27_01 -> 2021_09_27_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_27_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_27_01 2021_09_27_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1632777312937101815'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1632777312937101815');

UPDATE `creature` SET `position_x` = -2281.69, `position_y` = 5246.42, `position_z` = -9.97633 WHERE `guid` = 43673; -- Flik
UPDATE `creature` SET `position_x` = -2275.19, `position_y` = 5220.14, `position_z` = -9.98464 WHERE `guid` = 56348; -- Silas Darkmoon
UPDATE `creature` SET `position_x` = -2268.21, `position_y` = 5219.91, `position_z` = -9.97917 WHERE `guid` = 70024; -- Burth

UPDATE `creature_addon` SET `bytes2` = 1 WHERE `guid` IN (70025,83350);  -- Darkmoon Faire Carnie
UPDATE `creature_addon` SET `bytes2` = 1 WHERE `guid` IN (56348,137666); -- Silas Darkmoon

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (56348,43672);
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`)
VALUES
-- Silas Darkmoon & Burth
(56348,56348,0,0,2),
(56348,70024,6,15,2),
-- Flik's Frog & Flik
(43672,43672,0,0,0),
(43672,43673,2,0,0);

-- Burth: Remove obsolete WP path
UPDATE `creature` SET `MovementType` = 0 WHERE `guid` = 70024;
UPDATE `creature_addon` SET `path_id` = 0 WHERE `guid` = 70024;

-- Remove obsolete WP scripts
DELETE FROM `waypoint_scripts` WHERE `id` IN (45,46);

DELETE FROM `game_event_creature` WHERE `eventEntry` = -3 AND `guid` = 68923;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`)
VALUES
(-3,68923); -- Despawn Shattered Sun Warrior

-- Add gossip texts for different Darkmoon Faire locations
DELETE FROM `gossip_menu` WHERE `MenuID` = 6182 AND `TextID` = 11482;
DELETE FROM `gossip_menu` WHERE `MenuID` = 7095 AND `TextID` IN (8348,11743);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(6182,11482), -- Silas Darkmoon (Terokkar)
(7095,8348),  -- Selina Dourman (Elwynn)
(7095,11743); -- Selina Dourman (Terokkar)

-- Silas Darkmoon: Rework creature texts
DELETE FROM `creature_text` WHERE `CreatureId` = 14823;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(14823,0,0,'Come one, come all.  Welcome to the Darkmoon Faire!  Don''t be shy.  Step right up to Lhara and buy yourself an exotic artifact from far off lands.  If you''re one of the lucky few who have found Darkmoon Cards, have a word with Professor Paleo.  Hungry?  Thirsty?  You''re in luck!  Refreshments are available right here from Sylannia and Stamp.  I recommend the Darkmoon Special Reserve to wash down some Red Hot Wings.  And if the future is what you seek, then run, don''t walk, to speak with Sayge.',12,0,100,0,0,0,10154,0,'Silas Darkmoon'),
(14823,0,1,'Welcome one and all to the Darkmoon Faire, the greatest event in all the world!  We have it all... delicious food, strong drink, exotic artifacts, fortunes read, amazing prizes and excitement without end!  Don''t forget to turn in your Darkmoon Faire Prize Tickets to Gelvas Grimegate!  All it takes is five or more and you''re on your way to the most wondrous prizes on all of Azeroth.  Everybody is a winner!',12,0,100,0,0,0,10155,0,'Silas Darkmoon'),
(14823,0,2,'Welcome one and all to the greatest show on all of Azeroth... the Darkmoon Faire!  Adventure and excitement await, don''t be shy!  Mysteries and prizes for both the young and the old are here for the taking.  And be sure to speak with the professor about any Darkmoon Cards that you have come across during your travels!',12,0,100,0,0,0,10156,0,'Silas Darkmoon'),
(14823,0,3,'Greetings friends, and welcome to the greatest show on Azeroth!$B$BPlease, step right up and take in all we have to offer.  Ride the rides and see the sights!  Amaze at the wonders that the Darkmoon Faire has uncovered in this vast and mysterious world!  We have spared no expense in bringing you excitement that children of all ages will delight in!',12,0,100,0,0,0,10157,0,'Silas Darkmoon'),
(14823,0,4,'Come one, come all!  Welcome to the Darkmoon Faire!  Do you crave adventure?  Do you seek exotic and mysterious treasures?  Then look no further!  You, my friend, have come to the right place!  Dive right in and take part in all that the Faire has to offer!  We''ll be at this location all week, so be sure to tell your friends and loved ones!',12,0,100,0,0,0,10158,0,'Silas Darkmoon'),
(14823,0,5,'We''re back and better than ever!  It''s the Darkmoon Faire friend, and it''s your lucky day!  Sparing no expense, we''ve gathered wonders and treats from around the world for your delight.  Whether you''re young or old, rich or poor, the Darkmoon Faire has it all!  Be sure to turn in your Darkmoon Faire Prize Tickets to Gelvas Grimegate, and choose from several exotic and wondrous prizes!',12,0,100,0,0,0,10160,0,'Silas Darkmoon'),
(14823,1,0,'Come one, come all.  Welcome to the Darkmoon Faire!  Don''t be shy.  Step right up to Lhara and buy yourself an exotic artifact from far off lands.  If you''re one of the lucky few who have found Darkmoon Cards, have a word with Professor Paleo.  Hungry?  Thirsty?  You''re in luck!  Refreshments are available right here from Sylannia and Stamp.  I recommend the Darkmoon Special Reserve to wash down some Red Hot Wings.  And if the future is what you seek, then run, don''t walk, to speak with Sayge.',12,0,100,0,0,0,10154,0,'Silas Darkmoon'),
(14823,1,1,'Come one, come all!  Welcome to the Darkmoon Faire!  Do you crave adventure?  Do you seek exotic and mysterious treasures?  Then look no further!  You, my friend, have come to the right place!  Dive right in and take part in all that the Faire has to offer!  We''ll be at this location all week, so be sure to tell your friends and loved ones!',12,0,100,0,0,0,10158,0,'Silas Darkmoon'),
(14823,1,2,'We''re back and better than ever!  It''s the Darkmoon Faire friend, and it''s your lucky day!  Sparing no expense, we''ve gathered wonders and treats from around the world for your delight.  Whether you''re young or old, rich or poor, the Darkmoon Faire has it all!  Be sure to turn in your Darkmoon Faire Prize Tickets to Gelvas Grimegate, and choose from several exotic and wondrous prizes!',12,0,100,0,0,0,10160,0,'Silas Darkmoon'),
(14823,1,3,'Welcome one and all to the Darkmoon Faire, the greatest event in all the worlds!  We have it all... delicious food, strong drink, exotic artifacts, fortunes read, amazing prizes and excitement without end!  Don''t forget to turn in your Darkmoon Faire Prize Tickets to Gelvas Grimegate!  All it takes is five or more and you''re on your way to the most wondrous prizes in all of Outland.  Everybody is a winner!',12,0,100,0,0,0,22544,0,'Silas Darkmoon'),
(14823,2,0,'Everyone enjoying themselves so far?  That''s great!  Welcome to the Darkmoon Faire, the greatest show on all of Azeroth!  Make sure that you speak with Yebb and his friends here while you''re taking in Neblegear''s Darkmoon Zoo Bizarre.',12,0,100,0,0,0,10153,0,'Silas Darkmoon'),
(14823,3,0,'Everyone enjoying themselves so far?  That''s great!  Welcome to the Darkmoon Faire, the greatest show in all of Outland!  Make sure that you speak with Yebb and his friends here while you''re taking in Neblegear''s Darkmoon Zoo Bizarre.',12,0,100,0,0,0,22543,0,'Silas Darkmoon');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = -56348;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1482301,1482302,1482303);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-56348,0,0,0,34,0,100,0,2,1,0,0,0,80,1482303,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silas Darkmoon - On WP 2 Reached - Call Timed Action List'),
(-56348,0,1,0,34,0,100,0,2,7,0,0,0,80,1482301,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silas Darkmoon - On WP 8 Reached - Call Timed Action List'),
(-56348,0,2,0,34,0,100,0,2,15,0,0,0,80,1482301,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silas Darkmoon - On WP 16 Reached - Call Timed Action List'),

(1482301,9,0,0,0,0,100,0,0,240000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silas Darkmoon - On Script - Say Line 1'),

(1482302,9,0,0,0,0,100,0,0,240000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silas Darkmoon - On Script - Say Line 2'), -- For later use

(1482303,9,0,0,0,0,100,0,0,240000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silas Darkmoon - On Script - Say Line 3');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` IN (6182,7095);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,6182,7334,0,0,12,1,3,0,0,1,0,0,'Silas Darkmoon - Group 0: Show gossip text 7334 only if event ''Darkmoon Faire (Terokkar Forest)'' is not active'),
(14,6182,11482,0,0,12,1,3,0,0,0,0,0,'Silas Darkmoon - Group 0: Show gossip text 11482 only if event ''Darkmoon Faire (Terokkar Forest)'' is active'),

(14,7095,8348,0,0,12,1,3,0,0,1,0,0,'Selina Dourman - Group 0: Show gossip text 8348 only if event ''Darkmoon Faire (Terokkar Forest)'' is not active'),
(14,7095,8348,0,0,12,1,5,0,0,1,0,0,'Selina Dourman - Group 0: Show gossip text 8348 only if event ''Darkmoon Faire (Mulgore)'' is not active'),
(14,7095,8349,0,0,12,1,3,0,0,1,0,0,'Selina Dourman - Group 0: Show gossip text 8349 only if event ''Darkmoon Faire (Terokkar Forest)'' is not active'),
(14,7095,8349,0,0,12,1,4,0,0,1,0,0,'Selina Dourman - Group 0: Show gossip text 8349 only if event ''Darkmoon Faire (Elwynn Forest)'' is not active'),
(14,7095,11743,0,0,12,1,4,0,0,1,0,0,'Selina Dourman - Group 0: Show gossip text 11743 only if event ''Darkmoon Faire (Elwynn Forest)'' is not active'),
(14,7095,11743,0,0,12,1,5,0,0,1,0,0,'Selina Dourman - Group 0: Show gossip text 11743 only if event ''Darkmoon Faire (Mulgore)'' is not active');

DELETE FROM `waypoint_data` WHERE `id` IN (563480,436720,700250,833500,700240);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
-- Silas Darkmoon
(563480,1,-2275.19,5220.14,-9.98464,0,0,0,0,100,0),
(563480,2,-2287.88,5221.7,-9.98743,0,300000,0,0,100,0),
(563480,3,-2278.76,5220.11,-9.98744,0,0,0,0,100,0),
(563480,4,-2271.06,5218.77,-9.98373,0,0,0,0,100,0),
(563480,5,-2264.71,5212.8,-9.987,0,0,0,0,100,0),
(563480,6,-2257.39,5205.93,-9.98758,0,0,0,0,100,0),
(563480,7,-2249.81,5200.84,-9.98758,0,0,0,0,100,0),
(563480,8,-2240,5194.25,-10.4829,0,300000,0,0,100,0),
(563480,9,-2236.74,5197.24,-10.4196,0,0,0,0,100,0),
(563480,10,-2238.29,5203.65,-9.98796,0,0,0,0,100,0),
(563480,11,-2240.5,5212.78,-9.98796,0,0,0,0,100,0),
(563480,12,-2242.45,5220.84,-9.9798,0,0,0,0,100,0),
(563480,13,-2247.42,5227.17,-9.97662,0,0,0,0,100,0),
(563480,14,-2254.75,5227.07,-9.97637,0,0,0,0,100,0),
(563480,15,-2263.29,5226.96,-9.97635,0,0,0,0,100,0),
(563480,16,-2255.43,5216.31,-8.39336,0,300000,0,0,100,0),
(563480,17,-2263.29,5226.96,-9.97635,0,0,0,0,100,0),
(563480,18,-2271.06,5218.77,-9.98373,0,0,0,0,100,0),
-- Flik's Frog
(436720,1,-2277.7,5243.56,-9.97566,0,0,1,0,100,0),
(436720,2,-2279.48,5242.62,-9.97566,0,0,1,0,100,0),
(436720,3,-2284.89,5248.24,-9.97653,0,0,1,0,100,0),
(436720,4,-2283.32,5258.66,-9.97653,0,0,1,0,100,0),
(436720,5,-2290.07,5253.91,-9.97653,0,0,1,0,100,0),
(436720,6,-2278.24,5251.78,-9.97653,0,0,1,0,100,0),
(436720,7,-2277.64,5241.34,-9.97566,0,0,1,0,100,0),
(436720,8,-2273.03,5233.78,-9.97566,0,0,1,0,100,0),
(436720,9,-2267.23,5224.27,-9.97566,0,0,1,0,100,0),
(436720,10,-2262.34,5216.24,-9.98749,0,0,1,0,100,0),
(436720,11,-2257.45,5208.22,-9.98695,0,0,1,0,100,0),
(436720,12,-2251.49,5202.81,-9.98696,0,0,1,0,100,0),
(436720,13,-2244.76,5196.72,-10.1305,0,0,1,0,100,0),
(436720,14,-2238.2,5190.77,-10.7194,0,0,1,0,100,0),
(436720,15,-2232.03,5185.18,-11.4633,0,0,1,0,100,0),
(436720,16,-2228.17,5178.27,-12.5871,0,0,1,0,100,0),
(436720,17,-2224.53,5171.78,-14.0841,0,0,1,0,100,0),
(436720,18,-2219.91,5162.09,-17.0686,0,0,1,0,100,0),
(436720,19,-2214.53,5150.82,-19.8266,0,0,1,0,100,0),
(436720,20,-2219.53,5152.1,-19.433,0,0,1,0,100,0),
(436720,21,-2213.16,5157.07,-18.8627,0,0,1,0,100,0),
(436720,22,-2218.37,5159.88,-17.8067,0,0,1,0,100,0),
(436720,23,-2222.69,5170.07,-14.6028,0,0,1,0,100,0),
(436720,24,-2226.55,5176.98,-12.9064,0,0,1,0,100,0),
(436720,25,-2230.36,5183.77,-11.7017,0,0,1,0,100,0),
(436720,26,-2234.69,5191.51,-10.8124,0,0,1,0,100,0),
(436720,27,-2239.11,5200.98,-10.0402,0,0,1,0,100,0),
(436720,28,-2242.8,5208.86,-9.98747,0,0,1,0,100,0),
(436720,29,-2246.89,5217.62,-9.98747,0,0,1,0,100,0),
(436720,30,-2251.38,5227.23,-9.97628,0,0,1,0,100,0),
(436720,31,-2258.92,5230.74,-9.97628,0,0,1,0,100,0),
(436720,32,-2267.43,5234.7,-9.97625,0,0,1,0,100,0),
(436720,33,-2275.69,5238.54,-9.97626,0,0,1,0,100,0),
-- Darkmoon Faire Carnie
(700250,1,-2264.34,5221.03,-9.97827,0,0,0,0,100,0),
(700250,2,-2260.14,5212.48,-9.98766,0,0,0,0,100,0),
(700250,3,-2255.95,5203.96,-9.98725,0,0,0,0,100,0),
(700250,4,-2244.87,5202.49,-9.98725,0,0,0,0,100,0),
(700250,5,-2242.85,5214.99,-9.98725,0,0,0,0,100,0),
(700250,6,-2248.35,5223.09,-9.9817,0,0,0,0,100,0),
(700250,7,-2255.2,5233.18,-9.97606,0,0,0,0,100,0),
(700250,8,-2264.78,5235.82,-9.97606,0,0,0,0,100,0),
(700250,9,-2273.89,5238.33,-9.97606,0,0,0,0,100,0),
(700250,10,-2277.01,5243.06,-9.97606,0,0,0,0,100,0),
(700250,11,-2268.95,5248.49,-9.97606,0,0,0,0,100,0),
(700250,12,-2273.6,5254.28,-9.97606,0,0,0,0,100,0),
(700250,13,-2284.76,5249.97,-9.97606,0,0,0,0,100,0),
(700250,14,-2279.11,5242.98,-9.97606,0,0,0,0,100,0),
(700250,15,-2270.93,5232.86,-9.97606,0,0,0,0,100,0),
(700250,16,-2263.07,5223.15,-9.97599,0,0,0,0,100,0),
(700250,17,-2270.75,5221.87,-9.97751,0,0,0,0,100,0),
(700250,18,-2278.15,5220.64,-9.98549,0,0,0,0,100,0),
(700250,19,-2290.21,5227.06,-9.98703,0,0,0,0,100,0),
(700250,20,-2301.18,5240.72,-9.97684,0,0,0,0,100,0),
(700250,21,-2310.97,5227.54,-9.97835,0,0,0,0,100,0),
(700250,22,-2305.7,5216.23,-9.98707,0,0,0,0,100,0),
(700250,23,-2294.76,5211.97,-9.98567,0,0,0,0,100,0),
(700250,24,-2286.27,5215.3,-9.98711,0,0,0,0,100,0),
(700250,25,-2276.65,5219.06,-9.98683,0,0,0,0,100,0),
(700250,26,-2265.27,5223.52,-9.97672,0,0,0,0,100,0),
-- Darkmoon Faire Carnie
(833500,1,-2241.85,5209.55,-9.98725,0,0,0,0,100,0),
(833500,2,-2246.22,5216.93,-9.98725,0,0,0,0,100,0),
(833500,3,-2251.82,5226.39,-9.97725,0,0,0,0,100,0),
(833500,4,-2257.44,5235.88,-9.9754,0,0,0,0,100,0),
(833500,5,-2265.17,5236.69,-9.9754,0,0,0,0,100,0),
(833500,6,-2273.26,5237.53,-9.9754,0,0,0,0,100,0),
(833500,7,-2277.04,5243.18,-9.9754,0,0,0,0,100,0),
(833500,8,-2267.71,5249.37,-9.9754,0,0,0,0,100,0),
(833500,9,-2273.62,5253.88,-9.9754,0,0,0,0,100,0),
(833500,10,-2278.62,5242.79,-9.9754,0,0,0,0,100,0),
(833500,11,-2273.68,5233.72,-9.9754,0,0,0,0,100,0),
(833500,12,-2267.92,5223.12,-9.9754,0,0,0,0,100,0),
(833500,13,-2280.51,5221.73,-9.98592,0,0,0,0,100,0),
(833500,14,-2286.43,5225.67,-9.98733,0,0,0,0,100,0),
(833500,15,-2294.18,5230.82,-9.98797,0,0,0,0,100,0),
(833500,16,-2299.29,5225.58,-9.98797,0,0,0,0,100,0),
(833500,17,-2292.24,5221.17,-9.98797,0,0,0,0,100,0),
(833500,18,-2284.58,5216.38,-9.98733,0,0,0,0,100,0),
(833500,19,-2272,5218.06,-9.98694,0,0,0,0,100,0),
(833500,20,-2263.07,5210.76,-9.98694,0,0,0,0,100,0),
(833500,21,-2253.75,5203.13,-9.98694,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
