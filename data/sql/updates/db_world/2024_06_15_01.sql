-- Adjust the GO templates so they can be highlighted
UPDATE `gameobject_template` SET `type` = 8, `Data1` = 0, `Data2` = 0, `Data8` = 0 WHERE `entry` IN (179437,179438);
DELETE FROM `gameobject_template_addon` WHERE `entry` IN (179437,179438);

-- Remove quest starter/ender for "WANTED: Dwarves!" & "WANTED: Orcs!"
DELETE FROM `gameobject_queststarter` WHERE `quest` IN (7401,7402);
DELETE FROM `creature_questender` WHERE `quest` IN (7401,7402);
