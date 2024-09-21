#!/bin/bash

if ! command -v php &> /dev/null
then
    echo "PHP is not installed. Please install PHP first."
    cleanup
fi
