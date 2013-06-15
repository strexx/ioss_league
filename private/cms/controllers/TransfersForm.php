<?php

class TransfersForm extends Sparx_BaseForm
{
    
    public function init()
    {   
        $element = new Sparx_SimpleText('period');
        $element->setMedium()
                ->setRequired();
        $this->addElement($element);
        
        $element = new Sparx_SimpleText('name');
        $element->setMedium()
                ->setRequired();
        $this->addElement($element);
		
		$element = new Sparx_SimpleText('position');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);
        
        $element = new Sparx_SimpleText('oldteam');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);
		
		$element = new Sparx_SimpleText('newteam');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);
		
		$element = new Sparx_SimpleText('punishment');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);
	
    }
}