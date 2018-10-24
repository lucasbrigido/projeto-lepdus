-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 24-Out-2018 às 00:28
-- Versão do servidor: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ojs2`
--
CREATE DATABASE IF NOT EXISTS `ojs2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ojs2`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `access_keys`
--

DROP TABLE IF EXISTS `access_keys`;
CREATE TABLE IF NOT EXISTS `access_keys` (
  `access_key_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime NOT NULL,
  PRIMARY KEY (`access_key_id`),
  KEY `access_keys_hash` (`key_hash`,`user_id`,`context`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `announcements`
--

DROP TABLE IF EXISTS `announcements`;
CREATE TABLE IF NOT EXISTS `announcements` (
  `announcement_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` datetime DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `announcement_settings`
--

DROP TABLE IF EXISTS `announcement_settings`;
CREATE TABLE IF NOT EXISTS `announcement_settings` (
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `announcement_types`
--

DROP TABLE IF EXISTS `announcement_types`;
CREATE TABLE IF NOT EXISTS `announcement_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `announcement_type_settings`
--

DROP TABLE IF EXISTS `announcement_type_settings`;
CREATE TABLE IF NOT EXISTS `announcement_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `author_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `primary_contact` tinyint(4) NOT NULL DEFAULT '0',
  `seq` double NOT NULL DEFAULT '0',
  `first_name` varchar(40) NOT NULL,
  `middle_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(90) NOT NULL,
  `suffix` varchar(40) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `email` varchar(90) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `user_group_id` bigint(20) DEFAULT NULL,
  `include_in_browse` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`author_id`),
  KEY `authors_submission_id` (`submission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `author_settings`
--

DROP TABLE IF EXISTS `author_settings`;
CREATE TABLE IF NOT EXISTS `author_settings` (
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_sources`
--

DROP TABLE IF EXISTS `auth_sources`;
CREATE TABLE IF NOT EXISTS `auth_sources` (
  `auth_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `plugin` varchar(32) NOT NULL,
  `auth_default` tinyint(4) NOT NULL DEFAULT '0',
  `settings` text,
  PRIMARY KEY (`auth_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `citations`
--

DROP TABLE IF EXISTS `citations`;
CREATE TABLE IF NOT EXISTS `citations` (
  `citation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL DEFAULT '0',
  `raw_citation` text,
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_submission_seq` (`submission_id`,`seq`),
  KEY `citations_submission` (`submission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `citation_settings`
--

DROP TABLE IF EXISTS `citation_settings`;
CREATE TABLE IF NOT EXISTS `citation_settings` (
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `completed_payments`
--

DROP TABLE IF EXISTS `completed_payments`;
CREATE TABLE IF NOT EXISTS `completed_payments` (
  `completed_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`completed_payment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `controlled_vocabs`
--

DROP TABLE IF EXISTS `controlled_vocabs`;
CREATE TABLE IF NOT EXISTS `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `controlled_vocabs`
--

INSERT INTO `controlled_vocabs` (`controlled_vocab_id`, `symbolic`, `assoc_type`, `assoc_id`) VALUES
(1, 'mods34-name-types', 0, 0),
(2, 'mods34-name-role-roleTerms-marcrelator', 0, 0),
(3, 'mods34-typeOfResource', 0, 0),
(4, 'mods34-genre-marcgt', 0, 0),
(5, 'mods34-physicalDescription-form-marcform', 0, 0),
(6, 'openurl10-journal-genres', 0, 0),
(7, 'openurl10-book-genres', 0, 0),
(8, 'interest', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `controlled_vocab_entries`
--

DROP TABLE IF EXISTS `controlled_vocab_entries`;
CREATE TABLE IF NOT EXISTS `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `controlled_vocab_entries`
--

INSERT INTO `controlled_vocab_entries` (`controlled_vocab_entry_id`, `controlled_vocab_id`, `seq`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 2),
(6, 2, 3),
(7, 2, 4),
(8, 2, 5),
(9, 2, 6),
(10, 2, 7),
(11, 3, 1),
(12, 3, 2),
(13, 3, 3),
(14, 4, 1),
(15, 4, 2),
(16, 4, 3),
(17, 4, 4),
(18, 4, 5),
(19, 4, 6),
(20, 4, 7),
(21, 4, 8),
(22, 4, 9),
(23, 4, 10),
(24, 4, 11),
(25, 4, 12),
(26, 5, 1),
(27, 5, 2),
(28, 6, 1),
(29, 6, 2),
(30, 6, 3),
(31, 6, 4),
(32, 6, 5),
(33, 6, 6),
(34, 6, 7),
(35, 7, 1),
(36, 7, 2),
(37, 7, 3),
(38, 7, 4),
(39, 7, 5),
(40, 7, 6),
(41, 7, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `controlled_vocab_entry_settings`
--

DROP TABLE IF EXISTS `controlled_vocab_entry_settings`;
CREATE TABLE IF NOT EXISTS `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `controlled_vocab_entry_settings`
--

INSERT INTO `controlled_vocab_entry_settings` (`controlled_vocab_entry_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'name', 'personal', 'string'),
(2, '', 'name', 'corporate', 'string'),
(3, '', 'name', 'conference', 'string'),
(4, '', 'name', 'aut', 'string'),
(4, '', 'description', 'Author', 'string'),
(5, '', 'name', 'ctb', 'string'),
(5, '', 'description', 'Contributor', 'string'),
(6, '', 'name', 'edt', 'string'),
(6, '', 'description', 'Editor', 'string'),
(7, '', 'name', 'ill', 'string'),
(7, '', 'description', 'Illustrator', 'string'),
(8, '', 'name', 'pht', 'string'),
(8, '', 'description', 'Photographer', 'string'),
(9, '', 'name', 'spn', 'string'),
(9, '', 'description', 'Sponsor', 'string'),
(10, '', 'name', 'trl', 'string'),
(10, '', 'description', 'Translator', 'string'),
(11, '', 'name', 'multimedia', 'string'),
(12, '', 'name', 'still image', 'string'),
(13, '', 'name', 'text', 'string'),
(14, '', 'name', 'article', 'string'),
(15, '', 'name', 'book', 'string'),
(16, '', 'name', 'conference publication', 'string'),
(17, '', 'name', 'issue', 'string'),
(18, '', 'name', 'journal', 'string'),
(19, '', 'name', 'newspaper', 'string'),
(20, '', 'name', 'picture', 'string'),
(21, '', 'name', 'review', 'string'),
(22, '', 'name', 'periodical', 'string'),
(23, '', 'name', 'series', 'string'),
(24, '', 'name', 'thesis', 'string'),
(25, '', 'name', 'web site', 'string'),
(26, '', 'name', 'electronic', 'string'),
(27, '', 'name', 'print', 'string'),
(28, '', 'name', 'journal', 'string'),
(29, '', 'name', 'issue', 'string'),
(30, '', 'name', 'article', 'string'),
(31, '', 'name', 'proceeding', 'string'),
(32, '', 'name', 'conference', 'string'),
(33, '', 'name', 'preprint', 'string'),
(34, '', 'name', 'unknown', 'string'),
(35, '', 'name', 'book', 'string'),
(36, '', 'name', 'bookitem', 'string'),
(37, '', 'name', 'proceeding', 'string'),
(38, '', 'name', 'conference', 'string'),
(39, '', 'name', 'report', 'string'),
(40, '', 'name', 'document', 'string'),
(41, '', 'name', 'unknown', 'string');

-- --------------------------------------------------------

--
-- Estrutura da tabela `custom_issue_orders`
--

DROP TABLE IF EXISTS `custom_issue_orders`;
CREATE TABLE IF NOT EXISTS `custom_issue_orders` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  UNIQUE KEY `custom_issue_orders_pkey` (`issue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `custom_section_orders`
--

DROP TABLE IF EXISTS `custom_section_orders`;
CREATE TABLE IF NOT EXISTS `custom_section_orders` (
  `issue_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  UNIQUE KEY `custom_section_orders_pkey` (`issue_id`,`section_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `data_object_tombstones`
--

DROP TABLE IF EXISTS `data_object_tombstones`;
CREATE TABLE IF NOT EXISTS `data_object_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_object_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `data_object_tombstones_data_object_id` (`data_object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `data_object_tombstone_oai_set_objects`
--

DROP TABLE IF EXISTS `data_object_tombstone_oai_set_objects`;
CREATE TABLE IF NOT EXISTS `data_object_tombstone_oai_set_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `data_object_tombstone_settings`
--

DROP TABLE IF EXISTS `data_object_tombstone_settings`;
CREATE TABLE IF NOT EXISTS `data_object_tombstone_settings` (
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `data_object_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `edit_decisions`
--

DROP TABLE IF EXISTS `edit_decisions`;
CREATE TABLE IF NOT EXISTS `edit_decisions` (
  `edit_decision_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` tinyint(4) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` tinyint(4) NOT NULL,
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_log`
--

DROP TABLE IF EXISTS `email_log`;
CREATE TABLE IF NOT EXISTS `email_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text,
  `cc_recipients` text,
  `bcc_recipients` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`log_id`),
  KEY `email_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_log_users`
--

DROP TABLE IF EXISTS `email_log_users`;
CREATE TABLE IF NOT EXISTS `email_log_users` (
  `email_log_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE IF NOT EXISTS `email_templates` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL,
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`assoc_type`,`assoc_id`),
  KEY `email_templates_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_templates_data`
--

DROP TABLE IF EXISTS `email_templates_data`;
CREATE TABLE IF NOT EXISTS `email_templates_data` (
  `email_key` varchar(64) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `subject` varchar(120) NOT NULL,
  `body` text,
  UNIQUE KEY `email_templates_data_pkey` (`email_key`,`locale`,`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_templates_default`
--

DROP TABLE IF EXISTS `email_templates_default`;
CREATE TABLE IF NOT EXISTS `email_templates_default` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL,
  `can_disable` tinyint(4) NOT NULL DEFAULT '1',
  `can_edit` tinyint(4) NOT NULL DEFAULT '1',
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  KEY `email_templates_default_email_key` (`email_key`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `email_templates_default`
--

INSERT INTO `email_templates_default` (`email_id`, `email_key`, `can_disable`, `can_edit`, `from_role_id`, `to_role_id`) VALUES
(1, 'NOTIFICATION', 0, 1, NULL, NULL),
(2, 'NOTIFICATION_CENTER_DEFAULT', 0, 1, NULL, NULL),
(3, 'PASSWORD_RESET_CONFIRM', 0, 1, NULL, NULL),
(4, 'PASSWORD_RESET', 0, 1, NULL, NULL),
(5, 'USER_REGISTER', 0, 1, NULL, NULL),
(6, 'USER_VALIDATE', 0, 1, NULL, NULL),
(7, 'REVIEWER_REGISTER', 0, 1, NULL, NULL),
(8, 'PUBLISH_NOTIFY', 0, 1, NULL, NULL),
(9, 'LOCKSS_EXISTING_ARCHIVE', 0, 1, NULL, NULL),
(10, 'LOCKSS_NEW_ARCHIVE', 0, 1, NULL, NULL),
(11, 'SUBMISSION_ACK', 1, 1, NULL, 65536),
(12, 'SUBMISSION_ACK_NOT_USER', 1, 1, NULL, 65536),
(13, 'EDITOR_ASSIGN', 1, 1, 256, 512),
(14, 'REVIEW_CANCEL', 1, 1, 512, 4096),
(15, 'REVIEW_REQUEST', 1, 1, 512, 4096),
(16, 'REVIEW_REQUEST_SUBSEQUENT', 1, 1, 512, 4096),
(17, 'REVIEW_REQUEST_ONECLICK', 1, 1, 512, 4096),
(18, 'REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 1, 1, 512, 4096),
(19, 'REVIEW_REQUEST_ATTACHED', 0, 1, 512, 4096),
(20, 'REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 0, 1, 512, 4096),
(21, 'REVIEW_REQUEST_REMIND_AUTO', 0, 1, NULL, 4096),
(22, 'REVIEW_REQUEST_REMIND_AUTO_ONECLICK', 0, 1, NULL, 4096),
(23, 'REVIEW_CONFIRM', 1, 1, 4096, 512),
(24, 'REVIEW_DECLINE', 1, 1, 4096, 512),
(25, 'REVIEW_ACK', 1, 1, 512, 4096),
(26, 'REVIEW_REMIND', 0, 1, 512, 4096),
(27, 'REVIEW_REMIND_AUTO', 0, 1, NULL, 4096),
(28, 'REVIEW_REMIND_ONECLICK', 0, 1, 512, 4096),
(29, 'REVIEW_REMIND_AUTO_ONECLICK', 0, 1, NULL, 4096),
(30, 'EDITOR_DECISION_ACCEPT', 0, 1, 512, 65536),
(31, 'EDITOR_DECISION_SEND_TO_EXTERNAL', 0, 1, 17, 65536),
(32, 'EDITOR_DECISION_SEND_TO_PRODUCTION', 0, 1, 17, 65536),
(33, 'EDITOR_DECISION_REVISIONS', 0, 1, 512, 65536),
(34, 'EDITOR_DECISION_RESUBMIT', 0, 1, 512, 65536),
(35, 'EDITOR_DECISION_DECLINE', 0, 1, 512, 65536),
(36, 'EDITOR_DECISION_INITIAL_DECLINE', 0, 1, 512, 65536),
(37, 'EDITOR_RECOMMENDATION', 0, 1, 17, 16),
(38, 'COPYEDIT_REQUEST', 1, 1, 512, 8192),
(39, 'LAYOUT_REQUEST', 1, 1, 512, 768),
(40, 'LAYOUT_COMPLETE', 1, 1, 768, 512),
(41, 'EMAIL_LINK', 0, 1, 1048576, NULL),
(42, 'SUBSCRIPTION_NOTIFY', 0, 1, NULL, 1048576),
(43, 'OPEN_ACCESS_NOTIFY', 0, 1, NULL, 1048576),
(44, 'SUBSCRIPTION_BEFORE_EXPIRY', 0, 1, NULL, 1048576),
(45, 'SUBSCRIPTION_AFTER_EXPIRY', 0, 1, NULL, 1048576),
(46, 'SUBSCRIPTION_AFTER_EXPIRY_LAST', 0, 1, NULL, 1048576),
(47, 'SUBSCRIPTION_PURCHASE_INDL', 0, 1, NULL, 2097152),
(48, 'SUBSCRIPTION_PURCHASE_INSTL', 0, 1, NULL, 2097152),
(49, 'SUBSCRIPTION_RENEW_INDL', 0, 1, NULL, 2097152),
(50, 'SUBSCRIPTION_RENEW_INSTL', 0, 1, NULL, 2097152),
(51, 'CITATION_EDITOR_AUTHOR_QUERY', 0, 1, NULL, NULL),
(52, 'REVISED_VERSION_NOTIFY', 0, 1, NULL, 512),
(53, 'ORCID_COLLECT_AUTHOR_ID', 0, 1, NULL, NULL),
(54, 'MANUAL_PAYMENT_NOTIFICATION', 0, 1, NULL, NULL),
(55, 'PAYPAL_INVESTIGATE_PAYMENT', 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
CREATE TABLE IF NOT EXISTS `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `subject` varchar(120) NOT NULL,
  `body` text,
  `description` text,
  UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `email_templates_default_data`
--

INSERT INTO `email_templates_default_data` (`email_key`, `locale`, `subject`, `body`, `description`) VALUES
('NOTIFICATION', 'en_US', 'New notification from {$siteTitle}', 'You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}', 'The email is sent to registered users that have selected to have this type of notification emailed to them.'),
('PASSWORD_RESET_CONFIRM', 'en_US', 'Password Reset Confirmation', 'We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}', 'This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),
('PASSWORD_RESET', 'en_US', 'Password Reset', 'Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the journal.<br />\n<br />\nYour username: {$username}<br />\nPassword: {$password}<br />\n<br />\n{$principalContactSignature}', 'This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),
('USER_REGISTER', 'en_US', 'Journal Registration', '{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal\'s list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),
('USER_VALIDATE', 'en_US', 'Validate Your Account', '{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered user to validate their email account.'),
('REVIEWER_REGISTER', 'en_US', 'Registration as Reviewer with {$contextName}', 'In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),
('PUBLISH_NOTIFY', 'en_US', 'New Issue Published', 'Readers:<br />\n<br />\n{$contextName} has just published its latest issue at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}', 'This email is sent to registered readers via the \"Notify Users\" link in the Editor\'s User Home. It notifies readers of a new issue and invites them to visit the journal at a supplied URL.'),
('LOCKSS_EXISTING_ARCHIVE', 'en_US', 'Archiving Request for {$contextName}', 'Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member], serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe URL to the LOCKSS Publisher Manifest for our journal is: {$contextUrl}/gateway/lockss<br />\n<br />\nWe understand that you are already participating in LOCKSS. If we can provide any additional metadata for purposes of registering our journal with your version of LOCKSS, we would be happy to provide it.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email requests the keeper of a LOCKSS archive to consider including this journal in their archive. It provides the URL to the journal\'s LOCKSS Publisher Manifest.'),
('LOCKSS_NEW_ARCHIVE', 'en_US', 'Archiving Request for {$contextName}', 'Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member] serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe LOCKSS Program &amp;lt;http://lockss.org/&amp;gt;, an international library/publisher initiative, is a working example of a distributed preservation and archiving repository, additional details are below. The software, which runs on an ordinary personal computer is free; the system is easily brought on-line; very little ongoing maintenance is required.<br />\n<br />\nTo assist in the archiving of our journal, we invite you to become a member of the LOCKSS community, to help collect and preserve titles produced by your faculty and by other scholars worldwide. To do so, please have someone on your staff visit the LOCKSS site for information on how this system operates. I look forward to hearing from you on the feasibility of providing this archiving support for this journal.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email encourages the recipient to participate in the LOCKSS initiative and include this journal in the archive. It provides information about the LOCKSS initiative and ways to become involved.'),
('SUBMISSION_ACK', 'en_US', 'Submission Acknowledgement', '{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}', 'This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the journal. It provides information about tracking the submission through the process and thanks the author for the submission.'),
('SUBMISSION_ACK_NOT_USER', 'en_US', 'Submission Acknowledgement', 'Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}', 'This email, when enabled, is automatically sent to the other authors who are not users within OJS specified during the submission process.'),
('EDITOR_ASSIGN', 'en_US', 'Editorial Assignment', '{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as Section Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you,<br />\n{$editorialContactSignature}', 'This email notifies a Section Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the journal site.'),
('REVIEW_REQUEST', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),
('REVIEW_REQUEST_REMIND_AUTO', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REQUEST_ONECLICK', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),
('REVIEW_REQUEST_REMIND_AUTO_ONECLICK', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REQUEST_ATTACHED', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n', 'This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)'),
('REVIEW_REQUEST_SUBSEQUENT', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),
('REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),
('REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nThe Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n', 'This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission for a second or greater round of review. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_SUBSEQUENT.)'),
('REVIEW_CANCEL', 'en_US', 'Request for Review Cancelled', '{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal\'s review process in the future.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),
('REVIEW_CONFIRM', 'en_US', 'Able to Review', 'Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$reviewerName}', 'This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been accepted and will be completed by the specified date.'),
('REVIEW_DECLINE', 'en_US', 'Unable to Review', 'Editors:<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$reviewerName}', 'This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been declined.'),
('REVIEW_ACK', 'en_US', 'Article Review Acknowledgement', '{$reviewerName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We appreciate your contribution to the quality of the work that we publish.<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by a Section Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),
('REVIEW_REMIND', 'en_US', 'Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by a Section Editor to remind a reviewer that their review is due.'),
('REVIEW_REMIND_ONECLICK', 'en_US', 'Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by a Section Editor to remind a reviewer that their review is due.'),
('REVIEW_REMIND_AUTO', 'en_US', 'Automated Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REMIND_AUTO_ONECLICK', 'en_US', 'Automated Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('EDITOR_DECISION_ACCEPT', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission<br />\n<br />\n{$editorialContactSignature}<br />\n', 'This email from the Editor or Section Editor to an Author notifies them of a final \"accept submission\" decision regarding their submission.'),
('EDITOR_DECISION_SEND_TO_EXTERNAL', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Send to Review<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}<br />\n', 'This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to an external review.'),
('EDITOR_DECISION_SEND_TO_PRODUCTION', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nThe editing of your submission, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}<br />\n', 'This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to production.'),
('EDITOR_DECISION_REVISIONS', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is: Revisions Required<br />\n<br />\n{$editorialContactSignature}<br />\n', 'This email from the Editor or Section Editor to an Author notifies them of a final \"revisions required\" decision regarding their submission.'),
('EDITOR_DECISION_RESUBMIT', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Resubmit for Review<br />\n<br />\n{$editorialContactSignature}<br />\n', 'This email from the Editor or Section Editor to an Author notifies them of a final \"resubmit\" decision regarding their submission.'),
('EDITOR_DECISION_DECLINE', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission<br />\n<br />\n{$editorialContactSignature}<br />\n', 'This email from the Editor or Section Editor to an Author notifies them of a final \"decline\" decision regarding their submission.'),
('EDITOR_RECOMMENDATION', 'en_US', 'Editor Recommendation', '{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$contextName}, &quot;{$submissionTitle}&quot; is: {$recommendation}<br />\n<br />\n{$editorialContactSignature}<br />\n', 'This email from the recommending Editor or Section Editor to the decision making Editors or Section Editors notifies them of a final recommendation regarding the submission.'),
('COPYEDIT_REQUEST', 'en_US', 'Copyediting Request', '{$participantName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$contextName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Open any files available under Draft Files and do your copyediting, while adding any Copyediting Discussions as needed.<br />\n3. Save copyedited file(s), and upload to Copyedited panel.<br />\n4. Notify the Editor that all files have been prepared, and that the Production process may begin.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by a Section Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),
('LAYOUT_REQUEST', 'en_US', 'Request Galleys', '{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the journal and use the Production Ready files to create the galleys according to the journal\'s standards.<br />\n3. Upload the galleys to the Galley Files section.<br />\n4. Notify the Editor using Production Discussions that the galleys are uploaded and ready.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionLayoutUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.<br />\n<br />\n{$editorialContactSignature}', 'This email from the Section Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),
('LAYOUT_COMPLETE', 'en_US', 'Galleys Complete', '{$editorialContactName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$participantName}', 'This email from the Layout Editor to the Section Editor notifies them that the layout process has been completed.'),
('EMAIL_LINK', 'en_US', 'Article of Possible Interest', 'Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$contextName} at &quot;{$articleUrl}&quot;.', 'This email template provides a registered reader with the opportunity to send information about an article to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Journal Manager in the Reading Tools Administration page.'),
('SUBSCRIPTION_NOTIFY', 'en_US', 'Subscription Notification', '{$subscriberName}:<br />\n<br />\nYou have now been registered as a subscriber in our online journal management system for {$contextName}, with the following subscription:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nTo access content that is available only to subscribers, simply log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nOnce you have logged in to the system you can change your profile details and password at any point.<br />\n<br />\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a registered reader that the Manager has created a subscription for them. It provides the journal\'s URL along with instructions for access.'),
('OPEN_ACCESS_NOTIFY', 'en_US', 'Issue Now Open Access', 'Readers:<br />\n<br />\n{$contextName} has just made available in an open access format the following issue. We invite you to review the Table of Contents here and then visit our web site ({$contextUrl}) to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}', 'This email is sent to registered readers who have requested to receive a notification email when an issue becomes open access.'),
('SUBSCRIPTION_BEFORE_EXPIRY', 'en_US', 'Notice of Subscription Expiry', '{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription is about to expire.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription will soon expire. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_AFTER_EXPIRY', 'en_US', 'Subscription Expired', '{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_AFTER_EXPIRY_LAST', 'en_US', 'Subscription Expired - Final Reminder', '{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\nPlease note that this is the final reminder that will be emailed to you.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),
('SUBSCRIPTION_PURCHASE_INDL', 'en_US', 'Subscription Purchase: Individual', 'An individual subscription has been purchased online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an individual subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),
('SUBSCRIPTION_PURCHASE_INSTL', 'en_US', 'Subscription Purchase: Institutional', 'An institutional subscription has been purchased online for {$contextName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to \'Active\'.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an institutional subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),
('SUBSCRIPTION_RENEW_INDL', 'en_US', 'Subscription Renewal: Individual', 'An individual subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an individual subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),
('SUBSCRIPTION_RENEW_INSTL', 'en_US', 'Subscription Renewal: Institutional', 'An institutional subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an institutional subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),
('CITATION_EDITOR_AUTHOR_QUERY', 'en_US', 'Citation Editing', '{$authorFirstName},<br />\n<br />\nCould you please verify or provide us with the proper citation for the following reference from your article, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nThanks!<br />\n<br />\n{$userFirstName}<br />\nCopy-Editor, {$contextName}<br />\n', 'This email allows copyeditors to request additional information about references from authors.'),
('REVISED_VERSION_NOTIFY', 'en_US', 'Revised Version Uploaded', 'Editors:<br />\n<br />\nA revised version of &quot;{$submissionTitle}&quot; has been uploaded by the author {$authorName}.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent to the assigned editor when author uploads a revised version of an article.'),
('NOTIFICATION_CENTER_DEFAULT', 'en_US', 'A message regarding {$contextName}', 'Please enter your message.', 'The default (blank) message used in the Notification Center Message Listbuilder.'),
('EDITOR_DECISION_INITIAL_DECLINE', 'en_US', 'Editor Decision', '\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission<br />\n<br />\n{$editorialContactSignature}<br />', 'This email is send to the author if the editor declines his submission initially, before the review stage'),
('PASSWORD_RESET_CONFIRM', 'es_ES', 'Confirmación de cambio de contraseña', 'Hemos recibido una petición para cambiar su contraseña en {$siteTitle}.<br />\n<br />\nSi no hizo usted esta petición ignore este correo-e y su contraseña no cambiará. Si desea cambiar su contraseña pinche en el enlace que le mostramos a continuación.<br />\n<br />\nCambiar mi contraseña: {$url}<br />\n<br />\n{$principalContactSignature}', 'Este correo se envía a un/a usuario/a registrado/a cuando indican que han olvidado su contraseña o que no se pueden identificar. Proporciona una URL para que cambien su contraseña.'),
('PASSWORD_RESET', 'es_ES', 'Cambio de contraseña', 'Su contraseña en {$siteTitle} se ha cambiado sin problema. Por favor, guarde en lugar seguro su nombre de usuaria/o y contraseña, ya que son necesarios para trabajar con la revista.<br />\n<br />\nNombre de usuaria/o: {$username}<br />\nContraseña: {$password}<br />\n<br />\n{$principalContactSignature}', 'Este correo se envía a un/a usuario/a registrado/a una vez han cambiado su contraseña siguiendo el procedimiento descrito en el correo-e PASSWORD_RESET_CONFIRM.'),
('USER_REGISTER', 'es_ES', 'Nuevo registro de usuaria/o', 'Gracias por registrarse como usuaria/o en {$contextName}. Por favor, guarde en lugar seguro su nombre de usuaria/o y contraseña, ya que son necesarios para trabajar con la revista.<br />\n<br />\nNombre de usuario/a: {$username}<br />\nContraseña: {$password}<br />\n<br />\nGracias,<br />\n{$principalContactSignature}', 'Este correo se envía a un/a usuario/a que se acaba de registrar para darle la bienvenida al sistema y proporcionarle sus datos de acceso.'),
('PUBLISH_NOTIFY', 'es_ES', 'Nuevo número publicado', 'Estimados/as lectores/as:<br />\n<br />\n{$contextName} acaba de publicar su último número en {$contextUrl}. A continuación le mostramos la tabla de contenidos, después puede visitar nuestro sitio web para consultar los artículos que sean de su interés.<br />\n<br />\nGracias por mantener el interés en nuestro trabajo,<br />\n{$editorialContactSignature}', 'Este correo se envía a lectores/as registrados/as a través del enlace \"Notificar a usuarios/as\" en la home de editores/as. Notifica a los/as lectores/as de la aparición de un nuevo número y les invita a visitar la revista en la URL proporcionada.'),
('SUBSCRIPTION_NOTIFY', 'es_ES', 'Notificación de suscripción', '{$subscriberName}:<br />\n<br />\nAcaba de registrarse como suscriptor/a en nuestro sistema de gestión de revistas online para la revista {$contextName}, a continuación le mostramos los datos de su suscripción:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nPara acceder al contenido exclusivo para suscriptores/as, simplemente tiene que identificarse con su nombre de usuaria/o, &quot;{$username}&quot;.<br />\n<br />\nUna vez se haya identificado en el sistema puede cambiar los detalles de su perfil y su contraseña en cualquier momento.<br />\n<br />\nTenga en cuenta que si se trata de una suscripción institucional no es necesario que los/as usuarios/as de su institución se identifiquen, ya que las peticiones de contenido bajo suscripción serán autentificadas automáticamente por el sistema.<br />\n<br />\nSi tiene cualquier pregunta no dude en contactar con nosotros/as.<br />\n<br />\n{$subscriptionContactSignature}', 'Este correo notifica a un/a lector/a registrado/a que el/la Gestor/a les ha creado una suscripción. Proporciona la URL de la revista junto con instrucciones para acceder a ella.'),
('OPEN_ACCESS_NOTIFY', 'es_ES', 'Ahora el número es de acceso libre', 'Lectores:<br />\n<br />\n	{$contextName} acaba de hacer disponible de forma acceso libre el siguiente número. Los invitamos a revisar la Tabla de Contenido aquí y después visite nuestra página Web  ({$contextUrl}) para consultar los artículos que sean de su interés.<br />\n<br />\n	Gracias por mantener el interés en nuestro trabajo,<br />\n	{$editorialContactSignature}', 'Este correo se envía a los lectores/as registrados que han pedido recibir notificaciones por email cuando un número se vuelve de acceso libre.'),
('SUBSCRIPTION_BEFORE_EXPIRY', 'es_ES', 'Notificación de expiración de suscripción', '{$subscriberName}:<br />\n<br />\n	Su suscripción a {$contextName} está a punto de expirar.<br />\n<br />\n	{$subscriptionType}<br />\n	Fecha de expiración: {$expiryDate}<br />\n<br />\n	Para asegurarse de que continúa teniendo acceso a la revista entre en la página web de la revista y renueve su suscripción.  Puede acceder al sistema con su nombre de usuario/a, &quot;{$username}&quot;.<br />\n<br />\n	Si tiene cualquier pregunta no dude en contactarme.<br />\n<br />\n	{$subscriptionContactSignature}', 'Este correo notifica a un subscriptor que su subscripción va a expirar pronto.  Les provee el URL de la revista e instrucciones para accederla.'),
('SUBSCRIPTION_AFTER_EXPIRY', 'es_ES', 'Subscripción expirada', '{$subscriberName}:<br />\n<br />\n	Su subscripción a {$contextName} ha expirado.<br />\n<br />\n	{$subscriptionType}<br />\n	Fecha de expiración: {$expiryDate}<br />\n<br />\n	Para renovar su suscripción entre en la página web de la revista.  Puede acceder al sistema con su nombre de usuario, &quot;{$username}&quot;.<br />\n<br />\n	Si tiene cualquier pregunta no dude en contactarme.<br />\n<br />\n	{$subscriptionContactSignature}', 'Este correo notifica al suscriptor que su subscripción ha expirado.  También proporciona el URL de la revista con las instrucciones para acceder.'),
('SUBSCRIPTION_AFTER_EXPIRY_LAST', 'es_ES', 'Suscripción expirada - Último recordatorio', '{$subscriberName}:<br />\n<br />\n	Su subscripción a {$contextName} ha expirado.<br />\n	Por favor note que este es el último correo que recibirá para recordarle.<br />\n<br />\n	{$subscriptionType}<br />\n	Fecha de expiración: {$expiryDate}<br />\n<br />\n	Para renovar su suscripción entre en la página web de la revista.  Puede acceder al sistema con su nombre de usuario/a, &quot;{$username}&quot;.<br />\n<br />\n	Si tiene cualquier pregunta no dude en contactarme.<br />\n<br />\n	{$subscriptionContactSignature}', 'Este correo notifica al suscriptor que su subscripción ha expirado.  También proporciona el URL de la revista con las instrucciones para acceder.'),
('LOCKSS_EXISTING_ARCHIVE', 'es_ES', 'Petición de archivado para {$contextName}', 'Estimado/a [Bibliotecaria/o Universitaria/o]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, es una revista en la que un miembro de su Facultad/Universidad, [nombre de la persona], colabora como [cargo que desempeña]. La revista está intentando crear un archivo LOCKSS (Lots of Copies Keep Stuff Safe) con esta y otras bibliotecas universitarias.<br />\n<br />\n[Breve descripción de la revista]<br />\n<br />\nLa URL para el Manifiesto Editorial LOCKSS para nuestra revista es: {$contextUrl}/gateway/lockss<br />\n<br />\nEntendemos que ya está participando en LOCKSS. Si podemos proporcionarle metadatos adicionales para registrar nuestra revista con su versión de LOCKSS, estaremos encantados/as de hacerlo.<br />\n<br />\nGracias,<br />\n{$principalContactSignature}', 'Este correo solicita al / a la administrador/a de un archivo LOCKSS que tenga en cuenta esta revista para incluirla en su archivo. Proporciona la URL del Manifiesto Editorial LOCKSS de la revista.'),
('LOCKSS_NEW_ARCHIVE', 'es_ES', 'Petición de archivado para {$contextName}', 'Estimado/a [Bibliotecario/a Universitario/a]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, es una revista en la que un miembro de su Facultad/Universidad, [nombre de la persona], colabora como [cargo que desempeña]. La revista está intentando crear un archivo LOCKSS (Lots of Copies Keep Stuff Safe) con esta y otras bibliotecas universitarias.<br />\n<br />\n[Breve descripción de la revista]<br />\n<br />\nEl programa LOCKSS &amp;lt;http://lockss.org/&amp;gt;, una iniciativa internacional de bibliotecas y editoriales, es un ejemplo vivo de un repositorio de preservación y archivo distribuido, a continuación le mostramos más detalles. El software, que funciona en ordenadores personales normales es gratuito; el sistema se conecta fácilmente; necesitando muy poco mantenimiento.<br />\n<br />\nPara contribuir al archivado de nuestra revista, le invitamos a convertirse en miembro de la comunidad LOCKSS, y así ayudar a recopilar y preservar títulos producidos en nuestra facultad y por otras entidades académicas de todo el mundo. Para hacerlo le rogamos que alguna persona de su biblioteca visite el sitio de LOCKSS para saber cómo funciona este sistema. Espero recibir pronto noticias suyas en el sentido de que proporcionará el apoyo para poder archivar esta revista.<br />\n<br />\nGracias,<br />\n{$principalContactSignature}', 'Este correo solicita al / a la destinatario/a participar en la iniciativa LOCKSS e incluir esta revista en el archivo. Le proporciona información sobre la iniciativa LOCKSS y cómo participar.');
INSERT INTO `email_templates_default_data` (`email_key`, `locale`, `subject`, `body`, `description`) VALUES
('SUBMISSION_ACK', 'es_ES', 'Acuse de recibo del envío', '{$authorName}:<br />\n<br />\nGracias por enviar el manuscrito &quot;{$submissionTitle}&quot; a {$contextName}. Con el sistema de gestión de publicaciones en línea que utilizamos podrá seguir el progreso a través del proceso editorial tras iniciar sesión en el sitio web de la publicación:<br />\n<br />\nURL del manuscrito: {$submissionUrl}<br />\nNombre de usuario/a: {$authorUsername}<br />\n<br />\nSi tiene alguna duda puede ponerse en contacto conmigo. Gracias por elegir esta editorial para mostrar su trabajo.<br />\n<br />\n{$editorialContactSignature}', 'Este correo electrónico, si está activado, se envía automáticamente a un autor/a cuando completa el proceso de envío de un manuscrito a la editorial. Proporciona información sobre el seguimiento del envío en el proceso y agradece al autor/a el envío.'),
('EDITOR_ASSIGN', 'es_ES', 'Asignación editorial', '{$editorialContactName}:<br />\n<br />\nSe le ha asignado el envío, &quot;{$submissionTitle},&quot; a {$contextName} para que lo revise en el proceso editorial como Editor/a de Sección.<br />\n<br />\nURL del envío: {$submissionUrl}<br />\nUsuario/a: {$editorUsername}<br />\n<br />\nGracias,<br />\n{$editorialContactSignature}', 'Este correo notifica al / a la Editor/a de Sección de que les ha asignado la tarea de supervisar un envío a través del proceso editorial. Proporciona información sobre el envío y cómo acceder a la revista.'),
('REVIEW_REQUEST', 'es_ES', 'Solicitud de revisión de artículo', '{$reviewerName}:<br />\n<br />\nTengo el convencimiento de que sería un/a excelente revisor/a del manuscrito, &quot;{$submissionTitle},&quot; que ha sido enviado a {$contextName}. A continuación encontrará un extracto del envío, con la esperanza de que aceptará llevar a cabo esta importante tarea para nosotros.<br />\n<br />\nPor favor, identifíquese en la revista antes de {$responseDueDate} para decirnos si hará o no la revisión, así como para tener acceso al envío y para registrar su revisión y recomendación. La dirección es {$contextUrl}<br />\n<br />\nLa revisión propiamente dicha debe estar lista para el {$reviewDueDate}.<br />\n<br />\nSi ha perdido su nombre de usuaria/o y contraseña, puede pinchar en el siguiente enlace para cambiar su contraseña (le llegará por correo-e junto con su nombre de usuaria/o). {$passwordResetUrl}<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por tener en cuenta nuestra solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\nResumen<br />\n{$submissionAbstract}', 'Este correo del / de la Editor/a de Sección a un/a revisor/a le solicita que acepte o rechace la revisión de un envío. Proporciona información sobre el envío como el título y el resumen, el plazo de revisión, y cómo acceder al envío propiamente dicho. Este mensaje se usa cuando se selecciona el Proceso de Envío Estándar en la configuración de la revista, paso 2. (En caso de haber seleccionado otra opción, REVIEW_REQUEST_ATTACHED.)'),
('REVIEW_REQUEST_ONECLICK', 'es_ES', 'Petición de revisión de artículo', '{$reviewerName}:<br />\n<br />\nTengo el convencimiento de que sería un/a excelente revisor/a del manuscrito &quot;{$submissionTitle},&quot; que ha sido enviado a {$contextName}. A continuación encontrará un extracto del envío, con la esperanza de que aceptará llevar a cabo esta importante tarea para nosotros.<br />\n<br />\nPor favor, identifíquese en la revista antes de {$responseDueDate} para decirnos si hará o no la revisión, así como para tener acceso al envío y para registrar su revisión y recomendación.<br />\n<br />\nLa revisión propiamente dicha debe estar lista para el {$reviewDueDate}.<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por tener en cuenta nuestra solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Este correo del / de la Editor/a de Sección a un/a revisor/a le solicita que acepte o rechace la revisión de un envío. Proporciona información sobre el envío como el título y el resumen, el plazo de revisión, y cómo acceder al envío propiamente dicho. Este mensaje se usa cuando se selecciona el Proceso de Envío Estándar en la configuración de la revista, paso 2, y está activado el acceso a la revisión en un click.'),
('REVIEW_REQUEST_ATTACHED', 'es_ES', 'Petición de revisión de artículo', '{$reviewerName}:<br />\n<br />\nTengo el convencimiento de que sería un/a excelente revisor/a del manuscrito &quot;{$submissionTitle},&quot;. A continuación encontrará un extracto del envío, con la esperanza de que aceptará llevar a cabo esta importante tarea para nosotros. A continuación le mostramos las Normas de Revisión de esta revista y adjunto a este correo-e recibirá el envío. Debería enviarme por correo-e su revisión del envío, así como su recomendación antes del {$reviewDueDate}.<br />\n<br />\nLe ruego me conteste a este correo-e antes del {$responseDueDate} y me comunique si puede y quiere hacer la revisión.<br />\n<br />\nGracias por tener en cuenta esta solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nNormas de Revisión<br />\n<br />\n{$reviewGuidelines}<br />', 'Este correo del / de la Editor/a de Sección a un/a revisor/a le solicita que acepte o rechace la revisión de un envío. Contiene el envío propiamente dicho como adjunto. Este correo se usa cuando es seleccionado Proceso de Revisión mediante Adjuntos en Correo-e en la configuración de la revista, paso 2.'),
('REVIEW_CANCEL', 'es_ES', 'Petición de revisión cancelada', '{$reviewerName}:<br />\n<br />\nHemos decidido cancelar nuestra petición para que revisara el envío &quot;{$submissionTitle},&quot; para {$contextName}. Lamentamos las molestias que hayamos podido causarle y esperamos poder volver a contactar con usted en el futuro para que nos ayude en el proceso de revisión.<br />\n<br />\nSi tiene cualquier pregunta, no dude en contactar con nosotros/as.<br />\n<br />\n{$editorialContactSignature}', 'Este correo del / de la Editor/a de Sección a un/a Revisor/a que tiene la revisión de un envío en progreso para notificarles que la revisión se ha cancelado.'),
('REVIEW_CONFIRM', 'es_ES', 'Acepto la revisión', 'Editores/as:<br />\n<br />\nTengo la capacidad y deseo revisar el envío &quot;{$submissionTitle},&quot; para {$contextName}. Gracias por acordarse de mí, es mi intención tener la revisión completa en el plazo indicado: {$reviewDueDate}, a ser posible antes.<br />\n<br />\n{$reviewerName}', 'Este correo es enviado por un/a revisor/a al / a la Editor/a de Sección en respuesta a una petición de revisión para notificarle que ha aceptado la petición y que será completada antes de la fecha especificada.'),
('REVIEW_DECLINE', 'es_ES', 'Rechazo la revisión', 'Editores/as:<br />\n<br />\nMe temo que en este momento no voy a poder revisar el envío &quot;{$submissionTitle},&quot; para {$contextName}. Gracias por pensar en mí, espero que vuelvan a contar conmigo en futuras ocasiones.<br />\n<br />\n{$reviewerName}', 'Este correo es enviado por un/a revisor/a al / a la Editor/a de Sección en respuesta a una petición de revisión para notificarle que rechaza la petición de revisión.'),
('REVIEW_ACK', 'es_ES', 'Acuse de recibo de revisión de artículo', '{$reviewerName}:<br />\n<br />\nGracias por completar la revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Apreciamos su contribución a la calidad de los trabajos que publicamos.<br />\n<br />\n{$editorialContactSignature}', 'Este correo enviado por el/la Editor/a de Sección para confirmar la recepción de una revisión completada y agradecer al / a la revisor/a su contribución.'),
('REVIEW_REMIND', 'es_ES', 'Recordatorio de envío de revisión', '{$reviewerName}:<br />\n<br />\nLe recordamos nuestra petición de revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos su revisión antes del {$reviewDueDate}, esperamos nos la mande en cuanto la tenga lista.<br />\n<br />\nSi ha perdido su nombre de usuaria/o y contraseña para la revista puede pinchar en el siguiente enlace para cambiar su contraseña (se la enviaremos por correo-e junto con su nombre de usuaria/o). {$passwordResetUrl}<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nLe rogamos nos confirme su disponibilidad para completar esta contribución vital para el trabajo de la revista. Esperamos tener noticias suyas a la mayor brevedad.<br />\n<br />\n{$editorialContactSignature}', 'Este correo es enviado por el/la Editor/a de Sección para recordar a un/a revisor/a que ya debe entregar su revisión.'),
('REVIEW_REMIND_ONECLICK', 'es_ES', 'Recordatorio de envío de revisión', '{$reviewerName}:<br />\n<br />\nLe recordamos nuestra petición de revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos su revisión antes del {$reviewDueDate}, esperamos nos la mande en cuanto la tenga lista.<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nLe rogamos nos confirme su disponibilidad para completar esta contribución vital para el trabajo de la revista. Esperamos tener noticias suyas a la mayor brevedad.<br />\n<br />\n{$editorialContactSignature}', 'Este correo es enviado por el/la Editor/a de Sección para recordar a un/a revisor/a que ya debe entregar su revisión.'),
('REVIEW_REMIND_AUTO', 'es_ES', 'Recordatorio automático de revisión de envío', '{$reviewerName}:<br />\n<br />\nLe recordamos nuestra petición de revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos su revisión antes del {$reviewDueDate}, y se ha generado automáticamente este correo-e al haberse superado dicha fecha. Aún estaríamos encantados de recibirla una vez la tenga lista.<br />\n<br />\nSi ha perdido su nombre de usuaria/o y contraseña para la revista puede pinchar en el siguiente enlace para cambiar su contraseña (se la enviaremos por correo-e junto con su nombre de usuaria/o). {$passwordResetUrl}<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nLe rogamos nos confirme su disponibilidad para completar esta contribución vital para el trabajo de la revista. Esperamos tener noticias suyas a la mayor brevedad.<br />\n<br />\n{$editorialContactSignature}', 'Este correo es enviado automáticamente cuando se supera la fecha de entrega de un/a revisor/a (véase Opciones de Revisión en Configuración de la revista, paso 2). Las tareas planificadas deben estar activadas y configuradas (ver fichero de configuración del sitio).'),
('REVIEW_REMIND_AUTO_ONECLICK', 'es_ES', 'Recordatorio automático de revisión de envío', '{$reviewerName}:<br />\n<br />\nLe recordamos nuestra petición de revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos su revisión antes del {$reviewDueDate}, y se ha generado automáticamente este correo-e al haberse superado dicha fecha. Aún estaríamos encantados de recibirla una vez la tenga lista.<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nLe rogamos nos confirme su disponibilidad para completar esta contribución vital para el trabajo de la revista. Esperamos tener noticias suyas a la mayor brevedad.<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Journal Setup, Step 2) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('COPYEDIT_REQUEST', 'es_ES', 'Petición de corrección', '{$participantName}:<br />\n<br />\nMe gustaría pedirle que llevara a cabo la corrección del manuscrito &quot;{$submissionTitle},&quot; para {$contextName}. En el sitio web de la revista puede encontrar el envío, así como las instrucciones de corrección.<br />\n<br />\nURL del manuscrito: {$submissionUrl}<br />\nNombre de usuaria/o: {$participantUsername}<br />\n<br />\nSi no puede llevar a cabo este trabajo en este momento o tiene cualquier pregunta, póngase en contacto con nosotros/as. Gracias por aceptar llevar a cabo este importante trabajo para la revista.<br />\n<br />\n{$editorialContactSignature}', 'Este correo es enviado por un/a Editor/a de Sección a un/a corrector/a de un envío para pedirles que comiencen un proceso de corrección. Le proporciona información sobre en el envío y cómo acceder a él.'),
('LAYOUT_REQUEST', 'es_ES', 'Solicitud de galeradas', '{$participantName}:<br />\n<br />\nLe solicito que prepare las galeradas del manuscrito &quot;{$submissionTitle},&quot; para {$contextName}.<br />\n<br />\nURL del manuscrito: {$submissionLayoutUrl}<br />\nNombre de usuaria/o: {$participantUsername}<br />\n<br />\nSi no puede llevar a cabo este trabajo en este momento o tiene cualquier pregunta, póngase en contacto con nosotros/as. Gracias por su contribución a la revista.<br />\n<br />\n{$editorialContactSignature}', 'Este correo es enviado por el/ la Editor/a de Sección al / a la Editor/a de Maquetación notificándole que se les ha asignado la tarea de editar la maquetación de un envío. Le proporciona información sobre el envío y cómo acceder a él.'),
('LAYOUT_COMPLETE', 'es_ES', 'Galeradas completadas', '{$editorialContactName}:<br />\n<br />\nYa han sido preparadas las galeradas para el manuscrito &quot;{$submissionTitle},&quot; para {$contextName} y están listas para corregir.<br />\n<br />\nSi tiene cualquier pregunta, no dude en contactar con nosotros/as.<br />\n<br />\n{$participantName}', 'Este correo es enviado por el/la Editor/a de Maquetación al / a la Editor/a de Sección notificándole que el proceso de maquetación ha finalizado.'),
('EMAIL_LINK', 'es_ES', 'Artículo interesante', 'He pensado que le podría interesar ver el artículo &quot;{$submissionTitle}&quot; de {$authorName}, publicado en el vol. {$volume}, nº {$number} ({$year}) de {$contextName} en &quot;{$articleUrl}&quot;.', 'Esta plantilla de correo proporciona a un/a lector/a registrado/a la oportunidad de enviar información sobre un artículo a alguien a quien le podría interesar. Está disponible a través de las Herramientas de Lectura y debe ser activado por el/la Gestor/a de la Revista en las Administración de Herramientas de Lectura.'),
('USER_VALIDATE', 'es_ES', 'Activación de cuenta', 'Estimada/o {$userFullName}<br />\n<br />\nSe ha recibido una solicitud de cuenta de usuario para la revista {$contextName} utilizando su dirección de correo. Si desea activar su cuenta en {$contextName}, pulse por favor sobre el vínculo siguiente:<br />\n<br />\n{$activateUrl}<br />\n<br />\nMuchas gracias por su interés.', NULL),
('REVIEWER_REGISTER', 'es_ES', 'Revisor para {$contextName}', 'Estimado/a colega:<br />\n<br />\nA la vista de su trayectoria profesional, su nombre ha sido propuesto para figurar como revisor potencial en el sistema de gestión electrónica de artículos de la revista {$contextName}, sin que ello implique ningún compromiso por su parte y pudiendo dejar de formar parte de esta lista cuando lo desee.<br />\n<br />\nEn caso de estar conforme con actuar como revisor para la revista, podrá recibir solicitudes de revisión de artículos, y aceptar o rechazar dichas solicitudes en su momento.<br />\n<br />\nA continuación le enviamos un nombre de usuario y contraseña con los que podrá acceder al sistema de gestión de envíos de la revista.<br />\n<br />\nUsuario: {$username}<br />\ncontraseña: {$password}<br />\n<br />\nMuchas gracias por su atención y por su colaboración en {$contextName}', 'Este email se envía a los nuevos revisores para darles la bienvenida al sistema y proporcionarles sus datos de acceso.'),
('NOTIFICATION', 'es_ES', 'Nueva notificación desde {$siteTitle}', 'Tiene una nueva notificación desde {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nEnlace: {$url}<br />\n<br />\n{$principalContactSignature}', 'El email es enviado a usuarios registrados que han seleccionado recibir notificaciones.'),
('SUBSCRIPTION_RENEW_INSTL', 'es_ES', 'Renovación de suscripción: Institucional', 'Se ha renovado en línea una suscripción institucional para {$contextName} con los detalles siguientes.<br />\n<br />\nTipo de suscripción:<br />\n{$subscriptionType}<br />\n<br />\nInstitución:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDominio (si se proporciona):<br />\n{$domain}<br />\n<br />\nRangos IP (si se proporcionan):<br />\n{$ipRanges}<br />\n<br />\nPersona de contacto:<br />\n{$userDetails}<br />\n<br />\nInformación de membresía (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripción use la siguiente URL:<br />\n<br />\nURL para gestionar la suscripción: {$subscriptionUrl}', 'Este correo notifica al administrador/a de suscripciones que una suscripción institucional ha sido renovada en línea. Proporciona información resumida de la suscripción y un enlace de acceso rápido a la suscripción renovada.'),
('SUBSCRIPTION_RENEW_INDL', 'es_ES', 'Renovación de suscripción: Individual', 'Una suscripción individual ha sido renovada en línea para {$contextName} con los siguientes detalles.<br />\n<br />\nTipo de suscripción:<br />\n{$subscriptionType}<br />\n<br />\nUsuario/a:<br />\n{$userDetails}<br />\n<br />\nInformación de membresía (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripción use la siguiente URL:<br />\n<br />\nURL para gestionar la suscripción: {$subscriptionUrl}', 'Este correo notifica al administrador/a de suscripciones que una suscripción individual se ha renovado en línea. Proporciona información resumida sobre la suscripción y  un enlace de acceso rápido a la suscripción renovada.'),
('EDITOR_DECISION_ACCEPT', 'es_ES', 'Decisión del editor/a', '{$authorName}:<br />\n<br />\nHemos tomado una decisión sobre su envío en {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: Aceptar el envío<br />\n<br />\n{$editorialContactSignature}<br />', 'Este correo electrónico del editor/a o editor/a de sección al autor/a le notifica de la decisión final sobre su envío.'),
('EDITOR_DECISION_RESUBMIT', 'es_ES', 'Decisión del editor/a', '{$authorName}:<br />\n<br />\nHemos tomado una decisión sobre su envío en {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: Volver a enviar a revisión<br />\n<br />\n{$editorialContactSignature}<br />', 'Este correo electrónico del editor/a o editor/a de sección al autor/a le notifica sobre la decisión final de volver a revisar su envío.'),
('EDITOR_DECISION_DECLINE', 'es_ES', 'Decisión del editor/a', '{$authorName}:<br />\n<br />\nHemos tomado una decisión sobre su envío en {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: Rechazar el envío<br />\n<br />\n{$editorialContactSignature}<br />', 'Este correo electrónico del editor/a o editor/a de sección al autor/a le notifica sobre la decisión final de \"rechazar\" su envío.'),
('EDITOR_DECISION_REVISIONS', 'es_ES', 'Decisión del editor/a', '{$authorName}:<br />\n<br />\nHemos tomado una decisión sobre su envío en {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: Necesita revisiones<br />\n<br />\n{$editorialContactSignature}<br />', 'Este correo electrónico del editor/a o editor/a de sección al autor/a le notifica que la decisión final respecto a su envío es que \"necesita revisiones\".'),
('SUBSCRIPTION_PURCHASE_INDL', 'es_ES', 'Compra de suscripción: Individual', 'Se ha adquirido en línea una suscripción individual para {$contextName} con los detalles siguientes:<br />\n<br />\nTipo de suscripción:<br />\n{$subscriptionType}<br />\n<br />\nUsuario/a:<br />\n{$userDetails}<br />\n<br />\nInformación de membresía (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripción, use la siguiente URL.<br />\n<br />\nURL de la suscripción: {$subscriptionUrl}', 'Este correo notifica al administrador/a de suscripciones que una suscripción individual ha sido adquirida online. Proporciona un resumen de la información sobre la suscripción y un enlace de acceso rápido a la suscripción adquirida.'),
('SUBSCRIPTION_PURCHASE_INSTL', 'es_ES', 'Compra de suscripción: Institucional', 'Se ha adquirido en línea una suscripción institucional para {$contextName} con los siguientes detalles. Para activar la suscripción, use el enlace proporcionado y configure el estado de la suscripción como \'Activo\'.<br />\n<br />\nTipo de suscripción:<br />\n{$subscriptionType}<br />\n<br />\nInstitución:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDominio (si se proporciona):<br />\n{$domain}<br />\n<br />\nRangos de IP (si se proporcionan):<br />\n{$ipRanges}<br />\n<br />\nPersona de contacto:<br />\n{$userDetails}<br />\n<br />\nInformación de membresía (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripción, use el siguiente enlace.<br />\n<br />\nEnlace de la suscripción: {$subscriptionUrl}', 'Este correo notifica al administrador/a de suscripciones que una suscripción institucional ha sido adquirida en línea. Proporciona información resumida sobre la suscripción y un enlace de acceso rápido a la suscripción adquirida.'),
('CITATION_EDITOR_AUTHOR_QUERY', 'es_ES', 'Edición de citas', '{$authorFirstName},<br />\n<br />\nPor favor, ¿podría usted verificar o proporcionarnos la cita adecuada para la siguiente referencia de su artículo, {$submissionTitle}?:<br />\n<br />\n{$rawCitation}<br />\n<br />\n¡Gracias!<br />\n<br />\n{$userFirstName}<br />\nCorrector/a de estilo, {$contextName}', 'Este correo electrónico permite a los correctores/as de estilo solicitar información adicional acerca de las referencias de los autores/as.'),
('EDITOR_DECISION_SEND_TO_EXTERNAL', 'es_ES', 'Decisión del editor/a', '{$authorName}:<br />\n<br />\nHemos llegado a una decisión respecto a su envío {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: Enviar a revisión<br />\n<br />\nEnlace: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}<br />', 'Este correo electrónico del editor/a, o del editor/a de sección, notifica al autor/a que su envío se traslada a un revisor/a externo.'),
('EDITOR_DECISION_SEND_TO_PRODUCTION', 'es_ES', 'Decisión del editor/a', '{$authorName}:<br />\n<br />\nLa edición de su envío, &quot;{$submissionTitle},&quot; se ha completado. Ahora lo enviaremos a producción.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}<br />', 'Este correo electrónico del editor/a, o del editor/a de sección, notifica al autor/a que su envío se traslada a producción.'),
('NOTIFICATION_CENTER_DEFAULT', 'es_ES', 'Mensaje sobre {$contextName}', 'Por favor, introduzca su mensaje.', 'Mensaje (en blanco) por defecto usado en el Notification Center Message Listbuilder.'),
('REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 'es_ES', 'Solicitud de revisión de artículo', '{$reviewerName}:<br />\n<br />\nEste correo es en referencia al manuscrito &quot;{$submissionTitle},&quot;, que {$contextName} está considerando.<br />\n<br />\nDespués de la revisión de la versión previa del manuscrito, los autores/as han enviado una versión revisada de su artículo. Le agradeceríamos mucho si pudiera ayudarnos a evaluarla.<br />\n<br />\nLas normas de revisión de esta revista se pueden ver a continuación. Además, el artículo se adjunta en este correo electrónico. Debería enviarnos su revisión del envío, junto con su recomendación, antes del {$reviewDueDate}.<br />\n<br />\nPor favor, responda a este correo electrónico antes del {$responseDueDate} e indíquenos si puede y desea realizar esta revisión.<br />\n<br />\nGracias por considerar esta solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nNormas de revisión<br />\n<br />\n{$reviewGuidelines}<br />', 'El editor de sección envía este correo electrónico a un revisor para pedirle si acepta o rechaza la tarea de revisión de un artículo en segunda ronda. Este incluye el envío como adjunto. Este mensaje se usa cuando se selecciona el proceso de revisión de archivos adjuntos por correo electrónico en el paso 2 de la configuración de la revista. (Por lo demás, vea SOLICITUD_DE_REVISIÓN_POSTERIOR).'),
('REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 'es_ES', 'Solicitud de revisión de artículo', '{$reviewerName}:<br />\n<br />\nEste correo es en referencia al manuscrito &quot;{$submissionTitle},&quot;, que {$contextName} está considerando.<br />\n<br />\nDespués de la revisión de la versión previa del manuscrito, los autores/as han enviado una versión revisada de su artículo. Le agradeceríamos mucho si pudiera ayudarnos a evaluarla.<br />\n<br />\nInicie sesión en el sitio web de la revista antes del {$responseDueDate} para indicar si llevará a cabo la revisión o no, además de para obtener acceso al envío y registrar su revisión y recomendación.<br />\n<br />\nLa fecha límite para entregar la revisión es el {$reviewDueDate}.<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar esta solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Este correo electrónico del editor/a de sección a un revisor/a solicita que el revisor/a acepte o rechace la tarea de revisar un envío para una ronda de revisión adicional. Además, proporciona información sobre el envío como el título, el resumen, la fecha de entrega de la revisión y cómo obtener acceso al propio envío. Este mensaje se usa cuando se selecciona el proceso de revisión estándar en el paso 2 de la configuración de la revista y cuando se habilita el acceso al revisor/a con un solo clic.'),
('REVIEW_REQUEST_REMIND_AUTO', 'es_ES', 'Solicitud de revisión de artículo', '{$reviewerName}:<br />\nLe recordamos nuestra petición acerca de la revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos tener esta revisión como muy tarde el {$responseDueDate}, por lo cual este correo electrónico se ha generado automáticamente y se ha enviado una vez pasada dicha fecha.\n<br />\nEl resumen del envío se ha insertado a continuación. Creemos que sería un excelente revisor para este artículo, por lo que esperamos que reconsidere llevar a cabo esta importante tarea para nosotros.<br />\n<br />\nPor favor, ingrese en la página web de la revista para indicar si realizará o no la revisión, y en caso afirmativo para acceder al envío y registrar su revisión y su recomendación. El sitio web es {$contextUrl}<br />\n<br />\nLa fecha límite para la revisión es el {$reviewDueDate}.<br />\n<br />\nSi no dispone de un nombre de usuario/a y contraseña para el sitio web de la revista, puede hacer clic en este enlace para restablecer su contraseña (se la enviaremos junto con su nombre de usuario/a). {$passwordResetUrl}<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar esta petición.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Este correo electrónico se envía automáticamente cuando transcurre la fecha de entrega del revisor/a (vea las opciones de revisión en el paso 2 de la configuración de la revista) y se deshabilita el acceso al revisor/a con un solo clic. Las tareas planificadas se deben habilitar y configurar (vea el archivo de configuración del sitio).'),
('REVIEW_REQUEST_REMIND_AUTO_ONECLICK', 'es_ES', 'Solicitud de revisión de artículo', '{$reviewerName}:<br />\nLe recordamos nuestra petición acerca de la revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos tener esta revisión como muy tarde el {$responseDueDate}, por lo cual este correo electrónico se ha generado automáticamente y se ha enviado una vez pasada dicha fecha.\n<br />\nEl resumen del envío se ha insertado a continuación. Creemos que sería un excelente revisor para este artículo, por lo que esperamos que reconsidere llevar a cabo esta importante tarea para nosotros.<br />\n<br />\nPor favor, ingrese en la página web de la revista para indicar si realizará o no la revisión, y en caso afirmativo para acceder al envío y registrar su revisión y su recomendación. <br />\n<br />\nLa fecha límite para la revisión es el {$reviewDueDate}.<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar esta petición.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Este correo electrónico se envía automáticamente cuando transcurre la fecha de entrega del revisor/a (vea las opciones de revisión en el paso 2 de la configuración de la revista) y se habilita el acceso al revisor/a con un solo clic. Las tareas planificadas se deben habilitar y configurar (vea el archivo de configuración del sitio).'),
('REVIEW_REQUEST_SUBSEQUENT', 'es_ES', 'Solicitud de revisión de artículo', '{$reviewerName}:<br />\n<br />\nEste correo es en referencia al manuscrito &quot;{$submissionTitle},&quot;, que {$contextName} está considerando.<br />\n<br />\nDespués de la revisión de la versión previa del manuscrito, los autores/as han enviado una versión revisada de su artículo. Le agradeceríamos mucho si pudiera ayudarnos a evaluarla.<br />\n<br />\nInicie sesión en el sitio web de la revista antes del {$responseDueDate} para indicar si llevará a cabo la revisión o no, además de para obtener acceso al envío y registrar su revisión y recomendación. El sitio web es {$contextUrl}<br />\n<br />\nLa fecha límite para entregar la revisión es el {$reviewDueDate}.<br />\n<br />\nSi no dispone de un nombre de usuario/a y contraseña para el sitio web de la revista, puede hacer clic en este enlace para restablecer su contraseña (se la enviaremos junto con su nombre de usuario/a). {$passwordResetUrl}<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar esta solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Este correo electrónico del editor/a de sección a un revisor/a solicita que el revisor/a acepte o rechace la tarea de revisar un envío para una ronda de revisión adicional. Además, proporciona información sobre el envío como el título, el resumen, la fecha de entrega de la revisión y cómo obtener acceso al propio envío. Este mensaje se usa cuando se selecciona el proceso de revisión estándar en el paso 2 de la configuración de la revista. (Por lo demás, vea SOLICITUD_DE_REVISIÓN_POSTERIOR _ADJUNTA).'),
('REVISED_VERSION_NOTIFY', 'es_ES', 'Versión revisada cargada', 'Editores/as:<br />\n<br />\nEl autor {$authorName} ha cargado un versión revisada de &quot;{$submissionTitle}&quot;.<br />\n<br />\nURL del envío: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}', 'Este correo electrónico se envía de forma automática al editor/a asignado cuando el autor/a carga una versión revisada de un artículo.'),
('EDITOR_DECISION_INITIAL_DECLINE', 'es_ES', 'Decisión del editor/a', '{$authorName}:<br />\n<br />\nHemos llegado a una decisión sobre su envio a {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: Rechazar el envío<br />\n<br />\n{$editorialContactSignature}<br />', 'Este correo electrónico se envía al autor/a si el editor/a rechaza su envío inicialmente, antes de la fase de revisión'),
('EDITOR_RECOMMENDATION', 'es_ES', 'Recomendación del editor/a', '{$editors}:<br />\n<br />\nLa recomendación respecto al envío a {$contextName}, &quot;{$submissionTitle}&quot; es: {$recommendation}<br />\n<br />\n{$editorialContactSignature}<br />', 'Este correo electrónico del editor/a o editor/a de sección que aconseja para los editores/as o editores/as de sección que toman las decisiones les notifica sobre la recomendación final respecto al envío.'),
('SUBMISSION_ACK_NOT_USER', 'es_ES', 'Acuse de recibo del envío', 'Hola,<br />\n<br />\n{$submitterName} ha enviado el manuscrito &quot;{$submissionTitle}&quot; a {$contextName}. <br />\n<br />\nSi tiene cualquier pregunta no dude en contactarme. Le agradecemos que haya elegido esta revista para dar a conocer su obra.<br />\n<br />\n{$editorialContactSignature}', 'Este correo electrónico, si está activado, se envía automáticamente a los autores/as que no son usuarios/as del OJS especificado durante el proceso de envío.'),
('PASSWORD_RESET_CONFIRM', 'it_IT', 'Conferma di modifica password', '&lt;![CDATA[Abbiamo ricevuto la richiesta di modificare la tua password per {$siteTitle}.<br />\n<br />\nSe non hai fatto questa richiesta, ignora pure questo messaggio e la password non sar&amp;#224; modificata.<br />\nSe invece hai fatto tu la richiesta e desideri generare una nuova password, clicca sul link qui sotto.<br />\n<br />\nReset password: {$url}<br />\n<br />\n{$principalContactSignature}]]&gt;', 'Questa email viene mandata ad un utente registrato quando questi indica che ha dimenticato la sua password o non riesce a fare il log in. Fornisce una URL per il reset della password.'),
('PASSWORD_RESET', 'it_IT', 'Password modificata', '&lt;![CDATA[La tua password per {$siteTitle} &amp;#232; stata modificata con successo.<br />\nQui sotto trovi il tuo username e la nuova password.<br />\n<br />\nLa tua username: {$username}<br />\nPassword: {$password}<br />\n<br />\n{$principalContactSignature}]]&gt;', 'Questa email viene mandata ad un utente registrato quando ha resettato la password seguendo il processo descritto nella email PASSWORD_RESETTA_CONFERMA.'),
('USER_REGISTER', 'it_IT', 'Registrazione nuovo utente', 'Grazie per esserti registrato a {$contextName}.<br />\nQui sotto trovi lo username e la password che dovrai utilizzare per accedere e lavorare alla rivista. Puoi contattarmi in ogni momento per richiedere di essere rimosso dall\'elenco degli utenti della rivista.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nPuoi richiedere in ogni momento la rimozione del tuo account mandandomi un email.<br />\n<br />\nGrazie,<br />\n{$principalContactSignature}', 'Questa email viene mandata agli utenti appena registrati per dar loro il benvenuto nel sistema e fornirgli una nota della loro username e password.'),
('PUBLISH_NOTIFY', 'it_IT', 'Pubblicato un nuovo fascicolo', 'Gentile lettore,<br />\n<br />\nAll\'indirizzo {$contextUrl} è appena stato pubblicato un nuovo numero di {$contextName}.<br />\n<br />\nGrazie per l\'interesse dimostratoci,<br />\n{$editorialContactSignature}', 'Questa email viene mandata ai lettori registrsati tramite il link \"Notifica Utenti\" nella home utente del curatore. Questa informa i lettori di una nuova uscita e li invita a visitare il journal alla URL fornita.'),
('SUBSCRIPTION_NOTIFY', 'it_IT', 'Notifica di abbonamento', '&lt;![CDATA[Gentile{$subscriberName}:<br />\n<br />\nil tuo abbonamento a {$contextName} &amp;#232; stato attivato con le seguenti caratteristiche:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nPer accedere al contenuto riservato agli abbonati, effettua semplicemente il log in al sistema con il tuo username, &quot;{$username}&quot;.<br />\n<br />\nUna volta effettuato il log in potrai modificare in ogni momento i dettagli del profilo e la password.<br />\n<br />\nGli utenti istituzionali vengono riconosciuti automaticamente dal sistema.<br />\n<br />\nPer qualsiasi domanda non esitare a contattarmi.<br />\n<br />\n{$subscriptionContactSignature}]]&gt;', 'Questa email notifica ai lettori registrati che l\'amministratore una sottoscrizione per loro. Questa fornisce la URL del journal insieme con le istruzioni per l\'accesso.'),
('LOCKSS_EXISTING_ARCHIVE', 'it_IT', 'Richiesta di archiviazione per {$contextName}', '&lt;![CDATA[Caro [Bibliotecario dell\'Universita\']<br />\n<br />\n{$contextName} &lt;{$contextUrl}&gt;, &amp;#x00E8; una rivista a cui un membro della vostra facolt&amp;#x00E0;, [nome del membro], collabora come [posizione]  sta cercando di instaurare un archivio condiviso LOCKSS (Lots of Copies Keep Stuff Safe) con questa e altre biblioteche universitarie.<br />\n<br />\n[Breve descrizione del journal]<br />\n<br />\nLa URL al manifesto di pubblicazione del LOCKSS  per il nostro journal &amp;#x00E8;: {$contextUrl}/gateway/lockss<br />\n<br />\nComprendiamo che state gi&amp;#x00E0; partecipando al LOCKSS. Se possiamo fornire qualsiasi metadato aggiuntivo per scopi di registrazione al nostro journal con la vostra versione del LOCKSS, saremo felici di fornirvelo.<br />\n<br />\nGrazie,<br />\n{$principalContactSignature}]]&gt;', 'Questa email richiede al controllore di un archivio LOCKSS di considerare di includere questo journal nei loro archivi. Questa fornisce una URL al LOCKSS Publisher Manifest del journal.'),
('LOCKSS_NEW_ARCHIVE', 'it_IT', 'Archiviare richiesta per {$contextName}', 'Cara [biblioteca universitaria]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, &amp;amp;#x00E8; un journal per cui un membro della vostra facolt&amp;amp;#x00E0;, [nome del membro], presta servizio come [posizione]. Il journal sta cercando di instaurare un archivio condiviso LOCKSS (Lots of Copies Keep Stuff Safe) con questa e altre biblioteche universitarie.<br />\n<br />\n[Breve descrizione del journal]<br />\n<br />\nIl programma LOCKSS &amp;lt;http://lockss.org/&amp;gt;, una iniziativa biblioteca/editore, &amp;amp;#x00E8; un esempio funzionante di un deposito distribuito di preservazione e archiviazione, dettagli aggiuntivi sono di sotto. Il software, che funziona su personal computer ordinario &amp;amp;#x00E8; libero; il sistema &amp;amp;#x00E8; portato facilmente on-line; la manutenzione continua &amp;amp;#x00E8; pochissima.<br />\n<br />\nPer assistere nell\'archiviazione del nostro journal, vi invitiamo a diventare membri della comunit&amp;amp;#x00E0; LOCKSS, per aiutare a collezionare e preservare titoli prodotti dalla vostra facolt&amp;amp;#x00E0; e di altri studiosi a livello mondiale. Per fare questo, si prega di avere qualcuno nel vostro staff che visiti il sito LOCKSS per informazioni su come il sistema opera. Aspetto con impazienza di sentire a voi la possibilit&amp;amp;#x00E0; di fornire questo supporto di archiviazione per questo journal.<br />\n<br />\nGrazie,<br />\n{$principalContactSignature}', 'Questa email incoraggia il destinatario a partecipare all\'iniziativa LOCKSS e a includere questo journal nell\'archivio. Questa fornisce informazioni sull\'iniziativa LOCKSS e sui modi per farne parte.'),
('SUBMISSION_ACK', 'it_IT', 'Submission completata', 'Gentile {$authorName},<br />\n<br />\nGrazie per aver inviato la proposta dal titolo &quot;{$submissionTitle}&quot; a {$contextName}. Attraverso l\'interfaccia web potrà seguire i vari passi della submission attraverso il processo di revisione utlizzando la sua login al sito:<br />\n<br />\nURL della submission: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nPer qualsiasi domanda non esiti a contattarmi.<br />\nLa ringrazio per la preferenza espressa nei confronti di {$contextName}.<br />\n<br />\n{$editorialContactSignature}', 'Questa email, quando è abilitata, viene mandata automaticamente ad un autore quando lui o lei completa il processo di sottomissione del manoscritto al journal. Fornisce informazioni su come rintracciare la submission attraverso il processo e ringrazia l\'autore per la submission.'),
('SUBMISSION_COMMENT', 'it_IT', 'Commento alla submission ', '{$name}:<br />\n<br />\n{$commentName} ha aggiunto un commento alla submission, &quot;{$submissionTitle}&quot; in {$contextName}:<br />\n<br />\n{$comments}', 'Questa email notifica a varie persone coinvolte nel processo editoriale di una submission  che è stato aggiunto un nuovo commento.'),
('SUBMISSION_DECISION_REVIEWERS', 'it_IT', 'Decisione su \"{$submissionTitle}\"', 'Gentile revisore di {$contextName},<br />\nti comunico la decisione e i suggerimenti che abbiamo inviato all\'autore della proposta &quot;{$submissionTitle}&quot;.<br />\n<br />\nGrazie ancora per il tuo contributo.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n======<br />\n{$comments}', 'Questa email notifica ai revisori di una submission che il processo di revisione è stato completato. Include informazioni sull\'articolo e le decisioni raggiunte, e ringrazia i revisori per i loro contributi.'),
('EDITOR_ASSIGN', 'it_IT', 'Assegnazione  della proposta', 'Gentile {$editorialContactName},<br />\n<br />\nLa submission, &quot;{$submissionTitle},&quot; a {$contextName} ti è stata assegnata come Section Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nGrazie,<br />\n{$editorialContactSignature}', 'Questa email notifica ai section editor che l\'editor ha assegnato loro il compito di supervisionare una submission attraverso il processo editoriale. Questa fornisce informazioni sulla submission e su come accedere al sito del journal.'),
('REVIEW_REQUEST', 'it_IT', 'Richiesta di revisione della proposta', 'Gentile {$reviewerName},<br />\n<br />\nTi propongo la revisione del manoscritto &quot;{$submissionTitle},&quot; che è stato proposto a {$contextName}. L\'abstract della submission  è inserito qui sotto. Spero che vorrai prendere in carico questo compito.<br />\n<br />\nTi chiedo quindi di effettuare il log in al sito web della rivista entro il {$responseDueDate} per indicare se prenderai in carico la revisione o meno.<br />\nPotrai poi accedere alla submission e inviare il tuo parere. Il sito web è {$contextUrl}<br />\n<br />\nLa data di scadenza per la revisione è fissata al {$reviewDueDate}.<br />\n<br />\nSe non hai una username and password per il sito web della rivista, puoi usare questo link per resettare la  password (che ti sarà quindi mandata per email insieme con la username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nGrazie per la tua collaborazione.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n======<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\nAbstract<br />\n{$submissionAbstract}', 'Questa email dal section editor al revisore richiede che quest\'ultimo accetti o rifiuti il compito di revisionare una submission. Fornisce informazioni sulla submission quali il titolo e l\'abstract, una data attesa per la revisione, e su come accedere alla submission stessa. Questo messaggio è usato quando il processo Standard di revisione è selezionato nel Journal Setup, fase 2. (Altrimenti vedi  ALLEGATA_RICHIESTA_REVISIONE.)'),
('REVIEW_REQUEST_ONECLICK', 'it_IT', 'Richiesta di revisione della proposta', 'Gentile {$reviewerName}:<br />\n<br />\nTi propongo la revisione del manoscritto &quot;{$submissionTitle},&quot; che è stato inviato a {$contextName}. L\'abstract della proposta è più sotto. Spero che vorrai prendere in carico questo compito.<br />\n<br />\nTi chiedo quindi di effettuare il log in al sito web della rivista entro il {$responseDueDate} per indicare se prenderai in carico la revisione o meno. Potrai poi accedere alla submission e inviare il tuo parere.<br />\n<br />\nLa data di scadenza per la revisione è fissata al {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nGrazie per la tua collaborazione<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\nAbstract<br />\n{$submissionAbstract}', 'Questa email dal section editor al revisore richiede che quest\'ultimo accetti o rifiuti il compito di revisionare una submission. Fornisce informazioni sulla submission quali il titolo e l\'abstract, una data attesa per la revisione, e su come accedere alla submission stessa. Questo messaggio è usato quando il processo Standard di revisione è selezionato nel Journal Setup, fase 2, e il accesso one-click del revisore è attivato.'),
('REVIEW_REQUEST_ATTACHED', 'it_IT', 'Richiesta di revisione della proposta', '{$reviewerName}:<br />\n<br />\nTi propongo la revisione del manoscritto &quot;{$submissionTitle}&quot;.<br />\nLe linee guida per la revisione sono indicate sotto e il file della submission è allegato.<br />\n<br />\nPuoi comunicarmi il tuo parere per posta elettronica entro il {$reviewDueDate}.<br />\n<br />\nTi chiedo di farmi sapere entro il {$responseDueDate} e accetti o meno l\'incarico di revisione.<br />\n<br />\nGrazie per la tua collaborazione<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n======<br />\nLinee guida per le revisioni<br />\n<br />\n{$reviewGuidelines}', 'Questa email viene inviata dal section editor al revisore richiedendo a quest\'ultimo di accettare o rifiutare il compito di revisionare una submission. Include la submission come allegato. Questo messaggio è usato il processo di revisione degli allegati Email è selezionato nel Journal Setup, fase 2. (Altrimenti vedi RICHIESTA_REVISIONE.)'),
('REVIEW_CANCEL', 'it_IT', 'Cancellazione richiesta di revisione', 'Gentile {$reviewerName}:<br />\n<br />\nAbbiamo deciso di cancellare la nostra richiesta di revisione della submission, &quot;{$submissionTitle},&quot; per {$contextName}.<br />\n<br />\nCi scusiamo per qualsiasi disturbo possiamo aver causato speriamo di poter contare su di te in una prossima occasione.<br />\n<br />\nSe hai qualche domanda, ti prego di contattarmi.<br />\n<br />\n{$editorialContactSignature}', 'Questa email viene inviata dal section editor al revisore che ha una  revisione di una submission in corso per fargli sapere che la revisione è stata cancellata.'),
('REVIEW_CONFIRM', 'it_IT', 'Accettazione incarico di revisione', '{$editorialContactName}:<br />\n<br />\nAccetto l\'incarico di revisionare &quot;{$submissionTitle},&quot; per {$contextName}.<br />\nPenso di completare la revisione per la data che mi avete comunicato, {$reviewDueDate}, se non prima.<br />\n<br />\n{$reviewerName}', 'Questa email viene mandata dal revisore  al section editor in risposta a una richiesta di revisione per far sapere a quest\'ultimo che la richiesta è stata accettata e sarà completata alla data specificata.'),
('REVIEW_DECLINE', 'it_IT', 'Rifiuto incarico di revisione', '{$editorialContactName}:<br />\n<br />\nSono spiacente di non poter revisionare la submission, &quot;{$submissionTitle},&quot; per {$contextName}. Spero che ci siano future occasioni di collaborazione.<br />\n<br />\n{$reviewerName}', 'Questa email viene mandata dal revisore al section editor in risposta a una richiesta di revisione per far sapere a quest\'ultimo che la richiesta è stata declinata.'),
('REVIEW_ACK', 'it_IT', 'Ringraziamenti per la revisione', 'Gentile {$reviewerName}:<br />\n<br />\nGrazie per aver completato la revisione della submission, &quot;{$submissionTitle},&quot; per {$contextName}.<br />\n<br />\nApprezziamo il tuo contributo nel mantenere alta la qualità della rivista.<br />\n<br />\n{$editorialContactSignature}', 'Questa email viene inviata dal section editor per confermare la ricezione di una revisione completata e per ringraziare i revisori per i loro contributi.'),
('REVIEW_REMIND', 'it_IT', 'Promemoria revisione in attesa', 'Gentile {$reviewerName}:<br />\n<br />\nTi ricordo la richiesta di revisione della submission, &quot;{$submissionTitle},&quot; per {$contextName}. La data di scadenza prevista è {$reviewDueDate}.<br />\n<br />\nSe non hai una username and password per il sito web della rivista, puoi usare questo link per resettare la  password (che ti sarà quindi mandata per email insieme con la username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nTi chiedo la cortesia di di confermare la volontà di portare a termine l\'incarico.<br />\n<br />\n{$editorialContactSignature}', 'Questa email viene mandata da un section editor per ricordare al revisore che è attesa la revisione.'),
('REVIEW_REMIND_ONECLICK', 'it_IT', 'Promemoria revisione in attesa', 'Gentile {$reviewerName},<br />\n<br />\nTi ricordo la richiesta di revisione della submission, &quot;{$submissionTitle},&quot; per {$contextName}. La data di scadenza prevista è {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nTi chiedo la cortesia di confermare al più presto la tua disponibilità a portare a termine l\'incarico o meno.<br />\n<br />\n{$editorialContactSignature}', 'Questa email viene mandata da un section editor per ricordare al revisore che è attesa la revisione.'),
('REVIEW_REMIND_AUTO', 'it_IT', 'Promemoria automatico revisione in attesa', 'Gentile {$reviewerName},<br />\n<br />\nQuesto è un promemoria automatico della richiesta di revisione della submission, &quot;{$submissionTitle},&quot; per {$contextName}.<br />\n<br />\nScadenza prevista:  {$reviewDueDate}.<br />\n<br />\nSe non hai una username and password per il sito web della rivista, puoi usare questo link per resettare la  password (che ti sarà quindi mandata per email insieme con la username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nTi chiedo la cortesia di confermare al più presto la volontà di portare a termine l\'incarico o meno.<br />\n<br />\n{$editorialContactSignature}', 'Questa email viene mandata automaticamente quando una data di revisionee scade (vedi opzioni del revisore nel Journal Setup, passo 2) e l\'accesso one-click del revisore è disattivato. I compiti programmati devono essere abilitati e configurati (vedi il file di configurazione del sito).');
INSERT INTO `email_templates_default_data` (`email_key`, `locale`, `subject`, `body`, `description`) VALUES
('REVIEW_REMIND_AUTO_ONECLICK', 'it_IT', 'Promemoria automatico revisione in attesa', 'Gentile {$reviewerName},<br />\n<br />\nQuesto è un promemoria automatico della richiesta di revisione della submission, &quot;{$submissionTitle},&quot; per {$contextName}.<br />\n<br />\nScadenza prevista:  {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nTi chiedo la cortesia di confermare al più presto la volontà di portare a termine l\'incarico o meno.<br />\n<br />\n{$editorialContactSignature}', 'Questa email viene mandata automaticamente quando una data di revisionee scade (vedi opzioni del revisore nel Journal Setup, passo 2) e l\'accesso one-click del revisore è attivato. I compiti programmati devono essere abilitati e configurati (vedi il file di configurazione del sito).'),
('COPYEDIT_REQUEST', 'it_IT', 'Assegnazione di copyediting', '{$participantName}:<br />\n<br />\nTi chiedo di prendere in carico il copyedit del manoscritto, &quot;{$submissionTitle},&quot; per {$contextName}.<br />\nIl documento si trova su sito web della rivista, insieme alle istruzioni per il copyedit.<br />\n<br />\nURL Manoscritto: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nSe non puoi prendere in carico il lavoro in questo periodo o hai qualche domanda, ti prego di contattarmi.<br />\n<br />\n{$editorialContactSignature}', 'Questa email viene mandata dal section editor al copyeditor della submission per richiedere che comincino con il processo di copyedit. Questa fornisce informazioni sulla submission e su come accedervi.'),
('LAYOUT_REQUEST', 'it_IT', 'Richiesta preparazione delle bozze', '{$participantName}:<br />\n<br />\nVorrei chiederti di preparare le bozze per il manoscritto &quot;{$submissionTitle}&quot; per {$contextName}.<br />\n<br />\nURL manoscritto: {$submissionLayoutUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nSe non puoi prendere in carico il lavoro in questo periodo o hai qualche domanda, ti prego di contattarmi. Grazie per il tuo contributo al journal.<br />\n<br />\n{$editorialContactSignature}', 'Questa email dal section editor al layout editor notifica che è stato assegnato loro il compito di curare il layout di una submission. Questa fornisce informazioni sulla submission e su come accedervi.'),
('LAYOUT_COMPLETE', 'it_IT', 'Bozze pronte', '{$editorialContactName}:<br />\n<br />\nSono pronte le bozze dell\'articolo, &quot;{$submissionTitle}&quot; per {$contextName}, a disposizione per i correttori di bozze.<br />\n<br />\nPer qualsiasi domanda, si prega di contattarmi.<br />\n<br />\n{$participantName}', 'Questa email dal layout editor al section editor notifica che il processo di layout è stato completato.'),
('LAYOUT_ACK', 'it_IT', 'Ringraziamenti layout', '{$participantName}:<br />\n<br />\nGrazie per aver preparato l\'impaginato de manoscritto &quot;{$submissionTitle}&quot; per {$contextName}.<br />\n<br />\n{$editorialContactSignature}', 'Questa email dal section editor al layout editor riconosce il completamento del processo di layout e ringrazia il curatore di layout per il contributo.'),
('PROOFREAD_AUTHOR_REQUEST', 'it_IT', 'Correzione bozze dell\'autore', '{$authorName}:<br />\n<br />\nE\' necessario correggere le bozze del tuo contributo &quot;{$submissionTitle}&quot;. Puoi farlo seguendo queste istruzioni:<br />\n<br />\n1. Clicca sulla URL del manoscritto indicata sotto<br />\n2. Entra nella rivista e leggi le istruzioni per la correzione delle bozze<br />\n3. Clicca su \'Vedi bozza\'<br />\n4. Inserisci le correzioni, limitandoti a quelle tipografiche e al formato, nelle Correzioni della bozza\', indicando per ciascuna il numero di pagina e di riga alle quali si riferiscono<br />\n5. Salva le modifiche.<br />\n6. Invia all\'editor il messaggio COMPLETATO.<br />\n<br />\nURL del contributo: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}', 'Questa mail viene inviata dall\'editor all\'autore per informarlo che è necessario correggere le bozze del suo contributo. Fornisce informazioni sulla procedura.'),
('PROOFREAD_AUTHOR_COMPLETE', 'it_IT', 'Correzione bozze dell\'autore completata', '{$editorialContactName}:<br />\n<br />\nHo completato la correzione delle bozze del mio manoscritto, &quot;{$submissionTitle},&quot; for {$contextName}.<br />\n{$authorName}', NULL),
('PROOFREAD_AUTHOR_ACK', 'it_IT', 'Ringraziamenti correzione delle bozze (Autore)', '{$authorName}:<br />\n<br />\nGrazie per aver corretto le bozze dell\'articolo, &quot;{$submissionTitle},&quot; in {$contextName}.<br />\nAspettiamo solo di pubblicare il lavoro a breve.<br />\n<br />\nSe sottoscrivi il nostro servizio notifiche, riceverai una email non appena il fascicolo verrà pubblicato. Per qualsiasi domanda, contattami liberamente.<br />\n<br />\n{$editorialContactSignature}', 'Questa email dal section editor all\'autore riconosce il completamento del processo iniziale di correzione di bozze e ringrazia per il contributo.'),
('PROOFREAD_REQUEST', 'it_IT', 'Richiesta correzione di bozze', 'Gentile {$proofreaderName},<br />\n<br />\nVorrei chiederti di corregere le bozze per l\'articolo, &quot;{$submissionTitle},&quot; per {$contextName}, seguendo queste indicazioni:<br />\n<br />\n1. Clicca sulla URL del manoscritto<br />\n2. Entra nella rivista e leggi le istruzioni per la correzione delle bozze<br />\n3. Clicca su \'Vedi bozza\' e correggi le bozze nei vari eventuali formati<br />\n4. Inserisci le correzioni, limitandoti a quelle tipografiche e al formato, in \'Correzioni delle bozze\', indicando per ciascuna il numero di pagina e di riga<br />\n5. Salva le modifiche<br />\n6. Invia all\'editor comunicazione di aver completato l\'incarico.<br />\nURL manoscritto: {$submissionUrl}<br />\nUsername: {$proofreaderUsername}<br />\n<br />\nSe non puoi prendere in carico il lavoro in questo periodo o hai qualche domanda, ti prego di contattarmi.<br />\n<br />\nGrazie per il tuo contributo,<br />\n{$editorialContactSignature}', 'Questa email dal section editor al correttore di bozze richiede che facciano la correzione delle bozze di un articolo. Fornisce informazioni sull\'articolo e su come accedervi.'),
('PROOFREAD_COMPLETE', 'it_IT', 'Correzione delle bozze completata', '{$editorialContactName}:<br />\n<br />\nHo completato la correzione delle bozze del contributo &quot;{$submissionTitle},&quot; per {$contextName}.<br />\n<br />\n{$proofreaderName}', 'Questa email dal correttore di bozze al section editor notifica che il correttore di bozze ha completato il processo di correzione.'),
('PROOFREAD_ACK', 'it_IT', 'Ringraziamenti correzione di bozze', '{$proofreaderName}:<br />\n<br />\nGrazie per la correzione delle bozze per il manoscritto, &quot;{$submissionTitle},&quot; per {$contextName}. Questo lavoro da un contributo importante alla qualità della rivista.<br />\n<br />\n{$editorialContactSignature}', 'Questa email dal section editor al correttore di bozze conferma il completamento del processo di correzione do bozze e ringrazia per il contributo.'),
('PROOFREAD_LAYOUT_REQUEST', 'it_IT', 'Modifiche da apportare alle bozze', '{$participantName}:<br />\n<br />\nLe bozze del manoscritto &quot;{$submissionTitle}&quot; per {$contextName} sono state corrette dall\'autore e dai correttori di bozze. Per apportare le correzioni segui queste istruzioni:<br />\n<br />\n1. Clicca sulla URL del manoscritto<br />\n2. Entra nella rivista e consulta le \'Correzioni delle bozze\'<br />\n3. Apporta le correzioni alle bozze<br />\n3. Carica i file corretti<br />\n4. Invia all\'editor la comunicazione di aver completato l\'incarico, dal Passo n. 3 della correzione.<br />\n<br />\nURL manoscritto: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nSe non puoi prendere in carico il lavoro in questo periodo o hai qualche domanda, ti prego di contattarmi. Grazie per il tuo contributo al journal.<br />\n<br />\n{$editorialContactSignature}', 'Questa email dal section editor al curatore di layout  informa che le bozze di un articolo sono pronte per la correzione finale. Fornisce informazioni sull\'articolo su come accedervi.'),
('PROOFREAD_LAYOUT_COMPLETE', 'it_IT', 'Modifica alle bozze completata', '{$editorialContactName}:<br />\n<br />\nLe bozze dell\'articolo &quot;{$submissionTitle},&quot; per {$contextName} sono state corrette.<br />\nL\'articolo è ora pronto per essere pubblicato.<br />\n<br />\n{$participantName}', 'Questa email dal curatore del layout informa che la fase finale di correzione delle bozze è stata completata e l\'articolo è pronto per essere pubblicato.'),
('PROOFREAD_LAYOUT_ACK', 'it_IT', 'Ringraziamenti modifica delle bozze', '{$participantName}:<br />\n<br />\nGrazie per aver completato la correzione delle bozze associate al manoscritto, &quot;{$submissionTitle},&quot; per {$contextName}.<br />\n<br />\n{$editorialContactSignature}', 'Questa email dal section editor al layout editor riconosce il completamento della fase finale della correzione delle bozze e ringrazia per il contributo.'),
('EMAIL_LINK', 'it_IT', 'Ti suggerisco la lettura di un articolo', 'Penso che potrebbe interessarti la lettura di:<br />\n &quot;{$submissionTitle}&quot; di {$authorName}<br />\npubblicato in {$contextName}, Vol. {$volume}, N. {$number} ({$year}) e disponibile all\'indirizzo &quot;{$articleUrl}&quot;.', 'Questo modello  email fornisce ad un utente registrato l\'opprtunità di inviare informazioni su un articolo a qualcuno che potrebbe essere interessato. è disponibile via utility di lettura e e deve essere abilitata dall\'amministratore della rivista nella pagina di amministrazione delle utility di lettura.'),
('OPEN_ACCESS_NOTIFY', 'it_IT', 'Nuovo fascicolo disponibile ad accesso aperto', 'Gentile lettore,<br />\n<br />\n{$contextName} ha appena reso disponibile ad accesso aperto un fascicolo.<br />\n<br />\nTi invitiamo dunque a visitare il sito web ({$contextUrl}) per trovare articoli e altre risorse di tuo interesse.<br />\n<br />\nGrazie per l\'interesse dimolstrato nei nostri confronti,<br />\n{$editorialContactSignature}', 'Questa email viene inviata ai lettori registrati che hanno chiesto di ricevere un\'email di notifica in caso di uscite ad accesso aperto.'),
('SUBSCRIPTION_BEFORE_EXPIRY', 'it_IT', 'Avviso di abbonamento in scadenza', 'Gentile {$subscriberName}:<br />\n<br />\nIl suo abbonamento a {$contextName} sta per scadere.<br />\n<br />\n{$subscriptionType}<br />\nData di scadenza: {$expiryDate}<br />\n<br />\nPer continuare ad accedere a questa rivista, si rechi sul sito e rinnovi l\'abbonamento. Per l\'accesso utilizzi la sua username, &quot;{$username}&quot;.<br />\n<br />\nPer qualsiasi domanda e ulteriore informazione, non esiti a contattarmi.<br />\n<br />\n{$subscriptionContactSignature}', 'Questa email informa un abbonato della prossima scadenza del suo abbonamento. Fornisce la URL della rivista e le istruzioni per l\'accesso.'),
('SUBSCRIPTION_AFTER_EXPIRY', 'it_IT', 'Abbonamento scaduto', 'Gentile {$subscriberName}:<br />\n<br />\nIl suo abbonamento a  {$contextName} è scaduto.<br />\n<br />\n{$subscriptionType}<br />\nData di scadenza: {$expiryDate}<br />\n<br />\nPer rinnovare l\'abbonamento, si rechi sul nostro sito. Per l\'accesso utilizzi la sua username, &quot;{$username}&quot;.<br />\n<br />\nPer qualsiasi domanda e ulteriore informazione, non esiti a contattarmi.<br />\n<br />\n{$subscriptionContactSignature}', 'Questa email informa un abbonato che il suo abbonamento a  è scaduto. Fornisce la URL della rivista e le istruzioni per l\'accesso.'),
('SUBSCRIPTION_AFTER_EXPIRY_LAST', 'it_IT', 'Abbonamento scaduto - Ultimo avviso', '{$subscriberName}:<br />\n<br />\nIl suo abbonamento a  {$contextName} è scaduto.<br />\nQuesto è l\'ultimo avviso che le inviamo.<br />\n<br />\n{$subscriptionType}<br />\nData di scadenza: {$expiryDate}<br />\n<br />\nPer rinnovare l\'abbonamento, si rechi sul  sito della rivista.<br />\nPer l\'accesso utilizzi la sua username, &quot;{$username}&quot;.<br />\n<br />\nPer qualsiasi domanda e ulteriore informazione, non esiti a contattarmi.<br />\n<br />\n{$subscriptionContactSignature}', 'Questa email informa un abbonato che il suo abbonamento a  è scaduto. Fornisce la URL della rivista e le istruzioni per l\'accesso.'),
('USER_VALIDATE', 'it_IT', 'Convalida il tuo account', '{$userFullName}<br />\n<br />\nHai creato un account in {$contextName}, ma prima di usarlo, devi convalidare il tuo indirizzo email.<br />\n<br />\nPer farlo, clicca semplicemente sul link qui sotto:<br />\n{$activateUrl}<br />\n<br />\n[Se non si apre automaticamente una finestra del browser per la verifica, puoi copiare questo link e incollarlo direttamente nella barra degli indirizzi del tuo browser]<br />\n<br />\nGrazie,<br />\n{$principalContactSignature}', 'Questa email viene spedita a un nuovo utente registrato come benvenuto nel sistema e gli fornisce una nota con il suo nome utente e password.'),
('REVIEWER_REGISTER', 'it_IT', 'Registrazione come revisore per {$contextName}', 'Alla luce delle tue competenze, ci siamo presi la libertà di registrare il tuo nome nella banca dati dei revisori per {$contextName}.<br />\n<br />\nQuesto non implica nessun tipo di impegno da parte tua, ma semplicemente  ci permette di contattarti per proporti la revisione di proposte di pubblicazione per la rivista.<br />\n<br />\nQuando ti proporremo una revisione, potrai vedere il titolo e l\'abstract dell\'articolo in questione, e potrai sempre accettare o rifiutare l\'invito. Puoi anche chiedere in qualsiasi momento di far rimuovere il tuo nome dall\'elenco dei revisori.<br />\n<br />\nTi indico sotto il tuo nome utente e la password, che vengono usate per tutte le interazioni con la rivista attraverso il suo sito web.<br />\nPuoi volere, per esempio, aggiornare il tuo profilo, inclusi i tuoi interessi di revisione.<br />\n<br />\nNome utente: {$username}<br />\nPassword: {$password}<br />\n<br />\nGrazie,<br />\n{$principalContactSignature}', 'Questa email viene spedita a un nuovo revisore registrato come benvenuto nel sistema e gli fornsice una nota con nome utente e password'),
('NOTIFICATION', 'it_IT', 'Nuova notifica da {$siteTitle}', 'Hai ricevuto una nuova notifica da  {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}', NULL),
('EDITOR_DECISION_ACCEPT', 'it_IT', 'Decisione dell\'editor', '&lt;![CDATA[{$authorName}:<br />\n<br />\nAbbiamo raggiunto una decisione riguardo alla Sua submission a {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nLa decisione &amp;#232;:<br />\n<br />\n{$editorialContactSignature}]]&gt;', NULL),
('EDITOR_DECISION_REVISIONS', 'it_IT', 'Decisione dell\'editor', '&lt;![CDATA[{$authorName}:<br />\n<br />\nAbbiamo raggiunto una decisione sulla Sua submission a {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nLa nostra decisione &amp;#232;:<br />\n<br />\n{$editorialContactSignature}]]&gt;', NULL),
('SUBSCRIPTION_RENEW_INSTL', 'it_IT', 'Rinnovo dell\'abbonamento istituzionale', '&lt;![CDATA[&amp;#200; stato rinnovato online un abbonamento istituzionale a {$contextName} con i seguenti dettagli.<br />\n<br />\nTipo di abbonamento:<br />\n{$subscriptionType}<br />\n<br />\nEnte:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDominio (se fornito):<br />\n{$domain}<br />\n<br />\nIP Ranges (se indicato):<br />\n{$ipRanges}<br />\n<br />\nContattare:<br />\n{$userDetails}<br />\n<br />\nMembership (se indicato):<br />\n{$membership}<br />\n<br />\nPer vedere o modificare i dettagli, andare alla pagina: {$subscriptionUrl}]]&gt;', 'Notifica del rinnovo di un abbonamento istituzionale.'),
('SUBSCRIPTION_RENEW_INDL', 'it_IT', 'Rinnovo dell\'abbonamento individuale', '&lt;![CDATA[&amp;#200; stato rinnovato online un abbonamento individuale a {$contextName} con i seguenti dettagli.<br />\n<br />\nTipo di abbonamento:<br />\n{$subscriptionType}<br />\n<br />\nUtente:<br />\n{$userDetails}<br />\n<br />\nMembership (se indicato):<br />\n{$membership}<br />\n<br />\nPer vedere o modificare i dettagli dell\'abbonamento, vai alla pagina: {$subscriptionUrl}]]&gt;', 'Notifica del rinnovo di un abbonamento individuale.'),
('SUBSCRIPTION_PURCHASE_INSTL', 'it_IT', 'Acquisto di un abbonamento istituzionale', '&lt;![CDATA[&amp;#200; stato acquistato un abbonamento istituzionale a {$contextName} con i dettagli indicati sotto.<br />\nPer attivare l\'abbonamento, utilizzare il link fornito sotto e selezionare lo status \'Attivo\'per tale abbonamento.<br />\n<br />\nTipo di abbonamento:<br />\n{$subscriptionType}<br />\n<br />\nEnte:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDominio (se indicato):<br />\n{$domain}<br />\n<br />\nIP Ranges (se indicato):<br />\n{$ipRanges}<br />\n<br />\nContattare:<br />\n{$userDetails}<br />\n<br />\nMembership (se indicato):<br />\n{$membership}<br />\n<br />\nPer vedere o modificare i dettagli, andare alla pagina: {$subscriptionUrl}]]&gt;', 'Questo messaggio iforma il Subscription manager che è stato acquistato online un nuovo abbonamento istituzionale. Informa sulla procedura e fornisce un link all\'abbonamento acquistato.'),
('SUBSCRIPTION_PURCHASE_INDL', 'it_IT', 'Acquisto di un abbonamento individuale', '&lt;![CDATA[&amp;#200; stato acquistato online un abbonamento individuale a {$contextName} con i seguenti dettagli.<br />\n<br />\nTipo di abbonamento:<br />\n{$subscriptionType}<br />\n<br />\nUtente:<br />\n{$userDetails}<br />\n<br />\nMembership (se indicato):<br />\n{$membership}<br />\n<br />\nPer vedere o modificare i dettagli dell\'abbonamento, vai alla pagina: {$subscriptionUrl}]]&gt;', 'Questo messaggio informa il Subscription manager che è stato acquistato online un nuovo abbonamento individuale. Informa sulla procedura e fornisce un link all\'abbonamento acquistato.'),
('EDITOR_DECISION_RESUBMIT', 'it_IT', 'Decisione dell\'editor', '{$authorName}:<br />\n<br />\nAbbiamo raggiunto una decisione riguardo alla Sua submission a {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nLa decisione è:<br />\n<br />\n{$editorialContactSignature}', 'Messaggio dell\'editor all\'autore per informarlo della decisione conclusiva sulla proposta inviata.'),
('EDITOR_DECISION_DECLINE', 'it_IT', 'Decisione dell\'editor', '{$authorName}:<br />\n<br />\nAbbiamo raggiunto una decisione riguardo alla Sua submission a {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\n{$editorialContactSignature}', NULL),
('CITATION_EDITOR_AUTHOR_QUERY', 'it_IT', 'Richiesta di verifica delle citazioni', 'Gentile {$authorFirstName},<br />\n<br />\nTi chiedo la cortesia di verificare la correttezza delle citazioni contenute nell\'articolo  {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nGrazie,<br />\n<br />\n{$userFirstName}<br />\nCopy-Editor, {$contextName}', 'Questo messaggio permette al copyeditor di chiedere a un autore ulteriori informazioni sulle citazioni bibliografiche.'),
('REVISED_VERSION_NOTIFY', 'it_IT', 'Caricamento di versione revisionata', '{$editorialContactName}:<br />\n<br />\nL\'autore {$authorName} ha caricato una versione revisionata di &quot;{$submissionTitle}&quot;.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}', 'Questo messaggio viene inviato automaticamente all\'editor quando un autore carica una versione revisionata di un articolo'),
('REVIEW_REQUEST_SUBSEQUENT', 'it_IT', 'Article Review Request', 'Gentile {$reviewerName}:<br />\n<br />\nti scrivo riguardo alla proposta &quot;{$submissionTitle},&quot; che è in revisione per essere pubblicato da {$contextName}.<br />\n<br />\nSeguendo i suggerimenti emersi in precedenza, l\'autore ha modificato il manoscritto e inviato una nuova versione. Ti sarei grato se volessi aiutarci a valutarla.<br />\n<br />\nTi prego quindi di accedere al sito entro il {$responseDueDate} per comunicare se ti incaricherai o meno della revisione e poi per accedere alla proposta e registrare il tuo parere. Il sito è {$contextUrl}<br />\n<br />\nLa data di scadenza per l\'incarico di revisione è il {$reviewDueDate}.<br />\n<br />\nSe non ricordi la tua username e password, puoi utilizzare la funzione di reset password: {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nTi ringrazio della considerazione<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Questo messaggio viene inviato dall\'editor a un revisore chiedendogli di accettare o rifiutare l\'incarico di revisione di una proposta per un secondo o successivo round di revisione. Esso fornisce informazioni come il titolo e l\'abstract, una data di scadenza e modalità di accesso alla stessa proposta. Questo messaggio viene utilizzato quando il processo di revisione standard è stato selezionato nel Setup, Step 2. (In caso contrario vedi REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),
('REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 'it_IT', 'Richiesta di revisione di un articolo', 'Gentile {$reviewerName}:<br />\n<br />\nTi scrivo riguardo al manoscritto &quot;{$submissionTitle},&quot; in corso di revisione per eventuale pubblicazione in {$contextName}.<br />\n<br />\nL\'autore ha inviato una nuova versione, modificata secondo i suggerimenti ricevuti dai revisori. Tu sarei grato se volessi aiutarci a valutarla.<br />\n<br />\nTi chiedo di autenticarti al sito {$responseDueDate} per indicarmi se intendi accettare l\'incarico o meno e poi per accedere alla proposta e registrare il tuo parere.<br />\n<br />\nLa data di scadenza è il {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nTi ringrazio per la disponibilità<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Questo messaggio viene inviato dall\'editor a un revisore chiedendogli di accettare o rifiutare l\'incarico di revisione di una proposta per un secondo o successivo round di revisione. Esso fornisce informazioni come il titolo e l\'abstract, una data di scadenza e modalità di accesso alla stessa proposta. Questo messaggio viene utilizzato quando il processo di revisione standard è stato selezionato nel Setup, Step 2 ed è abilitato l\'accesso oneclick'),
('REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 'it_IT', 'Richiesta di revisione di un articolo', 'Gentile {$reviewerName}:<br />\n<br />\nTi scrivo riguardo al manoscritto &quot;{$submissionTitle},&quot; proposto per la pubblicazione a {$contextName}.<br />\n<br />\nSeguendo i suggerimenti ricevuti dai revisori, lautore ha inviato una nuova versione modificata. Ti sarei grato se ci aiutassi a valutarla.<br />\n<br />\nPiù sotto trovi le Linee guida sulla revisione e il file del manoscritto è in allegato. Puoi inviarmi la revisione e il tuo parere sulla proposta via email, entro il  {$reviewDueDate}.<br />\n<br />\nPerfavore informami entro il {$responseDueDate} se accetti o meno l\'incarico.<br />\n<br />\nGrazie della disponibilià<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nLinee guida sulla revisione<br />\n<br />\n{$reviewGuidelines}', 'Questo messaggio viene inviato dall\'editor a un revisore chiedendogli di accettare o rifiutare l\'incarico di revisione di una proposta per un secondo o successivo round di revisione. Contiene in allegato il file del manoscritto. Questo messaggio viene utilizzato quando è stato selezionato nel Setup, Step 2 il processo di revisione con allegati email. (In caso contrario vedi REVIEW_REQUEST_SUBSEQUENT.)'),
('PASSWORD_RESET_CONFIRM', 'pt_BR', 'Solicitação de atualização de senha', 'Recebemos uma solicitação para atualizar sua senha de acesso à revista {$siteTitle}.<br />\n<br />\nCaso não tenha feito a solicitação, ignore esta mensagem, para não alterar sua senha.<br />\n<br />\nSe deseja realmente atualizar sua senha, clique no link a seguir.<br />\n<br />\nAtualizar senha: {$url}<br />\n<br />\n{$principalContactSignature}', 'Mensagem enviada a usuário cadastrado quando o mesmo solicita atualização da senha, quando esqueceu a senha ou encontra problemas para acessar o sistema. O link contido permite ao usuário concluir a atualização da senha de acesso.'),
('PASSWORD_RESET', 'pt_BR', 'Senha atualizada', 'Sua senha de acesso ao site {$siteTitle} foi atualizada com sucesso. Guarde o login e a senha, uma vez que serão necessários para todas as atividades relacionadas ao sistema.<br />\n<br />\nSeu login: {$username}<br />\nSenha: {$password}<br />\n<br />\n{$principalContactSignature}', 'Mensagem enviada a usuário cadastrado quando o mesmo informa que esqueceu sua senha ou encontra problemas para acessar o sistema. O link contido permite ao usuário atualizar a senha de acesso.'),
('USER_REGISTER', 'pt_BR', 'Novo usuário cadastrado', '{$userFullName},<br />\n<br />\nAgradecemos o seu cadastro no sistema da revista {$contextName}. Guarde o login e a senha, pois serão necessários para todos os trabalhos junto à revista. Caso deseje ser removido do sistema, entre em contato.<br />\n<br />\nLogin: {$username}<br />\nSenha: {$password}<br />\n<br />\nAgradecendo desde já a atenção dispensada,<br />\n{$principalContactSignature}', 'Mensagem enviada aos usuários recém-cadastrados no sistema, para acolhê-los e proporcionar um registro pessoal do login e da senha.'),
('PUBLISH_NOTIFY', 'pt_BR', 'Nova Edição Publicada', 'Caros leitores,<br />\n<br />\nA revista {$contextName} acaba de publicar seu último número, disponível em {$contextUrl}. Convidamos todos para verificarem o sumário da revista e acessar artigos e outros itens de seu interesse.<br />\n<br />\nAgradecemos pelo seu apoio contínuo e confiança em nosso trabalho,<br />\n{$editorialContactSignature}', 'Mensagem enviada para leitores cadastrados via \"notificação de usuários\"  na página do Editor. Ela convida os leitores a acessar o sistema web da revista para ler a edição mais recente, através da URL informada.'),
('SUBSCRIPTION_NOTIFY', 'pt_BR', 'Confirmação de assinatura', '{$subscriberName},<br />\n<br />\nVocê se tornou assinante da revista {$contextName}, que possui um sistema de gerenciamento online, com os seguintes dados:<br />\n<br />\nTipo de assinatura:<br />\n{$subscriptionType}<br />\n<br />\nPara acessar o conteúdo exclusivo a assinantes basta entrar no sistema com seu login &quot;{$username}&quot; e senha.<br />\n<br />\nUma vez logado no sistema é possível modificar os dados do seu perfil e sua senha a qualquer momento.<br />\n<br />\nEm caso de assinatura institucional, não há necessidade de usuários acessando a partir da instituição logarem no sistema, já que o acesso ao conteúdo para assinantes é autenticado automaticamente.<br />\n<br />\nEm caso de dúvidas, entre em contato via e-mail.<br />\n<br />\n{$subscriptionContactSignature}', 'Mensagem notifica o leitor cadastrado que o Editor criou sua Assinatura. Proporciona todas as informações necessárias para acesso ao conteúdo.'),
('OPEN_ACCESS_NOTIFY', 'pt_BR', 'Nova edição de Acesso Livre', 'Caros leitores,<br />\n<br />\nA {$contextName} acaba de tornar disponível para Acesso Livre mais uma edição. Convidamos a examinar o sumário nesta mensagem e então acessar a revista ({$contextUrl}), para ler os artigos e outros itens de seu proveito.<br />\n<br />\nAgradecemos o interesse e apoio contínuo à revista,<br />\n{$editorialContactSignature}', 'Esta mensagem é enviada a leitores cadastrados que solicitam o recebimento do sumário de uma nova edição de Acesso Livre.'),
('SUBSCRIPTION_BEFORE_EXPIRY', 'pt_BR', 'Aviso de expiração de assinatura', '{$subscriberName},<br />\n<br />\nSua assinatura da revista {$contextName} está prestes a expirar.<br />\n<br />\n{$subscriptionType}<br />\nData de expiração: {$expiryDate}<br />\n<br />\nPara garantir a continuidade de acesso à revista, acesse o sistema com o seu login &quot;{$username}&quot; e renove sua assinatura.<br />\n<br />\nEm caso de dúvidas, entre em contato via e-mail.<br />\n<br />\n{$subscriptionContactSignature}', 'Esta mensagem avisa o assinante da proximidade do término da assinatura. Informa a URL da revista e instruções de acesso.'),
('SUBSCRIPTION_AFTER_EXPIRY', 'pt_BR', 'Expiração de assinatura', '{$subscriberName},<br />\n<br />\nSua assinatura de {$contextName} expirou.<br />\n<br />\n{$subscriptionType}<br />\nData de expiração: {$expiryDate}<br />\n<br />\nPara renovar sua assinatura, acesse o sistema com seu login &quot;{$username}&quot;.<br />\n<br />\nEm caso de dúvidas, entre em contato via e-mail.<br />\n<br />\n{$subscriptionContactSignature}', 'Esta mensagem avisa o assinante da expiração da assinatura. Informa a URL da revista e instruções de acesso.'),
('SUBSCRIPTION_AFTER_EXPIRY_LAST', 'pt_BR', 'Expiração de assinatura - Lembrete final', '{$subscriberName},<br />\n<br />\nSua assinatura da revista {$contextName} expirou.<br />\nEste é o lembrete final que será enviado pelo sistema.<br />\n<br />\n{$subscriptionType}<br />\nData de expiração: {$expiryDate}<br />\n<br />\nPara renovar sua assinatura, acesse o sistema, com seu login &quot;{$username}&quot;.<br />\n<br />\nEm caso de dúvidas, entre em contato via e-mail.<br />\n<br />\n{$subscriptionContactSignature}', 'Esta mensagem é o último aviso ao assinante da expiração da assinatura. Informa a URL da revista e instruções de acesso.'),
('LOCKSS_EXISTING_ARCHIVE', 'pt_BR', 'Solicitação para incluir a revista {$contextName} em seu arquivo', '&lt;![CDATA[Prezada(o) [Nome da(o) Bibliotecária(o) da Universidade],<br />\n<br />\n{$contextName} &lt;{$contextUrl}&gt; é uma revista na qual um docente da sua instituição, [nome da pessoa], possui o papel editorial de [título do papel editorial]. Esta revista deseja estabelecer arquivamento por meio do LOCKSS (Lots of Copies Keep Stuff Safe - Muitas Cópias Mantém as Coisas Seguras) com esta e outras bibliotecas de instituições de ensino superior.<br />\n<br />\n[Breve descrição da revista]<br />\n<br />\nA URL do Manifesto LOCKSS da Editora da nossa revista é: {$contextUrl}/gateway/lockss<br />\n<br />\nConsta do nosso registro que esta biblioteca é participante do sistema LOCKSS. Estamos à disposição caso necessite de metadados adicionais para o cadastro da revista na sua versão do LOCKSS, os quais providenciaremos o mais rápido possível.<br />\n<br />\nEm caso de dúvidas, entre em contato via e-mail.<br />\n<br />\nAgradecendo desde já a atenção dispensada,<br />\n{$principalContactSignature}]]&gt;', 'Mensagem solicita ao administrador de um repositório LOCKSS que considere armazenar a revista em seu arquivo, informando a URL para o Manifesto LOCKSS da Editora da revista.'),
('LOCKSS_NEW_ARCHIVE', 'pt_BR', 'Solicitação de inclusão da revista {$contextName} em seu arquivo', '&lt;![CDATA[Prezada(o) [Nome da(o) Bibliotecária(o) da Universidade],<br />\n<br />\n{$contextName} &lt;{$contextUrl}&gt; é uma revista na qual um docente da sua instituição, [nome da pessoa], possui o papel editorial de [título do papel editorial]. Esta revista deseja estabelecer arquivamento por meio do LOCKSS (Lots of Copies Keep Stuff Safe - Muitas Cópias Mantém as Coisas Seguras) com esta e outras bibliotecas de instituições de ensino superior.<br />\n<br />\n[Breve descrição da revista]<br />\n<br />\nO sistema LOCKSS &lt;http://lockss.org/&gt;, uma iniciativa internacional de bibliotecas e editores, é um exemplo funcional de um repositório digital de preservação e arquivamento distribuído. O sistema, que é operado em ambiente tecnológico idêntico ao de um computador pessoal, é gratuito, permite sua implementação e disponibilização online rápida, e sua manutenção é mínima.<br />\n<br />\nPara auxiliar no arquivamento de nossa revista, convidamos sua biblioteca a se tornar membro da comunidade LOCKSS, e ajudar a colecionar e preservar títulos produzidos mundialmente. Para isso, visite o site do LOCKSS para saber como funciona o sistema e como fazer parte da comunidade.<br />\n<br />\nAguardamos resposta sobre sua disponibilidade para arquivamento desta revista.<br />\n<br />\nAgradecendo desde já a atenção dispensada,<br />\n{$principalContactSignature}]]&gt;', 'Mensagem convida o destinatário a participar da iniciativa LOCKSS e incluir a revista no seu repositório, oferecendo informações iniciais e sobre como participar. O remetente deverá preencher as informações, substituindo o que estiver em colchetes!'),
('SUBMISSION_ACK', 'pt_BR', 'Agradecimento pela submissão', '{$authorName},<br />\n<br />\nAgradecemos a submissão do trabalho &quot;{$submissionTitle}&quot; para a revista {$contextName}.<br />\nAcompanhe o progresso da sua submissão por meio da interface de administração do sistema, disponível em:<br />\n<br />\nURL da submissão: {$submissionUrl}<br />\nLogin: {$authorUsername}<br />\n<br />\nEm caso de dúvidas,  entre em contato via e-mail.<br />\n<br />\nAgradecemos mais uma vez considerar nossa revista como meio de compartilhar seu trabalho.<br />\n<br />\n{$editorialContactSignature}', 'Mensagem enviada automaticamente pelo sistema ao autor, quando habilitada, ao ser concluído o processo de submissão de um trabalho à revista. Oferece informações sobre os mecanismos para acompanhamento do trabalho durante o processo editorial, e serve como registro e confirmação da submissão.'),
('SUBMISSION_ACK_NOT_USER', 'pt_BR', 'Agradecimento pela submissão', 'Olá,<br />\n<br />\n{$submitterName} submeteu o manuscrito &quot;{$submissionTitle}&quot; à editora {$contextName}. <br />\n<br />\nEm caso de dúvidas, entre em contato. Agradecemos por considerar nossa editora como um veículo para seus trabalhos.<br />\n<br />\n{$editorialContactSignature}', 'Quando habilitada, esta mensagem é enviada automaticamente aos coautores informados durante o processo de submissão, que não estão cadastrados no OMP.'),
('SUBMISSION_COMMENT', 'pt_BR', 'Comentário sobre a submissão', '{$name},<br />\n<br />\n{$commentName} enviou um comentário sobre a submissão &quot;{$submissionTitle}&quot; em {$contextName}:<br />\n<br />\n{$comments}', 'Mensagem notifica várias pessoas envolvidas no processo de edição de uma submissão que um comentário foi enviado.'),
('SUBMISSION_DECISION_REVIEWERS', 'pt_BR', 'Decisão sobre \"{$submissionTitle}\"', 'Como avaliador designado para a avaliação da submissão &quot;{$submissionTitle}&quot; a {$contextName}, encaminho aqui as avaliações e a decisão editorial enviadas ao autor deste trabalho.<br />\n<br />\nAgradecemos sua contribuição, fundamental para garantir a qualidade deste processo.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n{$comments}', 'Mensagem notifica os avaliadores de uma submissão que o processo de avaliação foi concluído. Inclui informações sobre o artigo e a decisão tomada, além de agradecer pela contribuição.'),
('EDITOR_ASSIGN', 'pt_BR', 'Tarefa editorial', '{$editorialContactName},<br />\n<br />\nComo parte de suas funções como editor de seção, designamos para seu acompanhamento do processo editorial a submissão &quot;{$submissionTitle}&quot; para a revista {$contextName}.<br />\n<br />\nURL da submissão: {$submissionUrl}<br />\nlogin: {$editorUsername}<br />\n<br />\nAgradecendo desde já a atenção dispensada,<br />\n{$editorialContactSignature}', 'Mensagem notifica o Editor de Seção que uma nova tarefa de acompanhamento de submissão lhe foi designada pelo Editor-Gerente. Oferece informações sobre a submissão e como acessar o sistema.'),
('REVIEW_REQUEST', 'pt_BR', 'A revista {$contextName} solicita avaliação de artigo', '{$reviewerName},<br />\n<br />\nAcredito que seu conhecimento será fundamental para realizar a avaliação do trabalho &quot;{$submissionTitle}&quot; submetido a {$contextName}. Informações sobre a submissão encontram-se nesta mensagem, e espero que considere assumir esta importante responsabilidade.<br />\n<br />\nAcesse o sistema até {$responseDueDate} para informar se estará disponível ou não para realizar a avaliação, bem como acessar os dados completos da submissão e registrar sua avaliação e recomendações, por meio da URL {$contextUrl}.<br />\n<br />\nO prazo para a conclusão da avaliação é {$reviewDueDate}.<br />\n<br />\nCaso não tenha seu login e senha de acesso para acessar o sistema, use o link a seguir para que o sistema crie uma nova senha que lhe será enviada via e-mail, após mensagem de confirmação de solicitação de atualização de senha, junto com o seu login. Clique no link a seguir para criar sua nova senha: {$passwordResetUrl}<br />\n<br />\nClique no link baixo para acessar o sistema e a submissão designada.<br />\nURL da submissão: {$submissionReviewUrl}<br />\n<br />\nAgradecemos desde já sua atenção.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n---------------------------------------------------------------<br />\nDados da submissão<br />\n<br />\nTítulo<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n<br />\n<br />\nResumo<br />\n{$submissionAbstract}', 'Mensagem do Editor de Seção para solicitar ao Avaliador que indique disponibilidade ou não para realizar uma avaliação. Oferece informações sobre a submissão, como título e resumo, além da data para a conclusão dos trabalhos e como acessar o documento. Esta mensagem é usada quando se utiliza o Processo Padrão de Avaliação, definido no Passo 2 de Configuração da Revista. (Caso contrário veja REVIEW_REQ_MULTI_ATTACHED e REVIEW_REQUEST_ATTACHED.)'),
('REVIEW_REQUEST_ONECLICK', 'pt_BR', 'Solicita avaliação de artigo', '{$reviewerName},<br />\n<br />\nAcredito que seu conhecimento será fundamental para realizar a avaliação do manuscrito &quot;{$submissionTitle}&quot; submetido a {$contextName}. Informações sobre a submissão encontram-se abaixo, e espero que considere assumir esta importante responsabilidade.<br />\n<br />\nAcesse o sistema até {$responseDueDate} para informar se estará disponível ou não para realizar a avaliação, bem como acessar os dados completos da submissão e registrar sua avaliação e recomendações.<br />\n<br />\nO prazo para a entrega da avaliação é {$reviewDueDate}.<br />\n<br />\nURL da Submissão: {$submissionReviewUrl}<br />\nA URL da submissão permite acesso direto, sem a necessidade de informar login e senha, que serão necessários para acessar outras áreas.<br />\n<br />\nAgradecendo desde já a atenção dispensada,<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n----------------------------------------------------<br />\nDados da submissão<br />\n<br />\nTítulo:<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n<br />\n<br />\nResumo:<br />\n{$submissionAbstract}', 'Mensagem do Editor de Seção para solicitar ao Avaliador que indique disponibilidade ou não para realizar uma avaliação. Oferece informações sobre a submissão, como título e resumo, além da data para a conclusão dos trabalhos e como acessar o documento. Esta mensagem é usada quando se utiliza o Processo Padrão de Avaliação, definido no Passo 2 de Configuração da Revista e a opção de acesso one-click está habilitada (Caso contrário veja REVIEW_REQ_MULTI_ATTACHED e REVIEW_REQUEST_ATTACHED).'),
('REVIEW_REQUEST_ATTACHED', 'pt_BR', 'A revista {$contextName} solicita avaliação de artigo', '{$reviewerName},<br />\n<br />\nAcredito que seu conhecimento será fundamental para realizar a avaliação do trabalho &quot;{$submissionTitle}&quot; submetido a {$contextName}.<br />\nAs diretrizes de avaliação encontram-se no final desta mensagem, e a submissão encontra-se em anexo.<br />\nO prazo para avaliar a submissão, bem como definir sua recomendação, devem ser enviadas via e-mail até {$reviewDueDate}.<br />\n<br />\nResponda a esta mensagem até {$responseDueDate} se estará disponível ou não para realizar a avaliação.<br />\n<br />\nEspero que considere assumir esta importante responsabilidade.<br />\n<br />\nAgradecemos desde já sua atenção.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n---------------------------------------------------------------<br />\nDiretrizes de avaliação<br />\n<br />\n{$reviewGuidelines}', NULL),
('REVIEW_CANCEL', 'pt_BR', 'Cancelamento de solicitação de avaliação', '{$reviewerName},<br />\n<br />\nEstamos cancelando a solicitação de avaliação da submissão &quot;{$submissionTitle}&quot; à revista {$contextName}.<br />\n<br />\nLamentamos qualquer inconveniente causado e esperamos poder contar com seus préstimos em outra oportunidade.<br />\n<br />\nEm caso de dúvidas, entre em contato via e-mail.<br />\n<br />\n{$editorialContactSignature}', 'Mensagem enviada pelo Editor de Seção com um processo de avaliação em andamento, notificando que o processo em questão foi cancelado.'),
('REVIEW_CONFIRM', 'pt_BR', 'Disponível para realizar avaliação', '{$editorialContactName},<br />\n<br />\nEstou disponível e interessado em avaliar a submissão &quot;{$submissionTitle}&quot; a {$contextName}. Agradeço a consideração e pretendo concluir a avaliação até a data definida, {$reviewDueDate}, ou antes do prazo.<br />\n<br />\n{$reviewerName}', 'Mensagem enviada pelo Avaliador ao Editor de Seção, em resposta à solicitação de avaliação, para notificar disponibilidade para realizar a tarefa e de que a mesma será concluída no prazo especificado.'),
('REVIEW_DECLINE', 'pt_BR', 'Indisponível para realizar avaliação', '{$editorialContactName},<br />\n<br />\nSinto informar que estou indisponível no momento para realizar a avaliação da submissão &quot;{$submissionTitle}&quot; à revista {$contextName}. Agradeço a consideração, e espero poder ser convocado e estar disponível em outra oportunidade.<br />\n<br />\n{$reviewerName}', 'Mensagem enviada pelo Avaliador ao Editor de Seção, em resposta à solicitação de avaliação, para notificar sua NÃO disponibilidade para realizar a tarefa, rejeitando a solicitação.'),
('REVIEW_ACK', 'pt_BR', 'Agradecimento pela avaliação', '{$reviewerName},<br />\n<br />\nAgradecemos ter concluído a avaliação da submissão &quot;{$submissionTitle}&quot; à revista {$contextName}.<br />\n<br />\nSua contribuição é fundamental para a qualidade dos trabalhos publicados.<br />\n<br />\n{$editorialContactSignature}', 'Mensagem enviada pelo Editor de Seção ao Avaliador para confirmar recebimento e agradecer o avaliador pela conclusão da avaliação.'),
('REVIEW_REMIND', 'pt_BR', 'Lembrete de soclitação de avaliação', '{$reviewerName},<br />\n<br />\nEste é apenas um lembrete quanto à solicitação de avaliação da submissão &quot;{$submissionTitle}&quot; à revista {$contextName}.<br />\nEsperamos receber sua avaliação até {$reviewDueDate}, e aguardamos o recebimento assim que for possível.<br />\n<br />\nCaso não possua o login e a senha para acessar o sistema da revista, use o link a seguir para criar uma nova senha, que lhe será enviada via email junto com o seu login.<br />\nCriar nova senha: {$passwordResetUrl}.<br />\n<br />\nClique no link a seguir para acessar a submissão e realizar a avaliação.<br />\nURL da Submissão: {$submissionReviewUrl}<br />\n<br />\nConfirme sua disponibilidade para concluir sua avaliação, uma contribuição vital para a qualidade desta publicação.<br />\n<br />\nAguardando seu contato,<br />\n<br />\n{$editorialContactSignature}', 'Mensagem enviada pelo Editor de Seção ao Avaliador como lembrete da tarefa de avaliação em andamento ainda não concluída.'),
('REVIEW_REMIND_ONECLICK', 'pt_BR', 'Lembrete de solicitação de avaliação', '{$reviewerName},<br />\n<br />\nEsta mensagem é apenas um lembrete quanto à solicitação de avaliação da submissão &quot;{$submissionTitle}&quot; a {$contextName}.<br />\nEsperamos receber a avaliação até {$reviewDueDate}, e aguardamos o recebimento assim que for possível.<br />\n<br />\nClique no link a seguir para realizar a avaliação.<br />\nURL da Submissão: {$submissionReviewUrl}<br />\n<br />\nConfirme sua disponibilidade para concluir sua avaliação, uma contribuição vital para a qualidade desta publicação.<br />\n<br />\nAguardando seu contato,<br />\n<br />\n{$editorialContactSignature}', 'Mensagem enviada pelo Editor de Seção ao Avaliador como lembrete da tarefa de avaliação em andamento ainda não concluída.'),
('REVIEW_REMIND_AUTO', 'pt_BR', 'Lembrete automático de solicitação de avaliação', '{$reviewerName},<br />\n<br />\nEste é um lembrete automático, referente à solicitação de avaliação da submissão &quot;{$submissionTitle}&quot; a {$contextName}.<br />\n<br />\nEsperávamos receber a avaliação até {$reviewDueDate}, e este e-mail foi enviado automaticamente pois o prazo para entrega foi ultrapassado.<br />\nAguardamos o recebimento da avaliação assim que for possível concluí-la.<br />\n<br />\nCaso não possua o login e a senha para acessar o sistema da revista, use o link a seguir para criar uma nova senha, que lhe será enviada via e-mail junto com o seu login.<br />\nCriar nova senha: {$passwordResetUrl}.<br />\n<br />\nURL da Submissão: {$submissionReviewUrl}<br />\n<br />\nConfirme sua disponibilidade para concluir a avaliação, uma contribuição vital para a qualidade desta publicação.<br />\n<br />\nAguardando seu contato,<br />\n<br />\n{$editorialContactSignature}', 'Mensagem enviada automaticamente ao avaliador quando a data de conclusão de avaliação for ultrapassada (veja as Opções de Avaliação no Passo 2 da Configuração da Revista). Tarefas agendadas devem ser habilitadas e configuradas (veja o arquivo de configuração do sistema).'),
('REVIEW_REMIND_AUTO_ONECLICK', 'pt_BR', 'Lembrete automático de solicitação de avaliação', '{$reviewerName},<br />\n<br />\nEste é um lembrete automático, referente à solicitação de avaliação da submissão &quot;{$submissionTitle}&quot; a {$contextName}.<br />\n<br />\nO prazo para entrega da avaliação era {$reviewDueDate}, e este e-mail foi enviado automaticamente pois o prazo se esgotou.<br />\nAguardamos o recebimento da avaliação assim que for possível concluí-la.<br />\n<br />\nURL da Submissão: {$submissionReviewUrl}<br />\n<br />\nConfirme sua disponibilidade para concluir a avaliação, uma contribuição vital para a qualidade desta publicação.<br />\n<br />\nAguardando seu contato,<br />\n<br />\n{$editorialContactSignature}', 'Mensagem enviada automaticamente ao avaliador quando a data de conclusão de avaliação for ultrapassada (veja as Opções de Avaliação no Passo 2 da Configuração da Revista) e o acesso 1-Clique estiver ativado. Tarefas agendadas devem ser habilitadas e configuradas (veja o arquivo de configuração do sistema).'),
('COPYEDIT_REQUEST', 'pt_BR', 'Solicitação de edição de texto', '{$participantName},<br />\n<br />\nSolicito a edição de texto do trabalho&quot;{$submissionTitle}&quot;, submetido à revista {$contextName}, conforme os passos a seguir:<br />\n<br />\n1. Clique na URL da submissão, informado mais adiante nesta mensagem.<br />\n2. Acesse o sistema e clique no arquivo que aparece no Passo 1.<br />\n3. Consulte as instruções para edição de texto na página<br />\n4. Abra o arquivo baixado e realize as alterações necessárias, incluindo perguntas ao autor onde necessário.<br />\n5. Salve o arquivo editado e envie o arquivo no Passo 1.<br />\n5. Clique no ícone de e-mail sob CONCLUÍDO e envie a mensagem ao editor.<br />\n<br />\nURL da revista {$contextName}: {$contextUrl}<br />\nURL da Submissão: {$submissionUrl}<br />\nLogin: {$participantUsername}<br />\n<br />\nCaso não esteja disponível para assumir esta responsabilidade no momento, ou em caso de dúvidas, entre em contato via e-mail.<br />\n<br />\nAgradecemos desde já sua colaboração, fundamental para a qualidade da revista.<br />\n<br />\n{$editorialContactSignature}', 'Mensagem enviada pelo Editor de Seção solicitando a realização de uma tarefa de edição ao Editor de Texto, com informações sobre e como acessar o documento.'),
('LAYOUT_REQUEST', 'pt_BR', 'Solicitação de composições', '{$participantName},<br />\n<br />\nSolicito a preparação das composições do manuscrito &quot;{$submissionTitle}&quot;, submetido à revista {$contextName}, conforme instruções a seguir:<br />\n<br />\n1. Clique na URL da submissão, informada mais adiante nesta mensagem.<br />\n2. Acesse o sistema e, usando a Versão de Layout como referência, produza as composições de acordo com os padrões desta revista.<br />\n3. Clique no ícone de e-mail sob CONCLUÍDO e envie a mensagem ao editor.<br />\n<br />\nURL da revista {$contextName}: {$contextUrl}<br />\nURL da Submissão: {$submissionLayoutUrl}<br />\nLogin: {$participantUsername}<br />\n<br />\nCaso não esteja disponível para assumir esta responsabilidade no momento, ou tenha quaisquer dúvidas, entre em contato via e-mail.<br />\n<br />\nAgradecemos desde já sua colaboração, fundamental para a qualidade da revista.<br />\n<br />\n{$editorialContactSignature}', 'Mensagem enviada pelo Editor de Seção ao Editor de Layout, solicitando que sejam preparadas as Composições do texto final, com informações de acesso.'),
('LAYOUT_COMPLETE', 'pt_BR', 'Composições concluídas', '{$editorialContactName},<br />\n<br />\nAs composições do trabalho &quot;{$submissionTitle}&quot;, submetido à revista {$contextName}, estão prontas para leitura de provas.<br />\n<br />\nEm caso de dúvidas, entre em contato via e-mail.<br />\n<br />\n{$participantName}', 'Mensagem enviada pelo Editor de Layout ao Editor de Seção, informando sobre a conclusão das composições.'),
('LAYOUT_ACK', 'pt_BR', 'Agradecimento pelas composições', '{$participantName},<br />\n<br />\nAgradecemos a preparação das composições do trabalho &quot;{$submissionTitle}&quot;, submetido à revista {$contextName}.<br />\n<br />\nSua contribuição é fundamental para o processo editorial e a qualidade desta publicação.<br />\n<br />\n{$editorialContactSignature}', 'Mensagem enviada pelo Editor de Seção ao Editor de Layout, agradecendo pela conclusão das composições.');
INSERT INTO `email_templates_default_data` (`email_key`, `locale`, `subject`, `body`, `description`) VALUES
('PROOFREAD_AUTHOR_REQUEST', 'pt_BR', 'Solicitação de leitura de provas ao autor', '{$authorName},<br />\n<br />\nSolicitamos a leitura de provas do trabalho&quot;{$submissionTitle}&quot;, submetido à revista {$contextName}, conforme as instruções a seguir:<br />\n<br />\n1. Clique na URL da submissão, informada mais adiante nesta mensagem.<br />\n2. Acesse o sistema da revista e leia as INSTRUÇÕES PARA LEITURA DE PROVAS<br />\n3. Clique em LER PROVA na seção Layout e revise a composição nos formatos disponíveis.<br />\n4. Informe as solicitações de correções (tipográficos e de formatação) em Correções da prova<br />\n5. Salve e envie o e-mail com as correções ao editor de layout e ao leitor de prova.<br />\n6. Clique no ícone de e-mail sob CONCLUÍDO e envie a mensagem ao editor.<br />\n<br />\nURL da Submissão: {$submissionUrl}<br />\n<br />\nEm caso de dúvidas, entre em contato via e-mail.<br />\n<br />\nAgradecemos desde já sua colaboração, fundamental para a qualidade da revista.<br />\n<br />\n{$editorialContactSignature}', 'Mensagem enviada pelo Editor de Seção ao autor, solicitando que verifique o trabalho realizado pelo Editor de Layou, com informações sobre acesso e avisando que somente é possível corrigir erros tipográficos de de layout.'),
('PROOFREAD_AUTHOR_COMPLETE', 'pt_BR', 'Conclusão da leitura de provas pelo autor', '{$editorialContactName},<br />\n<br />\nConcluí a leitura de provas do trabalho &quot;{$submissionTitle}&quot;, submetido à revista {$contextName}.<br />\nAs correções estão disponíveis para serem incorporadas pelo editor de layout e verificadas pelo leitor de prova.<br />\n<br />\n{$authorName}', 'Mensagem enviada pelo Autor ao Editor de Seção, informando a conclusão da Leitura de Provas.'),
('PROOFREAD_AUTHOR_ACK', 'pt_BR', 'Agradecimento pela leitura de provas pelo autor', '{$authorName},<br />\n<br />\nAgradecemos a conclusão da leitura de provas do seu trabalho, &quot;{$submissionTitle}&quot; submetido à revista {$contextName}.<br />\nEm breve seu trabalho estará pronto para publicação.<br />\n<br />\nCaso tenha habilitado o serviço de notificação, você receberá o Sumário via e-mail assim que a revista for publicada.<br />\n<br />\nEm caso de dúvidas, entre em contato.<br />\n<br />\n{$editorialContactSignature}', 'Mensagem enviada pelo Editor de Seção ao autor, agradecendo a conclusão da Leitura de Provas.'),
('PROOFREAD_REQUEST', 'pt_BR', 'Solicitação de leitura de provas', '{$proofreaderName},<br />\n<br />\nSolicito a leitura de provas do trabalho &quot;{$submissionTitle}&quot;, submetido à revista {$contextName}, conforme instruções a seguir:<br />\n<br />\n1. Clique na URL da submissão, informada mais adiante nesta mensagem.<br />\n2. Acesse o sistema da revista e leia as INSTRUÇÕES PARA LEITURA DE PROVAS.<br />\n3. Clique em VER PROVA na seção Layout e verifique as composições nos formatos disponíveis.<br />\n4. Informe correções (tipográficas e de formatação) em Correções da Prova.<br />\n5. Salve e envie as correções via e-mail ao editor de layout.<br />\n6. Clique no ícone de e-mail sob CONCLUÍDO e envie a mensagem ao editor.<br />\n<br />\nURL da Submissão: {$submissionUrl}<br />\nLogin: {$proofreaderUsername}<br />\n<br />\nCaso não esteja disponível para assumir esta responsabilidade no momento, ou tenha quaisquer dúvidas, entre em contato via e-mail.<br />\n<br />\nAgradecemos desde já sua colaboração, fundamental para a qualidade da revista.<br />\n<br />\n{$editorialContactSignature}', 'Mensagem enviada pelo Editor de Seção ao Leitor de Provas, solicitando que verifique o trabalho realizado pelo Editor de Layout e o autor, verificando os comentários e alterações solicitadas. É o último momento para verificar a qualidade do documento e evitar possíveis erros antes da publicação.'),
('PROOFREAD_COMPLETE', 'pt_BR', 'Leitura de provas concluída', '{$editorialContactName},<br />\n<br />\nConcluí a leitura de provas do trabalho&quot;{$submissionTitle}&quot;, submetido à revista {$contextName}.<br />\nAs correções estão disponíveis para serem incorporadas pelo editor de layout.<br />\n<br />\n{$proofreaderName}', 'Mensagem enviada pelo Leitor de Provas ao Editor de Seção, informando a conclusão da Leitura de Provas.'),
('PROOFREAD_ACK', 'pt_BR', 'Agradecimento pela leitura de provas', '{$proofreaderName},<br />\n<br />\nAgradecemos a leitura de provas do trabalho&quot;{$submissionTitle}&quot;, submetido à revista {$contextName}.<br />\n<br />\nSua contribuição é fundamental para a qualidade desta publicação.<br />\n<br />\n{$editorialContactSignature}', 'Mensagem enviada pelo Editor de Seção ao Leitor de Provas, agradecendo pelo trabalho concluído de Leitura de Provas.'),
('PROOFREAD_LAYOUT_REQUEST', 'pt_BR', 'Solicitação de leitura de provas pelo Editor de Layout', '{$participantName},<br />\n<br />\nO autor e o leitor de provas concluíram a leitura de provas do trabalho &quot;{$submissionTitle}&quot;, submetido à revista {$contextName}.<br />\nAs correções devem agora ser incorporadas conforme instruções a seguir:<br />\n<br />\n1. Clique na URL da submissão, informada mais adiante nesta mensagem.<br />\n2. Acesse o sistema da revista e consulte as Correções da prova para a atualizar as composições.<br />\n3. Envie as composições corrigidas.<br />\n4. Clique no ícone de e-mail sob CONCLUÍDO no Passo 3 da seção Leitura de provas, e envie a mensagem ao editor.<br />\n<br />\nURL da revista {$contextName}: {$contextUrl}<br />\nURL da Submissão: {$submissionUrl}<br />\nLogin: {$participantUsername}<br />\n<br />\nCaso não esteja disponível para assumir esta responsabilidade no momento, ou em caso de dúvidas, entre em contato através deste e-mail.<br />\n<br />\nAgradecemos desde já sua colaboração, fundamental para a qualidade da revista.<br />\n<br />\n{$editorialContactSignature}', 'Mensagem enviada pelo Editor de Seção ao Editor de Layout, solicitando que verifique os comentários e realize as alterações solicitadas após a Leitura de Provas. Possui informações sobre acesso ao sistema e ao documento'),
('PROOFREAD_LAYOUT_COMPLETE', 'pt_BR', 'Leitura de provas concluída pelo Editor de Layout', '{$editorialContactName},<br />\n<br />\nAs composições do trabalho &quot;{$submissionTitle}&quot;, submetido à revista  {$contextName}, foram corrigidas, segundo as solicitações da leitura de provas, e estão prontas para publicação.<br />\n<br />\n{$participantName}', 'Mensagem enviada pelo Editor de Layout ao Editor de Seção, informando a conclusão das novas composições, após Leitura de Provas'),
('PROOFREAD_LAYOUT_ACK', 'pt_BR', 'Agradecimento pela leitura de provas pelo Editor de Layout', '{$participantName},<br />\n<br />\nAgradecemos a conclusão da leitura de provas e as correções realizadas às composições do manuscrito &quot;{$submissionTitle}&quot;, submetido à revista {$contextName}.<br />\n<br />\nSua contribuição é fundamental para a qualidade desta publicação.<br />\n<br />\n{$editorialContactSignature}', 'Mensagem enviada pelo Editor de Seção ao Editor de Layout, agradecendo pela conclusão das composições, após a Leitura de Provas'),
('EMAIL_LINK', 'pt_BR', 'Artigo interessante para sua leitura', 'Acredito ser de seu interesse o artigo &quot;{$submissionTitle}&quot;, de {$authorName}, publicado na revista {$contextName}, V. {$volume}, n. {$number}, Ano {$year}, disponível em &quot;{$articleUrl}&quot;.', 'Mensagem enviada por um leitor a um colega, sobre um artigo considerado de seu interesse, com link para acesso e informações sobre a revista e a edição onde o documento foi publicado.'),
('USER_VALIDATE', 'pt_BR', 'Validação de cadastro', '{$userFullName},<br />\n<br />\nSeu cadastro foi criado na revista {$contextName}, porém é necessário validar o endereço de e-mail para finalizar o processo.<br />\nPara validar seu cadastro e acessar o sistema e seus recursos, acesse a URL a seguir:<br />\n<br />\n{$activateUrl}<br />\n<br />\nAtenciosamente,<br />\n<br />\n{$principalContactSignature}', 'Mensagem de boas-vindas enviada a novo usuário cadastrado, para ativação de cadastro.'),
('REVIEWER_REGISTER', 'pt_BR', 'Cadastro como avaliador na revista {$contextName}', 'Devido ao conhecimento excepcional na sua área de atuação, tomamos a liberdade de cadastrá-lo na base de dados de avaliadores da revista {$contextName}.<br />\n<br />\nSeu cadastro não significa assumir responsabilidade alguma, apenas permitindo-nos solicitar a avaliação de submissões, de acordo com seus interesses informados no perfil.<br />\n<br />\nAo ser convidado para avaliar um artigo, estarão disponíveis informações como o título e resumo da submissão, podendo aceitar ou rejeitar o convite. Caso deseje ser removido da lista, basta entrar em contato a qualquer tempo solicitando sua remoção.<br />\n<br />\nSeus dados de acesso, login e senha, utilizados para interagir com o sistema e realizar atividades, como por exemplo atualizar seu perfil e a área de interesse para avaliação, estão incluídos nesta mensagem.<br />\n<br />\nLogin: {$username}<br />\nSenha: {$password}<br />\n<br />\nEsperamos poder contar com sua colaboração para garantir a qualidade desta publicação.<br />\n<br />\nAtenciosamente,<br />\n<br />\n{$principalContactSignature}', 'Mensagem de boas-vindas enviada a novo avaliador cadastrado no sistema, com login e senha para acesso.'),
('NOTIFICATION', 'pt_BR', 'Nova notificação de {$siteTitle}', 'Você possui uma nova notificação de {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}', 'Esta mensagem é enviada a usuários cadastrados que escolheram habilitar este tipo de notificação via email.'),
('EDITOR_DECISION_ACCEPT', 'pt_BR', 'Decisão editorial', '{$authorName},<br />\n<br />\nFoi tomada uma decisão sobre o artigo submetido à revista {$contextName},<br />\n&quot;{$submissionTitle}&quot;.<br />\n<br />\nA decisão é: Submissão aceita.<br />\n<br />\n{$editorialContactSignature}', 'Esta é uma mensagem do Editor/Editor de Seção ao autor para notificá-lo da decisão editorial (final) tomada sobre a submissão.'),
('EDITOR_DECISION_REVISIONS', 'pt_BR', 'Decisão editorial', '{$authorName}:<br />\n<br />\nFoi tomada uma decisão sobre o artigo submetido à {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nA decisão é: Revisões necessárias.<br />\n<br />\n{$editorialContactSignature}', 'Esta mensagem é enviada pelo do Editor/Editor de Seção ao autor, notificando-o da decisão final tomada sobre a submissão.'),
('EDITOR_DECISION_RESUBMIT', 'pt_BR', 'Decisão editorial', '{$authorName}:<br />\n<br />\nFoi tomada uma decisão sobre o artigo enviado à revista {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nA decisão é: Submeter novamente.<br />\n<br />\n{$editorialContactSignature}', 'Esta mensagem do Editor/Editor de Seção ao autor notifica sobre a decisão editorial final tomada sobre a submissão.'),
('EDITOR_DECISION_DECLINE', 'pt_BR', 'Decisão editorial', '{$authorName}:<br />\n<br />\nFoi tomada uma decisão sobre o artigo submetido à revista {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nA decisão é: Submissão rejeitada.<br />\n<br />\n{$editorialContactSignature}', 'Esta mensagem do Editor/Editor de Seção ao autor notifica sobre a decisão final tomada sobre a submissão.'),
('SUBSCRIPTION_PURCHASE_INDL', 'pt_BR', 'Aquisição de Assinatura: Individual', 'Uma assinatura individual para a revista {$contextName} foi adquirida online, detalhada a seguir.<br />\n<br />\nTipo de assinatura:<br />\n{$subscriptionType}<br />\n<br />\nUsuário:<br />\n{$userDetails}<br />\n<br />\nRegistro em entidade de classe (caso informado):<br />\n{$membership}<br />\n<br />\nPara visualizar ou editar esta assinatura, acesse a URL a seguir.<br />\n<br />\nURL da assinatura: {$subscriptionUrl}', 'Esta mensagem notifica o Gerente de Assinaturas que uma assinatura individual foi adquirida online. Oferece informações sobre a assinatura e um link para acesso rápido à mesma.'),
('SUBSCRIPTION_PURCHASE_INSTL', 'pt_BR', 'Aquisição de Assinatura: Institucional', 'Uma assinatura institucional para a revista {$contextName} foi adquirida online, detalhada a seguir.<br />\nPara ativar esta assinatura, clique na URL da assinatura e define a situação para \'Ativo\'.<br />\n<br />\nTipo de assinatura:<br />\n{$subscriptionType}<br />\n<br />\nInstituição:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomínio (caso informado):<br />\n{$domain}<br />\n<br />\nFaixas de IP (caso informado):<br />\n{$ipRanges}<br />\n<br />\nContato:<br />\n{$userDetails}<br />\n<br />\nRegistro em entidade de classe (caso informado):<br />\n{$membership}<br />\n<br />\nPara visualizar ou editar esta assinatura, acesse a URL a seguir.<br />\n<br />\nURL da assinatura: {$subscriptionUrl}', 'Esta mensagem notifica o Editor Gerente que uma assinatura institucional foi adquirida online. Oferece informações sobre a assinatura e um link para acesso rápido à mesma.'),
('SUBSCRIPTION_RENEW_INDL', 'pt_BR', 'Renovação de Assinatura Individual', 'Uma assinatura individual para a revista {$contextName} foi renovada online, detalhada a seguir.<br />\n<br />\nTipo de assinatura:<br />\n{$subscriptionType}<br />\n<br />\nUsuário:<br />\n{$userDetails}<br />\n<br />\nRegistro em entidade de classe (caso informado):<br />\n{$membership}<br />\n<br />\nPara visualizar ou editar esta assinatura, acesse a URL a seguir.<br />\n<br />\nURL: {$subscriptionUrl}', 'Esta mensagem notifica o Editor Gerente que uma assinatura individual foi renovada online. Oferece informações sobre a assinatura e um link para acesso rápido à mesma.'),
('SUBSCRIPTION_RENEW_INSTL', 'pt_BR', 'Renovação de Assinatura Institucional', 'Uma assinatura institucional para a revista {$contextName} foi renovada online, detalhada a seguir.<br />\n<br />\nTipo de assinatura:<br />\n{$subscriptionType}<br />\n<br />\nInstituição:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomínio (caso informado):<br />\n{$domain}<br />\n<br />\nFaixas de IP (caso informado):<br />\n{$ipRanges}<br />\n<br />\nContato:<br />\n{$userDetails}<br />\n<br />\nRegistro em entidade de classe (caso informado):<br />\n{$membership}<br />\n<br />\nPara visualizar ou editar esta assinatura, acesse a URL a seguir.<br />\n<br />\nURL: {$subscriptionUrl}', 'Esta mensagem notifica o Editor Gerente que uma assinatura institucional foi renovada online. Oferece informações sobre a assinatura e um link para acesso rápido à mesma.'),
('CITATION_EDITOR_AUTHOR_QUERY', 'pt_BR', 'Edição de citação', '{$authorFirstName},<br />\n<br />\nSolicitamos verificar ou encaminhar a citação correta para a seguinte referência do seu artigo, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nAtenciosamente,<br />\n<br />\n{$userFirstName}<br />\nEditor de texto, {$contextName}', 'Solicitação ao autor de detalhes sobre referência, enviada pelo editor de texto.'),
('REVIEW_REQUEST_SUBSEQUENT', 'pt_BR', 'Solicitação de avaliação de artigo', '{$reviewerName}:<br />\n<br />\nEsta mensagem está relacionada ao trabalho &quot;{$submissionTitle},&quot; que está em processo de avaliação na publicação {$contextName}.<br />\n<br />\nSeguindo o processo de de avaliação da versão anterior, os autores encaminharam uma versão revisada. Nos seria de grande valia se pudesse ajudar a avaliar essa nova versão.<br />\n<br />\nPara tanto, acesse o sistema da revista até {$responseDueDate} para indicar se aceita ou não assumir a avaliação, bem como acessar os dados da submissão e registrar sua avaliação e recomendação. O site da revista é {$contextUrl}<br />\n<br />\nA avaliação deve ser concluída até{$reviewDueDate}.<br />\n<br />\nCaso não possua seu login e senha para acesso, use o link a seguir para criar uma nova senha (que será encaminha via e-mail junto com seu login). {$passwordResetUrl}<br />\n<br />\nURL da submissão: {$submissionReviewUrl}<br />\n<br />\nAgradecendo antecipadamente sua consideração em aceitar esta responsabilidade,<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'Este e-mail a partir do Editor de Seção a um Viajante solicita que o usuário aceitar ou recusar a tarefa de rever uma submissão por um segundo ou maior rodada de avaliação. Ele fornece informações sobre a apresentação, como o título e resumo, uma revisão data de vencimento, e como acessar a própria apresentação. Esta mensagem é usada quando o Processo de Revisão Padrão é selecionado no programa de configuração Journal, Passo 2. (Otherwise see REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),
('REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 'pt_BR', 'Solicitação de avaliação de artigo', '{$reviewerName}:<br />\n<br />\nEsta mensagem é referente ao trabalho &quot;{$submissionTitle}&quot;, que está em processo de avaliação na publicação {$contextName}.<br />\n<br />\nContinuando o processo de avaliação da versão anterior do trabalho, os autores enviaram uma versão revisada. Nos seria de grande valia se pudesse ajudara a avaliá-lo.<br />\n<br />\nPara tanto, acesse o sistema da revista até {$responseDueDate} para indicar se está disponível ou não para assumir a responsabilidade, bem como acessar os dados da submissão e registrar sua avaliação e recomendação.<br />\n<br />\nA avaliação deve ser concluída até {$reviewDueDate}.<br />\n<br />\nURL da Submissão: {$submissionReviewUrl}<br />\n<br />\nAgradecendo desde já a atenção dispensada,<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Journal Setup, Step 2, and one-click reviewer access is enabled.'),
('REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 'pt_BR', 'Solicitação de avaliação de artigo', 'Prezada(o) {$reviewerName},<br />\n<br />\nEsta mensagem é referente ao trabalho &quot;{$submissionTitle},&quot; em processo de avaliação para a revista {$contextName}.<br />\n<br />\nSeguindo o processo de avaliação do trabalho, os autores encaminharam uma versão atualizada. Acredito que seu conhecimento será fundamental para realizar sua avaliação e espero que considere assumir esta importante responsabilidade.<br />\n<br />\nAs Diretrizes para Avaliação estão apensas a e a submissão como anexo a esta mensaagem. Sua avaliação, bem como recomendação, devem ser enviadas para este e-mail até {$reviewDueDate}.<br />\n<br />\nResponda a esta mensagem até {$responseDueDate} indicando sua disponibilidade ou não para realizar a avaliação.<br />\n<br />\nAgradecendo desde já a atenção dispensada,<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nDiretrizes para Avaliação<br />\n<br />\n{$reviewGuidelines}', 'Esta mensagem é enviada pelo Editor de seção ao avaliador, solicitando a avaliação de uma submissão em uma segunda rodada ou superior. A mensagem inclui a submissão como anexo. Ela é usada quando o processo de avaliação via e-mail é escolhido no Passo 2 de configuração da revista (Caso contrário, veja REVIEW_REQUEST_SUBSEQUENT).'),
('REVISED_VERSION_NOTIFY', 'pt_BR', 'Envio de versão atualizada', '{$editorialContactName},<br />\n<br />\nUma versão atualizada de &quot;{$submissionTitle}&quot; foi enviada pelo autor {$authorName}.<br />\n<br />\nURL da submissão: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent to the assigned editor when author uploads a revised version of an article.'),
('EDITOR_DECISION_SEND_TO_EXTERNAL', 'pt_BR', 'Decisão do Editor', '{$authorName}:<br />\n<br />\nChegamos a uma decisão sobre sua submissão  {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNossa decisão é que seu artigo foi enviado para avaliação externa. Iremos aguardar os pareceres para entrar em contato novamente<br />\n<br />\nURL da submissão: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}<br />', 'Este e-mail enviado pelo Editor ou Editor de Seção para um autor serve para notificar o mesmo de que sua submissão foi enviada para revisores externos.'),
('ORCID_COLLECT_AUTHOR_ID', 'en_US', 'Submission ORCID', 'Dear {$authorName},\n\nYou have been listed as a co-author on the manuscript submission \"{$articleTitle}\" to {$journalName}. \n\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.\n\n{$authorOrcidUrl}\n\nIf you have any questions, please contact me.\n\n{$editorialContactSignature}\n\n\n', 'This email template is used to collect the ORCID id\'s from co-authors.'),
('MANUAL_PAYMENT_NOTIFICATION', 'en_US', 'Manual Payment Notification', 'A manual payment needs to be processed for the journal {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by Open Journal Systems\' Manual Payment plugin.', 'This email template is used to notify a journal manager contact that a manual payment was requested.'),
('MANUAL_PAYMENT_NOTIFICATION', 'es_ES', 'Notificación de pago manual', 'Un pago manual necesita ser procesado para la revista  {$contextName} y el usuario {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nEl ítem pagado es &quot;{$itemName}&quot;.<br />\nEl precio es {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nEste correo ha sido generado por el plugin de Pago Manual de  Open Journal Systems.', 'Este correo se usa para notificar al gestor/a de la revista de que se ha realizado un pago manual.'),
('MANUAL_PAYMENT_NOTIFICATION', 'it_IT', 'Notifica di pagamento manuale', 'Bisogna registrare un pagamento offline per  {$contextName}, utente {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nIl pagamento riguarda &quot;{$itemName}&quot;.<br />\nIl costo è {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nQuesta email è generata automaticamente da Open Journal Systems\' Manual Payment plugin.', NULL),
('MANUAL_PAYMENT_NOTIFICATION', 'pt_BR', 'Notificação de pagamento manual', 'É necessário realizar o processamento de um pagamento manual de assinatura da revista {$contextName}, pelo usuário {$userFullName} (login &quot;{$userName}&quot;).<br />\n<br />\nO item adquirido é &quot;{$itemName}&quot;.<br />\nValor em ({$itemCurrencyCode}): {$itemCost}<br />\n<br />\nEsta é uma mensagem automática da ferramenta de Pagamento manual do Open Journal Systems.', 'Mensagem automática notificando editor-gerente que um pagamento manual foi realizado e exige processamento.'),
('PAYPAL_INVESTIGATE_PAYMENT', 'en_US', 'Unusual PayPal Activity', 'Open Journal Systems has encountered unusual activity relating to PayPal payment support for the journal {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by Open Journal Systems\' PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n', 'This email template is used to notify a journal\'s primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),
('PAYPAL_INVESTIGATE_PAYMENT', 'es_ES', 'Actividad inusual de PayPal', 'Open Journal Systems ha notado una actividad inusual relacionada con el soporte de pago de PayPal para la revista {$contextName}.  Esta actividad puede necesitar de mayor investigación o intervención manual.<br />\n<br />\nEste email ha sido generado por el plugin de PayPal de Open Journal Systems.<br />\n<br />\nInformación completa de envío para la solicitud:<br />\n{$postInfo}<br />\n<br />\nInformación adicional (si proporcionada):<br />\n{$additionalInfo}<br />\n<br />\nVariables de servidor:<br />\n{$serverVars}', 'Esta plantilla de correo es usada para notificar al contacto principal de la revista de que el plugin de PayPal ha detectado actividad sospechosa o actividad que requiere de intervención manual.'),
('PAYPAL_INVESTIGATE_PAYMENT', 'it_IT', 'Attività PayPal sospetta', 'Open Journal Systems ha riscontrato un\'attivtà sospetta sul conto PayPal della rivista {$contextName}. Ciò può richiedere ulteriori indagini o un intervento manuale.<br />\n<br />\nQuesta email è stata generata da Open Journal Systems\' PayPal plugin<br />\n<br />\nTutte le informazioni sulla richiesta:<br />\n{$postInfo}<br />\n<br />\nInformazioni aggiuntive (se disponibili):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}', NULL),
('PAYPAL_INVESTIGATE_PAYMENT', 'pt_BR', 'Atividade incomum na conta PayPal', 'O sistema encontrou atividade incomum relacionada ao suporte a pagamentos via PayPal da revista {$contextName}. <br />\nEsta atividade pode exigir investigação mais profunda ou intervenção manual.<br />\n                       <br />\nEsta é uma mensagem automática da ferramenta de Pagamento via PayPal do Open Journal Systems.<br />\n<br />\nInformações detalhadas da notificação:<br />\n{$postInfo}<br />\n<br />\nInformações adicionais (caso informado):<br />\n{$additionalInfo}<br />\n<br />\nVariáveis do servidor:<br />\n{$serverVars}', 'Esta mensagem notifica o contato principal da revista sobre atividades suspeitas, ou atividades que exijam intervenção manual, detectadas pelo Plugin de Pagamento via PayPal.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `event_log`
--

DROP TABLE IF EXISTS `event_log`;
CREATE TABLE IF NOT EXISTS `event_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `ip_address` varchar(39) NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text,
  `is_translated` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `event_log_settings`
--

DROP TABLE IF EXISTS `event_log_settings`;
CREATE TABLE IF NOT EXISTS `event_log_settings` (
  `log_id` bigint(20) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  KEY `event_log_settings_log_id` (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `filters`
--

DROP TABLE IF EXISTS `filters`;
CREATE TABLE IF NOT EXISTS `filters` (
  `filter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filter_group_id` bigint(20) NOT NULL DEFAULT '0',
  `context_id` bigint(20) NOT NULL DEFAULT '0',
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` tinyint(4) NOT NULL DEFAULT '0',
  `parent_filter_id` bigint(20) NOT NULL DEFAULT '0',
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `filters`
--

INSERT INTO `filters` (`filter_id`, `filter_group_id`, `context_id`, `display_name`, `class_name`, `is_template`, `parent_filter_id`, `seq`) VALUES
(1, 1, 0, 'Extract metadata from a(n) Article', 'plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter', 0, 0, 0),
(2, 2, 0, 'MODS 3.4', 'lib.pkp.plugins.metadata.mods34.filter.Mods34DescriptionXmlFilter', 0, 0, 0),
(3, 3, 0, 'Extract metadata from a(n) Article', 'plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter', 0, 0, 0),
(4, 4, 0, 'Inject metadata into a(n) Article', 'plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter', 0, 0, 0),
(5, 5, 0, 'Crossref XML issue export', 'plugins.importexport.crossref.filter.IssueCrossrefXmlFilter', 0, 0, 0),
(6, 6, 0, 'Crossref XML issue export', 'plugins.importexport.crossref.filter.ArticleCrossrefXmlFilter', 0, 0, 0),
(7, 7, 0, 'DataCite XML export', 'plugins.importexport.datacite.filter.DataciteXmlFilter', 0, 0, 0),
(8, 8, 0, 'DataCite XML export', 'plugins.importexport.datacite.filter.DataciteXmlFilter', 0, 0, 0),
(9, 9, 0, 'DataCite XML export', 'plugins.importexport.datacite.filter.DataciteXmlFilter', 0, 0, 0),
(10, 10, 0, 'DOAJ XML export', 'plugins.importexport.doaj.filter.DOAJXmlFilter', 0, 0, 0),
(11, 11, 0, 'DOAJ JSON export', 'plugins.importexport.doaj.filter.DOAJJsonFilter', 0, 0, 0),
(12, 12, 0, 'mEDRA XML issue export', 'plugins.importexport.medra.filter.IssueMedraXmlFilter', 0, 0, 0),
(13, 13, 0, 'mEDRA XML article export', 'plugins.importexport.medra.filter.ArticleMedraXmlFilter', 0, 0, 0),
(14, 14, 0, 'mEDRA XML article export', 'plugins.importexport.medra.filter.GalleyMedraXmlFilter', 0, 0, 0),
(15, 15, 0, 'Native XML submission export', 'plugins.importexport.native.filter.ArticleNativeXmlFilter', 0, 0, 0),
(16, 16, 0, 'Native XML submission import', 'plugins.importexport.native.filter.NativeXmlArticleFilter', 0, 0, 0),
(17, 17, 0, 'Native XML issue export', 'plugins.importexport.native.filter.IssueNativeXmlFilter', 0, 0, 0),
(18, 18, 0, 'Native XML issue import', 'plugins.importexport.native.filter.NativeXmlIssueFilter', 0, 0, 0),
(19, 19, 0, 'Native XML issue galley export', 'plugins.importexport.native.filter.IssueGalleyNativeXmlFilter', 0, 0, 0),
(20, 20, 0, 'Native XML issue galley import', 'plugins.importexport.native.filter.NativeXmlIssueGalleyFilter', 0, 0, 0),
(21, 21, 0, 'Native XML author export', 'plugins.importexport.native.filter.AuthorNativeXmlFilter', 0, 0, 0),
(22, 22, 0, 'Native XML author import', 'plugins.importexport.native.filter.NativeXmlAuthorFilter', 0, 0, 0),
(23, 26, 0, 'Native XML submission file import', 'plugins.importexport.native.filter.NativeXmlArticleFileFilter', 0, 0, 0),
(24, 27, 0, 'Native XML submission file import', 'plugins.importexport.native.filter.NativeXmlArtworkFileFilter', 0, 0, 0),
(25, 28, 0, 'Native XML submission file import', 'plugins.importexport.native.filter.NativeXmlSupplementaryFileFilter', 0, 0, 0),
(26, 23, 0, 'Native XML submission file export', 'lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter', 0, 0, 0),
(27, 24, 0, 'Native XML submission file export', 'plugins.importexport.native.filter.ArtworkFileNativeXmlFilter', 0, 0, 0),
(28, 25, 0, 'Native XML submission file export', 'plugins.importexport.native.filter.SupplementaryFileNativeXmlFilter', 0, 0, 0),
(29, 29, 0, 'Native XML representation export', 'plugins.importexport.native.filter.ArticleGalleyNativeXmlFilter', 0, 0, 0),
(30, 30, 0, 'Native XML representation import', 'plugins.importexport.native.filter.NativeXmlArticleGalleyFilter', 0, 0, 0),
(31, 31, 0, 'ArticlePubMedXmlFilter', 'plugins.importexport.pubmed.filter.ArticlePubMedXmlFilter', 0, 0, 0),
(32, 32, 0, 'User XML user export', 'lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter', 0, 0, 0),
(33, 33, 0, 'User XML user import', 'lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter', 0, 0, 0),
(34, 34, 0, 'Native XML user group export', 'lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter', 0, 0, 0),
(35, 35, 0, 'Native XML user group import', 'lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `filter_groups`
--

DROP TABLE IF EXISTS `filter_groups`;
CREATE TABLE IF NOT EXISTS `filter_groups` (
  `filter_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`filter_group_id`),
  UNIQUE KEY `filter_groups_symbolic` (`symbolic`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `filter_groups`
--

INSERT INTO `filter_groups` (`filter_group_id`, `symbolic`, `display_name`, `description`, `input_type`, `output_type`) VALUES
(1, 'article=>dc11', 'plugins.metadata.dc11.articleAdapter.displayName', 'plugins.metadata.dc11.articleAdapter.description', 'class::classes.article.Article', 'metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)'),
(2, 'mods34=>mods34-xml', 'plugins.metadata.mods34.mods34XmlOutput.displayName', 'plugins.metadata.mods34.mods34XmlOutput.description', 'metadata::plugins.metadata.mods34.schema.Mods34Schema(*)', 'xml::schema(lib/pkp/plugins/metadata/mods34/filter/mods34.xsd)'),
(3, 'article=>mods34', 'plugins.metadata.mods34.articleAdapter.displayName', 'plugins.metadata.mods34.articleAdapter.description', 'class::classes.article.Article', 'metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)'),
(4, 'mods34=>article', 'plugins.metadata.mods34.articleAdapter.displayName', 'plugins.metadata.mods34.articleAdapter.description', 'metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)', 'class::classes.article.Article'),
(5, 'issue=>crossref-xml', 'plugins.importexport.crossref.displayName', 'plugins.importexport.crossref.description', 'class::classes.issue.Issue[]', 'xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),
(6, 'article=>crossref-xml', 'plugins.importexport.crossref.displayName', 'plugins.importexport.crossref.description', 'class::classes.article.Article[]', 'xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),
(7, 'issue=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.issue.Issue', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(8, 'article=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.article.Article', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(9, 'galley=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.article.ArticleGalley', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(10, 'article=>doaj-xml', 'plugins.importexport.doaj.displayName', 'plugins.importexport.doaj.description', 'class::classes.article.Article[]', 'xml::schema(plugins/importexport/doaj/doajArticles.xsd)'),
(11, 'article=>doaj-json', 'plugins.importexport.doaj.displayName', 'plugins.importexport.doaj.description', 'class::classes.article.Article', 'primitive::string'),
(12, 'issue=>medra-xml', 'plugins.importexport.medra.displayName', 'plugins.importexport.medra.description', 'class::classes.issue.Issue[]', 'xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),
(13, 'article=>medra-xml', 'plugins.importexport.medra.displayName', 'plugins.importexport.medra.description', 'class::classes.article.Article[]', 'xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),
(14, 'galley=>medra-xml', 'plugins.importexport.medra.displayName', 'plugins.importexport.medra.description', 'class::classes.article.ArticleGalley[]', 'xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),
(15, 'article=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.article.Article[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(16, 'native-xml=>article', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.article.Article[]'),
(17, 'issue=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.issue.Issue[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(18, 'native-xml=>issue', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.issue.Issue[]'),
(19, 'issuegalley=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.issue.IssueGalley[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(20, 'native-xml=>issuegalley', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.issue.IssueGalley[]'),
(21, 'author=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.article.Author[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(22, 'native-xml=>author', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.article.Author[]'),
(23, 'SubmissionFile=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::lib.pkp.classes.submission.SubmissionFile', 'xml::schema(plugins/importexport/native/native.xsd)'),
(24, 'SubmissionArtworkFile=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::lib.pkp.classes.submission.SubmissionArtworkFile', 'xml::schema(plugins/importexport/native/native.xsd)'),
(25, 'SupplementaryFile=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::lib.pkp.classes.submission.SupplementaryFile', 'xml::schema(plugins/importexport/native/native.xsd)'),
(26, 'native-xml=>SubmissionFile', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::lib.pkp.classes.submission.SubmissionFile'),
(27, 'native-xml=>SubmissionArtworkFile', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::lib.pkp.classes.submission.SubmissionArtworkFile'),
(28, 'native-xml=>SupplementaryFile', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::lib.pkp.classes.submission.SupplementaryFile'),
(29, 'article-galley=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.article.ArticleGalley', 'xml::schema(plugins/importexport/native/native.xsd)'),
(30, 'native-xml=>ArticleGalley', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.article.ArticleGalley[]'),
(31, 'article=>pubmed-xml', 'plugins.importexport.pubmed.displayName', 'plugins.importexport.pubmed.description', 'class::classes.article.Article[]', 'xml::dtd'),
(32, 'user=>user-xml', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'class::classes.user.User[]', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(33, 'user-xml=>user', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)', 'class::classes.users.User[]'),
(34, 'usergroup=>user-xml', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'class::lib.pkp.classes.security.UserGroup[]', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(35, 'user-xml=>usergroup', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)', 'class::lib.pkp.classes.security.UserGroup[]');

-- --------------------------------------------------------

--
-- Estrutura da tabela `filter_settings`
--

DROP TABLE IF EXISTS `filter_settings`;
CREATE TABLE IF NOT EXISTS `filter_settings` (
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `filter_settings_pkey` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `genres`
--

DROP TABLE IF EXISTS `genres`;
CREATE TABLE IF NOT EXISTS `genres` (
  `genre_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `category` bigint(20) NOT NULL DEFAULT '1',
  `dependent` tinyint(4) NOT NULL DEFAULT '0',
  `supplementary` tinyint(4) DEFAULT '0',
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `genres`
--

INSERT INTO `genres` (`genre_id`, `context_id`, `seq`, `enabled`, `category`, `dependent`, `supplementary`, `entry_key`) VALUES
(1, 1, 0, 1, 1, 0, 0, 'SUBMISSION'),
(2, 1, 1, 1, 3, 0, 1, 'RESEARCHINSTRUMENT'),
(3, 1, 2, 1, 3, 0, 1, 'RESEARCHMATERIALS'),
(4, 1, 3, 1, 3, 0, 1, 'RESEARCHRESULTS'),
(5, 1, 4, 1, 3, 0, 1, 'TRANSCRIPTS'),
(6, 1, 5, 1, 3, 0, 1, 'DATAANALYSIS'),
(7, 1, 6, 1, 3, 0, 1, 'DATASET'),
(8, 1, 7, 1, 3, 0, 1, 'SOURCETEXTS'),
(9, 1, 8, 1, 1, 1, 1, 'MULTIMEDIA'),
(10, 1, 9, 1, 2, 1, 0, 'IMAGE'),
(11, 1, 10, 1, 1, 1, 0, 'STYLE'),
(12, 1, 11, 1, 3, 0, 1, 'OTHER');

-- --------------------------------------------------------

--
-- Estrutura da tabela `genre_settings`
--

DROP TABLE IF EXISTS `genre_settings`;
CREATE TABLE IF NOT EXISTS `genre_settings` (
  `genre_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `genre_settings_pkey` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `genre_settings`
--

INSERT INTO `genre_settings` (`genre_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'name', 'Article Text', 'string'),
(1, 'es_ES', 'name', 'Texto del artículo', 'string'),
(1, 'it_IT', 'name', 'Articolo', 'string'),
(1, 'pt_BR', 'name', 'Texto do artigo', 'string'),
(2, 'en_US', 'name', 'Research Instrument', 'string'),
(2, 'es_ES', 'name', 'Instrumento de investigación', 'string'),
(2, 'it_IT', 'name', 'Strumenti di ricerca', 'string'),
(2, 'pt_BR', 'name', 'Instrumento de pesquisa', 'string'),
(3, 'en_US', 'name', 'Research Materials', 'string'),
(3, 'es_ES', 'name', 'Materiales de investigación', 'string'),
(3, 'it_IT', 'name', 'Materiali di ricerca', 'string'),
(3, 'pt_BR', 'name', 'Materiais de pesquisa', 'string'),
(4, 'en_US', 'name', 'Research Results', 'string'),
(4, 'es_ES', 'name', 'Resultados de la investigación', 'string'),
(4, 'it_IT', 'name', 'Risultati di ricerca', 'string'),
(4, 'pt_BR', 'name', 'Resultados de pesquisa', 'string'),
(5, 'en_US', 'name', 'Transcripts', 'string'),
(5, 'es_ES', 'name', 'Transcripciones', 'string'),
(5, 'it_IT', 'name', 'Trascrizioni', 'string'),
(5, 'pt_BR', 'name', 'Transcrições', 'string'),
(6, 'en_US', 'name', 'Data Analysis', 'string'),
(6, 'es_ES', 'name', 'Análisis de datos', 'string'),
(6, 'it_IT', 'name', 'Analisi di dati', 'string'),
(6, 'pt_BR', 'name', 'Análise de dados', 'string'),
(7, 'en_US', 'name', 'Data Set', 'string'),
(7, 'es_ES', 'name', 'Conjunto de datos', 'string'),
(7, 'it_IT', 'name', 'Data set', 'string'),
(7, 'pt_BR', 'name', 'Conjunto de dados', 'string'),
(8, 'en_US', 'name', 'Source Texts', 'string'),
(8, 'es_ES', 'name', 'Textos fuente', 'string'),
(8, 'it_IT', 'name', 'Fonti bibliografiche', 'string'),
(8, 'pt_BR', 'name', 'Textos fonte', 'string'),
(9, 'en_US', 'name', 'Multimedia', 'string'),
(9, 'es_ES', 'name', 'Multimedia', 'string'),
(9, 'it_IT', 'name', 'File multimediali', 'string'),
(9, 'pt_BR', 'name', 'Multimedia', 'string'),
(10, 'en_US', 'name', 'Image', 'string'),
(10, 'es_ES', 'name', 'Imagen', 'string'),
(10, 'it_IT', 'name', 'Immagine', 'string'),
(10, 'pt_BR', 'name', 'Imagem', 'string'),
(11, 'en_US', 'name', 'HTML Stylesheet', 'string'),
(11, 'es_ES', 'name', 'Hoja de estilo HTML', 'string'),
(11, 'it_IT', 'name', 'Foglio di stile', 'string'),
(11, 'pt_BR', 'name', 'Folha de Estilos', 'string'),
(12, 'en_US', 'name', 'Other', 'string'),
(12, 'es_ES', 'name', 'Otro', 'string'),
(12, 'it_IT', 'name', 'Altro', 'string'),
(12, 'pt_BR', 'name', 'Outros', 'string');

-- --------------------------------------------------------

--
-- Estrutura da tabela `institutional_subscriptions`
--

DROP TABLE IF EXISTS `institutional_subscriptions`;
CREATE TABLE IF NOT EXISTS `institutional_subscriptions` (
  `institutional_subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_id`),
  KEY `institutional_subscriptions_subscription_id` (`subscription_id`),
  KEY `institutional_subscriptions_domain` (`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `institutional_subscription_ip`
--

DROP TABLE IF EXISTS `institutional_subscription_ip`;
CREATE TABLE IF NOT EXISTS `institutional_subscription_ip` (
  `institutional_subscription_ip_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint(20) NOT NULL,
  `ip_end` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_ip_id`),
  KEY `institutional_subscription_ip_subscription_id` (`subscription_id`),
  KEY `institutional_subscription_ip_start` (`ip_start`),
  KEY `institutional_subscription_ip_end` (`ip_end`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `issues`
--

DROP TABLE IF EXISTS `issues`;
CREATE TABLE IF NOT EXISTS `issues` (
  `issue_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `volume` smallint(6) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `current` tinyint(4) NOT NULL DEFAULT '0',
  `date_published` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `access_status` tinyint(4) NOT NULL DEFAULT '1',
  `open_access_date` datetime DEFAULT NULL,
  `show_volume` tinyint(4) NOT NULL DEFAULT '0',
  `show_number` tinyint(4) NOT NULL DEFAULT '0',
  `show_year` tinyint(4) NOT NULL DEFAULT '0',
  `show_title` tinyint(4) NOT NULL DEFAULT '0',
  `style_file_name` varchar(90) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `issues_journal_id` (`journal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `issue_files`
--

DROP TABLE IF EXISTS `issue_files`;
CREATE TABLE IF NOT EXISTS `issue_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `content_type` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `issue_files_issue_id` (`issue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `issue_galleys`
--

DROP TABLE IF EXISTS `issue_galleys`;
CREATE TABLE IF NOT EXISTS `issue_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`galley_id`),
  KEY `issue_galleys_issue_id` (`issue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `issue_galley_settings`
--

DROP TABLE IF EXISTS `issue_galley_settings`;
CREATE TABLE IF NOT EXISTS `issue_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `issue_galley_settings_galley_id` (`galley_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `issue_settings`
--

DROP TABLE IF EXISTS `issue_settings`;
CREATE TABLE IF NOT EXISTS `issue_settings` (
  `issue_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_settings_pkey` (`issue_id`,`locale`,`setting_name`),
  KEY `issue_settings_issue_id` (`issue_id`),
  KEY `issue_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_views`
--

DROP TABLE IF EXISTS `item_views`;
CREATE TABLE IF NOT EXISTS `item_views` (
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` varchar(32) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_last_viewed` datetime DEFAULT NULL,
  UNIQUE KEY `item_views_pkey` (`assoc_type`,`assoc_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `journals`
--

DROP TABLE IF EXISTS `journals`;
CREATE TABLE IF NOT EXISTS `journals` (
  `journal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`journal_id`),
  UNIQUE KEY `journals_path` (`path`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `journals`
--

INSERT INTO `journals` (`journal_id`, `path`, `seq`, `primary_locale`, `enabled`) VALUES
(1, 'snct', 1, 'pt_BR', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `journal_settings`
--

DROP TABLE IF EXISTS `journal_settings`;
CREATE TABLE IF NOT EXISTS `journal_settings` (
  `journal_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `journal_settings_pkey` (`journal_id`,`locale`,`setting_name`),
  KEY `journal_settings_journal_id` (`journal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `journal_settings`
--

INSERT INTO `journal_settings` (`journal_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'numPageLinks', '10', 'int'),
(1, '', 'itemsPerPage', '25', 'int'),
(1, '', 'numWeeksPerReview', '4', 'int'),
(1, '', 'defaultReviewMode', '2', 'int'),
(1, '', 'coverageEnabledSubmission', '0', 'bool'),
(1, '', 'languagesEnabledSubmission', '1', 'bool'),
(1, '', 'rightsEnabledSubmission', '1', 'bool'),
(1, '', 'sourceEnabledSubmission', '0', 'bool'),
(1, 'pt_BR', 'openAccessPolicy', 'Esta revista oferece acesso livre imediato ao seu conteúdo, seguindo o princípio de que disponibilizar gratuitamente o conhecimento científico ao público proporciona maior democratização mundial do conhecimento.', 'string'),
(1, 'pt_BR', 'authorSelfArchivePolicy', 'Autores tem permissão e são encorajados a submeter seus documentos a páginas pessoais ou portais institucionais, antes e após sua publicação neste periódico (sempre oferecendo a referência bibliográfica do item).', 'string'),
(1, 'pt_BR', 'copyeditInstructions', 'A edição de texto procura aperfeiçoar a leitura, clareza, gramática, vocabulário e formatação do documento. Representa a última chance para o autor realizar alterações substanciais ao texto, sendo que no próximo passo as correções são restritas a erros de digitação e formatação.\n\nO documento a ser editado está no formato .doc, .odt ou .rtf, permitindo edição rápida por um processador de texto. As diretrizes descritas aqui apresentam duas propostas para a edição. A primeira é baseada nas ferramentas de controle de alterações do Microsoft Word e requer que todos os envolvidos no processo possuam o aplicativo. A segunda, independente de ferramenta, foi apropriada com autorização da Harvard Educational Review. O editor tem poderes para modificar estas diretrizes, sugerindo melhorias no processo editorial da revista.\n<h4>Copyediting Systems</h4>\n\n<strong>1. Controle de Alterações do Microsoft Word</strong>\n\nNo menu Ferramentas, a opção Controle de alterações permite ao editor de texto realizar inserções (o texto aparece em cores) ou remoções (o texto aparece tachado em cores ou nas margens como removido) no conteúdo. O editor de texto pode incluir comentários para o autor e o editor através do ícone de comentários na barra de ferramentas. A versão editada pode então ser enviada e o editor é notificado via e-mail. O editor revisa as alterações no texto e notifica o autor.\n\nO editor e o autor devem manter as alterações com as quais concordem. No caso de necessidade de mais alterações, ambos podem alterar as modificações do editor de texto, além de incluir outras. Ambos devem responder aos comentários enviados, com respostas colchetes.\n\nApós a revisão do texto por parte do editor e do autor, o editor de texto deverá realizar uma última revisão, aceitando as alterações para proceder à fase de Layout e Composição para publicação.\n<strong>2. Harvard Educational Review </strong>\n\n<strong>Instruções para Fazer Revisões Eletrônicas em Manuscritos</strong>\n\nSiga o seguinte protocolo para fazer revisões eletrônicas em seu manuscrito:\n\n<strong>Respostas a sugestões de alteração</strong>\n&nbsp; Para cada sugestão aceita, remova o negrito do texto.\n&nbsp; Para cada sugestão rejeitada, insira o texto original novamente e aplique <strong>negrito</strong>.\n\n<strong>Realizando Inserções e Remoções</strong>\n&nbsp; Indique inserções novas em <strong>negrito</strong>.\n&nbsp; Substitua seções removidas por: <strong>[texto removido]</strong>.\n&nbsp; Caso remova uma frase ou mais, indique com um aviso (ex.: <strong>[removidas 2 frases]</strong>).\n\n<strong>Respondendo a dúvidas para o autor (DAs)</strong>\n&nbsp; Mantenha todas as DAs intactas e em negrito dentro do texto. Não as remova.\n&nbsp; Para responder a uma DA, insira um comentário após a dúvida. Delimite comentários da seguinte forma:\n<strong>[Comentário: ]</strong>\n&nbsp; Ex.: <strong>[Comentário: Maior desenvolvimento da discussão da metodologia, como sugerido]</strong>\n\n<strong>Incluindo Comentários</strong>\n&nbsp; Use comentários para explicar alterações organizacionais ou revisões mais importantes\n&nbsp; Ex.: <strong>[Comentário: Parágrafo acima movido da p. 5 para a p. 7]</strong>\n&nbsp; Aviso: Ao se referir a numeração de páginas, use a numeração da cópia impressa enviada, pois a numeração pode ser alterada nas revisões eletrônicas.\n\n<h4>Exemplificando uma avaliação eletrônica</h4>\n\n<ol>\n<li><strong>Edição de texto inicial.</strong> O editor de texto alterará o conteúdo para melhorar o fluxo, clareza, gramática, vocabulário e formatação, bem como incluir dúvidas para o autor quando necessário. Uma vez concluída, o editor de texto enviará sua versão revisada por meio do sistema e notificará o autor da disponibilidade de acesso ao documento para sua revisão.</li>\n<li><strong>Edição de texto do autor.</strong> Antes de realizar alterações dramáticas na estrutura e organização do documento editado, os autores devem se comunicar com os editores responsáveis pela submissão. Os autores devem acatar/rejeitar quaisquer alterações realizadas durante a edição de texto inicial, onde considerarem apropriado. Uma vez concluída a revisão, o autor deve renomear o arquivo seguindo o padrão, alterando o nome de NomedoAutorDA.doc para NomedoAutorDAR.doc (de LeeDA.doc para LeeDAR.doc, por exemplo) e enviar sua versão revisada por meio do formulário disponível no sistema, conforme orientações recebidas.</li>\n<li><strong>Edição de texto final.</strong> O editor de texto verificará as alterções realizadas pelo autor, e incorporará as respostas do autor para produzir o documento final. Após concluir, o editor de texto enviará sua versão final por meio do sistema e notificará o editor de layout para produção da versão para publicação.</li>\n</ol>', 'string'),
(1, '', 'emailSignature', '##default.journalSettings.emailSignature##', 'string'),
(1, 'pt_BR', 'proofInstructions', '<p>O processo de leitura de provas tem por objetivo corrigir erros de ortografia, gramática e formatação na composição. Alterações mais importantes não podem ser realizadas nesta etapa sem o consentimento do editor responsável pela submissão. No seção Layout, clique em Visualizar prova para ver a composição em HTML, PDF ou outro formato disponível.</p>\n<h4>Erros de ortografia e gramática</h4>\n\n<p>Copie a palavra com problemas ou o conjunto de palavras e cole no campo de Alterações da prova com as instruções de \"ALTERE-PARA\" conforme as instruções a seguir.</p>\n\n        <pre>1. ALTERE\n        a peusqisa envolve\n        PARA\n        a pesquisa envolve</pre>\n        <br />\n        <pre>2. ALTERE\n        Malinowsky\n        PARA\n        Malinowski </pre>\n        <br />\n\n        <h4>Erros de Formatação</h4>\n\n        <p>Descreva o local e a natureza do problema na caixa Alterações da Prova, após digitar no título \"FORMATAÇÃO\" conforme as instruções a seguir...</p>\n        <br />\n        <pre>3. FORMATAÇÃO\n        Os números na Tabela 3 não estão alinhadas na 3ª coluna.</pre>\n        <br />\n        <pre>4. FORMATAÇÃO\n        O parágrafo iniciado em \"Este último elemento...\" não está recuado.</pre>', 'string'),
(1, 'pt_BR', 'refLinkInstructions', '<h4>Incluindo referências ativas no processo de layout</h4>\n	<p>Ao transformar a submissão para HTML ou PDF, assegure-se de que todos os hiperlinks estão ativos.</p>\n	<h4>A. Quando o autor informa o link para a referência</h4>\n	<ol>\n	<li>Enquanto a submissão ainda está em um formato de edição de texto original (ex.: Word), inclua a frase VISUALIZAR ITEM no final da referência que possui uma URL.</li>\n	<li>Transforme a frase em um hiperlink selecionando-a e utilizando a ferramenta do Word Inserir Hiperlink informando a URL criada no passo #2 no campo respectivo.</li>\n	</ol>\n	<h4>B. Permitindo aos leitores pesquisar referências no Google Acadêmico</h4>\n	<ol>\n	<li>Enquanto a submissão ainda está em formato para edição de texto (Word, por exemplo), copie o título do trabalho referenciado na lista de referências (caso pareça ser um título muito comum – por exemplo \"Paz\" – copie o autor e o título).</li>\n	<li>Cole o texto selecionado entre as marcações de espaço %22, incluindo o sinal + entre cada palavra: http://scholar.google.com/scholar?q=%22PASTE+TITLE+HERE%22&hl=en&lr=&btnG=Search</li>\n	<li>Inclua a frase GS SEARCH no final de cada citação na lista de referências da submissão.</li>\n	<li>Transforme a frase em um hiperlink selecionando-a e utilizando a ferramenta do Word Inserir Hiperlink informando a URL criada no passo #2 no campo respectivo.</li>\n	</ol>\n	<h4>C. Permitindo aos Leitores buscas por referências que possuem DOI</h4>\n	<ol>\n	<li>Enquanto a submissão ainda está em um formato de edição de texto original (ex.: Word), copie um grupo de referências na ferramenta CrossRef Text Query (http://www.crossref.org/freeTextQuery/)</li>\n	<li>Cole cada DOI que a ferramenta Query retorna na seguinte URL (entre os sinais = e &): http://www.cmaj.ca/cgi/external_ref?access_num=COLE O DOI#AQUI&link_type=DOI</li>\n	<li>Inclua a frase CrossRef no final de cada citação na lista de referências da submissão.</li>\n	<li>Transforme a frase em um hiperlink selecionando-a e utilizando a ferramenta do Word Inserir Hiperlink informando a URL criada no passo #2 no campo respectivo.</li>\n	</ol>', 'string'),
(1, 'pt_BR', 'readerInformation', 'Convidamos os leitores a se cadastrarem no serviço de notificação de publicação da revista. Clique em <a href=\"http://localhost/ojs/index.php/snct/user/register\">Cadastro</a> no menu superior da página. O cadastro permitirá ao leitor receber o sumário via e-mail a cada nova edição. A lista procura também reivindicar um nível básico de apoio ou de leitura da revista. Leia a <a href=\"http://localhost/ojs/index.php/snct/about/submissions#privacyStatement\">Política de privacidade</a>, que assegura aos leitores que seus nomes e endereços informados não serão utilizados para outros fins.', 'string'),
(1, 'pt_BR', 'authorInformation', 'Deseja enviar contribuições à revista? Convidamos todos a conferir a seção <a href=\"http://localhost/ojs/index.php/snct/about\">Sobre a revista</a> e ler as políticas das seções disponíveis, bem como as <a href=\"http://localhost/ojs/index.php/snct/about/submissions#authorGuidelines\">Diretrizes para autores</a>. É necessário que os autores se <a href=\"http://localhost/ojs/index.php/snct/user/register\">cadastrem</a> no sistema  antes de submeter um artigo; caso já tenha se cadastrado basta <a href=\"http://localhost/ojs/index.php/snct/login\">acessar</a> o sistema e iniciar o processo de 5 passos de submissão.', 'string'),
(1, 'pt_BR', 'librarianInformation', 'Convidamos as bibliotecas a listar revistas de Acesso Livre em seus catálogos de revistas eletrônicas. Este sistema de publicação é desenvolvido também para ser hospedado e operado por bibliotecas, em apoio ao trabalho de publicação das revistas do seu corpo acadêmico (saiba mais acessando a página oficial do <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).', 'string'),
(1, 'pt_BR', 'lockssLicense', 'Esta revista utiliza o sistema LOCKSS para criar um sistema de arquivo distribuído entre as bibliotecas participantes e permite às mesmas criar arquivos permanentes da revista para a preservação e restauração. <a href=\"http://www.lockss.org/\">Saiba mais...</a>', 'string'),
(1, 'pt_BR', 'clockssLicense', 'Esta revista utiliza o sistema CLOCKSS para criar um sistema de arquivos distribuídos entre bibliotecas participantes e permite que tais bibliotecas mantenham cópias permanentes da revista para propósitos de preservação e recuperação. <a href=\"http://clockss.org/\">Saiba mais...</a>', 'string'),
(1, '', 'supportedFormLocales', 'a:1:{i:0;s:5:\"pt_BR\";}', 'object'),
(1, '', 'supportedSubmissionLocales', 'a:1:{i:0;s:5:\"pt_BR\";}', 'object'),
(1, 'pt_BR', 'submissionChecklist', 'a:5:{i:0;a:2:{s:7:\"content\";s:170:\"A contribuição é original e inédita, e não está sendo avaliada para publicação por outra revista; caso contrário, deve-se justificar em \"Comentários ao editor\".\";s:5:\"order\";s:1:\"1\";}i:1;a:2:{s:7:\"content\";s:75:\"O arquivo da submissão está em formato Microsoft Word, OpenOffice ou RTF.\";s:5:\"order\";s:1:\"2\";}i:2;a:2:{s:7:\"content\";s:60:\"URLs para as referências foram informadas quando possível.\";s:5:\"order\";s:1:\"3\";}i:3;a:2:{s:7:\"content\";s:222:\"O texto está em espaço simples; usa uma fonte de 12-pontos; emprega itálico em vez de sublinhado (exceto em endereços URL); as figuras e tabelas estão inseridas no texto, não no final do documento na forma de anexos.\";s:5:\"order\";s:1:\"4\";}i:4;a:2:{s:7:\"content\";s:215:\"O texto segue os padrões de estilo e requisitos bibliográficos descritos em <a href=\"http://localhost/ojs/index.php/snct/about/submissions#authorGuidelines\">Diretrizes para Autores</a>, na página Sobre a Revista.\";s:5:\"order\";s:1:\"5\";}}', 'object'),
(1, '', 'reviewerAccessKeysEnabled', '1', 'bool'),
(1, '', 'rtCaptureCite', '1', 'bool'),
(1, '', 'rtViewMetadata', '1', 'bool'),
(1, '', 'rtSupplementaryFiles', '1', 'bool'),
(1, '', 'rtPrinterFriendly', '1', 'bool'),
(1, '', 'rtDefineTerms', '1', 'bool'),
(1, '', 'rtAddComment', '1', 'bool'),
(1, '', 'rtEmailAuthor', '1', 'bool'),
(1, '', 'rtEmailOthers', '1', 'bool'),
(1, '', 'publicationFee', '0', 'int'),
(1, '', 'purchaseArticleFee', '0', 'int'),
(1, '', 'membershipFee', '0', 'int'),
(1, 'pt_BR', 'metaCitations', '1', 'string'),
(1, '', 'themePluginPath', 'default', 'string'),
(1, '', 'keywordsEnabledSubmission', '1', 'bool'),
(1, '', 'keywordsEnabledWorkflow', '1', 'bool'),
(1, '', 'supportedLocales', 'a:4:{i:0;s:5:\"en_US\";i:1;s:5:\"es_ES\";i:2;s:5:\"it_IT\";i:3;s:5:\"pt_BR\";}', 'object'),
(1, 'pt_BR', 'name', 'XII Semana Nacional de Ciência e Tecnologia de Itacoatiara', 'string'),
(1, 'pt_BR', 'description', '<p>O instituto de Ciências Exatas e Tecnologia (UFAM/ICET) e o Instituto Federal do Amazonas - Campus Itacoatiara, realizam a XII Semana Nacional de Ciência e Tecnologia de Itacoatiara.</p>\r\n<p>O principal Objetivo deste evento é fazer com que a ciência e a tecnologia, temas que parecem tão distantes alem da compreensão, estejam mais próximos do publico geral.</p>\r\n<p>&nbsp;</p>', 'string'),
(1, '', 'mailingAddress', NULL, 'string'),
(1, '', 'contactName', 'Lucas', 'string'),
(1, 'pt_BR', 'contactAffiliation', 'UFAM', 'string'),
(1, '', 'contactEmail', 'lucasbrigidosi@gmail.com', 'string'),
(1, '', 'contactPhone', '', 'string'),
(1, '', 'supportName', NULL, 'string'),
(1, '', 'supportEmail', NULL, 'string'),
(1, '', 'supportPhone', NULL, 'string'),
(1, 'pt_BR', 'pageHeaderLogoImage', 'a:6:{s:4:\"name\";s:8:\"logo.png\";s:10:\"uploadName\";s:29:\"pageHeaderLogoImage_pt_BR.png\";s:5:\"width\";i:331;s:6:\"height\";i:581;s:12:\"dateUploaded\";s:19:\"2018-10-22 08:14:46\";s:7:\"altText\";s:9:\"Logo SNCT\";}', 'object'),
(1, 'pt_BR', 'pageFooter', '<p>UFAM/ICET itacoatiara</p>\r\n<div class=\"mod\" lang=\"pt-BR\" data-attrid=\"kc:/location/location:address\" data-md=\"1002\" data-hveid=\"CAsQIQ\" data-ved=\"2ahUKEwie__rSzZneAhXMmVkKHe-qBv0QkCkoAjAPegQICxAh\">\r\n<div class=\"Z1hOCe\">\r\n<div class=\"zloOqf kno-fb-ctx\" data-dtype=\"d3ifr\" data-local-attribute=\"d3adr\" data-ved=\"2ahUKEwie__rSzZneAhXMmVkKHe-qBv0QghwoADAPegQICxAi\"><span class=\"w8qArf\"><a class=\"fl\" href=\"https://www.google.com/search?sa=X&amp;biw=1536&amp;bih=706&amp;q=ufam/icet+itacoatiara+endere%C3%A7o&amp;stick=H4sIAAAAAAAAAOPgE-LVT9c3NEyqMEizLE4y0JLNTrbSz8lPTizJzM-DM6wSU1KKUouLAbA66MMwAAAA&amp;ludocid=5955156696657864812&amp;ved=2ahUKEwie__rSzZneAhXMmVkKHe-qBv0Q6BMwD3oECAsQIw\" data-ved=\"2ahUKEwie__rSzZneAhXMmVkKHe-qBv0Q6BMwD3oECAsQIw\">Endereço</a>:&nbsp;</span><span class=\"LrzXr\">Universidade Federal do Amazonas – UFAM/ Instituto de Ciências Exatas e Tecnologia em Itacoatiara – ICET, R. Nossa Sra. do Rosário - Tiradentes, Itacoatiara - AM, 69103-128</span>\r\n<div class=\"GDRHkb r-ie18_wrETui4\">&nbsp;</div>\r\n<div class=\"GDRHkb r-i9gYBrN3vlqM\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"mod\" lang=\"pt-BR\" data-attrid=\"kc:/collection/knowledge_panels/has_phone:phone\" data-md=\"1006\" data-hveid=\"CAsQJA\" data-ved=\"2ahUKEwie__rSzZneAhXMmVkKHe-qBv0QkCkoAzAQegQICxAk\">\r\n<div class=\"Z1hOCe\">\r\n<div class=\"zloOqf kno-fb-ctx\" data-dtype=\"d3ifr\" data-local-attribute=\"d3ph\" data-ved=\"2ahUKEwie__rSzZneAhXMmVkKHe-qBv0Q8I0BKAAwEHoECAsQJQ\"><span class=\"w8qArf\"><a class=\"fl\" href=\"https://www.google.com/search?sa=X&amp;biw=1536&amp;bih=706&amp;q=ufam/icet+itacoatiara+telefone&amp;ludocid=5955156696657864812&amp;ved=2ahUKEwie__rSzZneAhXMmVkKHe-qBv0Q6BMwEHoECAsQJg\" data-ved=\"2ahUKEwie__rSzZneAhXMmVkKHe-qBv0Q6BMwEHoECAsQJg\">Telefone</a>:&nbsp;</span><span class=\"LrzXr zdqRlf kno-fv\"><a class=\"fl r-iZyQ_F9hUv_4\" title=\"Ligar pelo Hangouts\" href=\"https://www.google.com/search?q=icet&amp;source=lnms&amp;sa=X&amp;ved=0ahUKEwj_1NTRzZneAhUprVkKHRSRCiQQ_AUICSgA&amp;biw=1536&amp;bih=706&amp;dpr=1.25#\" data-number=\"+559235213603\" data-pstn-out-call-url=\"\" data-rtid=\"iZyQ_F9hUv_4\" data-ved=\"2ahUKEwie__rSzZneAhXMmVkKHe-qBv0QkAgoADAQegQICxAn\">(92) 3521-3603</a></span></div>\r\n</div>\r\n</div>', 'string'),
(1, '', 'navItems', 'N;', 'object'),
(1, '', 'copySubmissionAckPrimaryContact', '1', 'bool'),
(1, '', 'copySubmissionAckAddress', 'lucasbrigidosi@gmail.com', 'string'),
(1, 'pt_BR', 'authorGuidelines', '<p>A comissão organizadora e científica da XII SCNT 2018 convida a comunidade para a submissão de trabalhos em duas categorias: Resumo e Artigo completo.</p>\r\n<p>As linhas de pesquisa e atuação são: Agrárias, Ciências Biológicas, Ciências da Saude, Ciências exatas e da terra, Ciências Sociais Aplicadas e Engenharias</p>\r\n<p>Para obter instruções de submissão de cada categoria, acesse os links abaixo</p>', 'string'),
(1, '', 'subjectsEnabledSubmission', '0', 'bool'),
(1, '', 'typeEnabledSubmission', '0', 'bool'),
(1, '', 'disciplinesEnabledSubmission', '0', 'bool'),
(1, '', 'agenciesEnabledSubmission', '0', 'bool'),
(1, '', 'citationsEnabledSubmission', '1', 'bool'),
(1, '', 'coverageEnabledWorkflow', '0', 'bool'),
(1, '', 'languagesEnabledWorkflow', '1', 'bool'),
(1, '', 'rightsEnabledWorkflow', '1', 'bool'),
(1, '', 'sourceEnabledWorkflow', '0', 'bool'),
(1, '', 'subjectsEnabledWorkflow', '0', 'bool'),
(1, '', 'typeEnabledWorkflow', '0', 'bool'),
(1, '', 'disciplinesEnabledWorkflow', '0', 'bool'),
(1, '', 'agenciesEnabledWorkflow', '0', 'bool'),
(1, '', 'citationsEnabledWorkflow', '1', 'bool'),
(1, '', 'coverageRequired', '0', 'bool'),
(1, '', 'languagesRequired', '0', 'bool'),
(1, '', 'rightsRequired', '0', 'bool'),
(1, '', 'sourceRequired', '0', 'bool'),
(1, '', 'subjectsRequired', '0', 'bool'),
(1, '', 'typeRequired', '0', 'bool'),
(1, '', 'disciplinesRequired', '0', 'bool'),
(1, '', 'keywordsRequired', '0', 'bool'),
(1, '', 'agenciesRequired', '0', 'bool'),
(1, '', 'citationsRequired', '0', 'bool'),
(1, 'pt_BR', 'searchDescription', 'Revista SNCT', 'string'),
(1, 'pt_BR', 'customHeaders', 'O instituto de Ciências Exatas e Tecnologia (UFAM/ICET) e o Instituto Federal do Amazonas - Campus Itacoatiara, realizam a XII Semana Nacional de Ciência e Tecnologia de Itacoatiara.\r\n\r\nO principal Objetivo deste evento é fazer com que a ciência e a tecnologia, temas que parecem tão distantes alem da compreensão, estejam mais próximos do publico geral.', 'string');

-- --------------------------------------------------------

--
-- Estrutura da tabela `library_files`
--

DROP TABLE IF EXISTS `library_files`;
CREATE TABLE IF NOT EXISTS `library_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `public_access` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `library_files_submission_id` (`submission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `library_file_settings`
--

DROP TABLE IF EXISTS `library_file_settings`;
CREATE TABLE IF NOT EXISTS `library_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `library_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_id` (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `metadata_descriptions`
--

DROP TABLE IF EXISTS `metadata_descriptions`;
CREATE TABLE IF NOT EXISTS `metadata_descriptions` (
  `metadata_description_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  `schema_namespace` varchar(255) NOT NULL,
  `schema_name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`metadata_description_id`),
  KEY `metadata_descriptions_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `metadata_description_settings`
--

DROP TABLE IF EXISTS `metadata_description_settings`;
CREATE TABLE IF NOT EXISTS `metadata_description_settings` (
  `metadata_description_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `metadata_descripton_settings_pkey` (`metadata_description_id`,`locale`,`setting_name`),
  KEY `metadata_description_settings_id` (`metadata_description_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `metrics`
--

DROP TABLE IF EXISTS `metrics`;
CREATE TABLE IF NOT EXISTS `metrics` (
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `pkp_section_id` bigint(20) DEFAULT NULL,
  `assoc_object_type` bigint(20) DEFAULT NULL,
  `assoc_object_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `day` varchar(8) DEFAULT NULL,
  `month` varchar(6) DEFAULT NULL,
  `file_type` tinyint(4) DEFAULT NULL,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `metric_type` varchar(255) NOT NULL,
  `metric` int(11) NOT NULL,
  KEY `metrics_load_id` (`load_id`),
  KEY `metrics_metric_type_context_id` (`metric_type`,`context_id`),
  KEY `metrics_metric_type_submission_id_assoc_type` (`metric_type`,`submission_id`,`assoc_type`),
  KEY `metrics_metric_type_submission_id_assoc` (`metric_type`,`context_id`,`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `navigation_menus`
--

DROP TABLE IF EXISTS `navigation_menus`;
CREATE TABLE IF NOT EXISTS `navigation_menus` (
  `navigation_menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`navigation_menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `navigation_menus`
--

INSERT INTO `navigation_menus` (`navigation_menu_id`, `context_id`, `area_name`, `title`) VALUES
(1, 0, 'user', 'User Navigation Menu'),
(2, 1, 'user', 'User Navigation Menu'),
(3, 1, 'primary', 'Primary Navigation Menu');

-- --------------------------------------------------------

--
-- Estrutura da tabela `navigation_menu_items`
--

DROP TABLE IF EXISTS `navigation_menu_items`;
CREATE TABLE IF NOT EXISTS `navigation_menu_items` (
  `navigation_menu_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `url` varchar(255) DEFAULT '',
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  PRIMARY KEY (`navigation_menu_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `navigation_menu_items`
--

INSERT INTO `navigation_menu_items` (`navigation_menu_item_id`, `context_id`, `url`, `path`, `type`) VALUES
(1, 0, NULL, NULL, 'NMI_TYPE_USER_REGISTER'),
(2, 0, NULL, NULL, 'NMI_TYPE_USER_LOGIN'),
(3, 0, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(4, 0, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(5, 0, NULL, NULL, 'NMI_TYPE_USER_PROFILE'),
(6, 0, NULL, NULL, 'NMI_TYPE_ADMINISTRATION'),
(7, 0, NULL, NULL, 'NMI_TYPE_USER_LOGOUT'),
(8, 1, NULL, NULL, 'NMI_TYPE_USER_REGISTER'),
(9, 1, NULL, NULL, 'NMI_TYPE_USER_LOGIN'),
(10, 1, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(11, 1, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(12, 1, NULL, NULL, 'NMI_TYPE_USER_PROFILE'),
(13, 1, NULL, NULL, 'NMI_TYPE_ADMINISTRATION'),
(14, 1, NULL, NULL, 'NMI_TYPE_USER_LOGOUT'),
(15, 1, NULL, NULL, 'NMI_TYPE_CURRENT'),
(16, 1, NULL, NULL, 'NMI_TYPE_ARCHIVES'),
(17, 1, NULL, NULL, 'NMI_TYPE_ANNOUNCEMENTS'),
(18, 1, NULL, NULL, 'NMI_TYPE_ABOUT'),
(19, 1, NULL, NULL, 'NMI_TYPE_ABOUT'),
(20, 1, NULL, NULL, 'NMI_TYPE_SUBMISSIONS'),
(21, 1, NULL, NULL, 'NMI_TYPE_EDITORIAL_TEAM'),
(22, 1, NULL, NULL, 'NMI_TYPE_PRIVACY'),
(23, 1, NULL, NULL, 'NMI_TYPE_CONTACT'),
(24, 1, NULL, NULL, 'NMI_TYPE_SEARCH');

-- --------------------------------------------------------

--
-- Estrutura da tabela `navigation_menu_item_assignments`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignments`;
CREATE TABLE IF NOT EXISTS `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `navigation_menu_id` bigint(20) NOT NULL,
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seq` bigint(20) DEFAULT '0',
  PRIMARY KEY (`navigation_menu_item_assignment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `navigation_menu_item_assignments`
--

INSERT INTO `navigation_menu_item_assignments` (`navigation_menu_item_assignment_id`, `navigation_menu_id`, `navigation_menu_item_id`, `parent_id`, `seq`) VALUES
(1, 1, 1, 0, 0),
(2, 1, 2, 0, 1),
(3, 1, 3, 0, 2),
(4, 1, 4, 3, 0),
(5, 1, 5, 3, 1),
(6, 1, 6, 3, 2),
(7, 1, 7, 3, 3),
(8, 2, 8, 0, 0),
(9, 2, 9, 0, 1),
(10, 2, 10, 0, 2),
(11, 2, 11, 10, 0),
(12, 2, 12, 10, 1),
(13, 2, 13, 10, 2),
(14, 2, 14, 10, 3),
(15, 3, 15, 0, 0),
(16, 3, 16, 0, 1),
(17, 3, 17, 0, 2),
(18, 3, 18, 0, 3),
(19, 3, 19, 18, 0),
(20, 3, 20, 18, 1),
(21, 3, 21, 18, 2),
(22, 3, 22, 18, 3),
(23, 3, 23, 18, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `navigation_menu_item_assignment_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignment_settings`;
CREATE TABLE IF NOT EXISTS `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_assignment_settings_pkey` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `assignment_settings_navigation_menu_item_assignment_id` (`navigation_menu_item_assignment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `navigation_menu_item_assignment_settings`
--

INSERT INTO `navigation_menu_item_assignment_settings` (`navigation_menu_item_assignment_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'title', 'Register', 'string'),
(1, 'es_ES', 'title', 'Registrarse', 'string'),
(1, 'it_IT', 'title', 'Registrazione', 'string'),
(1, 'pt_BR', 'title', 'Cadastro', 'string'),
(2, 'en_US', 'title', 'Login', 'string'),
(2, 'es_ES', 'title', 'Entrar', 'string'),
(2, 'it_IT', 'title', 'Login', 'string'),
(2, 'pt_BR', 'title', 'Acesso', 'string'),
(3, 'en_US', 'title', '{$loggedInUsername}', 'string'),
(3, 'es_ES', 'title', '{$loggedInUsername}', 'string'),
(3, 'it_IT', 'title', '{$loggedInUsername}', 'string'),
(3, 'pt_BR', 'title', '{$loggedInUsername}', 'string'),
(4, 'en_US', 'title', 'Dashboard', 'string'),
(4, 'es_ES', 'title', 'Panel de control', 'string'),
(4, 'it_IT', 'title', 'Bacheca', 'string'),
(4, 'pt_BR', 'title', 'Painel de Controle', 'string'),
(5, 'en_US', 'title', 'View Profile', 'string'),
(5, 'es_ES', 'title', 'Ver perfil', 'string'),
(5, 'it_IT', 'title', 'Visualizza profilo', 'string'),
(5, 'pt_BR', 'title', 'Perfil', 'string'),
(6, 'en_US', 'title', 'Administration', 'string'),
(6, 'es_ES', 'title', 'Administración', 'string'),
(6, 'it_IT', 'title', 'Amministrazione', 'string'),
(6, 'pt_BR', 'title', 'Administração', 'string'),
(7, 'en_US', 'title', 'Logout', 'string'),
(7, 'es_ES', 'title', 'Salir', 'string'),
(7, 'it_IT', 'title', 'Esci', 'string'),
(7, 'pt_BR', 'title', 'Sair do sistema', 'string'),
(8, 'en_US', 'title', 'Register', 'string'),
(8, 'es_ES', 'title', 'Registrarse', 'string'),
(8, 'it_IT', 'title', 'Registrazione', 'string'),
(8, 'pt_BR', 'title', 'Cadastro', 'string'),
(9, 'en_US', 'title', 'Login', 'string'),
(9, 'es_ES', 'title', 'Entrar', 'string'),
(9, 'it_IT', 'title', 'Login', 'string'),
(9, 'pt_BR', 'title', 'Acesso', 'string'),
(10, 'en_US', 'title', '{$loggedInUsername}', 'string'),
(10, 'es_ES', 'title', '{$loggedInUsername}', 'string'),
(10, 'it_IT', 'title', '{$loggedInUsername}', 'string'),
(10, 'pt_BR', 'title', '{$loggedInUsername}', 'string'),
(11, 'en_US', 'title', 'Dashboard', 'string'),
(11, 'es_ES', 'title', 'Panel de control', 'string'),
(11, 'it_IT', 'title', 'Bacheca', 'string'),
(11, 'pt_BR', 'title', 'Painel de Controle', 'string'),
(12, 'en_US', 'title', 'View Profile', 'string'),
(12, 'es_ES', 'title', 'Ver perfil', 'string'),
(12, 'it_IT', 'title', 'Visualizza profilo', 'string'),
(12, 'pt_BR', 'title', 'Perfil', 'string'),
(13, 'en_US', 'title', 'Administration', 'string'),
(13, 'es_ES', 'title', 'Administración', 'string'),
(13, 'it_IT', 'title', 'Amministrazione', 'string'),
(13, 'pt_BR', 'title', 'Administração', 'string'),
(14, 'en_US', 'title', 'Logout', 'string'),
(14, 'es_ES', 'title', 'Salir', 'string'),
(14, 'it_IT', 'title', 'Esci', 'string'),
(14, 'pt_BR', 'title', 'Sair do sistema', 'string'),
(15, 'en_US', 'title', 'Current', 'string'),
(15, 'es_ES', 'title', 'Actual', 'string'),
(15, 'it_IT', 'title', 'Ultimo fascicolo', 'string'),
(15, 'pt_BR', 'title', 'Atual', 'string'),
(16, 'en_US', 'title', 'Archives', 'string'),
(16, 'es_ES', 'title', 'Archivos', 'string'),
(16, 'it_IT', 'title', 'navigation.archives', 'string'),
(16, 'pt_BR', 'title', 'Arquivos', 'string'),
(17, 'en_US', 'title', 'Announcements', 'string'),
(17, 'es_ES', 'title', 'Avisos', 'string'),
(17, 'it_IT', 'title', 'Avvisi', 'string'),
(17, 'pt_BR', 'title', 'Notícias', 'string'),
(18, 'en_US', 'title', 'About', 'string'),
(18, 'es_ES', 'title', 'Acerca de', 'string'),
(18, 'it_IT', 'title', 'Info', 'string'),
(18, 'pt_BR', 'title', 'Sobre', 'string'),
(19, 'en_US', 'title', 'About the Journal', 'string'),
(19, 'es_ES', 'title', 'Sobre la revista', 'string'),
(19, 'it_IT', 'title', 'Sulla rivista', 'string'),
(19, 'pt_BR', 'title', 'Sobre a Revista', 'string'),
(20, 'en_US', 'title', 'Submissions', 'string'),
(20, 'es_ES', 'title', 'Envíos', 'string'),
(20, 'it_IT', 'title', 'Proposte', 'string'),
(20, 'pt_BR', 'title', 'Submissões', 'string'),
(21, 'en_US', 'title', 'Editorial Team', 'string'),
(21, 'es_ES', 'title', 'Equipo editorial', 'string'),
(21, 'it_IT', 'title', 'Editorial Team', 'string'),
(21, 'pt_BR', 'title', 'Equipe Editorial', 'string'),
(22, 'en_US', 'title', 'Privacy Statement', 'string'),
(22, 'es_ES', 'title', 'Declaración de privacidad', 'string'),
(22, 'it_IT', 'title', 'manager.setup.privacyStatement', 'string'),
(22, 'pt_BR', 'title', 'Declaração de Privacidade', 'string'),
(23, 'en_US', 'title', 'Contact', 'string'),
(23, 'es_ES', 'title', 'Contacto', 'string'),
(23, 'it_IT', 'title', 'Contatti', 'string'),
(23, 'pt_BR', 'title', 'Contato', 'string');

-- --------------------------------------------------------

--
-- Estrutura da tabela `navigation_menu_item_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_settings`;
CREATE TABLE IF NOT EXISTS `navigation_menu_item_settings` (
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_settings_pkey` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_id` (`navigation_menu_item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `navigation_menu_item_settings`
--

INSERT INTO `navigation_menu_item_settings` (`navigation_menu_item_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'titleLocaleKey', 'navigation.register', 'string'),
(1, 'en_US', 'title', 'Register', 'string'),
(1, 'es_ES', 'title', 'Registrarse', 'string'),
(1, 'it_IT', 'title', 'Registrazione', 'string'),
(1, 'pt_BR', 'title', 'Cadastro', 'string'),
(2, '', 'titleLocaleKey', 'navigation.login', 'string'),
(2, 'en_US', 'title', 'Login', 'string'),
(2, 'es_ES', 'title', 'Entrar', 'string'),
(2, 'it_IT', 'title', 'Login', 'string'),
(2, 'pt_BR', 'title', 'Acesso', 'string'),
(3, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(3, 'en_US', 'title', '{$loggedInUsername}', 'string'),
(3, 'es_ES', 'title', '{$loggedInUsername}', 'string'),
(3, 'it_IT', 'title', '{$loggedInUsername}', 'string'),
(3, 'pt_BR', 'title', '{$loggedInUsername}', 'string'),
(4, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(4, 'en_US', 'title', 'Dashboard', 'string'),
(4, 'es_ES', 'title', 'Panel de control', 'string'),
(4, 'it_IT', 'title', 'Bacheca', 'string'),
(4, 'pt_BR', 'title', 'Painel de Controle', 'string'),
(5, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(5, 'en_US', 'title', 'View Profile', 'string'),
(5, 'es_ES', 'title', 'Ver perfil', 'string'),
(5, 'it_IT', 'title', 'Visualizza profilo', 'string'),
(5, 'pt_BR', 'title', 'Perfil', 'string'),
(6, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(6, 'en_US', 'title', 'Administration', 'string'),
(6, 'es_ES', 'title', 'Administración', 'string'),
(6, 'it_IT', 'title', 'Amministrazione', 'string'),
(6, 'pt_BR', 'title', 'Administração', 'string'),
(7, '', 'titleLocaleKey', 'user.logOut', 'string'),
(7, 'en_US', 'title', 'Logout', 'string'),
(7, 'es_ES', 'title', 'Salir', 'string'),
(7, 'it_IT', 'title', 'Esci', 'string'),
(7, 'pt_BR', 'title', 'Sair do sistema', 'string'),
(8, '', 'titleLocaleKey', 'navigation.register', 'string'),
(8, 'en_US', 'title', 'Register', 'string'),
(8, 'es_ES', 'title', 'Registrarse', 'string'),
(8, 'it_IT', 'title', 'Registrazione', 'string'),
(8, 'pt_BR', 'title', 'Cadastro', 'string'),
(9, '', 'titleLocaleKey', 'navigation.login', 'string'),
(9, 'en_US', 'title', 'Login', 'string'),
(9, 'es_ES', 'title', 'Entrar', 'string'),
(9, 'it_IT', 'title', 'Login', 'string'),
(9, 'pt_BR', 'title', 'Acesso', 'string'),
(10, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(10, 'en_US', 'title', '{$loggedInUsername}', 'string'),
(10, 'es_ES', 'title', '{$loggedInUsername}', 'string'),
(10, 'it_IT', 'title', '{$loggedInUsername}', 'string'),
(10, 'pt_BR', 'title', '{$loggedInUsername}', 'string'),
(11, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(11, 'en_US', 'title', 'Dashboard', 'string'),
(11, 'es_ES', 'title', 'Panel de control', 'string'),
(11, 'it_IT', 'title', 'Bacheca', 'string'),
(11, 'pt_BR', 'title', 'Painel de Controle', 'string'),
(12, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(12, 'en_US', 'title', 'View Profile', 'string'),
(12, 'es_ES', 'title', 'Ver perfil', 'string'),
(12, 'it_IT', 'title', 'Visualizza profilo', 'string'),
(12, 'pt_BR', 'title', 'Perfil', 'string'),
(13, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(13, 'en_US', 'title', 'Administration', 'string'),
(13, 'es_ES', 'title', 'Administración', 'string'),
(13, 'it_IT', 'title', 'Amministrazione', 'string'),
(13, 'pt_BR', 'title', 'Administração', 'string'),
(14, '', 'titleLocaleKey', 'user.logOut', 'string'),
(14, 'en_US', 'title', 'Logout', 'string'),
(14, 'es_ES', 'title', 'Salir', 'string'),
(14, 'it_IT', 'title', 'Esci', 'string'),
(14, 'pt_BR', 'title', 'Sair do sistema', 'string'),
(15, '', 'titleLocaleKey', 'navigation.current', 'string'),
(15, 'en_US', 'title', 'Current', 'string'),
(15, 'es_ES', 'title', 'Actual', 'string'),
(15, 'it_IT', 'title', 'Ultimo fascicolo', 'string'),
(15, 'pt_BR', 'title', 'Atual', 'string'),
(16, '', 'titleLocaleKey', 'navigation.archives', 'string'),
(16, 'en_US', 'title', 'Archives', 'string'),
(16, 'es_ES', 'title', 'Archivos', 'string'),
(16, 'it_IT', 'title', 'navigation.archives', 'string'),
(16, 'pt_BR', 'title', 'Arquivos', 'string'),
(17, '', 'titleLocaleKey', 'manager.announcements', 'string'),
(17, 'en_US', 'title', 'Announcements', 'string'),
(17, 'es_ES', 'title', 'Avisos', 'string'),
(17, 'it_IT', 'title', 'Avvisi', 'string'),
(17, 'pt_BR', 'title', 'Notícias', 'string'),
(18, '', 'titleLocaleKey', 'navigation.about', 'string'),
(18, 'en_US', 'title', 'About', 'string'),
(18, 'es_ES', 'title', 'Acerca de', 'string'),
(18, 'it_IT', 'title', 'Info', 'string'),
(18, 'pt_BR', 'title', 'Sobre', 'string'),
(19, '', 'titleLocaleKey', 'about.aboutContext', 'string'),
(19, 'en_US', 'title', 'About the Journal', 'string'),
(19, 'es_ES', 'title', 'Sobre la revista', 'string'),
(19, 'it_IT', 'title', 'Sulla rivista', 'string'),
(19, 'pt_BR', 'title', 'Sobre a Revista', 'string'),
(20, '', 'titleLocaleKey', 'navigation.submissions', 'string'),
(20, 'en_US', 'title', 'Submissions', 'string'),
(20, 'es_ES', 'title', 'Envíos', 'string'),
(20, 'it_IT', 'title', 'Proposte', 'string'),
(20, 'pt_BR', 'title', 'Submissões', 'string'),
(21, '', 'titleLocaleKey', 'about.editorialTeam', 'string'),
(21, 'en_US', 'title', 'Editorial Team', 'string'),
(21, 'es_ES', 'title', 'Equipo editorial', 'string'),
(21, 'it_IT', 'title', 'Editorial Team', 'string'),
(21, 'pt_BR', 'title', 'Equipe Editorial', 'string'),
(22, '', 'titleLocaleKey', 'manager.setup.privacyStatement', 'string'),
(22, 'en_US', 'title', 'Privacy Statement', 'string'),
(22, 'es_ES', 'title', 'Declaración de privacidad', 'string'),
(22, 'it_IT', 'title', 'manager.setup.privacyStatement', 'string'),
(22, 'pt_BR', 'title', 'Declaração de Privacidade', 'string'),
(23, '', 'titleLocaleKey', 'about.contact', 'string'),
(23, 'en_US', 'title', 'Contact', 'string'),
(23, 'es_ES', 'title', 'Contacto', 'string'),
(23, 'it_IT', 'title', 'Contatti', 'string'),
(23, 'pt_BR', 'title', 'Contato', 'string'),
(24, '', 'titleLocaleKey', 'common.search', 'string'),
(24, 'en_US', 'title', 'Search', 'string'),
(24, 'es_ES', 'title', 'Buscar', 'string'),
(24, 'it_IT', 'title', 'Cerca', 'string'),
(24, 'pt_BR', 'title', 'Buscar', 'string');

-- --------------------------------------------------------

--
-- Estrutura da tabela `notes`
--

DROP TABLE IF EXISTS `notes`;
CREATE TABLE IF NOT EXISTS `notes` (
  `note_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text,
  PRIMARY KEY (`note_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `notifications`
--

INSERT INTO `notifications` (`notification_id`, `context_id`, `user_id`, `level`, `type`, `date_created`, `date_read`, `assoc_type`, `assoc_id`) VALUES
(7, 1, 0, 2, 16777244, '2018-10-22 08:02:56', NULL, 256, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `notification_mail_list`
--

DROP TABLE IF EXISTS `notification_mail_list`;
CREATE TABLE IF NOT EXISTS `notification_mail_list` (
  `notification_mail_list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `token` varchar(40) NOT NULL,
  `context` bigint(20) NOT NULL,
  PRIMARY KEY (`notification_mail_list_id`),
  UNIQUE KEY `notification_mail_list_email_context` (`email`,`context`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
CREATE TABLE IF NOT EXISTS `notification_settings` (
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `notification_settings_pkey` (`notification_id`,`locale`,`setting_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notification_subscription_settings`
--

DROP TABLE IF EXISTS `notification_subscription_settings`;
CREATE TABLE IF NOT EXISTS `notification_subscription_settings` (
  `setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `oai_resumption_tokens`
--

DROP TABLE IF EXISTS `oai_resumption_tokens`;
CREATE TABLE IF NOT EXISTS `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text,
  UNIQUE KEY `oai_resumption_tokens_pkey` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `plugin_settings`
--

DROP TABLE IF EXISTS `plugin_settings`;
CREATE TABLE IF NOT EXISTS `plugin_settings` (
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `plugin_settings`
--

INSERT INTO `plugin_settings` (`plugin_name`, `context_id`, `setting_name`, `setting_value`, `setting_type`) VALUES
('acronplugin', 0, 'enabled', '1', 'bool'),
('acronplugin', 0, 'crontab', 'a:6:{i:0;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:1;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:2;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:3;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:4;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:5;a:3:{s:9:\"className\";s:35:\"lib.pkp.classes.task.ReviewReminder\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}}', 'object'),
('tinymceplugin', 0, 'enabled', '1', 'bool'),
('usageeventplugin', 0, 'enabled', '1', 'bool'),
('usageeventplugin', 0, 'uniqueSiteId', '', 'string'),
('usagestatsplugin', 0, 'enabled', '1', 'bool'),
('usagestatsplugin', 0, 'createLogFiles', '1', 'bool'),
('usagestatsplugin', 0, 'accessLogFileParseRegex', '/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/', 'string'),
('usagestatsplugin', 0, 'optionalColumns', 'a:2:{i:0;s:4:\"city\";i:1;s:6:\"region\";}', 'object'),
('usagestatsplugin', 0, 'chartType', 'bar', 'string'),
('usagestatsplugin', 0, 'datasetMaxCount', '4', 'string'),
('defaultthemeplugin', 0, 'enabled', '1', 'bool'),
('developedbyblockplugin', 0, 'enabled', '0', 'bool'),
('developedbyblockplugin', 0, 'seq', '0', 'int'),
('developedbyblockplugin', 0, 'context', '1', 'int'),
('languagetoggleblockplugin', 0, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', 0, 'seq', '4', 'int'),
('languagetoggleblockplugin', 0, 'context', '1', 'int'),
('tinymceplugin', 1, 'enabled', '1', 'bool'),
('defaultthemeplugin', 1, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', 1, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', 1, 'seq', '4', 'int'),
('languagetoggleblockplugin', 1, 'context', '1', 'int'),
('developedbyblockplugin', 1, 'enabled', '0', 'bool'),
('developedbyblockplugin', 1, 'seq', '0', 'int'),
('developedbyblockplugin', 1, 'context', '1', 'int'),
('informationblockplugin', 1, 'enabled', '1', 'bool'),
('informationblockplugin', 1, 'seq', '7', 'int'),
('informationblockplugin', 1, 'context', '1', 'int'),
('subscriptionblockplugin', 1, 'enabled', '1', 'bool'),
('subscriptionblockplugin', 1, 'seq', '2', 'int'),
('subscriptionblockplugin', 1, 'context', '1', 'int'),
('resolverplugin', 1, 'enabled', '1', 'bool'),
('dublincoremetaplugin', 1, 'enabled', '1', 'bool'),
('googlescholarplugin', 1, 'enabled', '1', 'bool'),
('htmlarticlegalleyplugin', 1, 'enabled', '1', 'bool'),
('lensgalleyplugin', 1, 'enabled', '1', 'bool'),
('pdfjsviewerplugin', 1, 'enabled', '1', 'bool'),
('webfeedplugin', 1, 'enabled', '1', 'bool'),
('webfeedplugin', 1, 'displayPage', 'homepage', 'string'),
('webfeedplugin', 1, 'displayItems', '1', 'bool'),
('defaultthemeplugin', 1, 'baseColour', '#1e6292', 'text');

-- --------------------------------------------------------

--
-- Estrutura da tabela `published_submissions`
--

DROP TABLE IF EXISTS `published_submissions`;
CREATE TABLE IF NOT EXISTS `published_submissions` (
  `published_submission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `date_published` datetime DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `access_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`published_submission_id`),
  UNIQUE KEY `published_submissions_submission_id` (`submission_id`),
  KEY `published_submissions_issue_id` (`issue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `queries`
--

DROP TABLE IF EXISTS `queries`;
CREATE TABLE IF NOT EXISTS `queries` (
  `query_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `stage_id` tinyint(4) NOT NULL DEFAULT '1',
  `seq` double NOT NULL DEFAULT '0',
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`query_id`),
  KEY `queries_assoc_id` (`assoc_type`,`assoc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `query_participants`
--

DROP TABLE IF EXISTS `query_participants`;
CREATE TABLE IF NOT EXISTS `query_participants` (
  `query_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `query_participants_pkey` (`query_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `queued_payments`
--

DROP TABLE IF EXISTS `queued_payments`;
CREATE TABLE IF NOT EXISTS `queued_payments` (
  `queued_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text,
  PRIMARY KEY (`queued_payment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `review_assignments`
--

DROP TABLE IF EXISTS `review_assignments`;
CREATE TABLE IF NOT EXISTS `review_assignments` (
  `review_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `competing_interests` text,
  `recommendation` tinyint(4) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` tinyint(4) NOT NULL DEFAULT '0',
  `declined` tinyint(4) NOT NULL DEFAULT '0',
  `replaced` tinyint(4) NOT NULL DEFAULT '0',
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` tinyint(4) DEFAULT NULL,
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` tinyint(4) NOT NULL DEFAULT '1',
  `review_method` tinyint(4) NOT NULL DEFAULT '1',
  `round` tinyint(4) NOT NULL DEFAULT '1',
  `step` tinyint(4) NOT NULL DEFAULT '1',
  `review_form_id` bigint(20) DEFAULT NULL,
  `unconsidered` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`),
  KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `review_files`
--

DROP TABLE IF EXISTS `review_files`;
CREATE TABLE IF NOT EXISTS `review_files` (
  `review_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  UNIQUE KEY `review_files_pkey` (`review_id`,`file_id`),
  KEY `review_files_review_id` (`review_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `review_forms`
--

DROP TABLE IF EXISTS `review_forms`;
CREATE TABLE IF NOT EXISTS `review_forms` (
  `review_form_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `seq` double DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `review_form_elements`
--

DROP TABLE IF EXISTS `review_form_elements`;
CREATE TABLE IF NOT EXISTS `review_form_elements` (
  `review_form_element_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  `included` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_form_element_id`),
  KEY `review_form_elements_review_form_id` (`review_form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `review_form_element_settings`
--

DROP TABLE IF EXISTS `review_form_element_settings`;
CREATE TABLE IF NOT EXISTS `review_form_element_settings` (
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `review_form_responses`
--

DROP TABLE IF EXISTS `review_form_responses`;
CREATE TABLE IF NOT EXISTS `review_form_responses` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text,
  KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `review_form_settings`
--

DROP TABLE IF EXISTS `review_form_settings`;
CREATE TABLE IF NOT EXISTS `review_form_settings` (
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `review_rounds`
--

DROP TABLE IF EXISTS `review_rounds`;
CREATE TABLE IF NOT EXISTS `review_rounds` (
  `review_round_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` tinyint(4) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`review_round_id`),
  UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  KEY `review_rounds_submission_id` (`submission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `review_round_files`
--

DROP TABLE IF EXISTS `review_round_files`;
CREATE TABLE IF NOT EXISTS `review_round_files` (
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` tinyint(4) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL DEFAULT '1',
  UNIQUE KEY `review_round_files_pkey` (`submission_id`,`review_round_id`,`file_id`,`revision`),
  KEY `review_round_files_submission_id` (`submission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rt_contexts`
--

DROP TABLE IF EXISTS `rt_contexts`;
CREATE TABLE IF NOT EXISTS `rt_contexts` (
  `context_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version_id` bigint(20) NOT NULL,
  `title` varchar(120) NOT NULL,
  `abbrev` varchar(32) NOT NULL,
  `description` text,
  `cited_by` tinyint(4) NOT NULL DEFAULT '0',
  `author_terms` tinyint(4) NOT NULL DEFAULT '0',
  `define_terms` tinyint(4) NOT NULL DEFAULT '0',
  `geo_terms` tinyint(4) NOT NULL DEFAULT '0',
  `seq` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`context_id`),
  KEY `rt_contexts_version_id` (`version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rt_searches`
--

DROP TABLE IF EXISTS `rt_searches`;
CREATE TABLE IF NOT EXISTS `rt_searches` (
  `search_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `title` varchar(120) NOT NULL,
  `description` text,
  `url` text,
  `search_url` text,
  `search_post` text,
  `seq` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`search_id`),
  KEY `rt_searches_context_id` (`context_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rt_versions`
--

DROP TABLE IF EXISTS `rt_versions`;
CREATE TABLE IF NOT EXISTS `rt_versions` (
  `version_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `version_key` varchar(40) NOT NULL,
  `locale` varchar(14) DEFAULT 'en_US',
  `title` varchar(120) NOT NULL,
  `description` text,
  PRIMARY KEY (`version_id`),
  KEY `rt_versions_journal_id` (`journal_id`),
  KEY `rt_versions_version_key` (`version_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `scheduled_tasks`
--

DROP TABLE IF EXISTS `scheduled_tasks`;
CREATE TABLE IF NOT EXISTS `scheduled_tasks` (
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL,
  UNIQUE KEY `scheduled_tasks_pkey` (`class_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `scheduled_tasks`
--

INSERT INTO `scheduled_tasks` (`class_name`, `last_run`) VALUES
('plugins.generic.usageStats.UsageStatsLoader', '2018-10-22 04:37:09'),
('plugins.importexport.crossref.CrossrefInfoSender', '2018-10-22 04:37:15'),
('plugins.importexport.datacite.DataciteInfoSender', '2018-10-22 04:37:17'),
('plugins.importexport.doaj.DOAJInfoSender', '2018-10-22 04:37:17'),
('plugins.importexport.medra.MedraInfoSender', '2018-10-22 04:37:17'),
('lib.pkp.classes.task.ReviewReminder', '2018-10-22 04:37:18');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sections`
--

DROP TABLE IF EXISTS `sections`;
CREATE TABLE IF NOT EXISTS `sections` (
  `section_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `editor_restricted` tinyint(4) NOT NULL DEFAULT '0',
  `meta_indexed` tinyint(4) NOT NULL DEFAULT '0',
  `meta_reviewed` tinyint(4) NOT NULL DEFAULT '1',
  `abstracts_not_required` tinyint(4) NOT NULL DEFAULT '0',
  `hide_title` tinyint(4) NOT NULL DEFAULT '0',
  `hide_author` tinyint(4) NOT NULL DEFAULT '0',
  `abstract_word_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `sections_journal_id` (`journal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `sections`
--

INSERT INTO `sections` (`section_id`, `journal_id`, `review_form_id`, `seq`, `editor_restricted`, `meta_indexed`, `meta_reviewed`, `abstracts_not_required`, `hide_title`, `hide_author`, `abstract_word_count`) VALUES
(1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `section_editors`
--

DROP TABLE IF EXISTS `section_editors`;
CREATE TABLE IF NOT EXISTS `section_editors` (
  `context_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `section_editors_pkey` (`context_id`,`section_id`,`user_id`),
  KEY `section_editors_context_id` (`context_id`),
  KEY `section_editors_section_id` (`section_id`),
  KEY `section_editors_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `section_settings`
--

DROP TABLE IF EXISTS `section_settings`;
CREATE TABLE IF NOT EXISTS `section_settings` (
  `section_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `section_settings_pkey` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `section_settings`
--

INSERT INTO `section_settings` (`section_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'pt_BR', 'title', 'Artigos', 'string'),
(1, 'pt_BR', 'abbrev', 'ART', 'string'),
(1, 'pt_BR', 'policy', 'Política padrão de seção', 'string');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT '0',
  `last_used` bigint(20) NOT NULL DEFAULT '0',
  `remember` tinyint(4) NOT NULL DEFAULT '0',
  `data` text,
  `domain` varchar(255) DEFAULT NULL,
  UNIQUE KEY `sessions_pkey` (`session_id`),
  KEY `sessions_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `sessions`
--

INSERT INTO `sessions` (`session_id`, `user_id`, `ip_address`, `user_agent`, `created`, `last_used`, `remember`, `data`, `domain`) VALUES
('tau8e5hid6q8c9daifpt8u3gi7', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 1539842702, 1540255161, 1, 'csrf|a:2:{s:9:\"timestamp\";i:1540255105;s:5:\"token\";s:32:\"5cc0b4628b02322f604929e0734ddcc0\";}currentLocale|s:5:\"pt_BR\";userId|s:1:\"1\";username|s:5:\"lucas\";', 'localhost');

-- --------------------------------------------------------

--
-- Estrutura da tabela `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `redirect` bigint(20) NOT NULL DEFAULT '0',
  `primary_locale` varchar(14) NOT NULL,
  `min_password_length` tinyint(4) NOT NULL DEFAULT '6',
  `installed_locales` varchar(255) NOT NULL DEFAULT 'en_US',
  `supported_locales` varchar(255) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `site`
--

INSERT INTO `site` (`redirect`, `primary_locale`, `min_password_length`, `installed_locales`, `supported_locales`, `original_style_file_name`) VALUES
(0, 'pt_BR', 6, 'en_US:es_ES:it_IT:pt_BR', 'en_US:es_ES:it_IT:pt_BR', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
CREATE TABLE IF NOT EXISTS `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `site_settings`
--

INSERT INTO `site_settings` (`setting_name`, `locale`, `setting_value`, `setting_type`) VALUES
('showThumbnail', '', '1', 'bool'),
('showTitle', '', '1', 'bool'),
('showDescription', '', '1', 'bool'),
('contactName', 'en_US', 'Open Journal Systems', 'string'),
('contactEmail', 'en_US', 'lucasbrigidosi@gmail.com', 'string'),
('themePluginPath', '', 'default', 'string');

-- --------------------------------------------------------

--
-- Estrutura da tabela `stage_assignments`
--

DROP TABLE IF EXISTS `stage_assignments`;
CREATE TABLE IF NOT EXISTS `stage_assignments` (
  `stage_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stage_assignment_id`),
  UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `static_pages`
--

DROP TABLE IF EXISTS `static_pages`;
CREATE TABLE IF NOT EXISTS `static_pages` (
  `static_page_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  PRIMARY KEY (`static_page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `static_page_settings`
--

DROP TABLE IF EXISTS `static_page_settings`;
CREATE TABLE IF NOT EXISTS `static_page_settings` (
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`),
  KEY `static_page_settings_static_page_id` (`static_page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `submissions`
--

DROP TABLE IF EXISTS `submissions`;
CREATE TABLE IF NOT EXISTS `submissions` (
  `submission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `context_id` bigint(20) NOT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `language` varchar(10) DEFAULT 'en',
  `citations` text,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_status_modified` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `submission_progress` tinyint(4) NOT NULL DEFAULT '1',
  `pages` varchar(255) DEFAULT NULL,
  `hide_author` tinyint(4) NOT NULL DEFAULT '0',
  `stage_id` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`submission_id`),
  KEY `submissions_section_id` (`section_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `submission_artwork_files`
--

DROP TABLE IF EXISTS `submission_artwork_files`;
CREATE TABLE IF NOT EXISTS `submission_artwork_files` (
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `caption` text,
  `credit` varchar(255) DEFAULT NULL,
  `copyright_owner` varchar(255) DEFAULT NULL,
  `copyright_owner_contact` text,
  `permission_terms` text,
  `permission_file_id` bigint(20) DEFAULT NULL,
  `chapter_id` bigint(20) DEFAULT NULL,
  `contact_author` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`,`revision`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `submission_comments`
--

DROP TABLE IF EXISTS `submission_comments`;
CREATE TABLE IF NOT EXISTS `submission_comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` text,
  `comments` text,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `submission_comments_submission_id` (`submission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `submission_files`
--

DROP TABLE IF EXISTS `submission_files`;
CREATE TABLE IF NOT EXISTS `submission_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `revision` bigint(20) NOT NULL,
  `source_file_id` bigint(20) DEFAULT NULL,
  `source_revision` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `genre_id` bigint(20) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `uploader_user_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`,`revision`),
  KEY `submission_files_submission_id` (`submission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
CREATE TABLE IF NOT EXISTS `submission_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `submission_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_id` (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `submission_galleys`
--

DROP TABLE IF EXISTS `submission_galleys`;
CREATE TABLE IF NOT EXISTS `submission_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `remote_url` varchar(2047) DEFAULT NULL,
  `is_approved` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`galley_id`),
  KEY `submission_galleys_submission_id` (`submission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `submission_galley_settings`
--

DROP TABLE IF EXISTS `submission_galley_settings`;
CREATE TABLE IF NOT EXISTS `submission_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `submission_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `submission_galley_settings_galley_id` (`galley_id`),
  KEY `submission_galley_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `submission_search_keyword_list`
--

DROP TABLE IF EXISTS `submission_search_keyword_list`;
CREATE TABLE IF NOT EXISTS `submission_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `keyword_text` varchar(60) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `submission_search_keyword_text` (`keyword_text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `submission_search_objects`
--

DROP TABLE IF EXISTS `submission_search_objects`;
CREATE TABLE IF NOT EXISTS `submission_search_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `submission_search_object_keywords`
--

DROP TABLE IF EXISTS `submission_search_object_keywords`;
CREATE TABLE IF NOT EXISTS `submission_search_object_keywords` (
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL,
  UNIQUE KEY `submission_search_object_keywords_pkey` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `submission_settings`
--

DROP TABLE IF EXISTS `submission_settings`;
CREATE TABLE IF NOT EXISTS `submission_settings` (
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `submission_settings_pkey` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`),
  KEY `submission_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `submission_supplementary_files`
--

DROP TABLE IF EXISTS `submission_supplementary_files`;
CREATE TABLE IF NOT EXISTS `submission_supplementary_files` (
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  PRIMARY KEY (`file_id`,`revision`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `submission_tombstones`
--

DROP TABLE IF EXISTS `submission_tombstones`;
CREATE TABLE IF NOT EXISTS `submission_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `submission_tombstones_journal_id` (`journal_id`),
  KEY `submission_tombstones_submission_id` (`submission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `membership` varchar(40) DEFAULT NULL,
  `reference_number` varchar(40) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`subscription_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `subscription_types`
--

DROP TABLE IF EXISTS `subscription_types`;
CREATE TABLE IF NOT EXISTS `subscription_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `cost` double NOT NULL,
  `currency_code_alpha` varchar(3) NOT NULL,
  `non_expiring` tinyint(4) NOT NULL DEFAULT '0',
  `duration` smallint(6) DEFAULT NULL,
  `format` smallint(6) NOT NULL,
  `institutional` tinyint(4) NOT NULL DEFAULT '0',
  `membership` tinyint(4) NOT NULL DEFAULT '0',
  `disable_public_display` tinyint(4) NOT NULL,
  `seq` double NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `subscription_type_settings`
--

DROP TABLE IF EXISTS `subscription_type_settings`;
CREATE TABLE IF NOT EXISTS `subscription_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `subscription_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `subscription_type_settings_type_id` (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `temporary_files`
--

DROP TABLE IF EXISTS `temporary_files`;
CREATE TABLE IF NOT EXISTS `temporary_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `temporary_files_user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usage_stats_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_temporary_records`;
CREATE TABLE IF NOT EXISTS `usage_stats_temporary_records` (
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `day` bigint(20) NOT NULL,
  `entry_time` bigint(20) NOT NULL,
  `metric` bigint(20) NOT NULL DEFAULT '1',
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) NOT NULL,
  `file_type` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `suffix` varchar(255) DEFAULT NULL,
  `initials` varchar(5) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) DEFAULT NULL,
  `gossip` text,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime NOT NULL,
  `must_change_password` tinyint(4) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `disabled_reason` text,
  `inline_help` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `salutation`, `first_name`, `middle_name`, `last_name`, `suffix`, `initials`, `email`, `url`, `phone`, `mailing_address`, `billing_address`, `country`, `locales`, `gossip`, `date_last_email`, `date_registered`, `date_validated`, `date_last_login`, `must_change_password`, `auth_id`, `auth_str`, `disabled`, `disabled_reason`, `inline_help`) VALUES
(1, 'lucas', '$2y$10$DwXAChaoRvaqjOqD3vNmfeMQteu8qb4Qa79f5GswEYQVt8rjWQFju', NULL, 'lucas', NULL, 'lucas', NULL, 'll', 'lucasbrigidosi@gmail.com', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2018-10-18 06:04:51', NULL, '2018-10-18 06:06:54', 0, NULL, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
CREATE TABLE IF NOT EXISTS `user_groups` (
  `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `show_title` tinyint(4) NOT NULL DEFAULT '1',
  `permit_self_registration` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_group_id`),
  KEY `user_groups_user_group_id` (`user_group_id`),
  KEY `user_groups_context_id` (`context_id`),
  KEY `user_groups_role_id` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `user_groups`
--

INSERT INTO `user_groups` (`user_group_id`, `context_id`, `role_id`, `is_default`, `show_title`, `permit_self_registration`) VALUES
(1, 0, 1, 1, 0, 0),
(2, 1, 16, 1, 0, 0),
(3, 1, 16, 1, 0, 0),
(4, 1, 16, 1, 0, 0),
(5, 1, 17, 1, 0, 0),
(6, 1, 17, 1, 0, 0),
(7, 1, 4097, 1, 0, 0),
(8, 1, 4097, 1, 0, 0),
(9, 1, 4097, 1, 0, 0),
(10, 1, 4097, 1, 0, 0),
(11, 1, 4097, 1, 0, 0),
(12, 1, 4097, 1, 0, 0),
(13, 1, 4097, 1, 0, 0),
(14, 1, 65536, 1, 0, 1),
(15, 1, 65536, 1, 0, 0),
(16, 1, 4096, 1, 0, 1),
(17, 1, 1048576, 1, 0, 1),
(18, 1, 2097152, 1, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_group_settings`
--

DROP TABLE IF EXISTS `user_group_settings`;
CREATE TABLE IF NOT EXISTS `user_group_settings` (
  `user_group_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_group_settings_pkey` (`user_group_id`,`locale`,`setting_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `user_group_settings`
--

INSERT INTO `user_group_settings` (`user_group_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'name', 'Site Admin', 'string'),
(1, 'es_ES', 'name', '##default.groups.name.siteAdmin##', 'string'),
(1, 'it_IT', 'name', '##default.groups.name.siteAdmin##', 'string'),
(1, 'pt_BR', 'name', '##default.groups.name.siteAdmin##', 'string'),
(2, '', 'nameLocaleKey', 'default.groups.name.manager', 'string'),
(2, '', 'abbrevLocaleKey', 'default.groups.abbrev.manager', 'string'),
(2, 'en_US', 'name', 'Journal manager', 'string'),
(2, 'en_US', 'abbrev', 'JM', 'string'),
(2, 'es_ES', 'name', 'Gestor/a de la revista', 'string'),
(2, 'es_ES', 'abbrev', 'GR', 'string'),
(2, 'it_IT', 'name', 'Direttore', 'string'),
(2, 'it_IT', 'abbrev', 'MNGR', 'string'),
(2, 'pt_BR', 'name', 'Gerente da revista', 'string'),
(2, 'pt_BR', 'abbrev', 'GR', 'string'),
(3, '', 'nameLocaleKey', 'default.groups.name.editor', 'string'),
(3, '', 'abbrevLocaleKey', 'default.groups.abbrev.editor', 'string'),
(3, 'en_US', 'name', 'Journal editor', 'string'),
(3, 'en_US', 'abbrev', 'JE', 'string'),
(3, 'es_ES', 'name', 'Editor/a de la revista', 'string'),
(3, 'es_ES', 'abbrev', 'ER', 'string'),
(3, 'it_IT', 'name', 'Editor', 'string'),
(3, 'it_IT', 'abbrev', 'EDT', 'string'),
(3, 'pt_BR', 'name', 'Editor da revista', 'string'),
(3, 'pt_BR', 'abbrev', 'ER', 'string'),
(4, '', 'nameLocaleKey', 'default.groups.name.productionEditor', 'string'),
(4, '', 'abbrevLocaleKey', 'default.groups.abbrev.productionEditor', 'string'),
(4, 'en_US', 'name', 'Production editor', 'string'),
(4, 'en_US', 'abbrev', 'ProdE', 'string'),
(4, 'es_ES', 'name', 'Coordinador/a de producción', 'string'),
(4, 'es_ES', 'abbrev', 'CoProd', 'string'),
(4, 'it_IT', 'name', 'Editor di produzione', 'string'),
(4, 'it_IT', 'abbrev', 'ProdE', 'string'),
(4, 'pt_BR', 'name', 'Editor de Leiaute', 'string'),
(4, 'pt_BR', 'abbrev', 'EP', 'string'),
(5, '', 'nameLocaleKey', 'default.groups.name.sectionEditor', 'string'),
(5, '', 'abbrevLocaleKey', 'default.groups.abbrev.sectionEditor', 'string'),
(5, 'en_US', 'name', 'Section editor', 'string'),
(5, 'en_US', 'abbrev', 'SecE', 'string'),
(5, 'es_ES', 'name', 'Editor/a de sección', 'string'),
(5, 'es_ES', 'abbrev', 'ESec', 'string'),
(5, 'it_IT', 'name', 'Editor di sezione', 'string'),
(5, 'it_IT', 'abbrev', 'SecE', 'string'),
(5, 'pt_BR', 'name', 'Editor de seção', 'string'),
(5, 'pt_BR', 'abbrev', 'ESeç', 'string'),
(6, '', 'nameLocaleKey', 'default.groups.name.guestEditor', 'string'),
(6, '', 'abbrevLocaleKey', 'default.groups.abbrev.guestEditor', 'string'),
(6, 'en_US', 'name', 'Guest editor', 'string'),
(6, 'en_US', 'abbrev', 'GE', 'string'),
(6, 'es_ES', 'name', 'Editor/a invitado/a', 'string'),
(6, 'es_ES', 'abbrev', 'EI', 'string'),
(6, 'it_IT', 'name', 'Guest editor', 'string'),
(6, 'it_IT', 'abbrev', 'G_EDT', 'string'),
(6, 'pt_BR', 'name', 'Editor convidado', 'string'),
(6, 'pt_BR', 'abbrev', 'EConv', 'string'),
(7, '', 'nameLocaleKey', 'default.groups.name.copyeditor', 'string'),
(7, '', 'abbrevLocaleKey', 'default.groups.abbrev.copyeditor', 'string'),
(7, 'en_US', 'name', 'Copyeditor', 'string'),
(7, 'en_US', 'abbrev', 'CE', 'string'),
(7, 'es_ES', 'name', 'Corrector/a de estilo', 'string'),
(7, 'es_ES', 'abbrev', 'CE', 'string'),
(7, 'it_IT', 'name', 'Copyeditor', 'string'),
(7, 'it_IT', 'abbrev', 'CopyE', 'string'),
(7, 'pt_BR', 'name', 'Editor de texto', 'string'),
(7, 'pt_BR', 'abbrev', 'ET', 'string'),
(8, '', 'nameLocaleKey', 'default.groups.name.designer', 'string'),
(8, '', 'abbrevLocaleKey', 'default.groups.abbrev.designer', 'string'),
(8, 'en_US', 'name', 'Designer', 'string'),
(8, 'en_US', 'abbrev', 'Design', 'string'),
(8, 'es_ES', 'name', 'Diseñador/a', 'string'),
(8, 'es_ES', 'abbrev', 'Diseño', 'string'),
(8, 'it_IT', 'name', 'Designer', 'string'),
(8, 'it_IT', 'abbrev', 'Design', 'string'),
(8, 'pt_BR', 'name', 'Designer', 'string'),
(8, 'pt_BR', 'abbrev', 'DE', 'string'),
(9, '', 'nameLocaleKey', 'default.groups.name.funding', 'string'),
(9, '', 'abbrevLocaleKey', 'default.groups.abbrev.funding', 'string'),
(9, 'en_US', 'name', 'Funding coordinator', 'string'),
(9, 'en_US', 'abbrev', 'FC', 'string'),
(9, 'es_ES', 'name', 'Coordinador/a de financiación', 'string'),
(9, 'es_ES', 'abbrev', 'CF', 'string'),
(9, 'it_IT', 'name', 'Finanziatore', 'string'),
(9, 'it_IT', 'abbrev', 'FC', 'string'),
(9, 'pt_BR', 'name', 'Coordenador de Financiamento', 'string'),
(9, 'pt_BR', 'abbrev', 'CF', 'string'),
(10, '', 'nameLocaleKey', 'default.groups.name.indexer', 'string'),
(10, '', 'abbrevLocaleKey', 'default.groups.abbrev.indexer', 'string'),
(10, 'en_US', 'name', 'Indexer', 'string'),
(10, 'en_US', 'abbrev', 'IND', 'string'),
(10, 'es_ES', 'name', 'Documentalista', 'string'),
(10, 'es_ES', 'abbrev', 'DOC', 'string'),
(10, 'it_IT', 'name', 'Indicizzatore', 'string'),
(10, 'it_IT', 'abbrev', 'IND', 'string'),
(10, 'pt_BR', 'name', 'Indexador', 'string'),
(10, 'pt_BR', 'abbrev', 'IND', 'string'),
(11, '', 'nameLocaleKey', 'default.groups.name.layoutEditor', 'string'),
(11, '', 'abbrevLocaleKey', 'default.groups.abbrev.layoutEditor', 'string'),
(11, 'en_US', 'name', 'Layout Editor', 'string'),
(11, 'en_US', 'abbrev', 'LE', 'string'),
(11, 'es_ES', 'name', 'Maquetador/a', 'string'),
(11, 'es_ES', 'abbrev', 'MAQ', 'string'),
(11, 'it_IT', 'name', 'Layout editor', 'string'),
(11, 'it_IT', 'abbrev', 'LE', 'string'),
(11, 'pt_BR', 'name', 'Editor de Leiaute', 'string'),
(11, 'pt_BR', 'abbrev', 'EL', 'string'),
(12, '', 'nameLocaleKey', 'default.groups.name.marketing', 'string'),
(12, '', 'abbrevLocaleKey', 'default.groups.abbrev.marketing', 'string'),
(12, 'en_US', 'name', 'Marketing and sales coordinator', 'string'),
(12, 'en_US', 'abbrev', 'MS', 'string'),
(12, 'es_ES', 'name', 'Coordinador/a de marketing y ventas', 'string'),
(12, 'es_ES', 'abbrev', 'MV', 'string'),
(12, 'it_IT', 'name', 'Marketing', 'string'),
(12, 'it_IT', 'abbrev', 'MKTG', 'string'),
(12, 'pt_BR', 'name', 'Coordenador de Vendas e Marketing', 'string'),
(12, 'pt_BR', 'abbrev', 'CVM', 'string'),
(13, '', 'nameLocaleKey', 'default.groups.name.proofreader', 'string'),
(13, '', 'abbrevLocaleKey', 'default.groups.abbrev.proofreader', 'string'),
(13, 'en_US', 'name', 'Proofreader', 'string'),
(13, 'en_US', 'abbrev', 'PR', 'string'),
(13, 'es_ES', 'name', 'Corrector/a de pruebas', 'string'),
(13, 'es_ES', 'abbrev', 'CP', 'string'),
(13, 'it_IT', 'name', 'Correttore di bozze', 'string'),
(13, 'it_IT', 'abbrev', 'ProofR', 'string'),
(13, 'pt_BR', 'name', 'Leitor de Prova', 'string'),
(13, 'pt_BR', 'abbrev', 'LP', 'string'),
(14, '', 'nameLocaleKey', 'default.groups.name.author', 'string'),
(14, '', 'abbrevLocaleKey', 'default.groups.abbrev.author', 'string'),
(14, 'en_US', 'name', 'Author', 'string'),
(14, 'en_US', 'abbrev', 'AU', 'string'),
(14, 'es_ES', 'name', 'Autor/a', 'string'),
(14, 'es_ES', 'abbrev', 'AU', 'string'),
(14, 'it_IT', 'name', 'Autore', 'string'),
(14, 'it_IT', 'abbrev', 'AU', 'string'),
(14, 'pt_BR', 'name', 'Autor', 'string'),
(14, 'pt_BR', 'abbrev', 'AU', 'string'),
(15, '', 'nameLocaleKey', 'default.groups.name.translator', 'string'),
(15, '', 'abbrevLocaleKey', 'default.groups.abbrev.translator', 'string'),
(15, 'en_US', 'name', 'Translator', 'string'),
(15, 'en_US', 'abbrev', 'Trans', 'string'),
(15, 'es_ES', 'name', 'Traductor/a', 'string'),
(15, 'es_ES', 'abbrev', 'Trad', 'string'),
(15, 'it_IT', 'name', 'Traduttore', 'string'),
(15, 'it_IT', 'abbrev', 'Trans', 'string'),
(15, 'pt_BR', 'name', 'Tradutor', 'string'),
(15, 'pt_BR', 'abbrev', 'TR', 'string'),
(16, '', 'nameLocaleKey', 'default.groups.name.externalReviewer', 'string'),
(16, '', 'abbrevLocaleKey', 'default.groups.abbrev.externalReviewer', 'string'),
(16, 'en_US', 'name', 'Reviewer', 'string'),
(16, 'en_US', 'abbrev', 'R', 'string'),
(16, 'es_ES', 'name', 'Revisor/a externo', 'string'),
(16, 'es_ES', 'abbrev', 'RE', 'string'),
(16, 'it_IT', 'name', 'Revisore esterno', 'string'),
(16, 'it_IT', 'abbrev', 'REV', 'string'),
(16, 'pt_BR', 'name', 'Avaliador', 'string'),
(16, 'pt_BR', 'abbrev', 'A', 'string'),
(17, '', 'nameLocaleKey', 'default.groups.name.reader', 'string'),
(17, '', 'abbrevLocaleKey', 'default.groups.abbrev.reader', 'string'),
(17, 'en_US', 'name', 'Reader', 'string'),
(17, 'en_US', 'abbrev', 'Read', 'string'),
(17, 'es_ES', 'name', 'Lector/a', 'string'),
(17, 'es_ES', 'abbrev', 'Lect', 'string'),
(17, 'it_IT', 'name', 'Lettore', 'string'),
(17, 'it_IT', 'abbrev', 'Read', 'string'),
(17, 'pt_BR', 'name', 'Leitor', 'string'),
(17, 'pt_BR', 'abbrev', 'LE', 'string'),
(18, '', 'nameLocaleKey', 'default.groups.name.subscriptionManager', 'string'),
(18, '', 'abbrevLocaleKey', 'default.groups.abbrev.subscriptionManager', 'string'),
(18, 'en_US', 'name', 'Subscription Manager', 'string'),
(18, 'en_US', 'abbrev', 'SubM', 'string'),
(18, 'es_ES', 'name', 'Gestor/a de suscripción', 'string'),
(18, 'es_ES', 'abbrev', 'GSus', 'string'),
(18, 'it_IT', 'name', 'Subscription manager', 'string'),
(18, 'it_IT', 'abbrev', 'SubM', 'string'),
(18, 'pt_BR', 'name', 'Gerente de assinatura', 'string'),
(18, 'pt_BR', 'abbrev', 'GAssin', 'string');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_group_stage`
--

DROP TABLE IF EXISTS `user_group_stage`;
CREATE TABLE IF NOT EXISTS `user_group_stage` (
  `context_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_group_stage_pkey` (`context_id`,`user_group_id`,`stage_id`),
  KEY `user_group_stage_context_id` (`context_id`),
  KEY `user_group_stage_user_group_id` (`user_group_id`),
  KEY `user_group_stage_stage_id` (`stage_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `user_group_stage`
--

INSERT INTO `user_group_stage` (`context_id`, `user_group_id`, `stage_id`) VALUES
(1, 3, 1),
(1, 3, 3),
(1, 3, 4),
(1, 3, 5),
(1, 4, 4),
(1, 4, 5),
(1, 5, 1),
(1, 5, 3),
(1, 5, 4),
(1, 5, 5),
(1, 6, 1),
(1, 6, 3),
(1, 6, 4),
(1, 6, 5),
(1, 7, 4),
(1, 8, 5),
(1, 9, 1),
(1, 9, 3),
(1, 10, 5),
(1, 11, 5),
(1, 12, 4),
(1, 13, 5),
(1, 14, 1),
(1, 14, 3),
(1, 14, 4),
(1, 14, 5),
(1, 15, 1),
(1, 15, 3),
(1, 15, 4),
(1, 15, 5),
(1, 16, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
CREATE TABLE IF NOT EXISTS `user_interests` (
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
CREATE TABLE IF NOT EXISTS `user_settings` (
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`),
  KEY `user_settings_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
CREATE TABLE IF NOT EXISTS `user_user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_user_groups_pkey` (`user_group_id`,`user_id`),
  KEY `user_user_groups_user_group_id` (`user_group_id`),
  KEY `user_user_groups_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `user_user_groups`
--

INSERT INTO `user_user_groups` (`user_group_id`, `user_id`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `versions`
--

DROP TABLE IF EXISTS `versions`;
CREATE TABLE IF NOT EXISTS `versions` (
  `major` int(11) NOT NULL DEFAULT '0',
  `minor` int(11) NOT NULL DEFAULT '0',
  `revision` int(11) NOT NULL DEFAULT '0',
  `build` int(11) NOT NULL DEFAULT '0',
  `date_installed` datetime NOT NULL,
  `current` tinyint(4) NOT NULL DEFAULT '0',
  `product_type` varchar(30) DEFAULT NULL,
  `product` varchar(30) DEFAULT NULL,
  `product_class_name` varchar(80) DEFAULT NULL,
  `lazy_load` tinyint(4) NOT NULL DEFAULT '0',
  `sitewide` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `versions`
--

INSERT INTO `versions` (`major`, `minor`, `revision`, `build`, `date_installed`, `current`, `product_type`, `product`, `product_class_name`, `lazy_load`, `sitewide`) VALUES
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.metadata', 'dc11', '', 0, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.metadata', 'mods34', '', 0, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.metadata', 'openurl10', '', 0, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.blocks', 'information', 'InformationBlockPlugin', 1, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.blocks', 'makeSubmission', 'MakeSubmissionBlockPlugin', 1, 0),
(1, 1, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.blocks', 'subscription', 'SubscriptionBlockPlugin', 1, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.blocks', 'developedBy', 'DevelopedByBlockPlugin', 1, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.blocks', 'languageToggle', 'LanguageToggleBlockPlugin', 1, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.gateways', 'resolver', '', 0, 0),
(1, 2, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.generic', 'acron', 'AcronPlugin', 1, 1),
(0, 1, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.generic', 'citationStyleLanguage', 'CitationStyleLanguagePlugin', 1, 0),
(1, 2, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.generic', 'customBlockManager', 'CustomBlockManagerPlugin', 1, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.generic', 'driver', 'DRIVERPlugin', 1, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.generic', 'dublinCoreMeta', 'DublinCoreMetaPlugin', 1, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.generic', 'googleAnalytics', 'GoogleAnalyticsPlugin', 1, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.generic', 'googleScholar', 'GoogleScholarPlugin', 1, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.generic', 'htmlArticleGalley', 'HtmlArticleGalleyPlugin', 1, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.generic', 'lensGalley', 'LensGalleyPlugin', 1, 0),
(1, 2, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.generic', 'openAIRE', 'OpenAIREPlugin', 1, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.generic', 'orcidProfile', 'OrcidProfilePlugin', 1, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.generic', 'pdfJsViewer', 'PdfJsViewerPlugin', 1, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.generic', 'recommendByAuthor', 'RecommendByAuthorPlugin', 1, 1),
(1, 2, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.generic', 'staticPages', 'StaticPagesPlugin', 1, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.generic', 'tinymce', 'TinyMCEPlugin', 1, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.generic', 'usageEvent', '', 0, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.generic', 'usageStats', '', 0, 1),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.generic', 'webFeed', 'WebFeedPlugin', 1, 0),
(2, 1, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.importexport', 'crossref', '', 0, 0),
(2, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.importexport', 'datacite', '', 0, 0),
(1, 1, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.importexport', 'doaj', '', 0, 0),
(2, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.importexport', 'medra', '', 0, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.importexport', 'native', '', 0, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.importexport', 'pubmed', '', 0, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.importexport', 'users', '', 0, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.oaiMetadataFormats', 'dc', '', 0, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.oaiMetadataFormats', 'marc', '', 0, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.oaiMetadataFormats', 'marcxml', '', 0, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.oaiMetadataFormats', 'rfc1807', '', 0, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.paymethod', 'manual', '', 0, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.paymethod', 'paypal', '', 0, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.pubIds', 'doi', 'DOIPubIdPlugin', 1, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.pubIds', 'urn', 'URNPubIdPlugin', 1, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.reports', 'articles', '', 0, 0),
(1, 1, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.reports', 'counterReport', '', 0, 0),
(2, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.reports', 'reviewReport', '', 0, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.reports', 'views', '', 0, 0),
(1, 0, 0, 0, '2018-10-18 06:04:54', 1, 'plugins.themes', 'default', 'DefaultThemePlugin', 1, 0),
(3, 1, 1, 4, '2018-10-18 06:03:57', 1, 'core', 'ojs2', '', 0, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
