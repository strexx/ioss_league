<?php

class PunishmentsForm extends Sparx_BaseForm
{
    
    public function init()
    {   
        $element = new Sparx_SimpleText('date');
        $element->setMedium()
                ->setRequired();
        $this->addElement($element);
        
        $element = new Sparx_SimpleText('name');
        $element->setMedium()
                ->setRequired();
        $this->addElement($element);
		
		$element = new Sparx_SimpleText('team');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);
        
        $element = new Sparx_SimpleText('punishment');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);
		
		$element = new Sparx_SimpleText('reason');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);
		
	
    }
}