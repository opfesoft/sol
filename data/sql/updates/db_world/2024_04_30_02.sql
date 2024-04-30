UPDATE `gossip_menu_option_locale` SET `BoxText` = UNHEX(REGEXP_REPLACE(HEX(`BoxText`), 'C383C2(..)', 'C3\\1')) WHERE `Locale` = 'deDE' AND HEX(`BoxText`) LIKE '%C383C2%';
