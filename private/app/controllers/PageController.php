<?php

class PageController extends AppController {

    public function homeAction()
    {   
        // Includes
        $request = Zend_Controller_Front::getInstance()->getRequest();
        $db = Zend_Registry::get('db');
        $config = Zend_Registry::get('config');
        
        // Queries
        $q = $db->prepare('SELECT * FROM news ORDER BY date_created DESC LIMIT 5');
        $q->execute();
        
        $news = $q->fetchAll(PDO::FETCH_ASSOC);

        $q = $db->prepare('SELECT * FROM slides');
        $q->execute();
        
        $slides = $q->fetchAll(PDO::FETCH_ASSOC);

        // Views
        $this->view->baseurl = $baseurl;
        $this->view->news = $news;
        $this->view->slides = $slides;
    }

    public function clubsAction()
    {   
        // Includes
        $request = Zend_Controller_Front::getInstance()->getRequest();
        $db = Zend_Registry::get('db');
        $config = Zend_Registry::get('config');

        // Queries
        $q = $db->prepare('SELECT * FROM clubs');
        $q->execute();
        
        $clubs = $q->fetchAll(PDO::FETCH_ASSOC);
        $baseurl = $config->baseurl;

        // Views
        $this->view->baseurl = $baseurl;
        $this->view->clubs = $clubs;
    }

    public function playersAction()
    {
        // Includes
        $request = Zend_Controller_Front::getInstance()->getRequest();
        $db = Zend_Registry::get('db');

        // Queries
        $q = $db->prepare('SELECT * FROM players');
        $q->execute();
        $players = $q->fetchAll(PDO::FETCH_ASSOC);

        // Views
        $this->view->players = $players;
    }

    public function schedulesAction()
    {
        // Includes
        $request = Zend_Controller_Front::getInstance()->getRequest();
        $db = Zend_Registry::get('db');

        // Queries


        // Views
    }
	
	public function statisticAction()
    {
        //
    }
	
	public function detailAction()
    {
        //
    }

    public function standingsAction()
    {
        // Includes
        $request = Zend_Controller_Front::getInstance()->getRequest();
        $db = Zend_Registry::get('db');

        // Queries
        $q = $db->prepare('SELECT * FROM standings ORDER BY position');
        $q->execute();
        $standings = $q->fetchAll(PDO::FETCH_ASSOC);

        // Views
        $this->view->standings = $standings;
    }

    public function cupAction()
    {
        //
    }

    public function transfersAction()
    {
        // Includes
        $request = Zend_Controller_Front::getInstance()->getRequest();
        $db = Zend_Registry::get('db');

        // Queries
        $q = $db->prepare('SELECT * FROM transfers ORDER BY period');
        $q->execute();
        $transfers = $q->fetchAll(PDO::FETCH_ASSOC);

        // Views
        $this->view->transfers = $transfers;
    }

    public function rulesAction()
    {
        //
    }

    public function mediaAction()
    {
        //
    }

    public function ircAction()
    {
        //
    }

    public function pollAction()
    {
        //
    }
    
}

?>
