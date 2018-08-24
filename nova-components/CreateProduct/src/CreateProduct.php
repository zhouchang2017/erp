<?php

namespace Chang\CreateProduct;

use Laravel\Nova\ResourceTool;

class CreateProduct extends ResourceTool
{
    /**
     * Get the displayable name of the resource tool.
     *
     * @return string
     */
    public function name()
    {
        return 'Create Product';
    }

    /**
     * Get the component name for the resource tool.
     *
     * @return string
     */
    public function component()
    {
        return 'create-product';
    }
}
