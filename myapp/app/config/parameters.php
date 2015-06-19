<?php

use Dotenv\Dotenv;

$dotenv = new Dotenv(__DIR__.'/../..');
$dotenv->load();

$container->setParameter('database_host', getenv('MYSQL_PORT_3306_TCP_ADDR'));
$container->setParameter('database_port', getenv('MYSQL_PORT_3306_TCP_PORT'));
$container->setParameter('database_password', getenv('MYSQL_ROOT_PASSWORD'));