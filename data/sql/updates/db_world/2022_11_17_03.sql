DELETE FROM `gameobject_addon` WHERE `guid` IN (46039,46040,46043,46049,46081);
INSERT INTO `gameobject_addon` (`guid`, `invisibilityType`, `invisibilityValue`, `useRotation`)
VALUES
(46039,0,0,1),
(46040,0,0,1),
(46043,0,0,1),
(46049,0,0,1),
(46081,0,0,1);

DELETE FROM `gameobject_queststarter` WHERE `id` = 142712;
INSERT INTO `gameobject_queststarter` (`id`, `quest`)
VALUES
(142712,2933);
