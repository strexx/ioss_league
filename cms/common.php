<?php

/*********************************************************************************
 *       Filename: common.php
 *       Generated with CodeCharge 2.0.5
 *       PHP 4.0 & Templates build 11/30/2001
 *********************************************************************************/

error_reporting (E_ALL ^ E_NOTICE);
include("./template.php");
//===============================
// Database Connection Definition
//-------------------------------
//CMS Connection begin

include("./db_mysql.inc");

define("DATABASE_NAME","profiltr_prof92");
define("DATABASE_USER","profiltr_prof92a");
define("DATABASE_PASSWORD","hhLSeogV");
define("DATABASE_HOST","profiltr.mysqlservers.xs4all.nl");

// Database Initialize
$db = new DB_Sql();
$db->Database = DATABASE_NAME;
$db->User     = DATABASE_USER;
$db->Password = DATABASE_PASSWORD;
$db->Host     = DATABASE_HOST;

// CMS Connection end

//===============================
// Site Initialization
//-------------------------------
// Obtain the path where this site is located on the server
//-------------------------------
$app_path = ".";
//-------------------------------
// Create Header and Footer Path variables
//-------------------------------
$header_filename = "Header.html";
$footer_filename = "Footer.html";
//===============================

//===============================
// Common functions
//-------------------------------
// Convert non-standard characters to HTML
//-------------------------------
function tohtml($strValue)
{
  return htmlspecialchars($strValue);
}

//-------------------------------
// Convert value to URL
//-------------------------------
function tourl($strValue)
{
  return urlencode($strValue);
}

//-------------------------------
// Obtain specific URL Parameter from URL string
//-------------------------------
function get_param($param_name)
{
  global $HTTP_POST_VARS;
  global $HTTP_GET_VARS;

  $param_value = "";
  if(isset($HTTP_POST_VARS[$param_name]))
    $param_value = $HTTP_POST_VARS[$param_name];
  else if(isset($HTTP_GET_VARS[$param_name]))
    $param_value = $HTTP_GET_VARS[$param_name];

  return $param_value;
}

function get_session($param_name)
{
  global $HTTP_POST_VARS;
  global $HTTP_GET_VARS;
  global ${$param_name};

  $param_value = "";
  if(!isset($HTTP_POST_VARS[$param_name]) && !isset($HTTP_GET_VARS[$param_name]) && session_is_registered($param_name)) 
    $param_value = ${$param_name};

  return $param_value;
}

function set_session($param_name, $param_value)
{
  global ${$param_name};
  if(session_is_registered($param_name)) 
    session_unregister($param_name);
  ${$param_name} = $param_value;
  session_register($param_name);
}

function is_number($string_value)
{
  if(is_numeric($string_value) || !strlen($string_value))
    return true;
  else 
    return false;
}

//-------------------------------
// Convert value for use with SQL statament
//-------------------------------
function tosql($value, $type)
{
  if(!strlen($value))
    return "NULL";
  else
    if($type == "Number")
      return str_replace (",", ".", doubleval($value));
    else
    {
      if(get_magic_quotes_gpc() == 0)
      {
        $value = str_replace("'","''",$value);
        $value = str_replace("\\","\\\\",$value);
      }
      else
      {
        $value = str_replace("\\'","''",$value);
        $value = str_replace("\\\"","\"",$value);
      }

      return "'" . $value . "'";
    }
}

function strip($value)
{
  if(get_magic_quotes_gpc() == 0)
    return $value;
  else
    return stripslashes($value);
}

function db_fill_array($sql_query)
{
  global $db;
  $db_fill = new DB_Sql();
  $db_fill->Database = $db->Database;
  $db_fill->User     = $db->User;
  $db_fill->Password = $db->Password;
  $db_fill->Host     = $db->Host;

  $db_fill->query($sql_query);
  if ($db_fill->next_record())
  {
    do
    {
      $ar_lookup[$db_fill->f(0)] = $db_fill->f(1);
    } while ($db_fill->next_record());
    return $ar_lookup;
  }
  else
    return false;

}

//-------------------------------
// Deprecated function - use get_db_value($sql)
//-------------------------------
function dlookup($table_name, $field_name, $where_condition)
{
  $sql = "SELECT " . $field_name . " FROM " . $table_name . " WHERE " . $where_condition;
  return get_db_value($sql);
}


//-------------------------------
// Lookup field in the database based on SQL query
//-------------------------------
function get_db_value($sql)
{
  global $db;
  $db_look = new DB_Sql();
  $db_look->Database = $db->Database;
  $db_look->User     = $db->User;
  $db_look->Password = $db->Password;
  $db_look->Host     = $db->Host;

  $db_look->query($sql);
  if($db_look->next_record())
    return $db_look->f(0);
  else 
    return "";
}

//-------------------------------
// Obtain Checkbox value depending on field type
//-------------------------------
function get_checkbox_value($value, $checked_value, $unchecked_value, $type)
{
  if(!strlen($value))
    return tosql($unchecked_value, $type);
  else
    return tosql($checked_value, $type);
}

//-------------------------------
// Obtain lookup value from array containing List Of Values
//-------------------------------
function get_lov_value($value, $array)
{
  $return_result = "";

  if(sizeof($array) % 2 != 0) 
    $array_length = sizeof($array) - 1;
  else
    $array_length = sizeof($array);
  reset($array);

  for($i = 0; $i < $array_length; $i = $i + 2)
  {
    if($value == $array[$i]) $return_result = $array[$i+1];
  }

  return $return_result;
}

//-------------------------------
// Verify user's security level and redirect to login page if needed
//-------------------------------

function check_security($security_level)
{
  global $UserRights;
  if(!session_is_registered("UserID"))
  {
    header ("Location: Login.php?querystring=" . urlencode(getenv("QUERY_STRING")) . "&ret_page=" . urlencode(getenv("REQUEST_URI")));
    exit;
  }
  else
    if(!session_is_registered("UserRights") || $UserRights < $security_level)
    {
      header ("Location: Login.php?querystring=" . urlencode(getenv("QUERY_STRING")) . "&ret_page=" . urlencode(getenv("REQUEST_URI")));
      exit;
    }
}

//===============================
//  GlobalFuncs begin
function my_date_format($old_date, $format)
{
$res = "";
$day = dLookUp("nieuws", "DATE_FORMAT('$old_date', '%e')", "1=1");
$month = dLookUp("nieuws", "MONTH('$old_date')", "1=1");
$year = dLookUp("nieuws", "YEAR('$old_date')", "1=1");
switch ($format)
{
case 1:
$res = date("d/m/Y", mktime(0,0,0, $month, $day, $year));
break;
case 2:
$res = date("m/d/Y", mktime(0,0,0, $month, $day, $year));
break;
case 3:
$res = date("d-m-Y", mktime(0,0,0, $month, $day, $year));
break;
}
return $res;
}
//  GlobalFuncs end
//===============================
?>