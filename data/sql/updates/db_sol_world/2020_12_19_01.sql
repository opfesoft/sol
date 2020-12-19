-- DB update 2020_12_19_00 -> 2020_12_19_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_19_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_19_00 2020_12_19_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1608336434814868816'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1608336434814868816');

UPDATE `creature` SET `spawntimesecs` =   3600 WHERE `id` =  1531; -- Lost Soul
UPDATE `creature` SET `spawntimesecs` =   5400 WHERE `id` =  1911; -- Deeb
UPDATE `creature` SET `spawntimesecs` =   3600 WHERE `id` =  1936; -- Farmer Solliden
UPDATE `creature` SET `spawntimesecs` =   7200 WHERE `id` =  9046; -- Scarshield Quartermaster
UPDATE `creature` SET `spawntimesecs` =   3600 WHERE `id` = 10356; -- Bayne
UPDATE `creature` SET `spawntimesecs` =   5400 WHERE `id` = 10357; -- Ressan the Needler
UPDATE `creature` SET `spawntimesecs` =   5400 WHERE `id` = 10358; -- Fellicent's Shade
UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `id` = 10558; -- Hearthsinger Forresten
UPDATE `creature` SET `spawntimesecs` = 604800 WHERE `id` = 10809; -- Stonespine
UPDATE `creature` SET `spawntimesecs` =  72000 WHERE `id` = 14222; -- Araga
UPDATE `creature` SET `spawntimesecs` =  82800 WHERE `id` = 18680; -- Marticar
UPDATE `creature` SET `spawntimesecs` =  28800 WHERE `id` = 18685; -- Okrek
UPDATE `creature` SET `spawntimesecs` =  21600 WHERE `id` = 18686; -- Doomsayer Jurim
UPDATE `creature` SET `spawntimesecs` =  21600 WHERE `id` = 18690; -- Morcrush
UPDATE `creature` SET `spawntimesecs` =  21600 WHERE `id` = 32491; -- Time-Lost Proto Drake
UPDATE `creature` SET `spawntimesecs` =  21600 WHERE `id` = 32517; -- Loque'nahak

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
