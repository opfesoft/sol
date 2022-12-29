UPDATE `quest_template_locale` SET `Objectives` = REGEXP_REPLACE(`Objectives`, ' 3 ', ' 4 ') WHERE `ID` = 456 AND `Objectives` LIKE '% 3 %';
