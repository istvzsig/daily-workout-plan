#!/bin/bash

if ! command -v php &>/dev/null; then
  echo "PHP is not installed. Please install PHP first."
  brew install php
  trap cleanup ERR
else
  command php -v
  trap cleanup ERR
fi
