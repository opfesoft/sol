-- DB update 2021_01_31_04 -> 2021_02_02_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_31_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_31_04 2021_02_02_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1612274757051032301'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1612274757051032301');

DELETE FROM `creature_text` WHERE `CreatureID` IN (17243,17318);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(17243,0,0,'A-ha! Found one!',12,7,100,0,0,0,14076,0,'npc_engineer_spark_overgrind SPARK_SAY_0'),
(17243,0,1,'Another one!',12,7,100,0,0,0,14077,0,'npc_engineer_spark_overgrind SPARK_SAY_0'),
(17243,0,2,'Oh that''s a big one!',12,7,100,0,0,0,14078,0,'npc_engineer_spark_overgrind SPARK_SAY_0'),
(17243,0,3,'It''s ironic, I hate the ocean but I love the beach.',12,7,100,0,0,0,14080,0,'npc_engineer_spark_overgrind SPARK_SAY_0'),
(17243,0,4,'I wonder if you can really hear the ocean in these things.',12,7,100,0,0,0,14079,0,'npc_engineer_spark_overgrind SPARK_SAY_0'),
(17243,0,5,'Yes Master, all goes along as planned.',12,7,100,0,0,0,14082,0,'npc_engineer_spark_overgrind SPARK_SAY_0'),
(17243,1,0,'%s places the shell in his pack.',16,7,100,0,0,0,14083,0,'npc_engineer_spark_overgrind SPARK_SAY_1'),
(17243,1,1,'%s examines the shell.',16,7,100,0,0,0,14086,0,'npc_engineer_spark_overgrind SPARK_SAY_1'),
(17243,1,2,'%s holds the shell up to his ear.',16,7,100,0,0,0,14084,0,'npc_engineer_spark_overgrind SPARK_SAY_1'),
(17243,2,0,'%s laughs.',16,7,100,11,0,0,13785,0,'npc_engineer_spark_overgrind SPARK_SAY_2'),
(17243,3,0,'Does it frighten you to know that there are those that would serve the Legion with such devotion as to remain unwavering citizens of your pointless civilizations until called upon?',12,7,100,1,0,0,13787,0,'npc_engineer_spark_overgrind SPARK_SAY_3'),
(17243,4,0,'Live in fear, die by the will of Kael''thas... It''s all the same.',12,7,100,1,0,0,13791,0,'npc_engineer_spark_overgrind SPARK_SAY_4'),
(17243,5,0,'And now, I cut you!',12,7,100,0,0,0,14090,0,'npc_engineer_spark_overgrind SPARK_SAY_5'),
(17243,6,0,'DIE!',12,7,100,0,0,0,14091,0,'npc_engineer_spark_overgrind SPARK_SAY_6'),
(17243,7,0,'%s picks up the naga flag.',16,7,100,0,0,0,13775,0,'npc_geezle SPARK_SAY_7'),
(17243,8,0,'What''s the big idea? You nearly blew my cover, idiot! I told you to put the compass and navigation maps somewhere safe - not out in the open for any fool to discover.',12,7,100,1,0,0,13777,0,'npc_geezle SPARK_SAY_8'),
(17243,9,0,'The Master has gone to great lengths to secure information about the whereabouts of the Exodar. You could have blown the entire operation, including the cover of our spy on the inside.',12,7,100,1,0,0,13778,0,'npc_geezle SPARK_SAY_9'),
(17243,10,0,'Relax? Do you know what Kael''thas does to those that fail him, Geezle? Eternal suffering and pain... Do NOT screw this up, fool.',12,7,100,1,0,0,13780,0,'npc_geezle SPARK_SAY_10'),
(17243,11,0,'Our Bloodmyst scouts have located our contact. The fool, Velen, will soon leave himself open and defenseless -- long enough for us to strike! Now get out of my sight before I vaporize you...',12,7,100,15,0,0,13781,0,'npc_geezle SPARK_SAY_11'),

(17318,0,0,'What''s the big idea, Spark? Why''d you call for this meeting?',12,0,100,1,0,0,13776,0,'npc_geezle GEEZLE_SAY_0'),
(17318,1,0,'Relax, Spark! I have it all under control. We''ll strip mine the Exodar right out from under ''em - making both you and I very, very rich in the process.',12,0,100,1,0,0,13779,0,'npc_geezle GEEZLE_SAY_1'),
(17318,2,0,'Yes, sir. It won''t happen again...',12,0,100,1,0,0,13782,0,'npc_geezle GEEZLE_SAY_2');

DELETE FROM `waypoint_data` WHERE `id` = 619660;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(619660,1,-4708.48,-12532,1.08789,0,0,0,0,100,0),
(619660,2,-4717.12,-12505.9,3.15087,0,0,0,0,100,0),
(619660,3,-4731.38,-12515.1,1.97766,0,0,0,0,100,0),
(619660,4,-4739.05,-12499.2,2.44127,0,0,0,0,100,0),
(619660,5,-4744.11,-12488.7,2.71445,0,0,0,0,100,0),
(619660,6,-4736.06,-12469.9,2.79717,0,0,0,0,100,0),
(619660,7,-4745.04,-12466,3.23589,0,0,0,0,100,0),
(619660,8,-4759.44,-12459.7,1.9132,0,0,0,0,100,0),
(619660,9,-4770.78,-12419.5,0.947688,0,0,0,0,100,0),
(619660,10,-4754.78,-12415.2,3.25112,0,0,0,0,100,0),
(619660,11,-4750.7,-12429.3,2.85072,0,0,0,0,100,0),
(619660,12,-4744.58,-12450.5,3.81207,0,0,0,0,100,0),
(619660,13,-4741.05,-12462.7,3.47647,0,0,0,0,100,0),
(619660,14,-4749.05,-12504.2,1.28522,0,0,0,0,100,0),
(619660,15,-4730.3,-12513.1,2.25313,0,0,0,0,100,0),
(619660,16,-4699.79,-12527.7,1.98426,0,0,0,0,100,0),
(619660,17,-4689.77,-12527.3,2.6005,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
