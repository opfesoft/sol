-- DB update 2021_02_07_02 -> 2021_02_08_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_07_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_07_02 2021_02_08_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1612799723696158420'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1612799723696158420');

UPDATE `creature_text` SET `BroadcastTextId` = 37172 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17212;
UPDATE `creature_text` SET `BroadcastTextId` = 37173 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17213;
UPDATE `creature_text` SET `BroadcastTextId` = 37177 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17217;
UPDATE `creature_text` SET `BroadcastTextId` = 37175 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17218;
UPDATE `creature_text` SET `BroadcastTextId` = 37176 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17219;
UPDATE `creature_text` SET `BroadcastTextId` = 38668 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17220;
UPDATE `creature_text` SET `BroadcastTextId` = 37174 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17221;
UPDATE `creature_text` SET `BroadcastTextId` = 36994 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17223;
UPDATE `creature_text` SET `BroadcastTextId` = 38536 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16607;
UPDATE `creature_text` SET `BroadcastTextId` = 38537 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16608;
UPDATE `creature_text` SET `BroadcastTextId` = 38539 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16610;
UPDATE `creature_text` SET `BroadcastTextId` = 38551 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16645;
UPDATE `creature_text` SET `BroadcastTextId` = 36992 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16647;
UPDATE `creature_text` SET `BroadcastTextId` = 36990 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16648;
UPDATE `creature_text` SET `BroadcastTextId` = 36991 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16649;
UPDATE `creature_text` SET `BroadcastTextId` = 37598 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16638;
UPDATE `creature_text` SET `BroadcastTextId` = 37599 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16639;
UPDATE `creature_text` SET `BroadcastTextId` = 37600 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16640;
UPDATE `creature_text` SET `BroadcastTextId` = 37601 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16641;
UPDATE `creature_text` SET `BroadcastTextId` = 37602 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16642;
UPDATE `creature_text` SET `BroadcastTextId` = 37568 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17049;
UPDATE `creature_text` SET `BroadcastTextId` = 37569 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17050;
UPDATE `creature_text` SET `BroadcastTextId` = 37570 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17051;
UPDATE `creature_text` SET `BroadcastTextId` = 37571 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17052;
UPDATE `creature_text` SET `BroadcastTextId` = 37572 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17053;
UPDATE `creature_text` SET `BroadcastTextId` = 37573 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17054;
UPDATE `creature_text` SET `BroadcastTextId` = 37600 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17055;
UPDATE `creature_text` SET `BroadcastTextId` = 37575 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17056;
UPDATE `creature_text` SET `BroadcastTextId` = 37576 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17057;
UPDATE `creature_text` SET `BroadcastTextId` = 37583 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16659;
UPDATE `creature_text` SET `BroadcastTextId` = 37584 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16660;
UPDATE `creature_text` SET `BroadcastTextId` = 37585 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16661;
UPDATE `creature_text` SET `BroadcastTextId` = 37586 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16662;
UPDATE `creature_text` SET `BroadcastTextId` = 37587 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16663;
UPDATE `creature_text` SET `BroadcastTextId` = 37588 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16664;
UPDATE `creature_text` SET `BroadcastTextId` = 37589 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16665;
UPDATE `creature_text` SET `BroadcastTextId` = 37201 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16675;
UPDATE `creature_text` SET `BroadcastTextId` = 37202 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16676;
UPDATE `creature_text` SET `BroadcastTextId` = 37204 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16677;
UPDATE `creature_text` SET `BroadcastTextId` = 38442 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16678;
UPDATE `creature_text` SET `BroadcastTextId` = 37205 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16679;
UPDATE `creature_text` SET `BroadcastTextId` = 37206 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16680;
UPDATE `creature_text` SET `BroadcastTextId` = 37613 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17225;
UPDATE `creature_text` SET `BroadcastTextId` = 37614 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17226;
UPDATE `creature_text` SET `BroadcastTextId` = 37615 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17227;
UPDATE `creature_text` SET `BroadcastTextId` = 37168 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17058;
UPDATE `creature_text` SET `BroadcastTextId` = 38540 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17029;
UPDATE `creature_text` SET `BroadcastTextId` = 38541 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17030;
UPDATE `creature_text` SET `BroadcastTextId` = 38542 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17031;
UPDATE `creature_text` SET `BroadcastTextId` = 38543 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17032;
UPDATE `creature_text` SET `BroadcastTextId` = 38551 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17059;
UPDATE `creature_text` SET `BroadcastTextId` = 37170 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17061;
UPDATE `creature_text` SET `BroadcastTextId` = 37171 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 17062;
UPDATE `creature_text` SET `BroadcastTextId` = 37931 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16710;
UPDATE `creature_text` SET `BroadcastTextId` = 37941 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16711;
UPDATE `creature_text` SET `BroadcastTextId` = 37942 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16712;
UPDATE `creature_text` SET `BroadcastTextId` = 37943 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16713;
UPDATE `creature_text` SET `BroadcastTextId` = 37945 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16715;
UPDATE `creature_text` SET `BroadcastTextId` = 37946 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16716;
UPDATE `creature_text` SET `BroadcastTextId` = 37953 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16717;
UPDATE `creature_text` SET `BroadcastTextId` = 37944 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16714;
UPDATE `creature_text` SET `BroadcastTextId` = 37948 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16734;
UPDATE `creature_text` SET `BroadcastTextId` = 37949 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16735;
UPDATE `creature_text` SET `BroadcastTextId` = 37950 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16736;
UPDATE `creature_text` SET `BroadcastTextId` = 37951 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16737;
UPDATE `creature_text` SET `BroadcastTextId` = 37954 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16739;
UPDATE `creature_text` SET `BroadcastTextId` = 37955 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16740;
UPDATE `creature_text` SET `BroadcastTextId` = 37953 WHERE `CreatureID` IN (38112,38113,37226,36954,37225,37221,36955,37223,37554) AND `BroadcastTextId` = 0 AND `Sound` = 16741;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
