-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2019 at 03:24 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bxp`
--
CREATE DATABASE IF NOT EXISTS `bxp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bxp`;

-- --------------------------------------------------------

--
-- Table structure for table `app_properties`
--

CREATE TABLE `app_properties` (
  `id` int(11) NOT NULL,
  `property_name` varchar(64) DEFAULT NULL,
  `property_value` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_resultcodes`
--

CREATE TABLE `app_resultcodes` (
  `id` int(11) NOT NULL,
  `optionname` varchar(32) DEFAULT NULL,
  `optioncode` varchar(12) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `optiontype` varchar(32) DEFAULT NULL,
  `optionlabel` varchar(32) DEFAULT NULL,
  `optioncolor` varchar(32) DEFAULT NULL,
  `contact_type` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `callinglist_in_campaign`
--

CREATE TABLE `callinglist_in_campaign` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `treatment_id` int(11) DEFAULT '0',
  `filterby` varchar(1024) DEFAULT NULL,
  `orderby` varchar(1024) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_auto_imports`
--

CREATE TABLE `cfg_auto_imports` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `format_id` int(11) NOT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `sourcename` varchar(64) DEFAULT NULL,
  `sourcedir` varchar(128) DEFAULT NULL,
  `importmode` varchar(12) DEFAULT NULL,
  `active` bit(1) DEFAULT b'0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_callinglist`
--

CREATE TABLE `cfg_callinglist` (
  `id` int(11) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `tablename` varchar(64) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `crr_username` varchar(32) DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_campaigns`
--

CREATE TABLE `cfg_campaigns` (
  `id` int(11) NOT NULL,
  `timecondition_id` int(11) DEFAULT NULL,
  `greeting_id` int(11) DEFAULT '0',
  `shortname` varchar(32) DEFAULT NULL,
  `campaigndesc` varchar(64) DEFAULT NULL,
  `externalrouting` varchar(16) DEFAULT NULL,
  `routingtype` varchar(32) DEFAULT NULL,
  `routingnumber` varchar(16) DEFAULT NULL,
  `overflowtype` varchar(32) DEFAULT NULL,
  `overflownumber` varchar(16) DEFAULT NULL,
  `callernumber` varchar(16) DEFAULT NULL,
  `monitor` bit(1) DEFAULT b'0',
  `voicelang` varchar(16) DEFAULT NULL,
  `maxcalls` int(11) DEFAULT '0',
  `amd` bit(1) DEFAULT b'1',
  `active` bit(1) DEFAULT b'0',
  `crr_username` varchar(32) DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cfg_campaigns`
--

INSERT INTO `cfg_campaigns` (`id`, `timecondition_id`, `greeting_id`, `shortname`, `campaigndesc`, `externalrouting`, `routingtype`, `routingnumber`, `overflowtype`, `overflownumber`, `callernumber`, `monitor`, `voicelang`, `maxcalls`, `amd`, `active`, `crr_username`, `crr_time`) VALUES
(1, 2, 3, 'rueba', 'mpaña de prueba', 'hola', 'hola', '9001', 'hola', 'hola', '1', b'1', '3', 0, b'1', b'1', '00:00:00', '0000-00-00 00:00:00'),
(2, 3, 4, 'BECO', 'bancoestado', 'hola', 'hola', '900', 'hola', 'hola', '1', b'1', '1', 1, b'1', b'1', '00:00:00', '0000-00-00 00:00:00'),
(3, 4, 5, 'LA POLAR', 'bancoestado', 'hola', 'hola', 'hola', 'hola', 'hola', '1', b'1', '1', 1, b'1', b'1', '00:00:00', '0000-00-00 00:00:00'),
(4, 5, 6, 'RIPLEY', 'bancoestado', 'hola', 'hola', 'hola', 'hola', 'hola', '1', b'1', '1', 1, b'1', b'1', '00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cfg_datepay_conditions`
--

CREATE TABLE `cfg_datepay_conditions` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `active` bit(1) DEFAULT b'0',
  `mon` bit(1) DEFAULT b'0',
  `tue` bit(1) DEFAULT b'0',
  `wed` bit(1) DEFAULT b'0',
  `thu` bit(1) DEFAULT b'0',
  `fra` bit(1) DEFAULT b'0',
  `sat` bit(1) DEFAULT b'0',
  `sun` bit(1) DEFAULT b'0',
  `current_day_only` bit(1) DEFAULT b'0',
  `current_week_only` bit(1) DEFAULT b'0',
  `current_month_only` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_datepay_exceptions`
--

CREATE TABLE `cfg_datepay_exceptions` (
  `id` int(11) NOT NULL,
  `daypay_id` int(11) DEFAULT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `nday` int(11) DEFAULT '0',
  `nmonth` int(11) DEFAULT '0',
  `active` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_fields`
--

CREATE TABLE `cfg_fields` (
  `id` int(11) NOT NULL,
  `fldname` varchar(32) DEFAULT NULL,
  `fldtype` varchar(12) DEFAULT NULL,
  `fldlength` int(11) DEFAULT NULL,
  `userfield` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_formats`
--

CREATE TABLE `cfg_formats` (
  `id` int(11) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `chainmode` char(1) DEFAULT 'R',
  `matchcolname` bit(1) DEFAULT b'1',
  `timeformat` varchar(32) DEFAULT NULL,
  `fieldseparator` char(1) DEFAULT ';',
  `charsetname` varchar(32) DEFAULT NULL,
  `textqualifier` char(1) DEFAULT '"',
  `firstdatarow` int(11) DEFAULT '2',
  `active` bit(1) DEFAULT b'0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_greetings`
--

CREATE TABLE `cfg_greetings` (
  `id` int(11) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `greetingdesc` varchar(64) DEFAULT NULL,
  `playtype` varchar(16) DEFAULT NULL,
  `silencedetection` bit(1) DEFAULT b'0',
  `mrcp_recogopts` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_holidays`
--

CREATE TABLE `cfg_holidays` (
  `id` int(11) NOT NULL,
  `timecondition_id` int(11) DEFAULT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `nday` int(11) DEFAULT '0',
  `nmonth` int(11) DEFAULT '0',
  `active` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_imports`
--

CREATE TABLE `cfg_imports` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `format_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `filename` varchar(128) DEFAULT NULL,
  `filesize` varchar(128) DEFAULT '0',
  `importmode` varchar(12) DEFAULT NULL,
  `recordcount` int(11) DEFAULT '0',
  `fileextension` varchar(6) DEFAULT NULL,
  `importprogress` int(11) DEFAULT '0',
  `timeprogress` datetime DEFAULT NULL,
  `importstatus` int(11) DEFAULT '0',
  `importstatusinfo` varchar(128) DEFAULT NULL,
  `recordsuccess` int(11) DEFAULT '0',
  `recordfail` int(11) DEFAULT '0',
  `sched_startdate` datetime DEFAULT NULL,
  `sched_enddate` datetime DEFAULT NULL,
  `sched_starttime` time DEFAULT '00:00:00',
  `sched_endtime` time DEFAULT '23:59:59',
  `dialpriority` int(11) DEFAULT '0',
  `dialmode` int(11) DEFAULT '0',
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  `crr_username` varchar(32) DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_objects`
--

CREATE TABLE `cfg_objects` (
  `id` int(11) NOT NULL,
  `entitycode` int(11) DEFAULT NULL,
  `entityname` varchar(64) DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_outbound_rules`
--

CREATE TABLE `cfg_outbound_rules` (
  `id` int(11) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `trunktype` varchar(6) NOT NULL DEFAULT 'SIP',
  `trunkprefix` varchar(32) DEFAULT NULL,
  `trunkname` varchar(32) DEFAULT NULL,
  `maxdialresources` int(11) NOT NULL DEFAULT '0',
  `dialtimeout` int(11) NOT NULL DEFAULT '60',
  `canceldialtimeout` int(11) NOT NULL DEFAULT '90',
  `n_caps` int(11) NOT NULL DEFAULT '0',
  `active` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_persons`
--

CREATE TABLE `cfg_persons` (
  `id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `loginid` int(11) DEFAULT NULL,
  `username` varchar(32) NOT NULL,
  `userpwd` varchar(64) NOT NULL,
  `fullname` varchar(64) DEFAULT NULL,
  `active` bit(1) DEFAULT b'0',
  `mailbox` varchar(125) DEFAULT NULL,
  `defaultexten` varchar(32) DEFAULT NULL,
  `crr_username` varchar(32) DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_privileges`
--

CREATE TABLE `cfg_privileges` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `grantedadd` bit(1) DEFAULT b'0',
  `grantededit` bit(1) DEFAULT b'0',
  `granteddelete` bit(1) DEFAULT b'0',
  `grantedexec` bit(1) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_questions`
--

CREATE TABLE `cfg_questions` (
  `id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `shortname` varchar(32) NOT NULL,
  `questionnum` int(11) NOT NULL,
  `questionsound_id` int(11) DEFAULT NULL,
  `questiontext` varchar(512) DEFAULT NULL,
  `maxwaittime` int(11) DEFAULT NULL,
  `maxattempts` int(11) DEFAULT NULL,
  `playtype` varchar(16) DEFAULT 'TTS',
  `inputtype` varchar(16) NOT NULL DEFAULT 'INFO',
  `grammar` varchar(256) DEFAULT NULL,
  `gosub_onenter` bit(1) DEFAULT b'0',
  `gosub_onenterdata` varchar(128) DEFAULT NULL,
  `gosub_onexit` bit(1) DEFAULT b'0',
  `gosub_onexitdata` varchar(128) DEFAULT NULL,
  `maxdigits` int(11) DEFAULT '0',
  `mrcp_opts` varchar(128) DEFAULT NULL,
  `confidencelevel` int(11) DEFAULT '0',
  `viewstat` bit(1) DEFAULT b'1',
  `viewrepo` bit(1) DEFAULT b'1',
  `qvarname` varchar(32) DEFAULT NULL,
  `trxresource` varchar(32) DEFAULT NULL,
  `trxdst` varchar(32) DEFAULT NULL,
  `trxtimeout` int(11) DEFAULT '0',
  `exec_subrutine` varchar(64) DEFAULT NULL,
  `crr_username` varchar(32) DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cfg_questions`
--

INSERT INTO `cfg_questions` (`id`, `survey_id`, `shortname`, `questionnum`, `questionsound_id`, `questiontext`, `maxwaittime`, `maxattempts`, `playtype`, `inputtype`, `grammar`, `gosub_onenter`, `gosub_onenterdata`, `gosub_onexit`, `gosub_onexitdata`, `maxdigits`, `mrcp_opts`, `confidencelevel`, `viewstat`, `viewrepo`, `qvarname`, `trxresource`, `trxdst`, `trxtimeout`, `exec_subrutine`, `crr_username`, `crr_time`) VALUES
(1, 1, 'hola', 1, 1, 'hola', 1, 1, 'hola', 'hola', 'hola', b'1', 'hola', b'1', 'hola', 1, 'hola', 1, b'1', b'1', 'hola', 'hola', 'hola', 1, 'hola', 'hola', '0000-00-00 00:00:00'),
(683, 0, '', 0, NULL, NULL, NULL, NULL, 'TTS', 'ASR_DATE', 'Seleccione GrÃ¡matica....', b'0', NULL, b'0', NULL, 0, 'nit=3000&sct=1500&b=0&pr=fast', 0, b'1', b'1', NULL, NULL, NULL, 0, NULL, NULL, '2019-01-31 17:52:12');

-- --------------------------------------------------------

--
-- Table structure for table `cfg_recycles_plan`
--

CREATE TABLE `cfg_recycles_plan` (
  `id` int(11) NOT NULL,
  `import_id` int(11) NOT NULL,
  `recycletype` int(11) DEFAULT '1',
  `recyclemode` varchar(32) DEFAULT 'phone',
  `recyclestatus` int(11) DEFAULT '0',
  `recycleattempt` int(11) DEFAULT '0',
  `recyclecount` int(11) DEFAULT '0',
  `recyclelasttime` datetime DEFAULT NULL,
  `filterby_callresult` varchar(512) DEFAULT NULL,
  `filterby_responses` varchar(1024) DEFAULT NULL,
  `maxrecyclecount` int(11) DEFAULT '0',
  `maxavailrecords` int(11) DEFAULT '0',
  `usemaxavailrecords` bit(1) DEFAULT b'0',
  `mincallattempts` int(11) DEFAULT '0',
  `useonmon` bit(1) DEFAULT b'0',
  `useontue` bit(1) DEFAULT b'0',
  `useonwed` bit(1) DEFAULT b'0',
  `useonthu` bit(1) DEFAULT b'0',
  `useonfri` bit(1) DEFAULT b'0',
  `useonsat` bit(1) DEFAULT b'0',
  `useonsun` bit(1) DEFAULT b'0',
  `schedday` date DEFAULT NULL,
  `schedtime` time DEFAULT NULL,
  `schedmaxattempts` int(11) DEFAULT '1',
  `schedinterval` int(11) DEFAULT '1',
  `crr_username` varchar(32) DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_report_templates`
--

CREATE TABLE `cfg_report_templates` (
  `id` int(11) NOT NULL,
  `tenant_id` int(11) DEFAULT '0',
  `reportname` varchar(32) DEFAULT NULL,
  `templatedesc` varchar(80) DEFAULT NULL,
  `templatename` varchar(60) DEFAULT NULL,
  `active` bit(1) DEFAULT b'0',
  `crr_username` varchar(32) DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_resources`
--

CREATE TABLE `cfg_resources` (
  `id` int(11) NOT NULL,
  `taglabel` varchar(32) DEFAULT NULL,
  `tagtype` varchar(12) DEFAULT NULL,
  `tagurl` varchar(125) DEFAULT NULL,
  `tagdesc` varchar(64) DEFAULT NULL,
  `tagorder` int(11) DEFAULT '0',
  `parent_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_roles`
--

CREATE TABLE `cfg_roles` (
  `id` int(11) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `roledesc` varchar(64) DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `crr_username` varchar(32) DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_schedules`
--

CREATE TABLE `cfg_schedules` (
  `id` int(11) NOT NULL,
  `timecondition_id` int(11) DEFAULT NULL,
  `wday` int(11) DEFAULT '0',
  `starttime` time DEFAULT NULL,
  `endtime` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_soundcomplex`
--

CREATE TABLE `cfg_soundcomplex` (
  `id` int(11) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `complex_message` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_soundfiles`
--

CREATE TABLE `cfg_soundfiles` (
  `id` int(11) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `soundtype` varchar(32) NOT NULL DEFAULT 'wav',
  `mediatype` varchar(32) DEFAULT NULL,
  `telephonyformat` varchar(32) DEFAULT 'wav',
  `parent_id` int(11) DEFAULT NULL,
  `objtype` varchar(32) DEFAULT 'file',
  `crr_username` varchar(32) DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_surveys`
--

CREATE TABLE `cfg_surveys` (
  `id` int(11) NOT NULL,
  `shortname` varchar(32) NOT NULL,
  `surveydesc` varchar(64) DEFAULT NULL,
  `dnis` varchar(32) NOT NULL,
  `active` bit(1) DEFAULT b'0',
  `autogreeting` bit(1) DEFAULT NULL,
  `playfarewell` bit(1) DEFAULT b'0',
  `farewellsound_id` int(11) DEFAULT NULL,
  `farewelltext` varchar(128) DEFAULT NULL,
  `playtype` varchar(16) DEFAULT 'TTS',
  `maxwaittime` int(11) NOT NULL DEFAULT '0',
  `maxattempts` int(11) NOT NULL DEFAULT '0',
  `mrcp_synthopts` varchar(128) DEFAULT NULL,
  `mrcp_recogopts` varchar(128) DEFAULT NULL,
  `confidencelevel` int(11) DEFAULT '0',
  `crr_username` varchar(32) DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cfg_surveys`
--

INSERT INTO `cfg_surveys` (`id`, `shortname`, `surveydesc`, `dnis`, `active`, `autogreeting`, `playfarewell`, `farewellsound_id`, `farewelltext`, `playtype`, `maxwaittime`, `maxattempts`, `mrcp_synthopts`, `mrcp_recogopts`, `confidencelevel`, `crr_username`, `crr_time`) VALUES
(1, 'hola', 'hola', '9001', b'1', b'1', b'1', 1, 'hola', 'hola', 1, 1, 'hola', 'hola', 1, 'hola', '0000-00-00 00:00:00'),
(2, 'como', 'como', '900', b'1', b'1', b'1', 1, 'estas', 'hola', 1, 1, 'hola', 'hola', 1, 'hola', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cfg_tenants`
--

CREATE TABLE `cfg_tenants` (
  `id` int(11) NOT NULL,
  `shortname` varchar(32) NOT NULL,
  `active` bit(1) DEFAULT b'0',
  `crr_username` varchar(32) DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_timeconditions`
--

CREATE TABLE `cfg_timeconditions` (
  `id` int(11) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `active` bit(1) DEFAULT b'0',
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cfg_treatments`
--

CREATE TABLE `cfg_treatments` (
  `id` int(11) NOT NULL,
  `shortname` varchar(32) DEFAULT NULL,
  `max_attempts` int(11) DEFAULT '3',
  `sched_increment` int(11) DEFAULT '30',
  `applyaction` enum('redial','next-in-chain') DEFAULT NULL,
  `nextchain_after` int(11) DEFAULT '0',
  `active` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contacto_historico`
--

CREATE TABLE `contacto_historico` (
  `id` int(20) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `id_cliente` varchar(45) NOT NULL,
  `prioridad` int(11) DEFAULT NULL,
  `fecha_hora_contacto` datetime DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Almacena los numeros donde hubo contacto con clientes, ya se';

-- --------------------------------------------------------

--
-- Table structure for table `content_keyword_mapper`
--

CREATE TABLE `content_keyword_mapper` (
  `id` int(11) NOT NULL,
  `keyword` varchar(64) DEFAULT NULL,
  `sayas_tts` varchar(64) DEFAULT NULL,
  `sayas_filename` varchar(128) DEFAULT NULL,
  `lastcount` int(11) DEFAULT '0',
  `crr_username` varchar(32) DEFAULT NULL,
  `crr_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_afpcuprum`
--

CREATE TABLE `ct_afpcuprum` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) NOT NULL DEFAULT '1',
  `record_status` int(11) NOT NULL DEFAULT '1',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `call_result` int(11) NOT NULL DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(16) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `telefono1` varchar(64) DEFAULT NULL,
  `rut` varchar(32) DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `empresa` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_banmedica`
--

CREATE TABLE `ct_banmedica` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) NOT NULL DEFAULT '1',
  `record_status` int(11) NOT NULL DEFAULT '1',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `call_result` int(11) NOT NULL DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(16) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `telefono1` varchar(64) DEFAULT NULL,
  `rut` varchar(32) DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `empresa` varchar(64) DEFAULT NULL,
  `monto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_bcp`
--

CREATE TABLE `ct_bcp` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) NOT NULL,
  `fecha_pdp` datetime NOT NULL,
  `monto` int(11) NOT NULL,
  `id_cliente` varchar(64) NOT NULL,
  `producto` varchar(64) NOT NULL,
  `fecha_vence_pdp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_beco`
--

CREATE TABLE `ct_beco` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `producto` varchar(64) DEFAULT NULL,
  `monto` varchar(64) DEFAULT NULL,
  `fecha_vence1` datetime DEFAULT NULL,
  `dias_morosidad1` varchar(64) DEFAULT NULL,
  `producto2` varchar(64) DEFAULT NULL,
  `monto2` varchar(64) DEFAULT NULL,
  `fecha_vence2` datetime DEFAULT NULL,
  `dias_morosidad2` varchar(64) DEFAULT NULL,
  `fecha_tope1` datetime DEFAULT NULL,
  `fecha_tope2` datetime DEFAULT NULL,
  `sexo` varchar(64) DEFAULT NULL,
  `nombre_ejecutivo` varchar(64) DEFAULT NULL,
  `apellido_ejecutivo` varchar(64) DEFAULT NULL,
  `filename` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `ct_beco`
--
DELIMITER $$
CREATE TRIGGER `trigger_ct_beco_fechas_tope` BEFORE INSERT ON `ct_beco` FOR EACH ROW BEGIN 
SET NEW.fecha_tope1 = date(DATE_ADD(now(), INTERVAL 1 DAY)), NEW.fecha_tope2 = date(DATE_ADD(now(), INTERVAL 5 DAY));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ct_beco_2_tcr`
--

CREATE TABLE `ct_beco_2_tcr` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` timestamp NULL DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `producto` varchar(64) DEFAULT NULL,
  `monto` varchar(64) DEFAULT NULL,
  `fecha_vence1` datetime DEFAULT NULL,
  `dias_morosidad1` varchar(64) DEFAULT '1',
  `producto2` varchar(64) DEFAULT NULL,
  `monto2` varchar(64) DEFAULT NULL,
  `fecha_vence2` datetime DEFAULT NULL,
  `dias_morosidad2` varchar(64) DEFAULT '5',
  `fecha_tope1` datetime DEFAULT NULL,
  `fecha_tope2` datetime DEFAULT NULL,
  `sexo` varchar(64) DEFAULT NULL,
  `nombre_ejecutivo` varchar(64) DEFAULT NULL,
  `apellido_ejecutivo` varchar(64) DEFAULT NULL,
  `filename` varchar(64) DEFAULT NULL,
  `cantidad_productos` int(11) DEFAULT '1',
  `fecha_compromiso_visita` varchar(64) DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `ct_beco_2_tcr`
--
DELIMITER $$
CREATE TRIGGER `trigger_ct_beco_2_tcr_fechas_tope` BEFORE INSERT ON `ct_beco_2_tcr` FOR EACH ROW BEGIN 
 SET NEW.fecha_tope1 = date(DATE_ADD(now(), INTERVAL 1 DAY)), NEW.fecha_tope2 = date(DATE_ADD(now(), INTERVAL 5 DAY)), NEW.sexo='G';
 END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ct_beco_2_tcr_archive`
--

CREATE TABLE `ct_beco_2_tcr_archive` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` timestamp NULL DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `producto` varchar(64) DEFAULT NULL,
  `monto` varchar(64) DEFAULT NULL,
  `fecha_vence1` datetime DEFAULT NULL,
  `dias_morosidad1` varchar(64) DEFAULT '1',
  `producto2` varchar(64) DEFAULT NULL,
  `monto2` varchar(64) DEFAULT NULL,
  `fecha_vence2` datetime DEFAULT NULL,
  `dias_morosidad2` varchar(64) DEFAULT '5',
  `fecha_tope1` datetime DEFAULT NULL,
  `fecha_tope2` datetime DEFAULT NULL,
  `sexo` varchar(64) DEFAULT NULL,
  `nombre_ejecutivo` varchar(64) DEFAULT NULL,
  `apellido_ejecutivo` varchar(64) DEFAULT NULL,
  `filename` varchar(64) DEFAULT NULL,
  `cantidad_productos` int(11) DEFAULT '1',
  `fecha_compromiso_visita` varchar(64) DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_beco_archive`
--

CREATE TABLE `ct_beco_archive` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `producto` varchar(64) DEFAULT NULL,
  `monto` varchar(64) DEFAULT NULL,
  `fecha_vence1` datetime DEFAULT NULL,
  `dias_morosidad1` varchar(64) DEFAULT NULL,
  `producto2` varchar(64) DEFAULT NULL,
  `monto2` varchar(64) DEFAULT NULL,
  `fecha_vence2` datetime DEFAULT NULL,
  `dias_morosidad2` varchar(64) DEFAULT NULL,
  `fecha_tope1` datetime DEFAULT NULL,
  `fecha_tope2` datetime DEFAULT NULL,
  `sexo` varchar(64) DEFAULT NULL,
  `nombre_ejecutivo` varchar(64) DEFAULT NULL,
  `apellido_ejecutivo` varchar(64) DEFAULT NULL,
  `filename` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_beco_cobranza_liviana`
--

CREATE TABLE `ct_beco_cobranza_liviana` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` timestamp NULL DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `producto` varchar(64) DEFAULT NULL,
  `monto` varchar(64) DEFAULT NULL,
  `fecha_vence1` datetime DEFAULT NULL,
  `dias_morosidad1` varchar(64) DEFAULT '1',
  `producto2` varchar(64) DEFAULT NULL,
  `monto2` varchar(64) DEFAULT NULL,
  `fecha_vence2` datetime DEFAULT NULL,
  `dias_morosidad2` varchar(64) DEFAULT '5',
  `fecha_tope1` datetime DEFAULT NULL,
  `fecha_tope2` datetime DEFAULT NULL,
  `sexo` varchar(64) DEFAULT NULL,
  `nombre_ejecutivo` varchar(64) DEFAULT NULL,
  `apellido_ejecutivo` varchar(64) DEFAULT NULL,
  `filename` varchar(64) DEFAULT NULL,
  `cantidad_productos` int(11) DEFAULT '1',
  `fecha_compromiso_visita` varchar(64) DEFAULT NULL,
  `fecha_tope` datetime DEFAULT NULL,
  `attempts_count` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Triggers `ct_beco_cobranza_liviana`
--
DELIMITER $$
CREATE TRIGGER `trigger_ct_beco_cobranza_liviana_fechas_tope` BEFORE INSERT ON `ct_beco_cobranza_liviana` FOR EACH ROW BEGIN 
 SET NEW.fecha_tope1 = date(DATE_ADD(now(), INTERVAL 1 DAY)), NEW.fecha_tope2 = date(DATE_ADD(now(), INTERVAL 5 DAY)), NEW.sexo='G';
 END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ct_beco_cobranza_liviana_archive`
--

CREATE TABLE `ct_beco_cobranza_liviana_archive` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` timestamp NULL DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `producto` varchar(64) DEFAULT NULL,
  `monto` varchar(64) DEFAULT NULL,
  `fecha_vence1` datetime DEFAULT NULL,
  `dias_morosidad1` varchar(64) DEFAULT '1',
  `producto2` varchar(64) DEFAULT NULL,
  `monto2` varchar(64) DEFAULT NULL,
  `fecha_vence2` datetime DEFAULT NULL,
  `dias_morosidad2` varchar(64) DEFAULT '5',
  `fecha_tope1` datetime DEFAULT NULL,
  `fecha_tope2` datetime DEFAULT NULL,
  `sexo` varchar(64) DEFAULT NULL,
  `nombre_ejecutivo` varchar(64) DEFAULT NULL,
  `apellido_ejecutivo` varchar(64) DEFAULT NULL,
  `filename` varchar(64) DEFAULT NULL,
  `cantidad_productos` int(11) DEFAULT '1',
  `fecha_compromiso_visita` varchar(64) DEFAULT NULL,
  `fecha_tope` datetime DEFAULT NULL,
  `attempts_count` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_beco_cred_renegociado`
--

CREATE TABLE `ct_beco_cred_renegociado` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` timestamp NULL DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `producto` varchar(64) DEFAULT NULL,
  `monto` varchar(64) DEFAULT NULL,
  `fecha_vence1` datetime DEFAULT NULL,
  `dias_morosidad1` varchar(64) DEFAULT '1',
  `producto2` varchar(64) DEFAULT NULL,
  `monto2` varchar(64) DEFAULT NULL,
  `fecha_vence2` datetime DEFAULT NULL,
  `dias_morosidad2` varchar(64) DEFAULT '5',
  `fecha_tope1` datetime DEFAULT NULL,
  `fecha_tope2` datetime DEFAULT NULL,
  `sexo` varchar(64) DEFAULT NULL,
  `nombre_ejecutivo` varchar(64) DEFAULT NULL,
  `apellido_ejecutivo` varchar(64) DEFAULT NULL,
  `filename` varchar(64) DEFAULT NULL,
  `cantidad_productos` int(11) DEFAULT '1',
  `fecha_compromiso_visita` varchar(64) DEFAULT NULL,
  `fecha_tope` datetime DEFAULT NULL,
  `attempts_count` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_beco_cred_renegociado_archive`
--

CREATE TABLE `ct_beco_cred_renegociado_archive` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` timestamp NULL DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `producto` varchar(64) DEFAULT NULL,
  `monto` varchar(64) DEFAULT NULL,
  `fecha_vence1` datetime DEFAULT NULL,
  `dias_morosidad1` varchar(64) DEFAULT '1',
  `producto2` varchar(64) DEFAULT NULL,
  `monto2` varchar(64) DEFAULT NULL,
  `fecha_vence2` datetime DEFAULT NULL,
  `dias_morosidad2` varchar(64) DEFAULT '5',
  `fecha_tope1` datetime DEFAULT NULL,
  `fecha_tope2` datetime DEFAULT NULL,
  `sexo` varchar(64) DEFAULT NULL,
  `nombre_ejecutivo` varchar(64) DEFAULT NULL,
  `apellido_ejecutivo` varchar(64) DEFAULT NULL,
  `filename` varchar(64) DEFAULT NULL,
  `cantidad_productos` int(11) DEFAULT '1',
  `fecha_compromiso_visita` varchar(64) DEFAULT NULL,
  `fecha_tope` datetime DEFAULT NULL,
  `attempts_count` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_beco_recordatorio`
--

CREATE TABLE `ct_beco_recordatorio` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `voice_name` varchar(32) DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) NOT NULL,
  `id_cliente` varchar(32) DEFAULT '0',
  `empresa` varchar(64) DEFAULT NULL,
  `dia_compromiso` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_beco_recordatorio_archive`
--

CREATE TABLE `ct_beco_recordatorio_archive` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `voice_name` varchar(32) DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) NOT NULL,
  `id_cliente` varchar(32) DEFAULT '0',
  `empresa` varchar(64) DEFAULT NULL,
  `dia_compromiso` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_beco_recordatorio_impago`
--

CREATE TABLE `ct_beco_recordatorio_impago` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `voice_name` varchar(32) DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) NOT NULL,
  `id_cliente` varchar(32) DEFAULT '0',
  `empresa` varchar(64) DEFAULT NULL,
  `dia_compromiso` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_beco_recordatorio_impago_archive`
--

CREATE TABLE `ct_beco_recordatorio_impago_archive` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `voice_name` varchar(32) DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) NOT NULL,
  `id_cliente` varchar(32) DEFAULT '0',
  `empresa` varchar(64) DEFAULT NULL,
  `dia_compromiso` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_ciclo1`
--

CREATE TABLE `ct_ciclo1` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) NOT NULL DEFAULT '1',
  `record_status` int(11) NOT NULL DEFAULT '1',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `call_result` int(11) NOT NULL DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(16) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `phone0` varchar(64) DEFAULT NULL,
  `phone1` varchar(64) DEFAULT NULL,
  `phone2` varchar(64) DEFAULT NULL,
  `phone3` varchar(64) DEFAULT NULL,
  `phone4` varchar(64) DEFAULT NULL,
  `id_campana` int(11) DEFAULT NULL,
  `id_campana_detalle` int(11) DEFAULT NULL,
  `tienda` int(11) DEFAULT NULL,
  `nombre_tienda` varchar(64) DEFAULT NULL,
  `rut` varchar(32) DEFAULT NULL,
  `dv` varchar(1) DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `actividad` varchar(128) DEFAULT NULL,
  `fecha_atraso` datetime DEFAULT NULL,
  `fecha_ultimo_pago` datetime DEFAULT NULL,
  `monto_ultimo_pago` int(11) DEFAULT NULL,
  `facturacion` int(11) DEFAULT NULL,
  `dia_vencimiento` int(11) DEFAULT NULL,
  `cuota_mes` int(11) DEFAULT NULL,
  `dias_atraso` int(11) DEFAULT NULL,
  `monto_moroso` int(11) DEFAULT NULL,
  `interes_mora` int(11) DEFAULT NULL,
  `gasto_cobranza` int(11) DEFAULT NULL,
  `monto_a_pagar` int(11) DEFAULT NULL,
  `monto_total` int(11) DEFAULT NULL,
  `nombre_ejecutiva` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `ct_ciclo1`
--
DELIMITER $$
CREATE TRIGGER `random_nombre_ejecutiva` BEFORE INSERT ON `ct_ciclo1` FOR EACH ROW BEGIN 
drop temporary table if exists random_names;
create temporary table random_names (
id int(100) NOT NULL AUTO_INCREMENT,
nombre varchar(255),
PRIMARY KEY (id)
);

insert into  random_names (nombre) values ('LAURA');
insert into  random_names (nombre) values ('SOFIA');
insert into  random_names (nombre) values ('CRISTINA');
insert into  random_names (nombre) values ('MARIANA');
insert into  random_names (nombre) values ('VICTORIA');
insert into  random_names (nombre) values ('DANIELA');
insert into  random_names (nombre) values ('GABRIELA');
insert into  random_names (nombre) values ('ANDREA');
insert into  random_names (nombre) values ('ALICIA');
insert into  random_names (nombre) values ('FRANCISCA');

SET NEW.nombre_ejecutiva = (select distinct r.nombre from
(select ROUND((RAND() * (10-1))+1) as random ) c
inner join random_names r on r.id=c.random);

drop temporary table random_names;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ct_ciclo1_archive`
--

CREATE TABLE `ct_ciclo1_archive` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) NOT NULL DEFAULT '1',
  `record_status` int(11) NOT NULL DEFAULT '1',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `call_result` int(11) NOT NULL DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(16) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `phone0` varchar(64) DEFAULT NULL,
  `phone1` varchar(64) DEFAULT NULL,
  `phone2` varchar(64) DEFAULT NULL,
  `phone3` varchar(64) DEFAULT NULL,
  `phone4` varchar(64) DEFAULT NULL,
  `id_campana` int(11) DEFAULT NULL,
  `id_campana_detalle` int(11) DEFAULT NULL,
  `tienda` int(11) DEFAULT NULL,
  `nombre_tienda` varchar(64) DEFAULT NULL,
  `rut` varchar(32) DEFAULT NULL,
  `dv` varchar(1) DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `actividad` varchar(128) DEFAULT NULL,
  `fecha_atraso` datetime DEFAULT NULL,
  `fecha_ultimo_pago` datetime DEFAULT NULL,
  `monto_ultimo_pago` int(11) DEFAULT NULL,
  `facturacion` int(11) DEFAULT NULL,
  `dia_vencimiento` int(11) DEFAULT NULL,
  `cuota_mes` int(11) DEFAULT NULL,
  `dias_atraso` int(11) DEFAULT NULL,
  `monto_moroso` int(11) DEFAULT NULL,
  `interes_mora` int(11) DEFAULT NULL,
  `gasto_cobranza` int(11) DEFAULT NULL,
  `monto_a_pagar` int(11) DEFAULT NULL,
  `monto_total` int(11) DEFAULT NULL,
  `nombre_ejecutiva` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_claropromocion`
--

CREATE TABLE `ct_claropromocion` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `id_cliente` varchar(64) NOT NULL,
  `telefono1` varchar(64) NOT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_claropromocion_archive`
--

CREATE TABLE `ct_claropromocion_archive` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `id_cliente` varchar(64) NOT NULL,
  `telefono1` varchar(64) NOT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_claro_captacion`
--

CREATE TABLE `ct_claro_captacion` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `rut` varchar(32) NOT NULL,
  `telefono1` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_claro_captacion_archive`
--

CREATE TABLE `ct_claro_captacion_archive` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `rut` varchar(32) NOT NULL,
  `telefono1` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_corona_oferta`
--

CREATE TABLE `ct_corona_oferta` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) NOT NULL DEFAULT '1',
  `record_status` int(11) NOT NULL DEFAULT '1',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `call_result` int(11) NOT NULL DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(16) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `phone0` varchar(64) DEFAULT NULL,
  `phone1` varchar(64) DEFAULT NULL,
  `phone2` varchar(64) DEFAULT NULL,
  `phone3` varchar(64) DEFAULT NULL,
  `phone4` varchar(64) DEFAULT NULL,
  `id_campana` int(11) DEFAULT NULL,
  `id_campana_detalle` int(11) DEFAULT NULL,
  `tienda` int(11) DEFAULT NULL,
  `nombre_tienda` varchar(64) DEFAULT NULL,
  `rut` varchar(32) DEFAULT NULL,
  `dv` varchar(1) DEFAULT NULL,
  `nombres` varchar(64) DEFAULT NULL,
  `apellido_paterno` varchar(64) DEFAULT NULL,
  `apellido_materno` varchar(64) DEFAULT NULL,
  `actividad` varchar(128) DEFAULT NULL,
  `fecha_atraso` datetime DEFAULT NULL,
  `fecha_ultimo_pago` datetime DEFAULT NULL,
  `monto_ultimo_pago` int(11) DEFAULT NULL,
  `facturacion` int(11) DEFAULT NULL,
  `dia_vencimiento` int(11) DEFAULT NULL,
  `cuota_mes` int(11) DEFAULT NULL,
  `dias_atraso` int(11) DEFAULT NULL,
  `monto_moroso` int(11) DEFAULT NULL,
  `interes_mora` int(11) DEFAULT NULL,
  `gasto_cobranza` int(11) DEFAULT NULL,
  `monto_a_pagar` int(11) DEFAULT NULL,
  `monto_total` int(11) DEFAULT NULL,
  `nombre_ejecutiva` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_credito`
--

CREATE TABLE `ct_credito` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `telefono5` varchar(64) DEFAULT NULL,
  `telefono6` varchar(64) DEFAULT NULL,
  `telefono7` varchar(64) DEFAULT NULL,
  `telefono8` varchar(64) DEFAULT NULL,
  `telefono9` varchar(64) DEFAULT NULL,
  `telefono10` varchar(64) DEFAULT NULL,
  `telefono11` varchar(64) DEFAULT NULL,
  `telefono12` varchar(64) DEFAULT NULL,
  `telefono13` varchar(64) DEFAULT NULL,
  `telefono14` varchar(64) DEFAULT NULL,
  `monto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_credito_archive`
--

CREATE TABLE `ct_credito_archive` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `telefono5` varchar(64) DEFAULT NULL,
  `telefono6` varchar(64) DEFAULT NULL,
  `telefono7` varchar(64) DEFAULT NULL,
  `telefono8` varchar(64) DEFAULT NULL,
  `telefono9` varchar(64) DEFAULT NULL,
  `telefono10` varchar(64) DEFAULT NULL,
  `telefono11` varchar(64) DEFAULT NULL,
  `telefono12` varchar(64) DEFAULT NULL,
  `telefono13` varchar(64) DEFAULT NULL,
  `telefono14` varchar(64) DEFAULT NULL,
  `monto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_cuprum`
--

CREATE TABLE `ct_cuprum` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) NOT NULL,
  `id_cliente` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_depredador`
--

CREATE TABLE `ct_depredador` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `telefono5` varchar(64) DEFAULT NULL,
  `telefono6` varchar(64) DEFAULT NULL,
  `telefono7` varchar(64) DEFAULT NULL,
  `telefono8` varchar(64) DEFAULT NULL,
  `telefono9` varchar(64) DEFAULT NULL,
  `telefono10` varchar(64) DEFAULT NULL,
  `telefono11` varchar(64) DEFAULT NULL,
  `telefono12` varchar(64) DEFAULT NULL,
  `telefono13` varchar(64) DEFAULT NULL,
  `telefono14` varchar(64) DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_depredador_archive`
--

CREATE TABLE `ct_depredador_archive` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `telefono5` varchar(64) DEFAULT NULL,
  `telefono6` varchar(64) DEFAULT NULL,
  `telefono7` varchar(64) DEFAULT NULL,
  `telefono8` varchar(64) DEFAULT NULL,
  `telefono9` varchar(64) DEFAULT NULL,
  `telefono10` varchar(64) DEFAULT NULL,
  `telefono11` varchar(64) DEFAULT NULL,
  `telefono12` varchar(64) DEFAULT NULL,
  `telefono13` varchar(64) DEFAULT NULL,
  `telefono14` varchar(64) DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_depredador_mc`
--

CREATE TABLE `ct_depredador_mc` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `telefono5` varchar(64) DEFAULT NULL,
  `telefono6` varchar(64) DEFAULT NULL,
  `telefono7` varchar(64) DEFAULT NULL,
  `telefono8` varchar(64) DEFAULT NULL,
  `telefono9` varchar(64) DEFAULT NULL,
  `telefono10` varchar(64) DEFAULT NULL,
  `telefono11` varchar(64) DEFAULT NULL,
  `telefono12` varchar(64) DEFAULT NULL,
  `telefono13` varchar(64) DEFAULT NULL,
  `telefono14` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_depredador_mc_archive`
--

CREATE TABLE `ct_depredador_mc_archive` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `telefono5` varchar(64) DEFAULT NULL,
  `telefono6` varchar(64) DEFAULT NULL,
  `telefono7` varchar(64) DEFAULT NULL,
  `telefono8` varchar(64) DEFAULT NULL,
  `telefono9` varchar(64) DEFAULT NULL,
  `telefono10` varchar(64) DEFAULT NULL,
  `telefono11` varchar(64) DEFAULT NULL,
  `telefono12` varchar(64) DEFAULT NULL,
  `telefono13` varchar(64) DEFAULT NULL,
  `telefono14` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_depredador_vf`
--

CREATE TABLE `ct_depredador_vf` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `telefono5` varchar(64) DEFAULT NULL,
  `telefono6` varchar(64) DEFAULT NULL,
  `telefono7` varchar(64) DEFAULT NULL,
  `telefono8` varchar(64) DEFAULT NULL,
  `telefono9` varchar(64) DEFAULT NULL,
  `telefono10` varchar(64) DEFAULT NULL,
  `telefono11` varchar(64) DEFAULT NULL,
  `telefono12` varchar(64) DEFAULT NULL,
  `telefono13` varchar(64) DEFAULT NULL,
  `telefono14` varchar(64) DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_depredador_vf_archive`
--

CREATE TABLE `ct_depredador_vf_archive` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `telefono5` varchar(64) DEFAULT NULL,
  `telefono6` varchar(64) DEFAULT NULL,
  `telefono7` varchar(64) DEFAULT NULL,
  `telefono8` varchar(64) DEFAULT NULL,
  `telefono9` varchar(64) DEFAULT NULL,
  `telefono10` varchar(64) DEFAULT NULL,
  `telefono11` varchar(64) DEFAULT NULL,
  `telefono12` varchar(64) DEFAULT NULL,
  `telefono13` varchar(64) DEFAULT NULL,
  `telefono14` varchar(64) DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_derivacion`
--

CREATE TABLE `ct_derivacion` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `empresa` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_encuesta_movistar`
--

CREATE TABLE `ct_encuesta_movistar` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `rut` varchar(32) NOT NULL,
  `telefono1` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_encuesta_movistar_archive`
--

CREATE TABLE `ct_encuesta_movistar_archive` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `rut` varchar(32) NOT NULL,
  `telefono1` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_factoring`
--

CREATE TABLE `ct_factoring` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `telefono5` varchar(64) DEFAULT NULL,
  `telefono6` varchar(64) DEFAULT NULL,
  `telefono7` varchar(64) DEFAULT NULL,
  `telefono8` varchar(64) DEFAULT NULL,
  `telefono9` varchar(64) DEFAULT NULL,
  `telefono10` varchar(64) DEFAULT NULL,
  `telefono11` varchar(64) DEFAULT NULL,
  `telefono12` varchar(64) DEFAULT NULL,
  `telefono13` varchar(64) DEFAULT NULL,
  `telefono14` varchar(64) DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_factoring_archive`
--

CREATE TABLE `ct_factoring_archive` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `telefono5` varchar(64) DEFAULT NULL,
  `telefono6` varchar(64) DEFAULT NULL,
  `telefono7` varchar(64) DEFAULT NULL,
  `telefono8` varchar(64) DEFAULT NULL,
  `telefono9` varchar(64) DEFAULT NULL,
  `telefono10` varchar(64) DEFAULT NULL,
  `telefono11` varchar(64) DEFAULT NULL,
  `telefono12` varchar(64) DEFAULT NULL,
  `telefono13` varchar(64) DEFAULT NULL,
  `telefono14` varchar(64) DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_factoring_ejecutivo_ausente`
--

CREATE TABLE `ct_factoring_ejecutivo_ausente` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `rut` varchar(32) NOT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `nombre_ejecutivo` varchar(64) DEFAULT NULL,
  `apellido_ejecutivo` varchar(64) DEFAULT NULL,
  `nombre_ejecutivo_virtual` varchar(64) DEFAULT NULL,
  `apellido_ejecutivo_virtual` varchar(64) DEFAULT NULL,
  `fecha_limite_ausencia` datetime DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_geobpo_flujo`
--

CREATE TABLE `ct_geobpo_flujo` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) NOT NULL,
  `rut` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `nombre_plan` varchar(64) NOT NULL,
  `num_cel_a_portar` varchar(24) NOT NULL,
  `compania_origen` varchar(24) NOT NULL,
  `num_imei` int(128) NOT NULL,
  `compatibilidad` varchar(24) NOT NULL,
  `tipo_cliente` varchar(24) NOT NULL,
  `recibe` varchar(24) NOT NULL,
  `calle_recibe` varchar(24) NOT NULL,
  `numcalle_recibe` varchar(24) NOT NULL,
  `comuna_recibe` varchar(24) NOT NULL,
  `tel1_recibe` varchar(24) NOT NULL,
  `tel2_recibe` varchar(24) NOT NULL,
  `nombre_recibe` varchar(24) NOT NULL,
  `apellido_recibe` varchar(24) NOT NULL,
  `rut_recibe` varchar(24) NOT NULL,
  `contrato_contraentrega` varchar(24) NOT NULL,
  `doc_entregados` varchar(24) NOT NULL,
  `nombre_ejecutivo` varchar(24) NOT NULL,
  `apellido_ejecutivo` varchar(24) NOT NULL,
  `telefono_ejecutivo` varchar(24) NOT NULL,
  `plan` varchar(24) NOT NULL,
  `cargo_mensual` int(20) NOT NULL,
  `minutos` int(15) NOT NULL,
  `mensajes` int(15) NOT NULL,
  `cuota_internet` int(15) NOT NULL,
  `numero_titular1` varchar(24) NOT NULL,
  `numero_titular2` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_latam`
--

CREATE TABLE `ct_latam` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `monto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_latam_encuesta`
--

CREATE TABLE `ct_latam_encuesta` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `rut` varchar(32) NOT NULL,
  `telefono1` varchar(32) NOT NULL,
  `respuestaencu` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_la_polar_cobranza`
--

CREATE TABLE `ct_la_polar_cobranza` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `voice_name` varchar(32) DEFAULT NULL,
  `attempts_count` int(11) DEFAULT '0',
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(32) DEFAULT '0',
  `producto` varchar(64) DEFAULT NULL,
  `monto` int(11) DEFAULT NULL,
  `fecha_vence` datetime DEFAULT NULL,
  `dias_parametrizados` int(11) DEFAULT '3',
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `dv` varchar(10) DEFAULT NULL,
  `tipo_num` varchar(10) DEFAULT NULL,
  `total_deuda_fin` int(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_la_polar_cobranza_archive`
--

CREATE TABLE `ct_la_polar_cobranza_archive` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `voice_name` varchar(32) DEFAULT NULL,
  `attempts_count` int(11) DEFAULT '0',
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(32) DEFAULT '0',
  `producto` varchar(64) DEFAULT NULL,
  `monto` int(11) DEFAULT NULL,
  `fecha_vence` datetime DEFAULT NULL,
  `dias_parametrizados` int(11) DEFAULT '3',
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `dv` varchar(10) DEFAULT NULL,
  `tipo_num` varchar(10) DEFAULT NULL,
  `total_deuda_fin` int(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_mora_temprana_dia`
--

CREATE TABLE `ct_mora_temprana_dia` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) NOT NULL,
  `fecha_vence` datetime NOT NULL,
  `monto` int(11) NOT NULL,
  `dia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_mora_temprana_mes`
--

CREATE TABLE `ct_mora_temprana_mes` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) NOT NULL,
  `fecha_vence` datetime NOT NULL,
  `monto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_mora_temprana_mes_archive`
--

CREATE TABLE `ct_mora_temprana_mes_archive` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) NOT NULL,
  `fecha_vence` datetime NOT NULL,
  `monto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_movistar`
--

CREATE TABLE `ct_movistar` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `fecha_vence` datetime NOT NULL,
  `monto` int(11) NOT NULL,
  `rut` varchar(32) NOT NULL,
  `telefono1` varchar(32) NOT NULL,
  `deuda_total` int(11) DEFAULT NULL,
  `estrategia` varchar(32) DEFAULT NULL,
  `producto` varchar(32) DEFAULT NULL,
  `repactacion` varchar(32) DEFAULT NULL,
  `deuda_equipo` int(11) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_movistar_archive`
--

CREATE TABLE `ct_movistar_archive` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `fecha_vence` datetime NOT NULL,
  `monto` int(11) NOT NULL,
  `rut` varchar(32) NOT NULL,
  `telefono1` varchar(32) NOT NULL,
  `deuda_total` int(11) DEFAULT NULL,
  `estrategia` varchar(32) DEFAULT NULL,
  `producto` varchar(32) DEFAULT NULL,
  `repactacion` varchar(32) DEFAULT NULL,
  `deuda_equipo` int(11) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_ripley`
--

CREATE TABLE `ct_ripley` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) NOT NULL,
  `fecha_vence` datetime NOT NULL,
  `monto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_ripley_cep`
--

CREATE TABLE `ct_ripley_cep` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) NOT NULL,
  `fecha_vence` datetime NOT NULL,
  `monto` int(11) NOT NULL,
  `id_cliente` varchar(32) DEFAULT '0',
  `codent` varchar(6) DEFAULT NULL,
  `centalta` varchar(6) DEFAULT NULL,
  `cuenta` varchar(25) DEFAULT NULL,
  `saldo_monto` varchar(32) DEFAULT NULL,
  `max_dias` varchar(11) DEFAULT NULL,
  `fv` varchar(32) DEFAULT '',
  `id_base` varchar(32) DEFAULT NULL,
  `total_deuda` varchar(32) DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0',
  `dias_parametrizados` int(11) NOT NULL DEFAULT '5',
  `dv` varchar(10) DEFAULT NULL,
  `decil` varchar(10) DEFAULT NULL,
  `centil` varchar(10) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `MARCAADICN1` varchar(64) DEFAULT NULL,
  `MUESTRA` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `ct_ripley_cep`
--
DELIMITER $$
CREATE TRIGGER `calc_dias_param` BEFORE INSERT ON `ct_ripley_cep` FOR EACH ROW BEGIN
    IF NEW.campaign_id=35 THEN
			SET NEW.DIAS_PARAMETRIZADOS=3;
		ELSE
				SET NEW.DIAS_PARAMETRIZADOS=5;
		END IF; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ct_ripley_cep_archive`
--

CREATE TABLE `ct_ripley_cep_archive` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) NOT NULL,
  `fecha_vence` datetime NOT NULL,
  `monto` int(11) NOT NULL,
  `id_cliente` varchar(32) DEFAULT '0',
  `codent` varchar(6) DEFAULT NULL,
  `centalta` varchar(6) DEFAULT NULL,
  `cuenta` varchar(25) DEFAULT NULL,
  `saldo_monto` varchar(32) DEFAULT NULL,
  `max_dias` varchar(11) DEFAULT NULL,
  `fv` varchar(32) DEFAULT '',
  `id_base` varchar(32) DEFAULT NULL,
  `total_deuda` varchar(32) DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0',
  `dias_parametrizados` int(11) NOT NULL DEFAULT '5',
  `dv` varchar(10) DEFAULT NULL,
  `decil` varchar(10) DEFAULT NULL,
  `centil` varchar(10) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `MARCAADICN1` varchar(64) DEFAULT NULL,
  `MUESTRA` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_ripley_reneg_mora`
--

CREATE TABLE `ct_ripley_reneg_mora` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) NOT NULL,
  `fecha_vence` datetime NOT NULL,
  `monto` int(11) NOT NULL,
  `id_cliente` varchar(32) DEFAULT '0',
  `codent` varchar(6) DEFAULT NULL,
  `centalta` varchar(6) DEFAULT NULL,
  `cuenta` varchar(25) DEFAULT NULL,
  `saldo_monto` varchar(32) DEFAULT NULL,
  `max_dias` varchar(11) DEFAULT NULL,
  `fv` varchar(32) DEFAULT '',
  `id_base` varchar(32) DEFAULT NULL,
  `total_deuda` varchar(32) DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0',
  `dias_parametrizados` int(11) NOT NULL DEFAULT '5',
  `dv` varchar(10) DEFAULT NULL,
  `decil` varchar(10) DEFAULT NULL,
  `centil` varchar(10) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `MARCAADICN1` varchar(64) DEFAULT NULL,
  `MUESTRA` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_ripley_reneg_mora_archive`
--

CREATE TABLE `ct_ripley_reneg_mora_archive` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) NOT NULL,
  `fecha_vence` datetime NOT NULL,
  `monto` int(11) NOT NULL,
  `id_cliente` varchar(32) DEFAULT '0',
  `codent` varchar(6) DEFAULT NULL,
  `centalta` varchar(6) DEFAULT NULL,
  `cuenta` varchar(25) DEFAULT NULL,
  `saldo_monto` varchar(32) DEFAULT NULL,
  `max_dias` varchar(11) DEFAULT NULL,
  `fv` varchar(32) DEFAULT '',
  `id_base` varchar(32) DEFAULT NULL,
  `total_deuda` varchar(32) DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0',
  `dias_parametrizados` int(11) NOT NULL DEFAULT '5',
  `dv` varchar(10) DEFAULT NULL,
  `decil` varchar(10) DEFAULT NULL,
  `centil` varchar(10) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `MARCAADICN1` varchar(64) DEFAULT NULL,
  `MUESTRA` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_ripley_reneg_preventivo`
--

CREATE TABLE `ct_ripley_reneg_preventivo` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) NOT NULL,
  `fecha_vence` datetime NOT NULL,
  `monto` int(11) NOT NULL,
  `id_cliente` varchar(32) DEFAULT '0',
  `codent` varchar(6) DEFAULT NULL,
  `centalta` varchar(6) DEFAULT NULL,
  `cuenta` varchar(25) DEFAULT NULL,
  `saldo_monto` varchar(32) DEFAULT NULL,
  `max_dias` varchar(11) DEFAULT NULL,
  `fv` varchar(32) DEFAULT '',
  `id_base` varchar(32) DEFAULT NULL,
  `total_deuda` varchar(32) DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0',
  `dias_parametrizados` int(11) NOT NULL DEFAULT '5',
  `dv` varchar(10) DEFAULT NULL,
  `decil` varchar(10) DEFAULT NULL,
  `centil` varchar(10) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `MARCAADICN1` varchar(64) DEFAULT NULL,
  `MUESTRA` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_ripley_reneg_preventivo_archive`
--

CREATE TABLE `ct_ripley_reneg_preventivo_archive` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido_pat` varchar(64) NOT NULL,
  `apellido_mat` varchar(64) NOT NULL,
  `fecha_vence` datetime NOT NULL,
  `monto` int(11) NOT NULL,
  `id_cliente` varchar(32) DEFAULT '0',
  `codent` varchar(6) DEFAULT NULL,
  `centalta` varchar(6) DEFAULT NULL,
  `cuenta` varchar(25) DEFAULT NULL,
  `saldo_monto` varchar(32) DEFAULT NULL,
  `max_dias` varchar(11) DEFAULT NULL,
  `fv` varchar(32) DEFAULT '',
  `id_base` varchar(32) DEFAULT NULL,
  `total_deuda` varchar(32) DEFAULT NULL,
  `attempts_count` int(11) NOT NULL DEFAULT '0',
  `dias_parametrizados` int(11) NOT NULL DEFAULT '5',
  `dv` varchar(10) DEFAULT NULL,
  `decil` varchar(10) DEFAULT NULL,
  `centil` varchar(10) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `MARCAADICN1` varchar(64) DEFAULT NULL,
  `MUESTRA` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_santander_encuesta_cliente`
--

CREATE TABLE `ct_santander_encuesta_cliente` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_security_credito`
--

CREATE TABLE `ct_security_credito` (
  `record_id` bigint(20) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` datetime DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `id_cliente` varchar(64) DEFAULT NULL,
  `telefono1` varchar(64) DEFAULT NULL,
  `telefono2` varchar(64) DEFAULT NULL,
  `telefono3` varchar(64) DEFAULT NULL,
  `telefono4` varchar(64) DEFAULT NULL,
  `telefono5` varchar(64) DEFAULT NULL,
  `telefono6` varchar(64) DEFAULT NULL,
  `telefono7` varchar(64) DEFAULT NULL,
  `telefono8` varchar(64) DEFAULT NULL,
  `telefono9` varchar(64) DEFAULT NULL,
  `telefono10` varchar(64) DEFAULT NULL,
  `telefono11` varchar(64) DEFAULT NULL,
  `telefono12` varchar(64) DEFAULT NULL,
  `telefono13` varchar(64) DEFAULT NULL,
  `telefono14` varchar(64) DEFAULT NULL,
  `monto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_seguros`
--

CREATE TABLE `ct_seguros` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) NOT NULL DEFAULT '1',
  `record_status` int(11) NOT NULL DEFAULT '1',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `call_result` int(11) NOT NULL DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(16) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `telefono1` varchar(64) DEFAULT NULL,
  `rut` varchar(32) DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `empresa` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_tablename`
--

CREATE TABLE `ct_tablename` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT '0',
  `campaign_id` int(11) DEFAULT '0',
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) DEFAULT '1',
  `record_status` int(11) DEFAULT '1',
  `attempts` int(11) DEFAULT '0',
  `call_result` int(11) DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(16) DEFAULT NULL,
  `chain_id` varchar(32) DEFAULT '0',
  `chain_n` int(11) DEFAULT '0',
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ct_vidasecurity`
--

CREATE TABLE `ct_vidasecurity` (
  `record_id` bigint(20) NOT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `contact_info` varchar(32) DEFAULT NULL,
  `record_type` int(11) NOT NULL DEFAULT '1',
  `record_status` int(11) NOT NULL DEFAULT '1',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `call_result` int(11) NOT NULL DEFAULT '0',
  `call_time` datetime DEFAULT NULL,
  `sched_time` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `agent_dn` varchar(15) DEFAULT NULL,
  `chain_id` varchar(16) DEFAULT NULL,
  `chain_n` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `recycle_count` int(11) DEFAULT '0',
  `recycle_lasttime` datetime DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `telefono1` varchar(64) DEFAULT NULL,
  `rut` varchar(32) DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellido_pat` varchar(64) DEFAULT NULL,
  `apellido_mat` varchar(64) DEFAULT NULL,
  `empresa` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dialing_sessions`
--

CREATE TABLE `dialing_sessions` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `dialing` int(11) DEFAULT '0',
  `starttime` datetime DEFAULT NULL,
  `pausetime` datetime DEFAULT NULL,
  `stoptime` datetime DEFAULT NULL,
  `crr_username` varchar(32) DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dnis_in_campaign`
--

CREATE TABLE `dnis_in_campaign` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `dnis` varchar(32) NOT NULL,
  `maxcalls` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `field_in_callinglist`
--

CREATE TABLE `field_in_callinglist` (
  `id` int(11) NOT NULL,
  `field_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `attached` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `field_in_format`
--

CREATE TABLE `field_in_format` (
  `id` int(11) NOT NULL,
  `format_id` int(11) NOT NULL,
  `field_id` int(11) DEFAULT NULL,
  `column_id` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `global_call`
--

CREATE TABLE `global_call` (
  `id` bigint(20) NOT NULL,
  `uniqueid` varchar(32) DEFAULT NULL,
  `linkedid` varchar(32) DEFAULT NULL,
  `connid` varchar(32) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `answer_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `billsec` int(11) DEFAULT NULL,
  `src` varchar(32) DEFAULT NULL,
  `dst` varchar(32) DEFAULT NULL,
  `calltype` varchar(20) DEFAULT NULL,
  `call_result` int(11) DEFAULT NULL,
  `monitor` varchar(3) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `chain_id` varchar(16) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `survey_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hist_insert_priority_number`
--

CREATE TABLE `hist_insert_priority_number` (
  `id` bigint(20) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `original_chain_n` int(11) DEFAULT NULL,
  `new_priority` int(11) DEFAULT NULL,
  `change_date` datetime DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `id_cliente` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `homologaciones_la_polar`
--

CREATE TABLE `homologaciones_la_polar` (
  `codalteor` int(4) NOT NULL,
  `descalteor` varchar(50) DEFAULT NULL,
  `pregnombre` varchar(50) DEFAULT NULL,
  `pregfecha` varchar(50) DEFAULT NULL,
  `codlapolar` int(4) DEFAULT NULL,
  `desclapolar` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inhibiciones_ripley_rut`
--

CREATE TABLE `inhibiciones_ripley_rut` (
  `RUT` varchar(255) DEFAULT NULL,
  `FECHA_INICIO` date DEFAULT NULL,
  `FECHA_TERMINO` date DEFAULT NULL,
  `USUARIO` varchar(255) DEFAULT NULL,
  `FECHA_CREA` date DEFAULT NULL,
  `ORIGEN` varchar(255) DEFAULT NULL,
  `CEDENTE` varchar(255) DEFAULT NULL,
  `OBSERVACION` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inhibiciones_ripley_rut_telefono`
--

CREATE TABLE `inhibiciones_ripley_rut_telefono` (
  `RUT` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL,
  `CODIGO` varchar(255) DEFAULT NULL,
  `FONO_CORTO` varchar(255) DEFAULT NULL,
  `FECHA_INICIO` date DEFAULT NULL,
  `FECHA_TERMINO` date DEFAULT NULL,
  `USUARIO` varchar(255) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `AURIS` varchar(255) DEFAULT NULL,
  `ORIGEN` varchar(255) DEFAULT NULL,
  `OBSERVACION` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inhibiciones_ripley_telefono`
--

CREATE TABLE `inhibiciones_ripley_telefono` (
  `TELEFONO` varchar(255) DEFAULT NULL,
  `FECHA_INICIO` date DEFAULT NULL,
  `FECHA_TERMINO` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logs_recycles_plan`
--

CREATE TABLE `logs_recycles_plan` (
  `id` int(11) NOT NULL,
  `import_id` int(11) DEFAULT NULL,
  `rplan_id` int(11) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `recycletype` int(11) DEFAULT '1',
  `recyclemode` varchar(32) DEFAULT NULL,
  `filterby_callresult` varchar(512) DEFAULT NULL,
  `filterby_responses` varchar(1024) DEFAULT NULL,
  `recycleattempt` int(11) DEFAULT '0',
  `recordcount` int(11) DEFAULT '0',
  `cmdresult` varchar(32) DEFAULT NULL,
  `cmdmessage` varchar(512) DEFAULT NULL,
  `crr_username` varchar(32) DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logs_survey_interactions`
--

CREATE TABLE `logs_survey_interactions` (
  `id` bigint(20) NOT NULL,
  `eventname` varchar(12) DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `phone` varchar(32) DEFAULT NULL,
  `uniqueid` varchar(32) DEFAULT NULL,
  `connid` varchar(32) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `chain_id` varchar(16) DEFAULT NULL,
  `survey_id` int(11) DEFAULT NULL,
  `survey_dnis` varchar(32) DEFAULT NULL,
  `survey_name` varchar(32) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `question_name` varchar(32) DEFAULT NULL,
  `question_text` varchar(512) DEFAULT NULL,
  `question_num` int(11) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `response_code` varchar(16) DEFAULT NULL,
  `response_text` varchar(32) DEFAULT NULL,
  `input_type` varchar(16) DEFAULT NULL,
  `recog_confidence` int(11) DEFAULT NULL,
  `recog_utterance` varchar(32) DEFAULT NULL,
  `cdata01` varchar(64) DEFAULT NULL,
  `cdata02` varchar(64) DEFAULT NULL,
  `cdata03` varchar(64) DEFAULT NULL,
  `cdata04` varchar(64) DEFAULT NULL,
  `cdata05` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `messages_in_greeting`
--

CREATE TABLE `messages_in_greeting` (
  `id` int(11) NOT NULL,
  `greeting_id` int(11) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `greetingtext` varchar(255) DEFAULT NULL,
  `greetingsound_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `monitor`
--

CREATE TABLE `monitor` (
  `id` bigint(20) NOT NULL,
  `uniqueid` varchar(32) DEFAULT NULL,
  `linkedid` varchar(32) DEFAULT NULL,
  `connid` varchar(32) DEFAULT NULL,
  `clid` varchar(80) DEFAULT NULL,
  `src` varchar(32) DEFAULT NULL,
  `dst` varchar(32) DEFAULT NULL,
  `calltype` varchar(20) DEFAULT NULL,
  `queuename` varchar(32) DEFAULT NULL,
  `membername` varchar(32) DEFAULT NULL,
  `agent_id` varchar(32) DEFAULT NULL,
  `agent_name` varchar(32) DEFAULT NULL,
  `aegnt_dn` varchar(32) DEFAULT NULL,
  `filename` varchar(80) DEFAULT NULL,
  `filedir` varchar(80) DEFAULT NULL,
  `localdir` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `chain_id` varchar(16) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `survey_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `objects_in_role`
--

CREATE TABLE `objects_in_role` (
  `object_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `outrules_in_campaign`
--

CREATE TABLE `outrules_in_campaign` (
  `id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `outrule_id` int(11) DEFAULT NULL,
  `limitcall` int(11) DEFAULT '0',
  `weight` int(11) DEFAULT '0',
  `dialpattern` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `params_in_templates`
--

CREATE TABLE `params_in_templates` (
  `id` int(11) NOT NULL,
  `template_id` int(11) DEFAULT NULL,
  `paramname` varchar(32) DEFAULT NULL,
  `paramlabel` varchar(32) DEFAULT NULL,
  `paramtype` varchar(32) DEFAULT NULL,
  `classname` varchar(32) DEFAULT NULL,
  `filledstatement` varchar(125) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_in_callinglist`
--

CREATE TABLE `product_in_callinglist` (
  `id` int(11) NOT NULL,
  `callinglist_id` int(11) DEFAULT NULL,
  `import_id` int(11) DEFAULT NULL,
  `record_chain` varchar(16) DEFAULT NULL,
  `prod_order` int(11) DEFAULT '0',
  `prod_cod` varchar(32) DEFAULT NULL,
  `prod_nombre` varchar(32) DEFAULT NULL,
  `prod_tipo` varchar(32) DEFAULT NULL,
  `monto` int(11) DEFAULT '0',
  `monto_deuda` int(11) DEFAULT '0',
  `monto_cuota` int(11) DEFAULT '0',
  `fecha_vence` datetime DEFAULT NULL,
  `filename` varchar(64) DEFAULT NULL,
  `cantidad_cuotas` int(11) DEFAULT NULL,
  `fecha_tope` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recorded_names`
--

CREATE TABLE `recorded_names` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `responses_in_questions`
--

CREATE TABLE `responses_in_questions` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `responsecode` varchar(32) NOT NULL,
  `responsetext` varchar(32) DEFAULT NULL,
  `goto_onsuccess` int(11) DEFAULT NULL,
  `crr_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `retry_in_questions`
--

CREATE TABLE `retry_in_questions` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `attempt_type` varchar(16) DEFAULT NULL,
  `attempt_num` int(11) DEFAULT '0',
  `retry_messagetext` varchar(256) DEFAULT NULL,
  `retry_messagesound_id` int(11) DEFAULT '0',
  `playtype` varchar(16) DEFAULT 'TTS',
  `goto_onsuccess` int(11) DEFAULT '0',
  `mrcp_opts` varchar(128) DEFAULT NULL,
  `confidencelevel` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ripley m y l 23-12-2017 priorit`
--

CREATE TABLE `ripley m y l 23-12-2017 priorit` (
  `callinglist_id` varchar(255) DEFAULT NULL,
  `campaign_id` varchar(255) DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `record_type` varchar(255) DEFAULT NULL,
  `record_status` varchar(255) DEFAULT NULL,
  `attempts` varchar(255) DEFAULT NULL,
  `call_result` varchar(255) DEFAULT NULL,
  `chain_id` varchar(255) DEFAULT NULL,
  `chain_n` varchar(255) DEFAULT NULL,
  `import_id` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido_pat` varchar(255) DEFAULT NULL,
  `apellido_mat` varchar(255) DEFAULT NULL,
  `fecha_vence` varchar(255) DEFAULT NULL,
  `monto` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles_in_person`
--

CREATE TABLE `roles_in_person` (
  `role_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `statuses_in_treatment`
--

CREATE TABLE `statuses_in_treatment` (
  `id` int(11) NOT NULL,
  `treatment_id` int(11) DEFAULT NULL,
  `call_result` int(11) DEFAULT NULL,
  `sched_increment` int(11) DEFAULT '0',
  `max_attempts` int(11) DEFAULT '0',
  `chain_list` varchar(32) DEFAULT '0',
  `applyaction` enum('redial','next-in-chain') DEFAULT NULL,
  `nextchain_after` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cargaripleyintermedia`
--

CREATE TABLE `tbl_cargaripleyintermedia` (
  `PERIODO` int(11) DEFAULT NULL,
  `SISTEMA_ORIGEN` varchar(100) DEFAULT NULL,
  `ZONA` varchar(100) DEFAULT NULL,
  `SUCURSAL` varchar(100) DEFAULT NULL,
  `FECINICIOMORA` datetime DEFAULT NULL,
  `FECHA_ASIGNACION` datetime DEFAULT NULL,
  `FECHA_PROCESO` datetime DEFAULT NULL,
  `CANAL_ASIGNACION` varchar(100) DEFAULT NULL,
  `FV` varchar(100) DEFAULT NULL,
  `DIAS_MORA` int(11) DEFAULT NULL,
  `TRAMO_DIAS_MORA_REAL` varchar(100) DEFAULT NULL,
  `RUT_COBRADOR` varchar(100) DEFAULT NULL,
  `EJECUTIVO` varchar(100) DEFAULT NULL,
  `SUPERVISOR` varchar(100) DEFAULT NULL,
  `RUT_CLIENTE` int(11) DEFAULT NULL,
  `decil` int(11) DEFAULT NULL,
  `DV` varchar(100) DEFAULT NULL,
  `CODENT` varchar(100) DEFAULT NULL,
  `CENTALTA` varchar(100) DEFAULT NULL,
  `CUENTA` varchar(100) DEFAULT NULL,
  `SALDO_TOTAL` int(11) DEFAULT NULL,
  `SALDO_MORA` int(11) DEFAULT NULL,
  `TRAMO_MONTO` varchar(100) DEFAULT NULL,
  `DMP` int(11) DEFAULT NULL,
  `TRAMO_DM_PROYECTADO` varchar(100) DEFAULT NULL,
  `AP_PATERNO_CLTE` varchar(100) DEFAULT NULL,
  `AP_MATERNO_CLTE` varchar(100) DEFAULT NULL,
  `NOMBRES_CLTE` varchar(100) DEFAULT NULL,
  `COD_TIPO_DIRECCION_1` varchar(100) DEFAULT NULL,
  `TIPO_DIRECCION_1` varchar(100) DEFAULT NULL,
  `CALLE_1` varchar(100) DEFAULT NULL,
  `NRO_1` varchar(100) DEFAULT NULL,
  `RESTO_1` varchar(100) DEFAULT NULL,
  `REGION_1` varchar(100) DEFAULT NULL,
  `COMUNA_1` varchar(100) DEFAULT NULL,
  `FECHA_DIRECCION_1` datetime DEFAULT NULL,
  `PEMDM_COD_TIP_DML2` varchar(100) DEFAULT NULL,
  `TGMDO_GLS_DOM2` varchar(100) DEFAULT NULL,
  `PEMDM_GLS_CAL_DML2` varchar(100) DEFAULT NULL,
  `PEMDM_NRO_DML2` varchar(100) DEFAULT NULL,
  `PEMDM_GLS_RST_DML2` varchar(100) DEFAULT NULL,
  `REGION_2` varchar(100) DEFAULT NULL,
  `COMUNA_2` varchar(100) DEFAULT NULL,
  `PEMDM_FCH_ING_REG2` datetime DEFAULT NULL,
  `PEMDM_COD_TIP_DML3` varchar(100) DEFAULT NULL,
  `TGMDO_GLS_DOM3` varchar(100) DEFAULT NULL,
  `PEMDM_GLS_CAL_DML3` varchar(100) DEFAULT NULL,
  `PEMDM_NRO_DML3` varchar(100) DEFAULT NULL,
  `PEMDM_GLS_RST_DML3` varchar(100) DEFAULT NULL,
  `REGION_3` varchar(100) DEFAULT NULL,
  `COMUNA_3` varchar(100) DEFAULT NULL,
  `PEMDM_FCH_ING_REG3` varchar(100) DEFAULT NULL,
  `CON_FONO` varchar(100) DEFAULT NULL,
  `TIPOFONO1` varchar(100) DEFAULT NULL,
  `TELEFONO1` varchar(100) DEFAULT NULL,
  `FECHA_REG1` varchar(100) DEFAULT NULL,
  `VERIFICACION1` varchar(100) DEFAULT NULL,
  `TIPOFONO2` varchar(100) DEFAULT NULL,
  `TELEFONO2` varchar(100) DEFAULT NULL,
  `FECHA_REG2` varchar(100) DEFAULT NULL,
  `VERIFICACION2` varchar(100) DEFAULT NULL,
  `TIPOFONO3` varchar(100) DEFAULT NULL,
  `TELEFONO3` varchar(100) DEFAULT NULL,
  `FECHA_REG3` varchar(100) DEFAULT NULL,
  `VERIFICACION3` varchar(100) DEFAULT NULL,
  `TIPOFONO4` varchar(100) DEFAULT NULL,
  `TELEFONO4` varchar(100) DEFAULT NULL,
  `FECHA_REG4` varchar(100) DEFAULT NULL,
  `VERIFICACION4` varchar(100) DEFAULT NULL,
  `Fecha_Venc_Pago_Minimo` datetime DEFAULT NULL,
  `Monto_Pago_Minimo` int(11) DEFAULT NULL,
  `PRODUCTO` varchar(100) DEFAULT NULL,
  `FECHA_UNO` varchar(100) DEFAULT NULL,
  `CUOTA_UNO` varchar(100) DEFAULT NULL,
  `FECHA_DOS` varchar(100) DEFAULT NULL,
  `CUOTA_DOS` varchar(100) DEFAULT NULL,
  `FECHA_TRES` varchar(100) DEFAULT NULL,
  `CUOTA_TRES` varchar(100) DEFAULT NULL,
  `FECHA_CUATRO` varchar(100) DEFAULT NULL,
  `CUOTA_CUATRO` varchar(100) DEFAULT NULL,
  `FECHA_CINCO` varchar(100) DEFAULT NULL,
  `CUOTA_CINCO` varchar(100) DEFAULT NULL,
  `FECHA_SEIS` varchar(100) DEFAULT NULL,
  `CUOTA_SEIS` varchar(100) DEFAULT NULL,
  `FECHA_ULTIMA_REPACTACION` varchar(100) DEFAULT NULL,
  `VALOR_CUOTA` varchar(100) DEFAULT NULL,
  `MARCA_REPACTADO` varchar(100) DEFAULT NULL,
  `fecha_ult_pago` varchar(100) DEFAULT NULL,
  `pago_ult_pago` int(11) DEFAULT NULL,
  `CAMPANA` varchar(100) DEFAULT NULL,
  `inubicables` varchar(100) DEFAULT NULL,
  `DOTACION` varchar(100) DEFAULT NULL,
  `DEFUNCION` varchar(100) DEFAULT NULL,
  `GTN` varchar(100) DEFAULT NULL,
  `INCOBRABLES` varchar(100) DEFAULT NULL,
  `Rut_cob_ant` varchar(100) DEFAULT NULL,
  `Ejecutivo_ant` varchar(100) DEFAULT NULL,
  `EXCLUIR_ASIG` varchar(100) DEFAULT NULL,
  `centil` int(11) DEFAULT NULL,
  `MARCA` char(1) DEFAULT NULL,
  `REGION_GEO` varchar(100) DEFAULT NULL,
  `pd` varchar(100) DEFAULT NULL,
  `TRAMO` varchar(100) DEFAULT NULL,
  `PERIODO_SIG` int(11) DEFAULT NULL,
  `HOMOLOGACION_MARCA` char(1) DEFAULT NULL,
  `OBSERVACION` varchar(9) DEFAULT NULL,
  `CANAL_ANT` varchar(100) DEFAULT NULL,
  `RESULTADO_ANT` varchar(100) DEFAULT NULL,
  `PILOTO_CAMPAÑA` varchar(100) DEFAULT NULL,
  `ARCHIVO` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cargaripleyintermedia_archive`
--

CREATE TABLE `tbl_cargaripleyintermedia_archive` (
  `PERIODO` int(11) DEFAULT NULL,
  `SISTEMA_ORIGEN` varchar(100) DEFAULT NULL,
  `ZONA` varchar(100) DEFAULT NULL,
  `SUCURSAL` varchar(100) DEFAULT NULL,
  `FECINICIOMORA` datetime DEFAULT NULL,
  `FECHA_ASIGNACION` datetime DEFAULT NULL,
  `FECHA_PROCESO` datetime DEFAULT NULL,
  `CANAL_ASIGNACION` varchar(100) DEFAULT NULL,
  `FV` varchar(100) DEFAULT NULL,
  `DIAS_MORA` int(11) DEFAULT NULL,
  `TRAMO_DIAS_MORA_REAL` varchar(100) DEFAULT NULL,
  `RUT_COBRADOR` varchar(100) DEFAULT NULL,
  `EJECUTIVO` varchar(100) DEFAULT NULL,
  `SUPERVISOR` varchar(100) DEFAULT NULL,
  `RUT_CLIENTE` int(11) DEFAULT NULL,
  `decil` int(11) DEFAULT NULL,
  `DV` varchar(100) DEFAULT NULL,
  `CODENT` varchar(100) DEFAULT NULL,
  `CENTALTA` varchar(100) DEFAULT NULL,
  `CUENTA` varchar(100) DEFAULT NULL,
  `SALDO_TOTAL` int(11) DEFAULT NULL,
  `SALDO_MORA` int(11) DEFAULT NULL,
  `TRAMO_MONTO` varchar(100) DEFAULT NULL,
  `DMP` int(11) DEFAULT NULL,
  `TRAMO_DM_PROYECTADO` varchar(100) DEFAULT NULL,
  `AP_PATERNO_CLTE` varchar(100) DEFAULT NULL,
  `AP_MATERNO_CLTE` varchar(100) DEFAULT NULL,
  `NOMBRES_CLTE` varchar(100) DEFAULT NULL,
  `COD_TIPO_DIRECCION_1` varchar(100) DEFAULT NULL,
  `TIPO_DIRECCION_1` varchar(100) DEFAULT NULL,
  `CALLE_1` varchar(100) DEFAULT NULL,
  `NRO_1` varchar(100) DEFAULT NULL,
  `RESTO_1` varchar(100) DEFAULT NULL,
  `REGION_1` varchar(100) DEFAULT NULL,
  `COMUNA_1` varchar(100) DEFAULT NULL,
  `FECHA_DIRECCION_1` datetime DEFAULT NULL,
  `PEMDM_COD_TIP_DML2` varchar(100) DEFAULT NULL,
  `TGMDO_GLS_DOM2` varchar(100) DEFAULT NULL,
  `PEMDM_GLS_CAL_DML2` varchar(100) DEFAULT NULL,
  `PEMDM_NRO_DML2` varchar(100) DEFAULT NULL,
  `PEMDM_GLS_RST_DML2` varchar(100) DEFAULT NULL,
  `REGION_2` varchar(100) DEFAULT NULL,
  `COMUNA_2` varchar(100) DEFAULT NULL,
  `PEMDM_FCH_ING_REG2` datetime DEFAULT NULL,
  `PEMDM_COD_TIP_DML3` varchar(100) DEFAULT NULL,
  `TGMDO_GLS_DOM3` varchar(100) DEFAULT NULL,
  `PEMDM_GLS_CAL_DML3` varchar(100) DEFAULT NULL,
  `PEMDM_NRO_DML3` varchar(100) DEFAULT NULL,
  `PEMDM_GLS_RST_DML3` varchar(100) DEFAULT NULL,
  `REGION_3` varchar(100) DEFAULT NULL,
  `COMUNA_3` varchar(100) DEFAULT NULL,
  `PEMDM_FCH_ING_REG3` varchar(100) DEFAULT NULL,
  `CON_FONO` varchar(100) DEFAULT NULL,
  `TIPOFONO1` varchar(100) DEFAULT NULL,
  `TELEFONO1` varchar(100) DEFAULT NULL,
  `FECHA_REG1` varchar(100) DEFAULT NULL,
  `VERIFICACION1` varchar(100) DEFAULT NULL,
  `TIPOFONO2` varchar(100) DEFAULT NULL,
  `TELEFONO2` varchar(100) DEFAULT NULL,
  `FECHA_REG2` varchar(100) DEFAULT NULL,
  `VERIFICACION2` varchar(100) DEFAULT NULL,
  `TIPOFONO3` varchar(100) DEFAULT NULL,
  `TELEFONO3` varchar(100) DEFAULT NULL,
  `FECHA_REG3` varchar(100) DEFAULT NULL,
  `VERIFICACION3` varchar(100) DEFAULT NULL,
  `TIPOFONO4` varchar(100) DEFAULT NULL,
  `TELEFONO4` varchar(100) DEFAULT NULL,
  `FECHA_REG4` varchar(100) DEFAULT NULL,
  `VERIFICACION4` varchar(100) DEFAULT NULL,
  `Fecha_Venc_Pago_Minimo` datetime DEFAULT NULL,
  `Monto_Pago_Minimo` int(11) DEFAULT NULL,
  `PRODUCTO` varchar(100) DEFAULT NULL,
  `FECHA_UNO` varchar(100) DEFAULT NULL,
  `CUOTA_UNO` varchar(100) DEFAULT NULL,
  `FECHA_DOS` varchar(100) DEFAULT NULL,
  `CUOTA_DOS` varchar(100) DEFAULT NULL,
  `FECHA_TRES` varchar(100) DEFAULT NULL,
  `CUOTA_TRES` varchar(100) DEFAULT NULL,
  `FECHA_CUATRO` varchar(100) DEFAULT NULL,
  `CUOTA_CUATRO` varchar(100) DEFAULT NULL,
  `FECHA_CINCO` varchar(100) DEFAULT NULL,
  `CUOTA_CINCO` varchar(100) DEFAULT NULL,
  `FECHA_SEIS` varchar(100) DEFAULT NULL,
  `CUOTA_SEIS` varchar(100) DEFAULT NULL,
  `FECHA_ULTIMA_REPACTACION` varchar(100) DEFAULT NULL,
  `VALOR_CUOTA` varchar(100) DEFAULT NULL,
  `MARCA_REPACTADO` varchar(100) DEFAULT NULL,
  `fecha_ult_pago` varchar(100) DEFAULT NULL,
  `pago_ult_pago` int(11) DEFAULT NULL,
  `CAMPANA` varchar(100) DEFAULT NULL,
  `inubicables` varchar(100) DEFAULT NULL,
  `DOTACION` varchar(100) DEFAULT NULL,
  `DEFUNCION` varchar(100) DEFAULT NULL,
  `GTN` varchar(100) DEFAULT NULL,
  `INCOBRABLES` varchar(100) DEFAULT NULL,
  `Rut_cob_ant` varchar(100) DEFAULT NULL,
  `Ejecutivo_ant` varchar(100) DEFAULT NULL,
  `EXCLUIR_ASIG` varchar(100) DEFAULT NULL,
  `centil` int(11) DEFAULT NULL,
  `MARCA` char(1) DEFAULT NULL,
  `REGION_GEO` varchar(100) DEFAULT NULL,
  `pd` varchar(100) DEFAULT NULL,
  `TRAMO` varchar(100) DEFAULT NULL,
  `PERIODO_SIG` int(11) DEFAULT NULL,
  `HOMOLOGACION_MARCA` char(1) DEFAULT NULL,
  `OBSERVACION` varchar(9) DEFAULT NULL,
  `CANAL_ANT` varchar(100) DEFAULT NULL,
  `RESULTADO_ANT` varchar(100) DEFAULT NULL,
  `PILOTO_CAMPAÑA` varchar(100) DEFAULT NULL,
  `ARCHIVO` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_homologacion_ripley`
--

CREATE TABLE `tbl_homologacion_ripley` (
  `Tipo_contacto` varchar(50) DEFAULT NULL,
  `Codigo_de_accion` varchar(2) DEFAULT NULL,
  `Descripcion_Accion` varchar(50) DEFAULT NULL,
  `Codigo_Resultado` varchar(2) DEFAULT NULL,
  `Comentario_Predefinido` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_ruts_fv5_ripley_dic`
--

CREATE TABLE `tmp_ruts_fv5_ripley_dic` (
  `rut_cliente` int(11) DEFAULT NULL,
  `marca` varchar(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_callresult`
-- (See below for the actual view)
--
CREATE TABLE `v_callresult` (
`code_enum` varchar(12)
,`code_name` varchar(32)
,`code_color` varchar(32)
,`contact_type` varchar(32)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_callresult_fail`
-- (See below for the actual view)
--
CREATE TABLE `v_callresult_fail` (
`code_enum` varchar(12)
,`code_name` varchar(32)
,`code_color` varchar(32)
,`contact_type` varchar(32)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_callresult_success`
-- (See below for the actual view)
--
CREATE TABLE `v_callresult_success` (
`code_enum` varchar(12)
,`code_name` varchar(32)
,`code_color` varchar(32)
,`contact_type` varchar(32)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_recordstatus`
-- (See below for the actual view)
--
CREATE TABLE `v_recordstatus` (
`code_enum` varchar(12)
,`code_name` varchar(32)
,`code_color` varchar(32)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_recordtype`
-- (See below for the actual view)
--
CREATE TABLE `v_recordtype` (
`code_enum` varchar(12)
,`code_name` varchar(32)
,`code_color` varchar(32)
);

-- --------------------------------------------------------

--
-- Structure for view `v_callresult`
--
DROP TABLE IF EXISTS `v_callresult`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `v_callresult`  AS  select `app_resultcodes`.`optioncode` AS `code_enum`,(case when (isnull(`app_resultcodes`.`optionlabel`) or (trim(`app_resultcodes`.`optionlabel`) = '')) then `app_resultcodes`.`optionname` else `app_resultcodes`.`optionlabel` end) AS `code_name`,`app_resultcodes`.`optioncolor` AS `code_color`,`app_resultcodes`.`contact_type` AS `contact_type` from `app_resultcodes` where (`app_resultcodes`.`optiontype` = 'call_result') ;

-- --------------------------------------------------------

--
-- Structure for view `v_callresult_fail`
--
DROP TABLE IF EXISTS `v_callresult_fail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `v_callresult_fail`  AS  select `app_resultcodes`.`optioncode` AS `code_enum`,(case when (isnull(`app_resultcodes`.`optionlabel`) or (trim(`app_resultcodes`.`optionlabel`) = '')) then `app_resultcodes`.`optionname` else `app_resultcodes`.`optionlabel` end) AS `code_name`,`app_resultcodes`.`optioncolor` AS `code_color`,`app_resultcodes`.`contact_type` AS `contact_type` from `app_resultcodes` where ((`app_resultcodes`.`optiontype` = 'call_result') and (`app_resultcodes`.`contact_type` = 'FAIL')) ;

-- --------------------------------------------------------

--
-- Structure for view `v_callresult_success`
--
DROP TABLE IF EXISTS `v_callresult_success`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `v_callresult_success`  AS  select `app_resultcodes`.`optioncode` AS `code_enum`,(case when (isnull(`app_resultcodes`.`optionlabel`) or (trim(`app_resultcodes`.`optionlabel`) = '')) then `app_resultcodes`.`optionname` else `app_resultcodes`.`optionlabel` end) AS `code_name`,`app_resultcodes`.`optioncolor` AS `code_color`,`app_resultcodes`.`contact_type` AS `contact_type` from `app_resultcodes` where ((`app_resultcodes`.`optiontype` = 'call_result') and (`app_resultcodes`.`contact_type` = 'SUCCESS')) ;

-- --------------------------------------------------------

--
-- Structure for view `v_recordstatus`
--
DROP TABLE IF EXISTS `v_recordstatus`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `v_recordstatus`  AS  select `app_resultcodes`.`optioncode` AS `code_enum`,(case when (isnull(`app_resultcodes`.`optionlabel`) or (trim(`app_resultcodes`.`optionlabel`) = '')) then `app_resultcodes`.`optionname` else `app_resultcodes`.`optionlabel` end) AS `code_name`,`app_resultcodes`.`optioncolor` AS `code_color` from `app_resultcodes` where (`app_resultcodes`.`optiontype` = 'record_status') ;

-- --------------------------------------------------------

--
-- Structure for view `v_recordtype`
--
DROP TABLE IF EXISTS `v_recordtype`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `v_recordtype`  AS  select `app_resultcodes`.`optioncode` AS `code_enum`,(case when (isnull(`app_resultcodes`.`optionlabel`) or (trim(`app_resultcodes`.`optionlabel`) = '')) then `app_resultcodes`.`optionname` else `app_resultcodes`.`optionlabel` end) AS `code_name`,`app_resultcodes`.`optioncolor` AS `code_color` from `app_resultcodes` where (`app_resultcodes`.`optiontype` = 'record_type') ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_properties`
--
ALTER TABLE `app_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_resultcodes`
--
ALTER TABLE `app_resultcodes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_unique_value` (`optioncode`,`optiontype`),
  ADD UNIQUE KEY `idx_unique_label` (`optionname`,`optiontype`);

--
-- Indexes for table `callinglist_in_campaign`
--
ALTER TABLE `callinglist_in_campaign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cfg_auto_imports`
--
ALTER TABLE `cfg_auto_imports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_name` (`sourcename`);

--
-- Indexes for table `cfg_callinglist`
--
ALTER TABLE `cfg_callinglist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cfg_campaigns`
--
ALTER TABLE `cfg_campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cfg_datepay_conditions`
--
ALTER TABLE `cfg_datepay_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cfg_datepay_exceptions`
--
ALTER TABLE `cfg_datepay_exceptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cfg_fields`
--
ALTER TABLE `cfg_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_name` (`fldname`);

--
-- Indexes for table `cfg_formats`
--
ALTER TABLE `cfg_formats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cfg_greetings`
--
ALTER TABLE `cfg_greetings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cfg_holidays`
--
ALTER TABLE `cfg_holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cfg_imports`
--
ALTER TABLE `cfg_imports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cfg_objects`
--
ALTER TABLE `cfg_objects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_entity_find` (`entitycode`,`entityname`);

--
-- Indexes for table `cfg_outbound_rules`
--
ALTER TABLE `cfg_outbound_rules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_name` (`shortname`);

--
-- Indexes for table `cfg_persons`
--
ALTER TABLE `cfg_persons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_username` (`tenant_id`,`username`);

--
-- Indexes for table `cfg_privileges`
--
ALTER TABLE `cfg_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cfg_questions`
--
ALTER TABLE `cfg_questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_shortname` (`survey_id`,`shortname`),
  ADD UNIQUE KEY `idx_num` (`survey_id`,`questionnum`);

--
-- Indexes for table `cfg_recycles_plan`
--
ALTER TABLE `cfg_recycles_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cfg_report_templates`
--
ALTER TABLE `cfg_report_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cfg_resources`
--
ALTER TABLE `cfg_resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cfg_roles`
--
ALTER TABLE `cfg_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cfg_schedules`
--
ALTER TABLE `cfg_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cfg_soundcomplex`
--
ALTER TABLE `cfg_soundcomplex`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_shortname` (`shortname`);

--
-- Indexes for table `cfg_soundfiles`
--
ALTER TABLE `cfg_soundfiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_filename` (`filename`,`soundtype`);

--
-- Indexes for table `cfg_surveys`
--
ALTER TABLE `cfg_surveys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_shortname` (`shortname`),
  ADD UNIQUE KEY `idx_dnis` (`dnis`);

--
-- Indexes for table `cfg_tenants`
--
ALTER TABLE `cfg_tenants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_name` (`shortname`);

--
-- Indexes for table `cfg_timeconditions`
--
ALTER TABLE `cfg_timeconditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cfg_treatments`
--
ALTER TABLE `cfg_treatments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacto_historico`
--
ALTER TABLE `contacto_historico`
  ADD PRIMARY KEY (`telefono`,`id_cliente`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `idx_telefono` (`telefono`),
  ADD KEY `idx_rut` (`id_cliente`),
  ADD KEY `idx_rut_telefono` (`id_cliente`,`telefono`),
  ADD KEY `idx_callinglist_id` (`callinglist_id`);

--
-- Indexes for table `content_keyword_mapper`
--
ALTER TABLE `content_keyword_mapper`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ct_afpcuprum`
--
ALTER TABLE `ct_afpcuprum`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_chain` (`campaign_id`,`record_type`,`record_status`) USING BTREE;

--
-- Indexes for table `ct_banmedica`
--
ALTER TABLE `ct_banmedica`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_chain` (`campaign_id`,`record_type`,`record_status`) USING BTREE;

--
-- Indexes for table `ct_bcp`
--
ALTER TABLE `ct_bcp`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `ct_beco`
--
ALTER TABLE `ct_beco`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`) USING BTREE,
  ADD KEY `idx_chain` (`chain_id`) USING BTREE,
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_import` (`import_id`) USING BTREE;

--
-- Indexes for table `ct_beco_2_tcr`
--
ALTER TABLE `ct_beco_2_tcr`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`),
  ADD KEY `idx_chain` (`chain_id`),
  ADD KEY `idx_calltime` (`call_time`,`call_result`),
  ADD KEY `idx_import` (`import_id`),
  ADD KEY `idx_rut_telefono` (`id_cliente`,`contact_info`),
  ADD KEY `id_rut` (`id_cliente`),
  ADD KEY `id_chain_n` (`chain_n`) USING BTREE,
  ADD KEY `id_monto` (`monto`);

--
-- Indexes for table `ct_beco_2_tcr_archive`
--
ALTER TABLE `ct_beco_2_tcr_archive`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`),
  ADD KEY `idx_chain` (`chain_id`),
  ADD KEY `idx_calltime` (`call_time`,`call_result`),
  ADD KEY `idx_import` (`import_id`),
  ADD KEY `idx_rut_telefono` (`id_cliente`,`contact_info`),
  ADD KEY `id_rut` (`id_cliente`),
  ADD KEY `id_chain_n` (`chain_n`),
  ADD KEY `id_monto` (`monto`);

--
-- Indexes for table `ct_beco_archive`
--
ALTER TABLE `ct_beco_archive`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`) USING BTREE,
  ADD KEY `idx_chain` (`chain_id`) USING BTREE,
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_import` (`import_id`) USING BTREE;

--
-- Indexes for table `ct_beco_cobranza_liviana`
--
ALTER TABLE `ct_beco_cobranza_liviana`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`) USING BTREE,
  ADD KEY `idx_chain` (`chain_id`) USING BTREE,
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_import` (`import_id`) USING BTREE,
  ADD KEY `idx_rut_telefono` (`contact_info`,`id_cliente`) USING BTREE,
  ADD KEY `id_rut` (`id_cliente`) USING BTREE,
  ADD KEY `id_chain_n` (`chain_n`) USING BTREE,
  ADD KEY `id_monto` (`monto`) USING BTREE;

--
-- Indexes for table `ct_beco_cobranza_liviana_archive`
--
ALTER TABLE `ct_beco_cobranza_liviana_archive`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`) USING BTREE,
  ADD KEY `idx_chain` (`chain_id`) USING BTREE,
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_import` (`import_id`) USING BTREE;

--
-- Indexes for table `ct_beco_cred_renegociado`
--
ALTER TABLE `ct_beco_cred_renegociado`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`) USING BTREE,
  ADD KEY `idx_chain` (`chain_id`) USING BTREE,
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_import` (`import_id`) USING BTREE,
  ADD KEY `idx_rut_telefono` (`contact_info`,`id_cliente`) USING BTREE,
  ADD KEY `id_rut` (`id_cliente`) USING BTREE,
  ADD KEY `id_chain_n` (`chain_n`) USING BTREE,
  ADD KEY `id_monto` (`monto`) USING BTREE;

--
-- Indexes for table `ct_beco_cred_renegociado_archive`
--
ALTER TABLE `ct_beco_cred_renegociado_archive`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`) USING BTREE,
  ADD KEY `idx_chain` (`chain_id`) USING BTREE,
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_import` (`import_id`) USING BTREE,
  ADD KEY `idx_rut_telefono` (`contact_info`,`id_cliente`) USING BTREE,
  ADD KEY `id_rut` (`id_cliente`) USING BTREE,
  ADD KEY `id_chain_n` (`chain_n`) USING BTREE,
  ADD KEY `id_monto` (`monto`) USING BTREE;

--
-- Indexes for table `ct_beco_recordatorio`
--
ALTER TABLE `ct_beco_recordatorio`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `ct_beco_recordatorio_archive`
--
ALTER TABLE `ct_beco_recordatorio_archive`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `ct_beco_recordatorio_impago`
--
ALTER TABLE `ct_beco_recordatorio_impago`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `ct_beco_recordatorio_impago_archive`
--
ALTER TABLE `ct_beco_recordatorio_impago_archive`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `ct_ciclo1`
--
ALTER TABLE `ct_ciclo1`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial1` (`campaign_id`,`callinglist_id`) USING BTREE,
  ADD KEY `idx_pdial2` (`record_type`,`record_status`,`sched_time`) USING BTREE,
  ADD KEY `idx_chain` (`chain_id`) USING BTREE,
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_import` (`import_id`);

--
-- Indexes for table `ct_ciclo1_archive`
--
ALTER TABLE `ct_ciclo1_archive`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial1` (`campaign_id`,`callinglist_id`) USING BTREE,
  ADD KEY `idx_pdial2` (`record_type`,`record_status`,`sched_time`) USING BTREE,
  ADD KEY `idx_chain` (`chain_id`) USING BTREE,
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_import` (`import_id`);

--
-- Indexes for table `ct_claropromocion`
--
ALTER TABLE `ct_claropromocion`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `ct_claropromocion_archive`
--
ALTER TABLE `ct_claropromocion_archive`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `ct_claro_captacion`
--
ALTER TABLE `ct_claro_captacion`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`) USING BTREE,
  ADD KEY `idx_chain` (`chain_id`) USING BTREE,
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_import` (`import_id`) USING BTREE;

--
-- Indexes for table `ct_claro_captacion_archive`
--
ALTER TABLE `ct_claro_captacion_archive`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`) USING BTREE,
  ADD KEY `idx_chain` (`chain_id`) USING BTREE,
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_import` (`import_id`) USING BTREE;

--
-- Indexes for table `ct_corona_oferta`
--
ALTER TABLE `ct_corona_oferta`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial1` (`campaign_id`,`callinglist_id`) USING BTREE,
  ADD KEY `idx_pdial2` (`record_type`,`record_status`,`sched_time`) USING BTREE,
  ADD KEY `idx_chain` (`chain_id`) USING BTREE,
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_import` (`import_id`);

--
-- Indexes for table `ct_credito`
--
ALTER TABLE `ct_credito`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`,`record_type`,`record_status`) USING BTREE;

--
-- Indexes for table `ct_credito_archive`
--
ALTER TABLE `ct_credito_archive`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`,`record_type`,`record_status`) USING BTREE;

--
-- Indexes for table `ct_cuprum`
--
ALTER TABLE `ct_cuprum`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `ct_depredador`
--
ALTER TABLE `ct_depredador`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`) USING BTREE,
  ADD KEY `idx_chain` (`chain_id`) USING BTREE,
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_import` (`import_id`) USING BTREE;

--
-- Indexes for table `ct_depredador_archive`
--
ALTER TABLE `ct_depredador_archive`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`) USING BTREE,
  ADD KEY `idx_chain` (`chain_id`) USING BTREE,
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_import` (`import_id`) USING BTREE;

--
-- Indexes for table `ct_depredador_mc`
--
ALTER TABLE `ct_depredador_mc`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`,`record_type`,`record_status`) USING BTREE;

--
-- Indexes for table `ct_depredador_mc_archive`
--
ALTER TABLE `ct_depredador_mc_archive`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`,`record_type`,`record_status`) USING BTREE;

--
-- Indexes for table `ct_depredador_vf`
--
ALTER TABLE `ct_depredador_vf`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`,`record_type`,`record_status`) USING BTREE;

--
-- Indexes for table `ct_depredador_vf_archive`
--
ALTER TABLE `ct_depredador_vf_archive`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`,`record_type`,`record_status`) USING BTREE;

--
-- Indexes for table `ct_derivacion`
--
ALTER TABLE `ct_derivacion`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `ct_encuesta_movistar`
--
ALTER TABLE `ct_encuesta_movistar`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`) USING BTREE,
  ADD KEY `idx_chain` (`chain_id`) USING BTREE,
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_import` (`import_id`) USING BTREE;

--
-- Indexes for table `ct_encuesta_movistar_archive`
--
ALTER TABLE `ct_encuesta_movistar_archive`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`) USING BTREE,
  ADD KEY `idx_chain` (`chain_id`) USING BTREE,
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_import` (`import_id`) USING BTREE;

--
-- Indexes for table `ct_factoring`
--
ALTER TABLE `ct_factoring`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`,`record_type`,`record_status`) USING BTREE;

--
-- Indexes for table `ct_factoring_archive`
--
ALTER TABLE `ct_factoring_archive`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`,`record_type`,`record_status`) USING BTREE;

--
-- Indexes for table `ct_factoring_ejecutivo_ausente`
--
ALTER TABLE `ct_factoring_ejecutivo_ausente`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `ct_geobpo_flujo`
--
ALTER TABLE `ct_geobpo_flujo`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `ct_latam`
--
ALTER TABLE `ct_latam`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`,`record_type`,`record_status`) USING BTREE;

--
-- Indexes for table `ct_latam_encuesta`
--
ALTER TABLE `ct_latam_encuesta`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `ct_la_polar_cobranza`
--
ALTER TABLE `ct_la_polar_cobranza`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `indice_1` (`contact_info`,`import_id`,`id_cliente`) USING BTREE,
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`,`record_type`,`record_status`),
  ADD KEY `idx_calltime` (`call_time`,`call_result`),
  ADD KEY `idx_chain` (`chain_id`),
  ADD KEY `idx_import` (`import_id`),
  ADD KEY `indice_fecha` (`monto`,`fecha_vence`,`total_deuda_fin`) USING BTREE,
  ADD KEY `indice_2` (`chain_id`,`import_id`,`producto`) USING BTREE,
  ADD KEY `indice_3` (`chain_id`,`import_id`) USING BTREE;

--
-- Indexes for table `ct_la_polar_cobranza_archive`
--
ALTER TABLE `ct_la_polar_cobranza_archive`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `indice_1` (`contact_info`,`import_id`,`id_cliente`) USING BTREE,
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`,`record_type`,`record_status`),
  ADD KEY `idx_calltime` (`call_time`,`call_result`),
  ADD KEY `idx_chain` (`chain_id`),
  ADD KEY `idx_import` (`import_id`),
  ADD KEY `indice_fecha` (`monto`,`fecha_vence`,`total_deuda_fin`) USING BTREE,
  ADD KEY `indice_2` (`chain_n`,`import_id`) USING BTREE,
  ADD KEY `indice_3` (`chain_id`,`import_id`,`producto`);

--
-- Indexes for table `ct_mora_temprana_dia`
--
ALTER TABLE `ct_mora_temprana_dia`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `ct_mora_temprana_mes`
--
ALTER TABLE `ct_mora_temprana_mes`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_status` (`campaign_id`,`record_type`,`record_status`),
  ADD KEY `idx_import` (`crr_time`,`import_id`) USING BTREE,
  ADD KEY `idx_monto` (`monto`,`contact_info`) USING BTREE;

--
-- Indexes for table `ct_mora_temprana_mes_archive`
--
ALTER TABLE `ct_mora_temprana_mes_archive`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_status` (`campaign_id`,`record_type`,`record_status`),
  ADD KEY `idx_import` (`crr_time`,`import_id`) USING BTREE,
  ADD KEY `idx_monto` (`monto`,`contact_info`) USING BTREE;

--
-- Indexes for table `ct_movistar`
--
ALTER TABLE `ct_movistar`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `ct_movistar_archive`
--
ALTER TABLE `ct_movistar_archive`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `ct_ripley`
--
ALTER TABLE `ct_ripley`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `ct_ripley_cep`
--
ALTER TABLE `ct_ripley_cep`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_status` (`campaign_id`,`record_type`,`record_status`),
  ADD KEY `idx_import` (`crr_time`,`import_id`) USING BTREE,
  ADD KEY `idx_monto` (`monto`,`contact_info`) USING BTREE,
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`),
  ADD KEY `idx_chain` (`chain_id`),
  ADD KEY `idx_calltime` (`call_time`,`call_result`),
  ADD KEY `idx_rut_telefono` (`id_cliente`,`contact_info`),
  ADD KEY `id_rut` (`id_cliente`);

--
-- Indexes for table `ct_ripley_cep_archive`
--
ALTER TABLE `ct_ripley_cep_archive`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_status` (`campaign_id`,`record_type`,`record_status`),
  ADD KEY `idx_import` (`crr_time`,`import_id`) USING BTREE,
  ADD KEY `idx_monto` (`monto`,`contact_info`) USING BTREE,
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`),
  ADD KEY `idx_chain` (`chain_id`),
  ADD KEY `idx_calltime` (`call_time`,`call_result`),
  ADD KEY `idx_rut_telefono` (`id_cliente`,`contact_info`),
  ADD KEY `id_rut` (`id_cliente`);

--
-- Indexes for table `ct_ripley_reneg_mora`
--
ALTER TABLE `ct_ripley_reneg_mora`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_status` (`campaign_id`,`record_type`,`record_status`),
  ADD KEY `idx_import` (`crr_time`,`import_id`) USING BTREE,
  ADD KEY `idx_monto` (`monto`,`contact_info`) USING BTREE,
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`),
  ADD KEY `idx_chain` (`chain_id`),
  ADD KEY `idx_calltime` (`call_time`,`call_result`),
  ADD KEY `idx_rut_telefono` (`id_cliente`,`contact_info`),
  ADD KEY `id_rut` (`id_cliente`);

--
-- Indexes for table `ct_ripley_reneg_mora_archive`
--
ALTER TABLE `ct_ripley_reneg_mora_archive`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_status` (`campaign_id`,`record_type`,`record_status`),
  ADD KEY `idx_import` (`crr_time`,`import_id`) USING BTREE,
  ADD KEY `idx_monto` (`monto`,`contact_info`) USING BTREE,
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`),
  ADD KEY `idx_chain` (`chain_id`),
  ADD KEY `idx_calltime` (`call_time`,`call_result`),
  ADD KEY `idx_rut_telefono` (`id_cliente`,`contact_info`),
  ADD KEY `id_rut` (`id_cliente`);

--
-- Indexes for table `ct_ripley_reneg_preventivo`
--
ALTER TABLE `ct_ripley_reneg_preventivo`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_status` (`campaign_id`,`record_type`,`record_status`),
  ADD KEY `idx_import` (`crr_time`,`import_id`) USING BTREE,
  ADD KEY `idx_monto` (`monto`,`contact_info`) USING BTREE,
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`),
  ADD KEY `idx_chain` (`chain_id`),
  ADD KEY `idx_calltime` (`call_time`,`call_result`),
  ADD KEY `idx_rut_telefono` (`id_cliente`,`contact_info`),
  ADD KEY `id_rut` (`id_cliente`);

--
-- Indexes for table `ct_ripley_reneg_preventivo_archive`
--
ALTER TABLE `ct_ripley_reneg_preventivo_archive`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_status` (`campaign_id`,`record_type`,`record_status`),
  ADD KEY `idx_import` (`crr_time`,`import_id`) USING BTREE,
  ADD KEY `idx_monto` (`monto`,`contact_info`) USING BTREE,
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`),
  ADD KEY `idx_chain` (`chain_id`),
  ADD KEY `idx_calltime` (`call_time`,`call_result`),
  ADD KEY `idx_rut_telefono` (`id_cliente`,`contact_info`),
  ADD KEY `id_rut` (`id_cliente`);

--
-- Indexes for table `ct_santander_encuesta_cliente`
--
ALTER TABLE `ct_santander_encuesta_cliente`
  ADD PRIMARY KEY (`record_id`);

--
-- Indexes for table `ct_security_credito`
--
ALTER TABLE `ct_security_credito`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`,`record_type`,`record_status`) USING BTREE;

--
-- Indexes for table `ct_seguros`
--
ALTER TABLE `ct_seguros`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_chain` (`campaign_id`,`record_type`,`record_status`) USING BTREE;

--
-- Indexes for table `ct_tablename`
--
ALTER TABLE `ct_tablename`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_pdial` (`campaign_id`,`callinglist_id`,`record_type`,`record_status`),
  ADD KEY `idx_calltime` (`call_time`,`call_result`),
  ADD KEY `idx_chain` (`chain_id`),
  ADD KEY `idx_import` (`import_id`);

--
-- Indexes for table `ct_vidasecurity`
--
ALTER TABLE `ct_vidasecurity`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `idx_calltime` (`call_time`,`call_result`) USING BTREE,
  ADD KEY `idx_chain` (`campaign_id`,`record_type`,`record_status`) USING BTREE;

--
-- Indexes for table `dialing_sessions`
--
ALTER TABLE `dialing_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dnis_in_campaign`
--
ALTER TABLE `dnis_in_campaign`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_dnis` (`campaign_id`,`dnis`);

--
-- Indexes for table `field_in_callinglist`
--
ALTER TABLE `field_in_callinglist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_field` (`field_id`,`callinglist_id`);

--
-- Indexes for table `field_in_format`
--
ALTER TABLE `field_in_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_call`
--
ALTER TABLE `global_call`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_date` (`start_time`,`call_result`);

--
-- Indexes for table `hist_insert_priority_number`
--
ALTER TABLE `hist_insert_priority_number`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inhibiciones_ripley_rut`
--
ALTER TABLE `inhibiciones_ripley_rut`
  ADD KEY `idx_rut` (`RUT`),
  ADD KEY `idx_fecha_fin` (`FECHA_TERMINO`);

--
-- Indexes for table `inhibiciones_ripley_rut_telefono`
--
ALTER TABLE `inhibiciones_ripley_rut_telefono`
  ADD KEY `idx_rut_telefono` (`RUT`,`TELEFONO`),
  ADD KEY `idx_fecha_fin` (`FECHA_TERMINO`);

--
-- Indexes for table `inhibiciones_ripley_telefono`
--
ALTER TABLE `inhibiciones_ripley_telefono`
  ADD KEY `idx_telefono` (`TELEFONO`),
  ADD KEY `idx_fecha_termino` (`FECHA_TERMINO`);

--
-- Indexes for table `logs_recycles_plan`
--
ALTER TABLE `logs_recycles_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs_survey_interactions`
--
ALTER TABLE `logs_survey_interactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_starttime` (`eventname`,`crr_time`) USING BTREE,
  ADD KEY `idx_uid` (`uniqueid`) USING BTREE,
  ADD KEY `idx_chain` (`import_id`,`chain_id`) USING BTREE;

--
-- Indexes for table `messages_in_greeting`
--
ALTER TABLE `messages_in_greeting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_greeting_in_message` (`greeting_id`);

--
-- Indexes for table `monitor`
--
ALTER TABLE `monitor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outrules_in_campaign`
--
ALTER TABLE `outrules_in_campaign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `params_in_templates`
--
ALTER TABLE `params_in_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_in_callinglist`
--
ALTER TABLE `product_in_callinglist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recorded_names`
--
ALTER TABLE `recorded_names`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `responses_in_questions`
--
ALTER TABLE `responses_in_questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_code` (`question_id`,`responsecode`);

--
-- Indexes for table `retry_in_questions`
--
ALTER TABLE `retry_in_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses_in_treatment`
--
ALTER TABLE `statuses_in_treatment`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_properties`
--
ALTER TABLE `app_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_resultcodes`
--
ALTER TABLE `app_resultcodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `callinglist_in_campaign`
--
ALTER TABLE `callinglist_in_campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_auto_imports`
--
ALTER TABLE `cfg_auto_imports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_callinglist`
--
ALTER TABLE `cfg_callinglist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_campaigns`
--
ALTER TABLE `cfg_campaigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cfg_datepay_conditions`
--
ALTER TABLE `cfg_datepay_conditions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_datepay_exceptions`
--
ALTER TABLE `cfg_datepay_exceptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_fields`
--
ALTER TABLE `cfg_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_formats`
--
ALTER TABLE `cfg_formats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_greetings`
--
ALTER TABLE `cfg_greetings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_holidays`
--
ALTER TABLE `cfg_holidays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_imports`
--
ALTER TABLE `cfg_imports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_objects`
--
ALTER TABLE `cfg_objects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_outbound_rules`
--
ALTER TABLE `cfg_outbound_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_persons`
--
ALTER TABLE `cfg_persons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_privileges`
--
ALTER TABLE `cfg_privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_questions`
--
ALTER TABLE `cfg_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=684;

--
-- AUTO_INCREMENT for table `cfg_recycles_plan`
--
ALTER TABLE `cfg_recycles_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_report_templates`
--
ALTER TABLE `cfg_report_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_resources`
--
ALTER TABLE `cfg_resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_roles`
--
ALTER TABLE `cfg_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_schedules`
--
ALTER TABLE `cfg_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_soundcomplex`
--
ALTER TABLE `cfg_soundcomplex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_soundfiles`
--
ALTER TABLE `cfg_soundfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_surveys`
--
ALTER TABLE `cfg_surveys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cfg_tenants`
--
ALTER TABLE `cfg_tenants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_timeconditions`
--
ALTER TABLE `cfg_timeconditions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cfg_treatments`
--
ALTER TABLE `cfg_treatments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacto_historico`
--
ALTER TABLE `contacto_historico`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54769;

--
-- AUTO_INCREMENT for table `content_keyword_mapper`
--
ALTER TABLE `content_keyword_mapper`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_afpcuprum`
--
ALTER TABLE `ct_afpcuprum`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_banmedica`
--
ALTER TABLE `ct_banmedica`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_bcp`
--
ALTER TABLE `ct_bcp`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_beco`
--
ALTER TABLE `ct_beco`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_beco_2_tcr`
--
ALTER TABLE `ct_beco_2_tcr`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=893716;

--
-- AUTO_INCREMENT for table `ct_beco_2_tcr_archive`
--
ALTER TABLE `ct_beco_2_tcr_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=893716;

--
-- AUTO_INCREMENT for table `ct_beco_archive`
--
ALTER TABLE `ct_beco_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_beco_cobranza_liviana`
--
ALTER TABLE `ct_beco_cobranza_liviana`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=514320;

--
-- AUTO_INCREMENT for table `ct_beco_cobranza_liviana_archive`
--
ALTER TABLE `ct_beco_cobranza_liviana_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=514320;

--
-- AUTO_INCREMENT for table `ct_beco_cred_renegociado`
--
ALTER TABLE `ct_beco_cred_renegociado`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97281;

--
-- AUTO_INCREMENT for table `ct_beco_cred_renegociado_archive`
--
ALTER TABLE `ct_beco_cred_renegociado_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97281;

--
-- AUTO_INCREMENT for table `ct_beco_recordatorio`
--
ALTER TABLE `ct_beco_recordatorio`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_beco_recordatorio_archive`
--
ALTER TABLE `ct_beco_recordatorio_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_beco_recordatorio_impago`
--
ALTER TABLE `ct_beco_recordatorio_impago`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_beco_recordatorio_impago_archive`
--
ALTER TABLE `ct_beco_recordatorio_impago_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_ciclo1`
--
ALTER TABLE `ct_ciclo1`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_ciclo1_archive`
--
ALTER TABLE `ct_ciclo1_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_claropromocion`
--
ALTER TABLE `ct_claropromocion`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_claropromocion_archive`
--
ALTER TABLE `ct_claropromocion_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_claro_captacion`
--
ALTER TABLE `ct_claro_captacion`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_claro_captacion_archive`
--
ALTER TABLE `ct_claro_captacion_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_corona_oferta`
--
ALTER TABLE `ct_corona_oferta`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_credito`
--
ALTER TABLE `ct_credito`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_credito_archive`
--
ALTER TABLE `ct_credito_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_cuprum`
--
ALTER TABLE `ct_cuprum`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_depredador`
--
ALTER TABLE `ct_depredador`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_depredador_archive`
--
ALTER TABLE `ct_depredador_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_depredador_mc`
--
ALTER TABLE `ct_depredador_mc`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_depredador_mc_archive`
--
ALTER TABLE `ct_depredador_mc_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_depredador_vf`
--
ALTER TABLE `ct_depredador_vf`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_depredador_vf_archive`
--
ALTER TABLE `ct_depredador_vf_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_derivacion`
--
ALTER TABLE `ct_derivacion`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_encuesta_movistar`
--
ALTER TABLE `ct_encuesta_movistar`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_encuesta_movistar_archive`
--
ALTER TABLE `ct_encuesta_movistar_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_factoring`
--
ALTER TABLE `ct_factoring`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_factoring_archive`
--
ALTER TABLE `ct_factoring_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_factoring_ejecutivo_ausente`
--
ALTER TABLE `ct_factoring_ejecutivo_ausente`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_geobpo_flujo`
--
ALTER TABLE `ct_geobpo_flujo`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_latam`
--
ALTER TABLE `ct_latam`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_latam_encuesta`
--
ALTER TABLE `ct_latam_encuesta`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_la_polar_cobranza`
--
ALTER TABLE `ct_la_polar_cobranza`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_la_polar_cobranza_archive`
--
ALTER TABLE `ct_la_polar_cobranza_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_mora_temprana_dia`
--
ALTER TABLE `ct_mora_temprana_dia`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_mora_temprana_mes`
--
ALTER TABLE `ct_mora_temprana_mes`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_mora_temprana_mes_archive`
--
ALTER TABLE `ct_mora_temprana_mes_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_movistar`
--
ALTER TABLE `ct_movistar`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_movistar_archive`
--
ALTER TABLE `ct_movistar_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_ripley`
--
ALTER TABLE `ct_ripley`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_ripley_cep`
--
ALTER TABLE `ct_ripley_cep`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_ripley_cep_archive`
--
ALTER TABLE `ct_ripley_cep_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_ripley_reneg_mora`
--
ALTER TABLE `ct_ripley_reneg_mora`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_ripley_reneg_mora_archive`
--
ALTER TABLE `ct_ripley_reneg_mora_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_ripley_reneg_preventivo`
--
ALTER TABLE `ct_ripley_reneg_preventivo`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_ripley_reneg_preventivo_archive`
--
ALTER TABLE `ct_ripley_reneg_preventivo_archive`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_santander_encuesta_cliente`
--
ALTER TABLE `ct_santander_encuesta_cliente`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_security_credito`
--
ALTER TABLE `ct_security_credito`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_seguros`
--
ALTER TABLE `ct_seguros`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_tablename`
--
ALTER TABLE `ct_tablename`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ct_vidasecurity`
--
ALTER TABLE `ct_vidasecurity`
  MODIFY `record_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dialing_sessions`
--
ALTER TABLE `dialing_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dnis_in_campaign`
--
ALTER TABLE `dnis_in_campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `field_in_callinglist`
--
ALTER TABLE `field_in_callinglist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `field_in_format`
--
ALTER TABLE `field_in_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `global_call`
--
ALTER TABLE `global_call`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hist_insert_priority_number`
--
ALTER TABLE `hist_insert_priority_number`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92260;

--
-- AUTO_INCREMENT for table `logs_recycles_plan`
--
ALTER TABLE `logs_recycles_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs_survey_interactions`
--
ALTER TABLE `logs_survey_interactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages_in_greeting`
--
ALTER TABLE `messages_in_greeting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `monitor`
--
ALTER TABLE `monitor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `outrules_in_campaign`
--
ALTER TABLE `outrules_in_campaign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `params_in_templates`
--
ALTER TABLE `params_in_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_in_callinglist`
--
ALTER TABLE `product_in_callinglist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recorded_names`
--
ALTER TABLE `recorded_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18146;

--
-- AUTO_INCREMENT for table `responses_in_questions`
--
ALTER TABLE `responses_in_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `retry_in_questions`
--
ALTER TABLE `retry_in_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statuses_in_treatment`
--
ALTER TABLE `statuses_in_treatment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
