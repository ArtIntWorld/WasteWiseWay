# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     db_wastewiseway
# Server version:               5.0.51b-community-nt
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0
# Date/time:                    2023-06-21 07:12:43
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'db_wastewiseway'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "db_wastewiseway" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "db_wastewiseway";


#
# Table structure for table 'tbl_admin'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_admin" (
  "admin_id" int(10) unsigned NOT NULL auto_increment,
  "admin_name" varchar(50) NOT NULL,
  "admin_email" varchar(50) NOT NULL,
  "admin_password" varchar(50) NOT NULL,
  PRIMARY KEY  ("admin_id")
) AUTO_INCREMENT=1;




#
# Table structure for table 'tbl_agency'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_agency" (
  "agency_id" int(11) unsigned NOT NULL auto_increment,
  "agency_email" varchar(50) default NULL,
  "agency_address" varchar(50) default NULL,
  "agency_name" varchar(50) default NULL,
  "agency_contact" varchar(50) default NULL,
  "place_id" int(10) unsigned default NULL,
  "agency_logo" varchar(50) default NULL,
  "agency_proof" varchar(50) default NULL,
  "agency_password" varchar(50) default NULL,
  "agency_doj" varchar(50) default NULL,
  "agency_vstatus" int(10) unsigned default '0',
  PRIMARY KEY  ("agency_id")
) AUTO_INCREMENT=1;




#
# Table structure for table 'tbl_complaint'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complaint" (
  "complaint_id" int(10) unsigned NOT NULL auto_increment,
  "complainttype_id" int(10) unsigned NOT NULL,
  "complaint_description" varchar(50) default NULL,
  "complaint_status" varchar(50) default '0',
  "user_id" int(10) unsigned NOT NULL default '0',
  "complaint_date" varchar(50) default '0',
  "complaint_reply" varchar(250) default '0',
  PRIMARY KEY  ("complaint_id")
);




#
# Table structure for table 'tbl_complainttype'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_complainttype" (
  "complainttype_id" int(10) unsigned NOT NULL auto_increment,
  "complainttype_title" varchar(100) NOT NULL,
  PRIMARY KEY  ("complainttype_id")
) AUTO_INCREMENT=1;





#
# Table structure for table 'tbl_district'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_district" (
  "district_id" int(10) unsigned NOT NULL auto_increment,
  "district_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("district_id")
) AUTO_INCREMENT=1;


#
# Table structure for table 'tbl_employee'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_employee" (
  "employee_id" int(10) unsigned NOT NULL auto_increment,
  "employee_name" varchar(50) NOT NULL,
  "employee_address" varchar(50) NOT NULL,
  "employee_contact" varchar(50) NOT NULL,
  "employee_email" varchar(50) NOT NULL,
  "employee_photo" varchar(50) NOT NULL,
  "employee_proof" varchar(50) NOT NULL,
  "employee_doj" varchar(50) NOT NULL,
  "supervisor_id" int(10) unsigned NOT NULL,
  "employee_password" varchar(50) NOT NULL,
  "place_id" int(10) unsigned NOT NULL,
  "employee_gender" varchar(50) NOT NULL,
  PRIMARY KEY  ("employee_id")
) AUTO_INCREMENT=1;




#
# Table structure for table 'tbl_feedback'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_feedback" (
  "feedback_id" int(10) unsigned NOT NULL auto_increment,
  "feedback_content" varchar(50) NOT NULL,
  "feedback_date" varchar(50) NOT NULL,
  PRIMARY KEY  ("feedback_id")
);





#
# Table structure for table 'tbl_place'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_place" (
  "place_id" int(10) unsigned NOT NULL auto_increment,
  "place_name" varchar(50) NOT NULL,
  "district_id" int(10) unsigned NOT NULL,
  "type_id" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("place_id")
) AUTO_INCREMENT=1;




