<?php
/**
 * Created by PhpStorm.
 * User: z
 * Date: 2018/10/18
 * Time: 11:00 AM
 */

namespace App\Modules\Scaffold\Traits;


use Money\Currencies\ISOCurrencies;
use Money\Currency;
use Money\Formatter\DecimalMoneyFormatter;
use Money\Formatter\IntlMoneyFormatter;
use Money\Money;
use Money\Parser\DecimalMoneyParser;

trait MoneyFormatAble
{
    protected $currency = 'USD';

    /**
     * @return string
     */
    public function getCurrency(): string
    {
        return $this->currency;
    }

    /**
     * @param string $currency
     * @return MoneyFormatAble
     */
    public function setCurrency(string $currency = null)
    {
        $this->currency = $currency ?? config('dealpaw.currency');
        return $this;
    }

    private function displayCurrencyUsing($value)
    {
        $money = new Money($value, new Currency($this->getCurrency()));
        $currencies = new ISOCurrencies();
        $moneyFormatter = new DecimalMoneyFormatter($currencies);
        return $moneyFormatter->format($money);
    }

    private function displayCurrencyByTextUsing($value)
    {
        $money = new Money($value, new Currency('USD'));
        $currencies = new ISOCurrencies();

        $numberFormatter = new \NumberFormatter('en_US', \NumberFormatter::CURRENCY);
        $moneyFormatter = new IntlMoneyFormatter($numberFormatter, $currencies);

        return $moneyFormatter->format($money);
    }

    private function saveCurrencyUsing($value)
    {
        $currencies = new ISOCurrencies();

        $moneyParser = new DecimalMoneyParser($currencies);

        $money = $moneyParser->parse($value, $this->getCurrency());

        return $money->getAmount();
    }
}