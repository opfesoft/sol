UPDATE `gossip_menu_option_locale` SET `OptionText` = UNHEX(REGEXP_REPLACE(HEX(`OptionText`), 'C383C2(..)', 'C3\\1')) WHERE `Locale` = 'deDE' AND HEX(`OptionText`) LIKE '%C383C2%';
UPDATE `page_text_locale` SET `Text` = UNHEX(REGEXP_REPLACE(HEX(`Text`), 'C383C2(..)', 'C3\\1')) WHERE `locale` = 'deDE' AND HEX(`Text`) LIKE '%C383C2%';
