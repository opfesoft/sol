-- DB update 2021_08_10_01 -> 2021_08_11_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_10_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_10_01 2021_08_11_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1628697055856144438'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1628697055856144438');

DELETE FROM `command` WHERE `name` IN ('learn all my class', 'learn all my spells', 'learn all my talents');
INSERT INTO `command` (`name`, `security`, `help`)
VALUES
('learn all my class',2,'Syntax: .learn all my class\r\nLearn all spells and talents available for the targeted player''s class. The talent points will reset after login for normal players, GMs keep them.'),
('learn all my spells',2,'Syntax: .learn all my spells\r\nLearn all spells available for the targeted player''s class.'),
('learn all my talents',2,'Syntax: .learn all my talents\r\nLearn all talents available for the targeted player''s class. The talent points will reset after login for normal players, GMs keep them.');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