#
# Table structure for table 'tbl_rdwaste'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_rdwaste" (
  "rdwaste_id" int(10) unsigned NOT NULL auto_increment,
  "user_id" int(10) unsigned NOT NULL,
  "place_id" int(10) unsigned NOT NULL,
  "rdwaste_status" int(50) NOT NULL default '0',
  "rdwaste_date" varchar(50) NOT NULL,
  "rdwaste_details" varchar(50) default '0',
  "rdwaste_photo" varchar(50) NOT NULL,
  "rdwaste_landmark" varchar(50) NOT NULL,
  "rdwaste_latitude" varchar(50) default NULL,
  "rdwaste_longitude" varchar(100) default NULL,
  "employee_id" int(10) unsigned default '0',
  PRIMARY KEY  ("rdwaste_id")
)AUTO_INCREMENT=1;




#
# Table structure for table 'tbl_supervisor'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_supervisor" (
  "supervisor_id" int(50) unsigned NOT NULL auto_increment,
  "supervisor_name" varchar(50) NOT NULL,
  "supervisor_address" varchar(50) NOT NULL,
  "supervisor_contact" varchar(50) NOT NULL,
  "supervisor_photo" varchar(50) NOT NULL,
  "supervisor_proof" varchar(50) NOT NULL,
  "supervisor_gender" varchar(50) NOT NULL,
  "supervisor_email" varchar(50) NOT NULL,
  "supervisor_doj" varchar(50) NOT NULL,
  "supervisor_status" varchar(50) NOT NULL default '0',
  "agency_id" int(10) unsigned NOT NULL,
  "supervisor_password" varchar(50) NOT NULL,
  "place_id" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("supervisor_id")
) AUTO_INCREMENT=1;




#
# Table structure for table 'tbl_type'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_type" (
  "type_id" tinyint(3) unsigned NOT NULL auto_increment,
  "type_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("type_id")
) AUTO_INCREMENT=1;



#
# Table structure for table 'tbl_user'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_user" (
  "user_id" int(10) unsigned NOT NULL auto_increment,
  "user_name" varchar(50) NOT NULL,
  "user_email" varchar(50) NOT NULL,
  "user_address" varchar(100) NOT NULL,
  "user_contact" varchar(50) NOT NULL,
  "place_id" int(10) unsigned NOT NULL,
  "user_houseno" int(10) NOT NULL,
  "user_photo" varchar(50) NOT NULL,
  "user_proof" varchar(50) NOT NULL,
  "user_password" varchar(50) NOT NULL,
  "user_latitude" varchar(50) default NULL,
  "user_longitude" varchar(50) default NULL,
  PRIMARY KEY  ("user_id")
)AUTO_INCREMENT=1;




#
# Table structure for table 'tbl_wastecategory'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_wastecategory" (
  "wastecategory_id" int(10) unsigned NOT NULL auto_increment,
  "wastecategory_name" varchar(50) NOT NULL,
  PRIMARY KEY  ("wastecategory_id")
) AUTO_INCREMENT=1;



#
# Table structure for table 'tbl_wastematerial'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_wastematerial" (
  "wastematerial_id" int(10) unsigned NOT NULL auto_increment,
  "wastematerial_type" varchar(50) NOT NULL,
  "wastecategory_id" int(10) unsigned NOT NULL,
  "wastematerial_rate" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("wastematerial_id")
) AUTO_INCREMENT=1;



#
# Table structure for table 'tbl_wasterequest'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_wasterequest" (
  "wastereq_id" int(10) unsigned NOT NULL auto_increment,
  "wastereq_date" varchar(50) NOT NULL,
  "wastereq_pickupdate" varchar(50) NOT NULL,
  "user_id" int(10) unsigned NOT NULL,
  "wastereq_status" int(10) unsigned NOT NULL default '0',
  "employee_id" int(10) unsigned default '0',
  "recived" varchar(50) default NULL,
  "payed" varchar(50) default NULL,
  PRIMARY KEY  ("wastereq_id")
)AUTO_INCREMENT=1;





#
# Table structure for table 'tbl_wasterequestbody'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "tbl_wasterequestbody" (
  "wrbody_id" int(11) NOT NULL auto_increment,
  "wasterequest_id" int(10) unsigned NOT NULL,
  "wastematerial_id" int(10) unsigned NOT NULL,
  PRIMARY KEY  ("wrbody_id")
) AUTO_INCREMENT=1;

