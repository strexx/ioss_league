<?php

class NewsController extends AppController {
    
    public function overviewAction()
    {
        $request = Zend_Controller_Front::getInstance()->getRequest();
        $db = Zend_Registry::get('db');
        
        $q = $db->prepare('SELECT * FROM news ORDER BY date_created DESC');
        $q->execute();
        
        $news = $q->fetchAll(PDO::FETCH_ASSOC);

        $this->view->news = $news;
    }

    public function detailAction()
    {
        $request = Zend_Controller_Front::getInstance()->getRequest();
        $db = Zend_Registry::get('db');

        $url = $request->article;
        
        $q = $db->prepare('SELECT * FROM news WHERE url = :article');
        $q->bindValue(':article', $url);
        $q->execute();
        
        $article = $q->fetch(PDO::FETCH_ASSOC);

        $this->view->article = $article;
    }
    
}

?>
