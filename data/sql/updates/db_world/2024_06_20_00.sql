UPDATE `command` SET `help` = REPLACE(`help`, 'trigered', 'triggered') WHERE `name` like 'cast%';
UPDATE `command` SET `help` = REPLACE(`help`, 'casted', 'cast') WHERE `name` like 'cast%';
UPDATE `command` SET `help` = REPLACE(`help`, 'pint', 'point') WHERE `name` = 'cast dist';
UPDATE `command` SET `help` = REPLACE(`help`, '\nCast #', '\n  Cast #') WHERE `name` = 'cast self';
