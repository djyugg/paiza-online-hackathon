<?php

$inputLines = fgets(STDIN);

for ($i = 0; $i < mb_strlen($inputLines); $i += 2) {
    echo substr($inputLines, $i, 1);
}
