<?php

class SchedulesForm extends Sparx_BaseForm
{
    
    public function init()
    {   
        $element = new Sparx_SimpleText('stage');
        $element->setMedium()
                ->setRequired();
        $this->addElement($element);
        
        $element = new Sparx_SimpleText('date');
        $element->setMedium()
                ->setRequired();
        $this->addElement($element);
		
		$element = new Sparx_SimpleText('hometeam');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);
        
        $element = new Sparx_SimpleText('score');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);
		
		$element = new Sparx_SimpleText('awayteam');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);
		
		$element = new Sparx_SimpleText('time');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);
		
		$element = new Sparx_SimpleText('admin');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);
    }
}