-- DB update 2021_09_03_00 -> 2021_09_03_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_03_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_03_00 2021_09_03_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1630667639434678069'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1630667639434678069');

UPDATE `broadcast_text` SET `MaleText` = 'Guild Master', `FemaleText` = 'Guild Master', `VerifiedBuild` = 0 WHERE `ID` IN (2870,3428,4890,5086,5332,5910,6909,6993,7072,15222,32189,45380);

DELETE FROM `broadcast_text_locale` WHERE `ID` IN (2870,3428,4890,5086,5332,5910,6909,6993,7072,15222,32189,45380);
INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `MaleText`, `FemaleText`, `VerifiedBuild`)
VALUES
(2870,'deDE','Gildenmeister','Gildenmeister',0),
(2870,'esES','Maestro de hermandad','Maestro de hermandad',0),
(2870,'esMX','Maestro de hermandad','Maestro de hermandad',0),
(2870,'frFR','Maître des guildes','Maître des guildes',0),
(2870,'koKR','길드 사무관','길드 사무관',0),
(2870,'ruRU','Регистратор гильдий','Регистратор гильдий',0),
(2870,'zhCN','公会注册员','公会注册员',0),
(2870,'zhTW','公會註冊員','公會註冊員',0),

(3428,'deDE','Gildenmeister','Gildenmeister',0),
(3428,'esES','Maestro de hermandad','Maestro de hermandad',0),
(3428,'esMX','Maestro de hermandad','Maestro de hermandad',0),
(3428,'frFR','Maître des guildes','Maître des guildes',0),
(3428,'koKR','길드 사무관','길드 사무관',0),
(3428,'ruRU','Регистратор гильдий','Регистратор гильдий',0),
(3428,'zhCN','公会注册员','公会注册员',0),
(3428,'zhTW','公會註冊員','公會註冊員',0),

(4890,'deDE','Gildenmeister','Gildenmeister',0),
(4890,'esES','Maestro de hermandad','Maestro de hermandad',0),
(4890,'esMX','Maestro de hermandad','Maestro de hermandad',0),
(4890,'frFR','Maître des guildes','Maître des guildes',0),
(4890,'koKR','길드 사무관','길드 사무관',0),
(4890,'ruRU','Регистратор гильдий','Регистратор гильдий',0),
(4890,'zhCN','公会注册员','公会注册员',0),
(4890,'zhTW','公會註冊員','公會註冊員',0),

(5086,'deDE','Gildenmeister','Gildenmeister',0),
(5086,'esES','Maestro de hermandad','Maestro de hermandad',0),
(5086,'esMX','Maestro de hermandad','Maestro de hermandad',0),
(5086,'frFR','Maître des guildes','Maître des guildes',0),
(5086,'koKR','길드 사무관','길드 사무관',0),
(5086,'ruRU','Регистратор гильдий','Регистратор гильдий',0),
(5086,'zhCN','公会注册员','公会注册员',0),
(5086,'zhTW','公會註冊員','公會註冊員',0),

(5332,'deDE','Gildenmeister','Gildenmeister',0),
(5332,'esES','Maestro de hermandad','Maestro de hermandad',0),
(5332,'esMX','Maestro de hermandad','Maestro de hermandad',0),
(5332,'frFR','Maître des guildes','Maître des guildes',0),
(5332,'koKR','길드 사무관','길드 사무관',0),
(5332,'ruRU','Регистратор гильдий','Регистратор гильдий',0),
(5332,'zhCN','公会注册员','公会注册员',0),
(5332,'zhTW','公會註冊員','公會註冊員',0),

(5910,'deDE','Gildenmeister','Gildenmeister',0),
(5910,'esES','Maestro de hermandad','Maestro de hermandad',0),
(5910,'esMX','Maestro de hermandad','Maestro de hermandad',0),
(5910,'frFR','Maître des guildes','Maître des guildes',0),
(5910,'koKR','길드 사무관','길드 사무관',0),
(5910,'ruRU','Регистратор гильдий','Регистратор гильдий',0),
(5910,'zhCN','公会注册员','公会注册员',0),
(5910,'zhTW','公會註冊員','公會註冊員',0),

(6909,'deDE','Gildenmeister','Gildenmeister',0),
(6909,'esES','Maestro de hermandad','Maestro de hermandad',0),
(6909,'esMX','Maestro de hermandad','Maestro de hermandad',0),
(6909,'frFR','Maître des guildes','Maître des guildes',0),
(6909,'koKR','길드 사무관','길드 사무관',0),
(6909,'ruRU','Регистратор гильдий','Регистратор гильдий',0),
(6909,'zhCN','公会注册员','公会注册员',0),
(6909,'zhTW','公會註冊員','公會註冊員',0),

(6993,'deDE','Gildenmeister','Gildenmeister',0),
(6993,'esES','Maestro de hermandad','Maestro de hermandad',0),
(6993,'esMX','Maestro de hermandad','Maestro de hermandad',0),
(6993,'frFR','Maître des guildes','Maître des guildes',0),
(6993,'koKR','길드 사무관','길드 사무관',0),
(6993,'ruRU','Регистратор гильдий','Регистратор гильдий',0),
(6993,'zhCN','公会注册员','公会注册员',0),
(6993,'zhTW','公會註冊員','公會註冊員',0),

(7072,'deDE','Gildenmeister','Gildenmeister',0),
(7072,'esES','Maestro de hermandad','Maestro de hermandad',0),
(7072,'esMX','Maestro de hermandad','Maestro de hermandad',0),
(7072,'frFR','Maître des guildes','Maître des guildes',0),
(7072,'koKR','길드 사무관','길드 사무관',0),
(7072,'ruRU','Регистратор гильдий','Регистратор гильдий',0),
(7072,'zhCN','公会注册员','公会注册员',0),
(7072,'zhTW','公會註冊員','公會註冊員',0),

(15222,'deDE','Gildenmeister','Gildenmeister',0),
(15222,'esES','Maestro de hermandad','Maestro de hermandad',0),
(15222,'esMX','Maestro de hermandad','Maestro de hermandad',0),
(15222,'frFR','Maître des guildes','Maître des guildes',0),
(15222,'koKR','길드 사무관','길드 사무관',0),
(15222,'ruRU','Регистратор гильдий','Регистратор гильдий',0),
(15222,'zhCN','公会注册员','公会注册员',0),
(15222,'zhTW','公會註冊員','公會註冊員',0),

(32189,'deDE','Gildenmeister','Gildenmeister',0),
(32189,'esES','Maestro de hermandad','Maestro de hermandad',0),
(32189,'esMX','Maestro de hermandad','Maestro de hermandad',0),
(32189,'frFR','Maître des guildes','Maître des guildes',0),
(32189,'koKR','길드 사무관','길드 사무관',0),
(32189,'ruRU','Регистратор гильдий','Регистратор гильдий',0),
(32189,'zhCN','公会注册员','公会注册员',0),
(32189,'zhTW','公會註冊員','公會註冊員',0),

(45380,'deDE','Gildenmeister','Gildenmeister',0),
(45380,'esES','Maestro de hermandad','Maestro de hermandad',0),
(45380,'esMX','Maestro de hermandad','Maestro de hermandad',0),
(45380,'frFR','Maître des guildes','Maître des guildes',0),
(45380,'koKR','길드 사무관','길드 사무관',0),
(45380,'ruRU','Регистратор гильдий','Регистратор гильдий',0),
(45380,'zhCN','公会注册员','公会注册员',0),
(45380,'zhTW','公會註冊員','公會註冊員',0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
