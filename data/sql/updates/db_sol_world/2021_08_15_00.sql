-- DB update 2021_08_14_01 -> 2021_08_15_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_14_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_14_01 2021_08_15_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1629027167984034027'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1629027167984034027');

UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 20 WHERE `guid` IN (23182,23181,23183,23187,23186);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10 WHERE `guid` IN (23126,23127,23131,23136,23138,23173,23197,23213);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `guid` IN (23178,23180,23125,23135,23139,23145);
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0 WHERE `guid` IN (23141,23212,23190,23175,23147,23171,23179);
UPDATE `creature` SET `wander_distance` = 5 WHERE `guid` = 23170;
UPDATE `creature` SET `position_x` = -8311.66, `position_y` = -2885.25, `position_z` = 10.4301, `orientation` = 0.697169 WHERE `guid` = 23209;
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0, `orientation` = 3.53 WHERE `guid` = 23148;
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0, `orientation` = 5.77476 WHERE `guid` = 23188;
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0, `orientation` = 0.489027 WHERE `guid` = 23176;
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0, `orientation` = 2.57819 WHERE `guid` = 23154;
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0, `orientation` = 4.49063 WHERE `guid` = 23172;
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0, `orientation` = 5.25246 WHERE `guid` = 23142;
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0, `orientation` = 4.01153 WHERE `guid` = 23150;
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0, `orientation` = 1.03093 WHERE `guid` = 23185;
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0, `orientation` = 5.18176 WHERE `guid` = 23146;
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0, `orientation` = 2.61586 WHERE `guid` = 23143;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
