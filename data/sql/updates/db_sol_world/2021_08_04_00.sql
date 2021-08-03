-- DB update 2021_08_03_03 -> 2021_08_04_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_03_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_03_03 2021_08_04_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1628027980241287249'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1628027980241287249');

UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `guid` IN (93735,93627,93555,93042,93102,93715,93408);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4 WHERE `guid` IN (93553,93044,93719,93722,93700);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 3 WHERE `guid` IN (93105,93603,93654,93666,93678,93731,93726,93218,93232,93032,93694,93714,93716,93633,93668,93220);
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0 WHERE `guid` IN (93754,93760,93204,93187);

UPDATE `creature` SET `orientation` = 0.352043 WHERE `guid` = 93554;
UPDATE `creature` SET `orientation` = 4.35018 WHERE `guid` = 93640;
UPDATE `creature` SET `orientation` = 3.69344 WHERE `guid` = 93659;
UPDATE `creature` SET `orientation` = 5.83803 WHERE `guid` = 93761;
UPDATE `creature` SET `orientation` = 1.592 WHERE `guid` = 93211;
UPDATE `creature` SET `orientation` = 5.61822 WHERE `guid` = 93672;
UPDATE `creature` SET `orientation` = 5.06765 WHERE `guid` = 93675;
UPDATE `creature` SET `orientation` = 1.67255 WHERE `guid` = 93207;
UPDATE `creature` SET `orientation` = 4.05203 WHERE `guid` = 93727;
UPDATE `creature` SET `orientation` = 1.7898 WHERE `guid` = 93703;
UPDATE `creature` SET `orientation` = 1.7466 WHERE `guid` = 93704;
UPDATE `creature` SET `orientation` = 2.01927 WHERE `guid` = 93033;
UPDATE `creature` SET `orientation` = 3.3655 WHERE `guid` = 93041;
UPDATE `creature` SET `orientation` = 0.257374 WHERE `guid` = 93217;
UPDATE `creature` SET `orientation` = 2.49884 WHERE `guid` = 93215;
UPDATE `creature` SET `orientation` = 3.57443 WHERE `guid` = 93045;
UPDATE `creature` SET `orientation` = 0.353608 WHERE `guid` = 93213;
UPDATE `creature` SET `orientation` = 0.230818 WHERE `guid` = 93671;
UPDATE `creature` SET `orientation` = 4.21529, `MovementType` = 0, `wander_distance` = 0 WHERE `guid` = 93552;
UPDATE `creature` SET `orientation` = 2.41382, `MovementType` = 0, `wander_distance` = 0 WHERE `guid` = 93642;
UPDATE `creature` SET `orientation` = 2.97604, `MovementType` = 0, `wander_distance` = 0 WHERE `guid` = 93141;
UPDATE `creature` SET `orientation` = 4.52046, `MovementType` = 0, `wander_distance` = 0 WHERE `guid` = 93698;
UPDATE `creature` SET `orientation` = 3.12771, `MovementType` = 0, `wander_distance` = 0 WHERE `guid` = 93602;
UPDATE `creature` SET `orientation` = 5.48056, `MovementType` = 0, `wander_distance` = 0 WHERE `guid` = 93206;
UPDATE `creature` SET `orientation` = 2.64135, `MovementType` = 0, `wander_distance` = 0 WHERE `guid` = 93730;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
