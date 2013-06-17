<?php

class PlayersForm extends Sparx_BaseForm
{
    
    public function init()
    {   
    	$db = Zend_Registry::get('db');

    	$q = $db->prepare('SELECT id, club FROM clubs');
        $q->execute();
        $clubs = $q->fetchAll(PDO::FETCH_KEY_PAIR);

    	$element = new Sparx_SimpleSelect('club_id');
        $element->setShort()
                ->addMultiOptions($clubs);
        $this->addElement($element);

        $element = new Sparx_SimpleText('name');
        $element->setMedium()
                ->setRequired();
        $this->addElement($element);

        $element = new Sparx_SimpleText('pos');
        $element->setMedium();
        $this->addElement($element);

        $element = new Sparx_SimpleText('steam_id');
        $element->setMedium();
        $this->addElement($element);
		
		$element = new Sparx_SimpleText('steam_id64');
        $element->setMedium();
        $this->addElement($element);
		
        $element = new Sparx_SimpleText('nation');
        $element->setMedium();
        $this->addElement($element);
    }
}