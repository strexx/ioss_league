<?php

class ClubController extends AppController {

    public function overviewAction()
    {   
        // Includes
        $request = Zend_Controller_Front::getInstance()->getRequest();
        $db = Zend_Registry::get('db');
        $config = Zend_Registry::get('config');
        
        // Queries
        $club = $db->fetchRow('SELECT * FROM clubs WHERE tag = ?', $request->club);
        $players = $db->fetchAll('SELECT * FROM players WHERE club_id = ?', $club['id']);

        // Views
        $this->view->players = $players;
        $this->view->club = $club;
    }
    
}

?>
