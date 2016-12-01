#!/usr/bin/env bash

timestamp=$( date +%d-%m-%Y_%H-%M-%S )

elasticDir="/var/www/SymfonyTest/elasticq/"
elasticOutput="$elasticDir$timestamp.json"

bold=$(tput bold)
normal=$(tput sgr0)