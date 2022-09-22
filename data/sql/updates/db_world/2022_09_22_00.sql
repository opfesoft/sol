-- Arcane Barrage, Arcane Blast, Chaos Bolt, Firebolt, Incinerate, Lightning Bolt, Smite
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.125 WHERE `entry` = 403;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.317 WHERE `entry` = 529;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.561 WHERE `entry` = 548;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.123 WHERE `entry` = 585;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.271 WHERE `entry` = 591;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.554 WHERE `entry` = 598;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.714 WHERE `entry` IN (44425,44780,44781,30451,42894,42896,42897,50796,59170,59171,59172,3110,7799,7800,7801,7802,11762,11763,27267,47964,29722,32231,47837,47838,915,943,6041,10391,10392,15207,15208,25448,25449,49237,49238,984,1004,6060,10933,10934,25363,25364,48122,48123);

-- Arcane Explosion, Cone of Cold, Death Coil, Fire Nova, Flame Shock, Shadow Cleave
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.166 WHERE `entry` = 1449;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.15 WHERE `entry` = 8349;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.134 WHERE `entry` = 8050;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.198 WHERE `entry` = 8052;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.214 WHERE `entry` IN (8437,8438,8439,10201,10202,27080,27082,42920,42921,120,8492,10159,10160,10161,27087,42930,42931,6789,17925,17926,27223,47859,47860,8502,8503,11306,11307,25535,25537,61650,61654,8053,10447,10448,29228,25457,49232,49233,50581);

-- Arcane Missile, Arcane Missiles, Mind Sear, Rain of Fire, Seed of Corruption
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.157 WHERE `entry` = 7268;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.243 WHERE `entry` = 7269;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.286 WHERE `entry` IN (7270,8419,8418,10273,10274,25346,27076,38700,38703,42844,42845,49821,53022,42223,42227,42224,42225,42226,42218,47817,47818,27285,47833,47834);

-- Attack
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.104 WHERE `entry` = 3606;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.167 WHERE `entry` IN (6350,6351,6352,10435,10436,25530,58700,58701,58702);

-- Avenger's Shield
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.091, `ap_bonus` = 0.091 WHERE `entry` IN (31935,32699,32700,48826,48827);

-- Binding Heal, Desperate Prayer, Flash Heal, Holy Shock, Lesser Healing Wave
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.807 WHERE `entry` IN (32546,48119,48120,19236,19238,19240,19241,19242,19243,25437,48172,48173,2061,9472,9473,9474,10915,10916,10917,25233,25235,48070,48071,25914,25913,25903,27175,33074,48820,48821,8004,8008,8010,10466,10467,10468,25420,49275,49276);

-- Blast Wave, Dragon's Breath, Frost Nova, Shadowfury, Typhoon
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.018 WHERE `entry` = 122;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.043 WHERE `entry` IN (865,6131,10230);
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.193 WHERE `entry` IN (11113,13018,13019,13020,13021,27133,33933,42944,42945,31661,33041,33042,33043,42949,42950,27088,42917,30283,30413,30414,47846,47847,61391,61390,61388,61387,53227);

-- Blizzard, Ice Lance
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.143 WHERE `entry` IN (42208,42209,42210,42211,42212,42213,42198,42937,42938,30455,42913,42914);

-- Chain Heal
UPDATE `spell_bonus_data` SET `direct_bonus` = 1.343 WHERE `entry` IN (1064,10622,10623,25422,25423,55458,55459);

-- Chain Lightning, Lava Burst, Wrath
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.123 WHERE `entry` = 5176;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.231 WHERE `entry` = 5177;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.443 WHERE `entry` = 5178;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.571 WHERE `entry` IN (421,930,2860,10605,25439,25442,49270,49271,51505,60043,5179,5180,6780,8905,9912,26984,26985,48459,48461);

-- Circle of Healing
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.402 WHERE `entry` IN (34861,34863,34864,34865,34866,48088,48089);

-- Corruption
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.0624 WHERE `entry` = 172;

