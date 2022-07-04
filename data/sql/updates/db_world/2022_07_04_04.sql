DELETE FROM `graveyard_zone` WHERE `GhostZone` IN (141,1657) AND `ID` IN (469,129,91);
INSERT INTO `graveyard_zone` (`ID`, `GhostZone`, `GhostArea`, `Faction`, `ClassMask`, `Comment`)
VALUES
(91,141,0,0,0,'Teldrassil, Dolanaar GY'),
(91,1657,0,67,0,'Teldrassil, Dolanaar GY'),
(129,141,0,469,0,'Teldrassil, Rut''theran Village GY'),
(469,141,702,67,0,'Darkshore, Twilight Vale GY');
