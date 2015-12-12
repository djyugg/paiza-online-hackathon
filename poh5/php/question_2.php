<?php

class Sales_Sum
{
    const WEEK_DAYS = 7;
    private $_weekNum;
    private $_salesOfDays = [0, 0, 0, 0, 0, 0, 0];

    function __construct($inputDays)
    {
        $this->_weekNum = $inputDays / Self::WEEK_DAYS;
    }

    public function readWeeks()
    {
        for ($i = 0; $i < $this->_weekNum; $i++) {
            $this->readDays();
        }
    }

    private function readDays()
    {
        $this->_salesOfDays = array_map(function ($sales) {
            return $sales + intval(fgets(STDIN));
        }, $this->_salesOfDays);
    }

    public function displaySalesSum()
    {
        foreach ($this->_salesOfDays as $sales) {
            echo $sales . "\n";
        }
    }

}


$inputDays = intval(fgets(STDIN));

$sales_sum = new Sales_Sum($inputDays);
$sales_sum->readWeeks();
$sales_sum->displaySalesSum();
