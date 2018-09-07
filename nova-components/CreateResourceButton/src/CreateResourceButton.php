<?php

namespace Chang\CreateResourceButton;

use Laravel\Nova\Card;

class CreateResourceButton extends Card
{
    /**
     * The width of the card (1/3, 1/2, or full).
     *
     * @var string
     */
    public $width = '1/3';

    /**
     * Get the component name for the element.
     *
     * @return string
     */
    public function component()
    {
        return 'create-resource-button';
    }

    public function config()
    {
        return $this->withMeta(['issuesRefunds' => true]);
    }
}
