<?php
//********************************************************************************


//===============================
// Display Menu Form
//-------------------------------
function Form_show()
{
  global $tpl;
  global $db;
  $sFormTitle = "";

//-------------------------------
// Form Open Event begin
// Form Open Event end
//-------------------------------

//-------------------------------
// Set URLs
//-------------------------------
//-------------------------------
// Form Show begin
//-------------------------------

  $tpl->set_var("FormTitle", $sFormTitle);

//-------------------------------
// Form BeforeShow Event begin
// Form BeforeShow Event end
//-------------------------------

//-------------------------------
// Show fields
//-------------------------------
  $tpl->parse("FormForm", false);

//-------------------------------
// Form Show end
//-------------------------------
}
//===============================

?>