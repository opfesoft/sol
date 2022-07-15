DELETE FROM `npc_text_locale` WHERE `ID` = 13321 AND `Locale` = 'zhCN';
INSERT INTO `npc_text_locale` (`ID`, `Locale`, `Text0_0`, `Text0_1`, `Text1_0`, `Text1_1`, `Text2_0`, `Text2_1`, `Text3_0`, `Text3_1`, `Text4_0`, `Text4_1`, `Text5_0`, `Text5_1`, `Text6_0`, `Text6_1`, `Text7_0`, `Text7_1`)
VALUES
(13321,'zhCN',NULL,'从这个港口，勇气号往返暴风城与奥伯丁两地。',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

DELETE FROM `broadcast_text` WHERE `ID` = 28636;
INSERT INTO `broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`)
VALUES
(28636,7,'','From this dock, The Bravery travels back and forth between Stormwind and Auberdine.',0,0,0,0,0,0,0,0,1,0);

DELETE FROM `broadcast_text_locale` WHERE `ID` = 28636;
INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `MaleText`, `FemaleText`, `VerifiedBuild`)
VALUES
(28636,'deDE','','Von diesem Dock aus fährt die Bravado zwischen Sturmwind und Auberdine hin und her.',0),
(28636,'esES','','Desde este muelle, El Valentía hace el viaje de ida y vuelta entre Ventormenta y Auberdine.',0),
(28636,'esMX','','Desde este muelle, El Valentía hace el viaje de ida y vuelta entre Ventormenta y Auberdine.',0),
(28636,'frFR','','Depuis ce quai, la Bravoure fait l\'aller-retour entre Hurlevent et Auberdine.',0),
(28636,'koKR','','용사들은 이 항구에서 스톰윈드와 루테란 마을을 오간답니다.',0),
(28636,'ruRU','','Между Штормградом и деревней Рут\'теран курсирует корабль \"Доблесть\".',0),
(28636,'zhCN','','从这个港口，勇气号往返暴风城与奥伯丁两地。',0);
