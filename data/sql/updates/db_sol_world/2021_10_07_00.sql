-- DB update 2021_10_06_07 -> 2021_10_07_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_06_07';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_06_07 2021_10_07_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1633611170733921592'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1633611170733921592');

DELETE FROM `quest_details` WHERE `ID` IN (8275,8276,8277,8278,8286,8288,8301,8302,8303,8305,8710,8702,9248,8694,9023,8282,8283,8318,8361,8320,8321,8331,8332,8349,8348,8343,8341,8351,8352,8507,8731,8557,8689,8690,8691,8692,8693,8695,8696,8556,8697,8698,8699,8700,8701,8703,8704,8558,8705,8706,8707,8708,8709,8711,8712,8279,8304,8306,8800,8548,8572,8573,8574,8309,8310,8314,9415,9416,9419,9422,8315,8307,8317,7786);
INSERT INTO `quest_details` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `VerifiedBuild`)
VALUES
(8275,5,0,0,0,0,0,0,0,0),
(8276,5,0,0,0,0,0,0,0,0),
(8277,2,1,0,0,0,0,0,0,0),
(8278,6,0,0,0,0,0,0,0,0),
(8286,1,1,1,0,0,0,0,0,0),
(8288,5,25,1,1,0,0,0,0,0),
(8301,1,1,1,0,0,0,0,0,0),
(8302,25,5,0,0,0,0,0,0,0),
(8303,2,1,0,0,0,0,0,0,0),
(8305,1,0,0,0,0,0,0,0,0),
(8710,1,1,25,0,0,0,0,0,0),
(8702,1,1,1,0,0,0,0,0,0),
(9248,2,0,0,0,0,0,0,0,0),
(8694,1,1,2,0,0,0,0,0,0),
(9023,1,1,1,1,0,0,0,0,0),
(8318,1,0,0,0,0,0,0,0,0),
(8361,1,0,0,0,0,0,0,0,0),
(8320,1,0,0,0,0,0,0,0,0),
(8321,1,0,0,0,0,0,0,0,0),
(8331,1,0,0,0,0,0,0,0,0),
(8332,1,0,0,0,0,0,0,0,0),
(8349,1,2,0,0,0,0,0,0,0),
(8348,1,0,0,0,0,0,0,0,0),
(8343,1,0,0,0,0,0,0,0,0),
(8341,1,0,0,0,0,0,0,0,0),
(8351,1,0,0,0,0,0,0,0,0),
(8352,1,0,0,0,0,0,0,0,0),
(8507,3,1,0,0,0,0,0,0,0),
(8731,3,1,0,0,0,0,0,0,0),
(8557,1,1,2,0,0,0,0,0,0),
(8689,1,1,2,0,0,0,0,0,0),
(8690,1,1,2,0,0,0,0,0,0),
(8691,1,1,2,0,0,0,0,0,0),
(8692,1,1,2,0,0,0,0,0,0),
(8693,1,1,2,0,0,0,0,0,0),
(8695,1,1,2,0,0,0,0,0,0),
(8696,1,1,2,0,0,0,0,0,0),
(8556,1,1,1,0,0,0,0,0,0),
(8697,1,1,1,0,0,0,0,0,0),
(8698,1,1,1,0,0,0,0,0,0),
(8699,1,1,1,0,0,0,0,0,0),
(8700,1,1,1,0,0,0,0,0,0),
(8701,1,1,1,0,0,0,0,0,0),
(8703,1,1,1,0,0,0,0,0,0),
(8704,1,1,1,0,0,0,0,0,0),
(8558,1,1,25,0,0,0,0,0,0),
(8705,1,1,25,0,0,0,0,0,0),
(8706,1,1,25,0,0,0,0,0,0),
(8707,1,1,25,0,0,0,0,0,0),
(8708,1,1,25,0,0,0,0,0,0),
(8709,1,1,25,0,0,0,0,0,0),
(8711,1,1,25,0,0,0,0,0,0),
(8712,1,1,25,0,0,0,0,0,0),
(8304,1,1,1,6,0,0,0,0,0),
(8306,1,1,1,0,0,0,0,0,0),
(8800,1,0,0,0,0,0,0,0,0),
(8548,1,1,0,0,0,0,0,0,0),
(8572,1,1,0,0,0,0,0,0,0),
(8573,1,1,0,0,0,0,0,0,0),
(8574,1,1,0,0,0,0,0,0,0),
(8309,1,1,1,1,0,0,0,0,0),
(8310,1,1,1,0,0,0,0,0,0),
(8314,5,1,1,1,0,0,0,0,0),
(9415,6,5,25,0,0,0,0,0,0),
(9416,25,1,1,0,0,0,0,0,0),
(9419,1,1,1,0,0,0,0,0,0),
(9422,1,1,1,0,0,0,0,0,0),
(8315,1,1,1,0,0,0,0,0,0),
(8307,1,1,1,0,0,0,0,0,0),
(8317,1,1,0,0,0,0,0,0,0),
(7786,1,1,0,0,0,0,0,0,0);

