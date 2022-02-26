-- DB update 2022_02_26_02 -> 2022_02_27_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_26_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_26_02 2022_02_27_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1645917206430017039'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1645917206430017039');

DELETE FROM `quest_request_items` WHERE `ID` IN (11284,13839);
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`)
VALUES
(11284,0,0,'Have you had any luck removing that stupid yeti from my mine? ',0),
(13839,0,0,'Have you mastered the use of the charge?',0);

UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = 'Go kill 10 panthers! Show us what you''ve got!' WHERE `ID` = 191;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = 'What are you doing here, $n! You should be crawling through the brush, trying to kill 10 Shadowmaw Panthers. I thought you fancied yourself a big game hunter?' WHERE `ID` = 192;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 25, `EmoteOnIncomplete` = 25,
`CompletionText` = 'Your task is not yet complete, $N. Return to me once 5 mangy nightsabers and 5 thistle boars have been killed.' WHERE `ID` = 457;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = 'Do you have the heirlooms, $n?' WHERE `ID` = 1821;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 2, `EmoteOnIncomplete` = 5,
`CompletionText` = 'Welcome to the Valley of Trials, $n. You wouldn''t be here if you hadn''t gotten my tablet, so I will get to the point.$B$BI am Rwag and I am responsible for training the rogues, thieves, and cutpurses here in the Valley. I''m the one the Hand will turn to if you''re not ready for what''s to come. But don''t worry, the Hand won''t be controlling everything you do, but it would be wise to work with them if they have need of your talents.' WHERE `ID` = 3083;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = 'Finally, you''ve arrived... and discretely also. Good.$b$bOur world is full of fools, $N. Even the mighty Thrall has greater flaws than most can see. He turns his back on the power needed to make this land ours completely! We''re not the same people who were manipulated and used by creatures from the Nether. We are our own people. We are proud... and we are strong.' WHERE `ID` = 3090;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 2, `EmoteOnIncomplete` = 1,
`CompletionText` = 'Hello, $n. I''m glad you found me. I was thinking that perhaps you got lost on the way here.$B$BNothing really new has happened in Shadowglen since I sent you my sigil, but I''ll leave all the information gathering to you. Speak to the rest of the people around Aldrassil if you''d like.' WHERE `ID` = 3118;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 3, `EmoteOnIncomplete` = 0,
`CompletionText` = 'Why hello there young $g man : lady;. Would you like a tour of the museum?' WHERE `ID` = 3182;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1,
`CompletionText` = 'I can tell you more of the power required to defeat Blazerunner, but first, you need to gather the things I require.' WHERE `ID` = 4084;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = 'Salutations, mighty $c! Have you brought the valor tokens I asked of you? Once you hand them to me, I will issue you your own Chromatic Mantle of the Dawn.' WHERE `ID` = 5517;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = 'Yeah, I know who you are, and I know why you''re here. Arbington sent word to me before you arrived. Let''s cut to deal at hand, now shall we?$B$BI''ve got a mold you can use for the skeleton key, but it will cost you - fifteen gold, up front, no negotiation. I''ll pack the skeletal fragments into the mold for you, and I''ll also teach you on how to forge the stem of the key without any knowledge of blacksmithing... all free of charge no less.$B$BWho says mercenaries don''t offer competitive deals!' WHERE `ID` = 5538;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = 'Our spells of Fortify are very powerful, $N. They allow our companions to take further injury from all types of attacks and survive in situations where they would normally fall. But this is nothing when compared to our abilities to heal. There are no greater healers than a priest--do well to remember that. Your power alone can turn the tides of battle easily.' WHERE `ID` = 5621;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = 'When you have faced the challenge that lies before you, your understanding of strength of body and strength of heart will be fully realized. Until that time, I cannot help you further.' WHERE `ID` = 6002;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = '<Warmaster Laggrond salutes you.>$B$BIt is your time, $N. You have done much for the Frostwolf Clan and in doing so, earned a place as not only a soldier of Frostwolf but also as a friend.$B$BWell done! Present your initiate''s insignia.' WHERE `ID` = 7163;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = 'It is good to see you again, $C. I had not expected you to return. Alas, you have proven yourself a brave and honorable soldier of the Frostwolf.$B$BYour time has come again, $N. You have earned a new ranking and as such, a new insignia denoting this rise in stature.$B$BPresent your insignia.' WHERE `ID` = 7164;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = 'So many slain. Blood drenches the fields. Yet... You live... You have persevered. You have led our armies to many victories. For this, then, soldier, you have earned a new rank.$B$BPresent your insignia.' WHERE `ID` = 7165;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = 'Your radiate command and power, $C. Exalted in the eyes of Frostwolf - the enemy cowers at the mention of your name.$B$BRise, Hero of Frostwolf. Rise and be honored!$B$BPresent your insignia.' WHERE `ID` = 7166;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = 'Drek''Thar sings your praises. Kalimdor is abuzz with tales of your heroics. The Warchief glows - your stalwart defense of our clan has pleased him greatly.$B$BYou have earned the Eye of Command.$B$BPresent your insignia, Commander $N.' WHERE `ID` = 7167;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = 'Yup, I be glad you''re here, mon. You helped me before, and now I need your help again. We still lookin'' ta bring in more mithril bars for the war effort; gonna build lots of armor and weapons and things to go squish them bugs at Ahn''Qiraj.$B$BSo if you be a true friend, you bring me back more stacks of mithril bars. I take all you got until we hit our quota. You have some for me now?' WHERE `ID` = 8546;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = 'In fact it does appear that we are in need of even more purple lotus, $c. While my own studies have yet to determine a new useful application for the herb, there are tried and true methodologies yet to be employed.$B$BI need you to once again go out into the field and collect at least twenty purple lotus samples. Return them to me here.' WHERE `ID` = 8583;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = 'It''s true, $c, I still need more heavy leather. The requests from the generals and their quartermasters seem endless. And that''s nothing compared to what the zeppelin masters are asking for!$B$BI need to get my quota collected on the double. $n, bring me more stacks of heavy leather as soon as you can!' WHERE `ID` = 8589;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = '$c, as you can see I still need to gather up more thick leather. Once again I ask your help with this task, and promise that if you complete it, you will be recognized for your efforts.$B$BTime is of the essence! Return to me with the thick leather so that we can finish our preparations and go to war, hero!' WHERE `ID` = 8591;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 68, `EmoteOnIncomplete` = 0,
`CompletionText` = '$gLord:Lady; $N, you have freed us of its grasp.' WHERE `ID` = 8801;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1,
`CompletionText` = 'You are doing the right thing, $c. The Lost Ones have suffered so much already. They shouldn''t have to suffer this further indignity.' WHERE `ID` = 9448;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = 'Don''t worry, $n! Worry never got anyone anywhere!' WHERE `ID` = 10710;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0,
`CompletionText` = 'What? You don''t want to perform the experiment? Don''t fret, $n! I''m behind you all the way!' WHERE `ID` = 10711;

UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 743;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 747;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 748;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 750;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0, `EmoteOnIncomplete` = 0 WHERE `ID` = 751;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 753;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0, `EmoteOnIncomplete` = 0 WHERE `ID` = 756;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 757;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0, `EmoteOnIncomplete` = 0 WHERE `ID` = 759;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 763;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0, `EmoteOnIncomplete` = 0 WHERE `ID` = 765;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 766;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 3, `EmoteOnIncomplete` = 3 WHERE `ID` = 768;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 769;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 771;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 776;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0, `EmoteOnIncomplete` = 0 WHERE `ID` = 780;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 781;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 3, `EmoteOnIncomplete` = 3 WHERE `ID` = 861;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 962;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 1049;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 1102;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 6 WHERE `ID` = 1656;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0, `EmoteOnIncomplete` = 0 WHERE `ID` = 2178;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 3, `EmoteOnIncomplete` = 3 WHERE `ID` = 2440;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 2967;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 2, `EmoteOnIncomplete` = 2 WHERE `ID` = 3091;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 2, `EmoteOnIncomplete` = 2 WHERE `ID` = 3092;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 2, `EmoteOnIncomplete` = 2 WHERE `ID` = 3093;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 2, `EmoteOnIncomplete` = 2 WHERE `ID` = 3094;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0, `EmoteOnIncomplete` = 18 WHERE `ID` = 3368;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0, `EmoteOnIncomplete` = 0 WHERE `ID` = 3373;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 3376;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0, `EmoteOnIncomplete` = 6 WHERE `ID` = 3385;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0, `EmoteOnIncomplete` = 6 WHERE `ID` = 3442;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0, `EmoteOnIncomplete` = 6 WHERE `ID` = 3909;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0, `EmoteOnIncomplete` = 1 WHERE `ID` = 4041;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0, `EmoteOnIncomplete` = 1 WHERE `ID` = 4143;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 5, `EmoteOnIncomplete` = 1 WHERE `ID` = 4144;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0, `EmoteOnIncomplete` = 0 WHERE `ID` = 4449;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 0 WHERE `ID` = 5085;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 5724;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 6061;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 6087;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 6088;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 6361;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 6362;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 3, `EmoteOnIncomplete` = 3 WHERE `ID` = 6363;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 6364;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0, `EmoteOnIncomplete` = 1 WHERE `ID` = 8242;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 8467;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 0 WHERE `ID` = 9140;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 9280;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 9293;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 9303;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 9305;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 9409;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 9451;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 9452;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 9453;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 9454;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 9455;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 9463;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 9473;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 9506;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 9512;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 9514;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 25, `EmoteOnIncomplete` = 25 WHERE `ID` = 9523;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 9527;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 9530;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 9531;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 9537;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0, `EmoteOnIncomplete` = 0 WHERE `ID` = 9560;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0, `EmoteOnIncomplete` = 0 WHERE `ID` = 9562;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 0 WHERE `ID` = 9564;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 9582;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 9591;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 9592;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 9593;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 5, `EmoteOnIncomplete` = 5 WHERE `ID` = 9602;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 9616;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 9798;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 9799;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 1 WHERE `ID` = 10324;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0 WHERE `ID` = 12171;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0 WHERE `ID` = 13140;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0 WHERE `ID` = 13662;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0 WHERE `ID` = 13718;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 2, `EmoteOnIncomplete` = 0 WHERE `ID` = 13836;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0 WHERE `ID` = 14017;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0 WHERE `ID` = 14112;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 0 WHERE `ID` = 14409;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 11, `EmoteOnIncomplete` = 0 WHERE `ID` = 24431;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1, `EmoteOnIncomplete` = 0 WHERE `ID` = 7702;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 6, `EmoteOnIncomplete` = 6 WHERE `ID` = 24857;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
