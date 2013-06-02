<?php

class StandingsForm extends Sparx_BaseForm
{
    
    public function init()
    {   
        $element = new Sparx_SimpleText('position');
        $element->setMedium()
                ->setRequired();
        $this->addElement($element);
        
        $element = new Sparx_SimpleText('club');
        $element->setMedium()
                ->setRequired();
        $this->addElement($element);
		
		$element = new Sparx_SimpleText('games');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);
        
        $element = new Sparx_SimpleText('won');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);
		
		$element = new Sparx_SimpleText('draw');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);
		
		$element = new Sparx_SimpleText('loss');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);
		
		$element = new Sparx_SimpleText('goalsfor');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);
		
		$element = new Sparx_SimpleText('goalsagainst');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);
		
		$element = new Sparx_SimpleText('goaldifference');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);

		$element = new Sparx_SimpleText('points');
        $element->setMedium()
        		->setRequired();
        $this->addElement($element);		
    }
}