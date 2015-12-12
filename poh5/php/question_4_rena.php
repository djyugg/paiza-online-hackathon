<?php

class Table
{
  private $_row;
  private $_column;
  private $_field = [];

  public function __construct($column, $row)
  {
    $this->_row = $row;
    $this->_column = $column;

    $this->_initializeField();
  }

  private function _initializeField()
  {
    for ($i = 0; $i < $this->_row; $i++) {
      array_push($this->_field, $this->_initializeRow(fgets(STDIN)));
    }
  }

  private function _initializeRow($line)
  {
    $row = explode(" ", $line);
    $row = array_map(function ($cell) {
      return intval($cell);
    }, $row);

    return $row;
  }

  public function getFieldValues($cellProperties)
  {
    foreach ($cellProperties as $cellProperty) {
      yield $this->_field[$cellProperty["y"]][$cellProperty["x"]];
    }
  }
}


class Field_Property
{
  private $_startX;
  private $_startY;
  private $_endX;
  private $_endY;

  public function __construct($line)
  {
    $fieldProperty = explode(" ", $line);

    $this->_startX = intval($fieldProperty[0]) - 1;
    $this->_startY = intval($fieldProperty[1]) - 1;
    $this->_endX = intval($fieldProperty[2]) - 1;
    $this->_endY = intval($fieldProperty[3]) - 1;
  }

  public function getCellProperties()
  {
    for ($x = $this->_startX; $x <= $this->_endX; $x++) {
      for ($y = $this->_startY; $y <= $this->_endY; $y++) {
        yield ["x" => $x, "y" => $y];
      }
    }
  }
}

function getFieldProperties($fieldNum)
{
  for ($i = 0; $i < $fieldNum; $i++) {
    yield new Field_Property(fgets(STDIN));
  }
}

function getUniqueCellProperties($fieldNum)
{
  $fieldProperties = getFieldProperties($fieldNum);

  $cellProperties = [];
  foreach ($fieldProperties as $fieldProperty) {
    foreach ($fieldProperty->getCellProperties() as $cellProperty) {
      array_push($cellProperties, $cellProperty);
    }
  }

  return array_unique($cellProperties, SORT_REGULAR);
}

$inputParameter = explode(" ", fgets(STDIN));

$table = new Table(intval($inputParameter[0]), intval($inputParameter[1]));
$cellProperties = getUniqueCellProperties(intval($inputParameter[2]));

$sum = 0;
foreach ($table->getFieldValues($cellProperties) as $cellValue) {
  $sum += $cellValue;
}

echo $sum;