-- Curse of Agony
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.0548 WHERE `entry` = 980;
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.0923 WHERE `entry` = 1014;

-- Devouring Plague
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.185 WHERE `entry` IN (2944,19276,19277,19278,19279,19280,25467,48299,48300);

-- Divine Hymn
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.564 WHERE `entry` = 64844;

-- Drain Life
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.111 WHERE `entry` = 689;

-- Drain Soul
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.268 WHERE `entry` = 1120;

-- Earthliving
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.171 WHERE `entry` IN (51945,51990,51997,51998,51999,52000);

-- Earth Shock, Frost Shock
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.154 WHERE `entry` = 8042;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.212 WHERE `entry` = 8044;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.299 WHERE `entry` = 8045;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.386 WHERE `entry` IN (8046,10412,10413,10414,25454,49230,49231,8056,8058,10472,10473,25464,49235,49236);

-- Entangling Roots
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.055 WHERE `entry` IN (19975,339);
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.093 WHERE `entry` IN (1062,19974);
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.1 WHERE `entry` IN (19973,5195,19972,5196,19971,9852,19970,9853,26989,27010,53308,53313);

-- Fireball
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.123 WHERE `entry` = 133;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.271 WHERE `entry` = 143;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.5 WHERE `entry` = 145;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.793 WHERE `entry` = 3140;

-- Fire Blast, Holy Shock, Mind Blast, Scorch, Searing Pain, Shadowburn, Shadow Word: Death
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.15 WHERE `entry` = 59637;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.204 WHERE `entry` = 2136;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.332 WHERE `entry` = 2137;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.268 WHERE `entry` = 8092;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.364 WHERE `entry` = 8102;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.396 WHERE `entry` = 5676;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.429 WHERE `entry` IN (57984,2138,8412,8413,10197,10199,27078,27079,42872,42873,25912,25911,25902,27176,33073,48822,48823,8103,8104,8105,8106,10945,10946,10947,25372,25375,48126,48127,2948,8444,8445,8446,10205,10206,10207,27073,27074,42858,42859,17919,17920,17921,17922,17923,27210,30459,47814,47815,17877,18867,18868,18869,18870,18871,27263,30546,47826,47827,32379,32996,48157,48158);

-- Fire Shield
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.032 WHERE `entry` = 13376;

-- Flamestrike
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.243 WHERE `entry` IN (2120,2121,8422,8423,10215,10216,27086,42925,42926);

-- Flash of Light
UPDATE `spell_bonus_data` SET `direct_bonus` = 1.009 WHERE `entry` IN (19750,19939,19940,19941,19942,19943,27137,48784,48785);

-- Frostbolt
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.172 WHERE `entry` = 116;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.283 WHERE `entry` = 205;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.488 WHERE `entry` = 837;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.743 WHERE `entry` = 7322;

-- Frostfire Bolt, Shadow Bolt
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.14 WHERE `entry` = 686;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.299 WHERE `entry` = 695;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.56 WHERE `entry` = 705;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.857 WHERE `entry` IN (44614,47610,1088,1106,7641,11659,11660,11661,25307,27209,47808,47809);

-- Gargoyle Strike
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.453 WHERE `entry` = 51963;

-- Greater Heal, Heal, Healing Touch, Healing Wave
UPDATE `spell_bonus_data` SET `direct_bonus` = 1.371 WHERE `entry` = 2054;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.231 WHERE `entry` IN (5185,331);
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.59 WHERE `entry` = 5186;
UPDATE `spell_bonus_data` SET `direct_bonus` = 1.042 WHERE `entry` = 5187;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.51 WHERE `entry` = 332;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.94 WHERE `entry` = 547;
UPDATE `spell_bonus_data` SET `direct_bonus` = 1.491 WHERE `entry` = 913;
UPDATE `spell_bonus_data` SET `direct_bonus` = 1.611 WHERE `entry` IN (2060,10963,10964,10965,25314,25210,25213,48062,48063,2055,6063,6064,5188,5189,6778,8903,9758,9888,9889,25297,26978,26979,48377,48378,939,959,8005,10395,10396,25357,25391,25396,49272,49273);

