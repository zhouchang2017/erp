<?php

namespace Chang\CreateProcurementPlan;

use Illuminate\Support\Str;
use Laravel\Nova\Nova;
use Laravel\Nova\Tool;

class CreateProcurementPlan extends Tool
{

    protected $navigationName;

    protected $routerName;

    protected $name;

    public function __construct($name = 'procurement plan', $component = null)
    {
        parent::__construct($component);
        $this->navigationName = __('Create') . __(title_case($name));
        $this->name = $name;
    }


    /**
     * Perform any tasks that need to happen when the tool is booted.
     *
     * @return void
     */
    public function boot()
    {
        Nova::script('create-procurement-plan', __DIR__ . '/../dist/js/tool.js');
        Nova::style('create-procurement-plan', __DIR__ . '/../dist/css/tool.css');
    }

    /**
     * Build the view that renders the navigation links for the tool.
     *
     * @return \Illuminate\View\View
     */
    public function renderNavigation()
    {
        return view('create-procurement-plan::navigation',
            [
                'name' => $this->navigationName,
                'router' => [
                    'name' => 'create-put-storage-plan',
                    'params' => [
                        'resourceName' => Str::plural(Str::snake($this->name, '-')),
                    ]
                ],
            ]);
    }
}
