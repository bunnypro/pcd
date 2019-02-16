#!/bin/sh

type php 1> /dev/null \
  && type composer 1> /dev/null \
  && type phpunit 1> /dev/null \
  && php -m | grep xdebug 1> /dev/null \
  && php -m | grep zip 1> /dev/null
