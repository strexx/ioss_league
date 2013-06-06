<?php

return array(
    
    // PAGES ROUTING
    
    'home' => new Zend_Controller_Router_Route('/', array('controller' => 'page','action' => 'home')),
    'clubs' => new Zend_Controller_Router_Route('/clubs', array('controller' => 'page','action' => 'clubs')),
    'players' => new Zend_Controller_Router_Route('/players', array('controller' => 'page','action' => 'players')),
    'schedules' => new Zend_Controller_Router_Route('/schedules', array('controller' => 'page','action' => 'schedules')),
    'standings' => new Zend_Controller_Router_Route('/standings', array('controller' => 'page','action' => 'standings')),
    'cup' => new Zend_Controller_Router_Route('/cup', array('controller' => 'page','action' => 'cup')),
    'punishments' => new Zend_Controller_Router_Route('/punishments', array('controller' => 'page','action' => 'punishments')),
    'rules' => new Zend_Controller_Router_Route('/rules', array('controller' => 'page','action' => 'rules')),
    'media' => new Zend_Controller_Router_Route('/media', array('controller' => 'page','action' => 'media')),
    'irc' => new Zend_Controller_Router_Route('/irc', array('controller' => 'page','action' => 'irc')),
    'poll' => new Zend_Controller_Router_Route('/poll', array('controller' => 'page','action' => 'poll')),

    // Clubs
    'club' => new Zend_Controller_Router_Route('/club/:club', array('controller' => 'club', 'action' => 'overview')),
    'profile' => new Zend_Controller_Router_Route('/profile/:player', array('controller' => 'profile', 'action' => 'detail')),

    // JSON
    'loadjson' => new Zend_Controller_Router_Route('/loadjson/:jsonfile', array('controller' => 'match', 'action' => 'loadjson')),

    // NEWS

    'news' => new Zend_Controller_Router_Route('/news', array('controller' => 'news','action' => 'overview')),
    'news-article' => new Zend_Controller_Router_Route('/news/:article', array('controller' => 'news','action' => 'detail')),

	// MATCH	
	'match' => new Zend_Controller_Router_Route('/match/:id', array('controller' => 'match', 'action' => 'statistic'))
	


);