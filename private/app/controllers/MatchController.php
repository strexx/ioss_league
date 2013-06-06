<?php

class MatchController extends AppController {

    public function statisticAction()
    {   
	 	$request = Zend_Controller_Front::getInstance()->getRequest();
        $db = Zend_Registry::get('db');
        $config = Zend_Registry::get('config');

        $matchInfo = $db->fetchRow('SELECT * FROM matches WHERE id = ?', $request->id);

        $this->view->matchInfo = $matchInfo;
	}
	
}

?>