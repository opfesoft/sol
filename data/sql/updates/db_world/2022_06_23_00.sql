--
DELETE FROM `creature` WHERE `guid` = 248582;
DELETE FROM `gameobject` WHERE `guid` IN (21003, 21004, 21005, 21006, 21007, 21008, 21010, 21011, 21012, 21013, 21014, 21015, 21017, 21019, 21020, 21021, 21022);
DELETE FROM `game_event_creature` WHERE `guid` = 248582;
DELETE FROM `game_event_gameobject` WHERE `guid` IN (21003, 21004, 21005, 21006, 21007, 21008, 21010, 21011, 21012, 21013, 21014, 21015, 21017, 21019, 21020, 21021, 21022);