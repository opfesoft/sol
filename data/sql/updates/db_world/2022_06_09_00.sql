UPDATE `gameobject_template` SET `Data0` = 4, `Data1` = 10 WHERE `entry` = 195090;

DELETE FROM `gameobject_template` WHERE `entry` = 195089;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`)
VALUES
(195089,6,0,'Spirit Candle','','','',1,0,0,10,65459,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',-18019);

DELETE FROM `gameobject_template_addon` WHERE `entry` = 195089;
INSERT INTO `gameobject_template_addon` (`entry`, `faction`, `flags`, `mingold`, `maxgold`)
VALUES
(195089,35,0,0,0);
