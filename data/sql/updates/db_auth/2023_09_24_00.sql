ALTER TABLE `account` MODIFY `joindate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `account` MODIFY `last_login` DATETIME NULL DEFAULT NULL;
ALTER TABLE `logs_ip_actions` MODIFY `time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp';