INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1625485014381956791');

-- Relocate Dread Swoop
UPDATE `creature` SET `position_x` = 52.892, `position_y` = 1563.021, `position_z` = 124.512, `orientation` = 3.459 WHERE `guid` = 27980;
