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

    public function punishmentsAction()
    {
        // Includes
        $request = Zend_Controller_Front::getInstance()->getRequest();
        $db = Zend_Registry::get('db');

        // Queries
        $q = $db->prepare('SELECT * FROM punishments ORDER BY date');
        $q->execute();
        $punishments = $q->fetchAll(PDO::FETCH_ASSOC);

        // Views
        $this->view->punishments = $punishments;
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
        // Includes
        $request = Zend_Controller_Front::getInstance()->getRequest();
        $db = Zend_Registry::get('db');
                
        //if ($_SERVER['REMOTE_ADDR'] !== '77.248.25.223') 
         //   die(header("Location: /"));

        if( isset($_POST['submit'])) 
        {
            if( !empty($_POST['player']) && !empty($_POST['q1']) && !empty($_POST['q2']) && !empty($_POST['q3']) && !empty($_POST['q4']) )
            {
                    // Player
                    $player = $_POST['player'];
                        
                    // Question
                    $q1 = $_POST['q1'];
                    $q2 = $_POST['q2'];
                    $q3 = $_POST['q3'];
                    $q4 = $_POST['q4'];
                    
                    // IP
                    $ip = $_SERVER['REMOTE_ADDR'];

                    if( $db->fetchOne('SELECT ip FROM polls WHERE ip = ?', $ip) ) {
                        echo '<h2 style="position:absolute; top: 0; left: 0; width: 100%;  padding: 5px 0 5px 20px; background: red; text-align: center; color: #fff;">Already assigned, thank you!</h2>';
                    }
                    else {

                        // SQL
                        $q = $db->prepare('INSERT INTO polls (player, q1, q2, q3, q4, ip) VALUES (:player,:q1,:q2,:q3,:q4,:ip)');
                        $q->bindValue(':player', $player);
                        $q->bindValue(':q1', $q1);
                        $q->bindValue(':q2', $q2);
                        $q->bindValue(':q3', $q3);
                        $q->bindValue(':q4', $q4);
                        $q->bindValue(':ip', $ip);
                        $q->execute();
                        
                        if( $q ) {

                            echo '<h2 style="position:absolute; top: 0; left: 0; width: 100%; padding: 5px 0 5px 20px; background: green; text-align: center; color: #fff;">Success! Thank you :)</h2>'; 
                            //header("Location: http://iosmod.co.uk", 3);
                        }
                        else {
                            echo 'bad query';

                        }

                    }
            }
            else {
                echo '<h2 style="position:absolute; top: 0; left: 0; padding: 5px 0 5px 20px; background: red; text-align: center; color: #fff;">Select an option</h2>'; 
            }
        }
    }
    
}

?>
