DELETE FROM `quest_greeting` WHERE `Type` = 0 AND `ID` IN (661,1377,2277,3050,4047,5393,5637,5888,6169,6868,6946,7802,8256,8379,10428);
DELETE FROM `quest_greeting` WHERE `Type` = 1 AND `ID` IN (1738,138492);
INSERT INTO `quest_greeting` (`ID`, `Type`, `GreetEmoteType`, `GreetEmoteDelay`, `Greeting`, `VerifiedBuild`)
VALUES
(1738,1,0,0,'This collection of scrolls contains various logistic and strategic information, as well as coded correspondences.',0),
(138492,1,0,0,'These shards glint with an unnatural sheen.  It is clear that they hide a deep power within.',0),

(661,0,0,0,'Greetings. What business have you with the Carevin family? Do you seek to assist the Carevins in their battle against the undead?',0),
(1377,0,0,0,'Driving a Steam Tank isn''t for everyone.  It takes an iron grip and nerves of steel...lucky I have both!  How about you?  How''s your mettle?  Want to prove it to me?',0),
(2277,0,0,0,'I have a great deal of work to do.  Are you here to aid me with my research?',0),
(3050,0,0,0,'The tauren are sons and daughters of the Earthmother, and we show respect to all her children.  Even the beasts we slay are cherished, as their bodies give nourishment and their skins provide warmth.',0),
(4047,0,0,0,'The spirits of nature are powers to respect.  They offer great aid to the worthy, and mete out swift death to the foolish.',0),
(5393,0,1,0,'Nethergarde keep always needs more supplies - supplies to help our mages in their research, and supplies to keep our defenders in top fighting shape.',0),
(5637,0,2,0,'Pleased to meetcha, $c. Me name''s Roetten. I lead Reclaimers Incorporated.$B$BMe guild and I specialize in aquiring lost goods. We usually hire brave adventurers and send them off to finish tasks for those who aren''t able, or don''t have the time.',0),
(5888,0,1,0,'The earth calls to you, $N. Go to it, and know that your brethren are proud of you and all you will accomplish.',0),
(6169,0,5,0,'I''m on quest.  A quest!  A quest for new alloys and harder metals for the greatest invention of all!!',0),
(6868,0,6,0,'Whatcha need, $c?  I trust that you''ve come out to this wasteland for a reason other than idle chit chat.',0),
(6946,0,0,0,'Mathias found me left for dead by the Venture Co. in the Barrens. Had it not been for him, I''d have been prowler fodder. ',0),
(7802,0,0,0,'So few make it this far, even fewer make it past. Do not become a statistic, $N.',0),
(8256,0,1,0,'Greetings, $N.',0),
(8379,0,0,0,'If you are here to beg for the privilege of working for me, then your company is quite welcome. Otherwise, there is little chance you are of any use to me.',0),
(10428,0,1,0,'Whitereach Post started off as a small hunting camp... Now, everyone wants to set up shop and call this home.$B$B<Motega shrugs his shoulder>',0);

UPDATE `quest_greeting` SET `Greeting` = 'Hey there, friend.  My name''s Remy.  I''m from Redridge to the east, and came here looking for business, looking for business.  You got any...got any??' WHERE `ID` = 241 AND `Type` = 0;
UPDATE `quest_greeting` SET `Greeting` = 'Hello, citizen.  You look like a $gman:woman; with a purpose - do you have business with the Stormwind Army?' WHERE `ID` = 261 AND `Type` = 0;
UPDATE `quest_greeting` SET `Greeting` = 'At ease, $c.  If you are just passing though I suggest you stick to the roads and only travel by day. If your business is here in Darkshire, consider lending your abilities to the Night Watch.  Our skill is unquestionable but our numbers are small.' WHERE `ID` = 264 AND `Type` = 0;
UPDATE `quest_greeting` SET `Greeting` = 'Who is this $c who goes before the Court of Lakshire in the Kingdom of Stormwind?  State your business within this township, $R.  The orc threat to the Kingdom is far too great to squander time in idle conversation.' WHERE `ID` = 344 AND `Type` = 0;
UPDATE `quest_greeting` SET `Greeting` = 'Greetings, $glad:lass;. I''m Grelin Whitebeard. I''m here to examine the threat posed by the growing numbers of trolls in Coldridge Valley. What have I found? It''s a bit troubling...' WHERE `ID` = 786 AND `Type` = 0;
UPDATE `quest_greeting` SET `Greeting` = 'Hello there, $c.  Normally I''d be out on the beat looking after the folk of Stormwind, but a lot of the Stormwind guards are fighting in other lands.  So here I am, deputized and offering bounties when I''d rather be on patrol...' WHERE `ID` = 823 AND `Type` = 0;
UPDATE `quest_greeting` SET `Greeting` = 'When I was first offered the title of Southshore Magistrate I was elated to have earned such a commission so early in my career.$B$BBut now that I''m here, I wonder if I''d have been better off shuffling papers in Stormwind.' WHERE `ID` = 2276 AND `Type` = 0;
UPDATE `quest_greeting` SET `Greeting` = 'We at Refuge Pointe hold one of the few remaining patches of Stromgarde territory in the Arathi Highlands.  And we''re losing ground...$B$BIf you have words for me, then I hope they are good tidings.' WHERE `ID` = 2700 AND `Type` = 0;
UPDATE `quest_greeting` SET `Greeting` = 'Thanks to the Warchief, even here in the ruins of our former prison, some hope remains, and the Horde rises anew.' WHERE `ID` = 2706 AND `Type` = 0;
UPDATE `quest_greeting` SET `Greeting` = 'This wooden board holds roughly-made wanted posters.' WHERE `ID` = 2713 AND `Type` = 1;
UPDATE `quest_greeting` SET `Greeting` = 'You must be hard up to be wandering these Badlands, $c.  Hard up like me.$B$BOr maybe you''re here because you''re crazy.  Crazy, like me.' WHERE `ID` = 2817 AND `Type` = 0;
UPDATE `quest_greeting` SET `Greeting` = 'The land, the water, and the sky are all as one. It is your eyes that deceive you with such separation. The Earthmother is all those things and more.' WHERE `ID` = 3338 AND `Type` = 0;
UPDATE `quest_greeting` SET `Greeting` = 'Be careful where you put that foot of yours, $gsir:ma''am;.  We''re not all blessed with the lofty height of a $r.' WHERE `ID` = 4453 AND `Type` = 0;
UPDATE `quest_greeting` SET `Greeting` = 'The main threat Thrall wishes dealt with is the Burning Blade--members of the Horde that have given their loyalty to the demons. They seek to practice their dark magic and care little for Thrall''s vision of the Horde''s future here in Kalimdor.' WHERE `ID` = 5641 AND `Type` = 0;
