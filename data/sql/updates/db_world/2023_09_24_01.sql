DELETE FROM `acore_string` WHERE `entry` = 515;
INSERT INTO `acore_string` (`entry`, `content_default`)
VALUES
(515,'%d (Entry: %d) - |cffffffff|Hcreature:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r ');

DELETE FROM `acore_string_locale` WHERE `entry` = 515;
INSERT INTO `acore_string_locale` (`entry`, `locale`, `content`)
VALUES
(515,'deDE','%d (Eintrag: %d) - |cffffffff|Hcreature:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r ');
