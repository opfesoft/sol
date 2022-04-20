-- DB update 2022_04_19_01 -> 2022_04_20_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_19_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_19_01 2022_04_20_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1650451535520584769'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1650451535520584769');

DELETE FROM `acore_string` WHERE `entry` IN (1336,1337,1338);
INSERT INTO `acore_string` (`entry`, `content_default`)
VALUES
(1336,'Begone, uncouth scum!  The Alliance shall prevail in Alterac Valley!'),
(1337,'Now is the time to attack!  For the Horde!'),
(1338,'Snivvle is here!  Snivvle claims the Coldtooth mine!');

DELETE FROM `acore_string_locale` WHERE `entry` IN (1336,1337,1338);
INSERT INTO `acore_string_locale` (`entry`, `locale`, `content`)
VALUES
(1336,'deDE','Verschwinde, dreckiger Abschaum! Die Allianz wird im Alteractal siegen!'),
(1336,'esES','¡Largo, escoria apestosa! ¡La Alianza reinará en el Valle de Alterac!'),
(1336,'esMX','¡Largo, escoria apestosa! ¡La Alianza reinará en el Valle de Alterac!'),
(1336,'frFR','Arrière, vermine inculte ! L’Alliance triomphera dans la vallée d’Alterac !'),
(1336,'koKR','꺼져라! 이 무례한 오합지졸들아! 알터랙 계곡은 얼라이언스의 땅이다!'),
(1336,'ruRU','Прочь, подлецы! Альтеракская долина достанется Альянсу!'),
(1336,'zhCN','去死吧，渣滓！联盟会获得胜利的！'),
(1336,'zhTW','去死吧，沒水準的廢物!聯盟會在奧特蘭克山谷獲得勝利的!'),
(1337,'deDE','Es ist Zeit anzugreifen! Für die Horde!'),
(1337,'esES','¡Es hora de atacar! ¡Por la Horda!'),
(1337,'esMX','¡Es hora de atacar! ¡Por la Horda!'),
(1337,'frFR','L''heure de l''attaque a sonné ! Pour la Horde !'),
(1337,'koKR','바로 지금이 공격할 때다! 호드를 위하여!'),
(1337,'ruRU','Настало время для атаки! За Орду!'),
(1337,'zhCN','准备发动攻击！为部落而战！'),
(1337,'zhTW','準備發動攻擊!為部落而戰!'),
(1338,'deDE','Schnuffel ist da! Schnuffel gehört jetzt die Eisbeißermine!'),
(1338,'esES','¡Snivvle está aquí! ¡Snivvle reclama la Mina Dentefrío!'),
(1338,'esMX','¡Snivvle está aquí! ¡Snivvle reclama la Mina Dentefrío!'),
(1338,'frFR','Snivvle est ici ! Snivvle prend la mine de Froide-dent !'),
(1338,'koKR','나 여기 있지롱! 얼음이빨 광산은 이 스니블 님의 것이다!'),
(1338,'ruRU','Хныкс пришел! Хныкс захватил рудник Ледяного Зуба!'),
(1338,'zhCN','斯尼维尔在此！冷齿矿洞是斯尼维尔的！'),
(1338,'zhTW','斯尼維爾在此!冷齒礦坑是斯尼維爾的!');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