UPDATE `quest_request_items` SET `EmoteOnIncomplete` = 5 WHERE `ID` IN (8280,8281);
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0 WHERE `ID` IN (8277,8278,8507,8284,8285,8287,8323,8501,8502,8773,8539,8772,8770,8771,8774,8777,8776,8775,8687,8778,8785,8737,8537,8536,8535,8538,8498,8739,8738,8534,8740,8308);
UPDATE `quest_request_items` SET `EmoteOnIncomplete` = 1, `CompletionText` = 'There is much history rooted in their distrust of the mortal races; but alas, such is a tale better left for the Brood to tell when the time is right.' WHERE `ID` = 8301;
UPDATE `quest_request_items` SET `EmoteOnIncomplete` = 1, `CompletionText` = 'Perhaps one day the whole of Cenarion Hold will be working under your command.' WHERE `ID` = 8302;
UPDATE `quest_request_items` SET `EmoteOnIncomplete` = 1, `EmoteOnComplete` = 1 WHERE `ID` IN (8288,8319,8362,8333,8363,8364,8309,9419,9422);
UPDATE `quest_request_items` SET `EmoteOnIncomplete` = 6, `EmoteOnComplete` = 6 WHERE `ID` IN (8710,8702,8694,8318,8361,8321,8332,8348,8341,8352,8508,8732,8557,8689,8690,8691,8692,8693,8695,8696,8556,8697,8698,8699,8700,8701,8703,8704,8558,8705,8706,8707,8708,8709,8711,8712,8314,8313,8317,7785);
UPDATE `quest_request_items` SET `EmoteOnIncomplete` = 25, `EmoteOnComplete` = 25 WHERE `ID` IN (9023,8283,8310,8315);
UPDATE `quest_request_items` SET `EmoteOnComplete` = 0, `CompletionText` = 'You have something for me, $n?' WHERE `ID` IN (8782,8808,8496,8810,8783,8809,8829,8497,8804,8540,8805,8541,8806,8786,8781,8780,8787,8779,8807);
UPDATE `quest_request_items` SET `EmoteOnIncomplete` = 5, `EmoteOnComplete` = 5 WHERE `ID` = 7786;
UPDATE `quest_request_items` SET `EmoteOnIncomplete` = 6, `EmoteOnComplete` = 6, `CompletionText` = 'Fandu-dath-belore? Oh, pardon me, $N. I did not recognize you. Have you the scepter?' WHERE `ID` = 9248;

UPDATE `quest_offer_reward` SET `Emote1` = 1 WHERE `ID` IN (8277,8286,8303,8702,8320,8321,8332,8349,8343,8341,8556,8697,8698,8699,8700,8701,8703,8704,8498,8308);
UPDATE `quest_offer_reward` SET `Emote1` = 2 WHERE `ID` IN (8275,8276,9023,8318,8331,8333,8342,8548,8572,8573,8574,9338,8782,8808,8496,8810,8783,8809,8829,8497,8804,8779,8739,8738,8534,7785,8280);
UPDATE `quest_offer_reward` SET `Emote1` = 4 WHERE `ID` IN (8278,8361,8348,8352,8778,8785,8281);
UPDATE `quest_offer_reward` SET `Emote1` = 21 WHERE `ID` IN (8302,8362,8363,8364,8501,8502,8773,8539,8772,8770,8771,8774,8777,8776,8775,8687,8737,8537,8536,8535,8740,8317);
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1 WHERE `ID` IN (8507,8731,8306,8555,8310,9415,8313);
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 25 WHERE `ID` IN (8508,8732,9416);
UPDATE `quest_offer_reward` SET `Emote1` = 6, `RewardText` = 'Could you be the first to earn favor among the Bronze Flight in a thousand years?' WHERE `ID` = 8288;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `RewardText` = 'You are not alone, hero. I will now grant you the ability to deputize others to help you in your quest. If you are to be the champion of your people, you will need assistance in your tasks and duties.' WHERE `ID` = 8301;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 66 WHERE `ID` IN (8710,8558,8705,8706,8707,8708,8709,8711,8712,9419,9422);
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 2 WHERE `ID` = 9248;
UPDATE `quest_offer_reward` SET `Emote1` = 273, `Emote2` = 2 WHERE `ID` IN (8694,8557,8689,8690,8691,8692,8693,8695,8696);
UPDATE `quest_offer_reward` SET `Emote1` = 66 WHERE `ID` IN (8283,8540,8805,8541,8806,8786,8781,8780,8787,8538);
UPDATE `quest_offer_reward` SET `Emote1` = 273 WHERE `ID` = 8351;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 6 WHERE `ID` = 8304;
UPDATE `quest_offer_reward` SET `Emote1` = 6 WHERE `ID` = 8800;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 5 WHERE `ID` = 8309;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 1, `Emote3` = 1 WHERE `ID` = 8314;
UPDATE `quest_offer_reward` SET `Emote1` = 5 WHERE `ID` = 8315;
UPDATE `quest_offer_reward` SET `Emote1` = 1, `Emote2` = 25, `Emote3` = 5, `Emote4` = 22 WHERE `ID` = 7786;

DELETE FROM `quest_offer_reward` WHERE `ID` = 8807;
INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`)
VALUES
(8807,2,0,0,0,0,0,0,0,'Why, yes... these will be of tremendous aid!  These materials are awfully hard to come by in the desert, $n.  Thank you.',0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
