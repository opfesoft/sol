DELETE FROM `quest_request_items` WHERE `ID` IN (124, 257, 258, 289, 511);
INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `CompletionText`, `VerifiedBuild`) VALUES
(124, 1, 0, 'My horses still seem skittish, and I still hear that cursed wolf cry at night. Please, $N, do something about those Gnolls!', 0),
(257, 1, 1, 'No luck? Don\'t feel too bad, $ner...$B$BNot everyone can be me.', 0),
(258, 1, 1, 'It\'s only natural to feel sorry for yourself when shown up by someone so new to this world. You shouldn\'t feel bad, $nah.$B$BHm? Did I get your name wrong?', 0),
(289, 1, 0, 'In my dreams, I can sometimes hear the doomed moans of my brethren! Please, good $gsir:lady;, free them from the bonds and quiet their cries.', 0),
(511, 6, 0, 'Yes, $Gsir:ma\'am;? Do you have some business with me?', 0);
