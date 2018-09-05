<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;
use Illuminate\Http\Request;

class CheckArrivedProductNum implements Rule
{

    protected $request;

    /**
     * Create a new rule instance.
     *
     * @param Request $request
     */
    public function __construct(Request $request)
    {
        $this->request = $request;
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string $attribute
     * @param  mixed $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        $pcs = $this->request->input('pcs', 0);
        $good = $this->request->input('good', 0);
        $bad = $this->request->input('bad', 0);
        $lost = $this->request->input('lost', 0);
        return $pcs - ($good + $bad + $lost) >= 0;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return '良品 + 破损 + 丢失 数量之和不能大于' . $this->request->input('pcs', 0);
    }
}
