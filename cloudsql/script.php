<?php
declare(strict_types=1);

try {
  $dbh = new pdo(
    'mysql:host=127.0.0.1:3308;dbname=axpdb',
    'admin',
    '1234',
    [
      PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
      PDO::ATTR_TIMEOUT => 2
    ]
  );
  die(json_encode([
    'outcome' => true
  ]));
} catch (PDOException $ex) {
  die(json_encode([
    'outcome' => false,
    'message' => 'Unable to connect'
  ]));
}