-- Health Funnel
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.376 WHERE `entry` = 755;
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.538 WHERE `entry` IN (3698,3699,3700,11693,11694,11695,27259,47856);

-- Hellfire
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.095 WHERE `entry` IN (1949,11683,11684,27213,47823);

-- Holy Fire
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.571, `dot_bonus` = 0.024 WHERE `entry` IN (14914,15262,15263,15264,15265,15266,15267,15261,25384,48134,48135);

-- Holy Light
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.481 WHERE `entry` = 635;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.796 WHERE `entry` = 639;
UPDATE `spell_bonus_data` SET `direct_bonus` = 1.3 WHERE `entry` = 647;
UPDATE `spell_bonus_data` SET `direct_bonus` = 1.679 WHERE `entry` IN (1026,1042,3472,10328,10329,25292,27135,27136,48781,48782);

-- Holy Nova
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.161 WHERE `entry` IN (15237,15430,15431,27799,27800,27801,25331,48077,48078);
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.303 WHERE `entry` IN (23455,23458,23459,27803,27804,27805,25329,48075,48076);

-- Holy Shield
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.117, `ap_bonus` = 0.0732 WHERE `entry` IN (20925,20927,20928,27179,48951,48952);

-- Hurricane
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.129 WHERE `entry` IN (42231,42232,42233,42230,48466);

-- Immolate
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.058, `dot_bonus` = 0.058 WHERE `entry` = 348;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.125, `dot_bonus` = 0.125 WHERE `entry` = 707;

-- Lesser Heal
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.231 WHERE `entry` = 2050;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.431 WHERE `entry` = 2052;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.839 WHERE `entry` = 2053;

-- Lifebloom
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.0952 WHERE `entry` IN (33763,48450,48451);

-- Lightning Shield
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.147 WHERE `entry` = 26364;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.227 WHERE `entry` = 26365;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.267 WHERE `entry` IN (26366,26367,26369,26370,26363,26371,26372,49278,49279);

-- Living Bomb
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.4 WHERE `entry` IN (44461,55361,55362);

-- Moonfire
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.06, `dot_bonus` = 0.052 WHERE `entry` = 8921;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.094, `dot_bonus` = 0.081 WHERE `entry` = 8924;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.128, `dot_bonus` = 0.111 WHERE `entry` = 8925;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.15, `dot_bonus` = 0.13 WHERE `entry` IN (8926,8927,8928,8929,9833,9834,9835,26987,26988,48462,48463);

-- Nourish
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.672 WHERE `entry` = 50464;

-- Penance
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.229 WHERE `entry` IN (47666,52998,52999,53000);
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.537 WHERE `entry` IN (47750,52983,52984,52985);

-- Regrowth
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.376, `dot_bonus` = 0.132 WHERE `entry` = 8936;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.496, `dot_bonus` = 0.175 WHERE `entry` = 8938;
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.538, `dot_bonus` = 0.188 WHERE `entry` IN (8939,8940,8941,9750,9856,9857,9858,26980,48442,48443);

-- Rejuvenation
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.15 WHERE `entry` = 774;
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.235 WHERE `entry` = 1058;
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.32 WHERE `entry` = 1430;

-- Renew
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.207 WHERE `entry` = 139;
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.291 WHERE `entry` = 6074;

-- Retribution Aura
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.033 WHERE `entry` = 7294;

-- Riptide
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.402 WHERE `entry` IN (61295,61299,61300,61301);

-- Shadowflame
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.107 WHERE `entry` IN (47897,61290);

-- Tranquility
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.538 WHERE `entry` IN (44203,44205,44206,44207,44208,48444,48445);

-- Waterbolt
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.833 WHERE `entry` IN (31707,72898);

-- Wild Growth
UPDATE `spell_bonus_data` SET `dot_bonus` = 0.115 WHERE `entry` IN (48438,53248,53249,53251);
