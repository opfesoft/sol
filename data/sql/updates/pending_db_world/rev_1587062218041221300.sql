INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1587062218041221300');

DELETE FROM `acore_string` WHERE `entry` IN (30081,30082);
INSERT INTO `acore_string` (`entry`, `content_default`) VALUES
(30081, '%s does not have itemID %i, thus cannot be removed.'),
(30082, '%s does have less than the specified amount of itemID %i, removing all items.');

UPDATE `command` SET `help` = 'Syntax: .additem #itemid/[#itemname]/#shift-click-item-link #itemcount\r\n\r\nAdds the specified number of items of id #itemid (or exact (!) name $itemname in brackets, or link created by shift-click at item in inventory or recipe) to your or selected character inventory. If #itemcount is omitted, only one item will be added. If #itemCount is negative the specified number of items is removed.' WHERE `name` = 'additem';
