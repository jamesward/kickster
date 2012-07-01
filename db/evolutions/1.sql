# Initial DB Setup

# --- !Ups

CREATE TABLE `Matches` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `scoreTeam1` int(11) NOT NULL,
  `scoreTeam2` int(11) NOT NULL,
  `team1_id` bigint(20) DEFAULT NULL,
  `team2_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Player` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Team` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Team_Player` (
  `teams_id` bigint(20) NOT NULL,
  `players_id` bigint(20) NOT NULL,
  PRIMARY KEY (`teams_id`,`players_id`)
);

ALTER TABLE `Matches`
  ADD CONSTRAINT `FK95572113EC53FB47` FOREIGN KEY (`team1_id`) REFERENCES `Team` (`id`),
  ADD CONSTRAINT `FK95572113EC546FA6` FOREIGN KEY (`team2_id`) REFERENCES `Team` (`id`);

ALTER TABLE `Team_Player`
  ADD CONSTRAINT `FKD4E5F703EC71FBC5` FOREIGN KEY (`teams_id`) REFERENCES `Team` (`id`),
  ADD CONSTRAINT `FKD4E5F703322211CD` FOREIGN KEY (`players_id`) REFERENCES `Player` (`id`);

# --- !Downs

ALTER TABLE `Matches`
  DROP FOREIGN KEY `FK95572113EC53FB47`,
  DROP FOREIGN KEY `FK95572113EC546FA6`;

ALTER TABLE `Team_Player`
  DROP FOREIGN KEY `FKD4E5F703EC71FBC5`,
  DROP FOREIGN KEY `FKD4E5F703322211CD`;

DROP TABLE `Matches`;

DROP TABLE `Player`;

DROP TABLE `Team`;

DROP TABLE `Team_Player`;