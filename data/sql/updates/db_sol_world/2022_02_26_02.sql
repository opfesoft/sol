-- DB update 2022_02_26_01 -> 2022_02_26_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_26_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_26_01 2022_02_26_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1645916074978755494'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1645916074978755494');

DELETE FROM `quest_offer_reward` WHERE `ID` IN (5636,5638,5640,1661,5677,5678);
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`)
VALUES
(5636,0,0,0,0,0,0,0,0,'I''m glad you''ve arrived, $N. There are many things we will have to discuss, but more importantly is your training in the ways of the Light.$B$BThere are lessons all servants of the Light must learn. If you are ready, we''ll begin discussing some of those now.',0),
(5638,0,0,0,0,0,0,0,0,'I''m glad you''ve arrived, $N. There are many things we will have to discuss, but more importantly is your training in the ways of the Light.$B$BThere are lessons all servants of the Light must learn. If you are ready, we''ll begin discussing some of those now.',0),
(5640,0,0,0,0,0,0,0,0,'I''m glad you''ve arrived, $N. There are many things we will have to discuss, but more importantly is your training in the ways of the Light.$B$BThere are lessons all servants of the Light must learn. If you are ready, we''ll begin discussing some of those now.',0),
(1661,0,0,0,0,0,0,0,0,'Congratulations, and may the Light protect you.',0),
(5677,0,0,0,0,0,0,0,0,'Ah, you have wonderful timing, $N. I was beginning to wonder if all of my messengers had been successful. I''m glad to see they were, otherwise I would wager you''d still be out in the world learning more about all the threats that exist against our people.$B$BAre you ready? Ready for more training I mean. You''re growing in power more quickly, and I feel you are ready to learn more about our faith.',0),
(5678,0,0,0,0,0,0,0,0,'Ah, you have wonderful timing, $N. I was beginning to wonder if all of my messengers had been successful. I''m glad to see they were, otherwise I would wager you''d still be out in the world learning more about all the threats that exist against our people.$B$BAre you ready? Ready for more training I mean. You''re growing in power more quickly, and I feel you are ready to learn more about our faith.',0);

UPDATE `quest_offer_reward` SET `Emote1` = 21, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0,
`RewardText` = 'You are quite the bounty hunter, $C. Well done.' WHERE `ID` = 567;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0,
`RewardText` = 'Grenka was powerful, even by $r standards. You should be proud of your accomplishment this day.$b$bDuring your test of faith you displayed strength of spirit, and now you have shown endurance in battle by taking on the Roguefeather harpies, but the time has come for a new test.' WHERE `ID` = 1150;
UPDATE `quest_offer_reward` SET `Emote1` = 0, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0,
`RewardText` = 'And now you''ve joined our ranks also. Don''t misunderstand, $n. Just because you have access to power that many will be jealous of, it does not mean you will be accepted easily. Thrall allows our kind into Orgrimmar because we are still his fellow kin--he cannot turn his back on us, or we would become as pathetic as the humans who enslaved him. My point is: be careful. You can be powerful, but if you are foolish, then you are as good dead.$B$BIf you need training in spells then return to me.' WHERE `ID` = 3090;
UPDATE `quest_offer_reward` SET `Emote1` = 2, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0,
`RewardText` = 'You''ve done it! Praise be to Elune and whichever powers you worship, $N. You have done an honorable and noble thing this day. I am certain Arko''narin will be pleased that you not only took the time to save her, but to also slay the creature who tortured one of her best friends.$b$bI wish I could do more for you, but please, take this.' WHERE `ID` = 5385;
UPDATE `quest_offer_reward` SET `Emote1` = 0, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0,
`RewardText` = 'You captured a mine! With our own warriors protecting it, it will be much simpler to extract minerals from its depths, or gather supplies that have been cached there.$B$BWell done, $n. The deed you have done is a great boon to our battle efforts.' WHERE `ID` = 7124;
UPDATE `quest_offer_reward` SET `Emote1` = 0, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0,
`RewardText` = 'This new insignia reflects your rank amongst the Frostwolf. Keep it on you at all times.$B$BAnd $C... Die with honor!' WHERE `ID` = 7163;
UPDATE `quest_offer_reward` SET `Emote1` = 0, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0,
`RewardText` = '<Warmaster Laggrond roars.>$B$BThey have already begun telling tales of your deeds, soldier. The Stormpike shakes in fear when your name is uttered. Carry on!' WHERE `ID` = 7165;
UPDATE `quest_offer_reward` SET `Emote1` = 25, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0,
`RewardText` = 'Surely it will be you who carries the Eye of Command!' WHERE `ID` = 7171;
UPDATE `quest_offer_reward` SET `Emote1` = 0, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0,
`RewardText` = 'Aha! The modulators! Superb!$B$BI can''t tell you exactly what we''re building, but these will be invaluable for its construction. I am in your debt, $n, but please, take this Darkmoon Faire ticket as a token of my appreciation.' WHERE `ID` = 7894;
UPDATE `quest_offer_reward` SET `Emote1` = 0, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0,
`RewardText` = '<Sanath sneers at you.>$B$BArchmage Xylem awaits your arrival.' WHERE `ID` = 8250;
UPDATE `quest_offer_reward` SET `Emote1` = 0, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0,
`RewardText` = 'To''gun was here earlier giving me his report. He should have stayed with you to help!$B$BI sent him back out there to assist Grik''tha. I think they make a cute couple.$B$BSo, these are the soul devices that the Shadow Council were using to enhance their summoning power? They look dangerous to me - maybe the Scryers will know what to do with them?$B$BPlease, take one of these as a reward for crippling the Shadow Council''s operation in the labyrinth.' WHERE `ID` = 10091;
UPDATE `quest_offer_reward` SET `Emote1` = 0, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0,
`RewardText` = 'Honor the Stranglethorn Vale flame.' WHERE `ID` = 11832;
UPDATE `quest_offer_reward` SET `Emote1` = 0, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0,
`RewardText` = 'They''re being driven insane? Voices in their heads?$B$BVoices in your head?!$B$BI want you to clear your mind of the taint that has crept into that place, $g boy : girl;.$B$BWe''ll try to get the remainder of them out of there again tomorrow when you''ve had a chance to rest.' WHERE `ID` = 13302;
UPDATE `quest_offer_reward` SET `Emote1` = 0, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0,
`RewardText` = 'You have done the Light a great service by becoming a shining example to those who travel in these dangerous lands and beyond. Please, accept this lesson as a thanks for all you''ve done.' WHERE `ID` = 5634;
UPDATE `quest_offer_reward` SET `Emote1` = 0, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0,
`RewardText` = 'It''s about time this troll got a full night''s rest! The spirit totem will watch over me.$B$BI been a long time collectin'' things, maybe you want somethin'' for all your trouble?' WHERE `ID` = 8413;

UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 745;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 746;
UPDATE `quest_offer_reward` SET `Emote1` = 2, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 747;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 748;
UPDATE `quest_offer_reward` SET `Emote1` = 2, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 750;
UPDATE `quest_offer_reward` SET `Emote1` = 24, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 752;
UPDATE `quest_offer_reward` SET `Emote1` = 6, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 753;
UPDATE `quest_offer_reward` SET `Emote1` = 2, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 754;
UPDATE `quest_offer_reward` SET `Emote1` = 6, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 755;
UPDATE `quest_offer_reward` SET `Emote1` = 2, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 756;
UPDATE `quest_offer_reward` SET `Emote1` = 21, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 757;
UPDATE `quest_offer_reward` SET `Emote1` = 2, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 758;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 759;
UPDATE `quest_offer_reward` SET `Emote1` = 2, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 760;
UPDATE `quest_offer_reward` SET `Emote1` = 2, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 761;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 763;
UPDATE `quest_offer_reward` SET `Emote1` = 2, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 766;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 768;
UPDATE `quest_offer_reward` SET `Emote1` = 2, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 769;
UPDATE `quest_offer_reward` SET `Emote1` = 5, `Emote2` = 2, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 770;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 771;
UPDATE `quest_offer_reward` SET `Emote1` = 2, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 772;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 773;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 775;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 776;
UPDATE `quest_offer_reward` SET `Emote1` = 4, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 780;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 833;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 861;
UPDATE `quest_offer_reward` SET `Emote1` = 4, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 962;
UPDATE `quest_offer_reward` SET `Emote1` = 5, `Emote2` = 2, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 1049;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 1102;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 1, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 1656;
UPDATE `quest_offer_reward` SET `Emote1` = 5, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 2178;
UPDATE `quest_offer_reward` SET `Emote1` = 6, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 2280;
UPDATE `quest_offer_reward` SET `Emote1` = 6, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 2440;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 2965;
UPDATE `quest_offer_reward` SET `Emote1` = 6, `Emote2` = 1, `Emote3` = 1, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 2967;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 1, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 2968;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 3091;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 3092;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 3093;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 3094;
UPDATE `quest_offer_reward` SET `Emote1` = 5, `Emote2` = 1, `Emote3` = 1, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 3385;
UPDATE `quest_offer_reward` SET `Emote1` = 0, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 3441;
UPDATE `quest_offer_reward` SET `Emote1` = 21, `Emote2` = 1, `Emote3` = 1, `Emote4` = 0, `EmoteDelay1` = 1000, `EmoteDelay2` = 500, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 3442;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 3452;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 3453;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 3462;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 3845;
UPDATE `quest_offer_reward` SET `Emote1` = 11, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 4041;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 4143;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 11, `Emote3` = 5, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 200, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 4144;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 6, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 5082;
UPDATE `quest_offer_reward` SET `Emote1` = 5, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 5085;
UPDATE `quest_offer_reward` SET `Emote1` = 2, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 5723;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 5724;
UPDATE `quest_offer_reward` SET `Emote1` = 21, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 6061;
UPDATE `quest_offer_reward` SET `Emote1` = 273, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 6087;
UPDATE `quest_offer_reward` SET `Emote1` = 2, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 6088;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 6361;
UPDATE `quest_offer_reward` SET `Emote1` = 2, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 6362;
UPDATE `quest_offer_reward` SET `Emote1` = 6, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 6363;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 6364;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 6604;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 6642;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 6644;
UPDATE `quest_offer_reward` SET `Emote1` = 0, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 7722;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 21, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 7728;
UPDATE `quest_offer_reward` SET `Emote1` = 0, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 7729;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 7736;
UPDATE `quest_offer_reward` SET `Emote1` = 5, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 7737;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 8241;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 8242;
UPDATE `quest_offer_reward` SET `Emote1` = 4, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 8468;
UPDATE `quest_offer_reward` SET `Emote1` = 15, `Emote2` = 66, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 8885;
UPDATE `quest_offer_reward` SET `Emote1` = 2, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9279;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9280;
UPDATE `quest_offer_reward` SET `Emote1` = 4, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9283;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9287;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9288;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9289;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9290;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9293;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 4, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9294;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9303;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9305;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9311;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 5, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9312;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 2, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9313;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9314;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9371;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9409;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9421;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9451;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9452;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 1, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9453;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9454;
UPDATE `quest_offer_reward` SET `Emote1` = 6, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9455;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9456;
UPDATE `quest_offer_reward` SET `Emote1` = 5, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9463;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9473;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 1, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9506;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 1, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9512;
UPDATE `quest_offer_reward` SET `Emote1` = 4, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9513;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9514;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9515;
UPDATE `quest_offer_reward` SET `Emote1` = 4, `Emote2` = 1, `Emote3` = 1, `Emote4` = 273, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9523;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9530;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 5, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9531;
UPDATE `quest_offer_reward` SET `Emote1` = 5, `Emote2` = 5, `Emote3` = 1, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9537;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 15, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9544;
UPDATE `quest_offer_reward` SET `Emote1` = 4, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9562;
UPDATE `quest_offer_reward` SET `Emote1` = 273, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9582;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9591;
UPDATE `quest_offer_reward` SET `Emote1` = 6, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9592;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9593;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9595;
UPDATE `quest_offer_reward` SET `Emote1` = 6, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9598;
UPDATE `quest_offer_reward` SET `Emote1` = 274, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9600;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9602;
UPDATE `quest_offer_reward` SET `Emote1` = 5, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9616;
UPDATE `quest_offer_reward` SET `Emote1` = 6, `Emote2` = 1, `Emote3` = 1, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9622;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9675;
UPDATE `quest_offer_reward` SET `Emote1` = 5, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9757;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 9799;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 10302;
UPDATE `quest_offer_reward` SET `Emote1` = 6, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 10304;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 10324;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 10350;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 10366;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 10428;
UPDATE `quest_offer_reward` SET `Emote1` = 0, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 11409;
UPDATE `quest_offer_reward` SET `Emote1` = 6, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 150, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 12191;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 1, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 11344;
UPDATE `quest_offer_reward` SET `Emote1` = 6, `Emote2` = 1, `Emote3` = 1, `Emote4` = 15, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 11864;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 1000, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 11919;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 500, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 11936;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 1000, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 11943;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 1000, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 11951;
UPDATE `quest_offer_reward` SET `Emote1` = 5, `Emote2` = 1, `Emote3` = 5, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 12171;
UPDATE `quest_offer_reward` SET `Emote1` = 5, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 13088;
UPDATE `quest_offer_reward` SET `Emote1` = 396, `Emote2` = 396, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 13124;
UPDATE `quest_offer_reward` SET `Emote1` = 396, `Emote2` = 396, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 13126;
UPDATE `quest_offer_reward` SET `Emote1` = 396, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 13127;
UPDATE `quest_offer_reward` SET `Emote1` = 66, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 13592;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 13600;
UPDATE `quest_offer_reward` SET `Emote1` = 5, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 13662;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 13664;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 13665;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 13699;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 13702;
UPDATE `quest_offer_reward` SET `Emote1` = 66, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 13706;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 13718;
UPDATE `quest_offer_reward` SET `Emote1` = 66, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 13789;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 13790;
UPDATE `quest_offer_reward` SET `Emote1` = 2, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 13794;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 13836;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 13847;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 14016;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 14017;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 14096;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 14112;
UPDATE `quest_offer_reward` SET `Emote1` = 396, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 14152;
UPDATE `quest_offer_reward` SET `Emote1` = 0, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 7702;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 0, `Emote3` = 0, `Emote4` = 0, `EmoteDelay1` = 0, `EmoteDelay2` = 0, `EmoteDelay3` = 0, `EmoteDelay4` = 0 WHERE `ID` = 26012;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
