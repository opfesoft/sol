-- DB update 2022_04_16_00 -> 2022_04_18_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_16_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_16_00 2022_04_18_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1650279987582335974'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1650279987582335974');

DELETE FROM `spell_group` WHERE `id` = 5000;
INSERT INTO `spell_group` (`id`, `spell_id`, `special_flag`)
VALUES
(5000,57761,0),
(5000,48108,0),
(5000,22008,0);

DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 5000;
INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`, `description`)
VALUES
(5000,8,'Never stack: Netherwind Focus, Fireball!, Hot Streak');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
