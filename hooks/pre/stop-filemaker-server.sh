#!/bin/bash

# Stop the FileMaker Server, to free up port 80 for the renewal.
service fmshelper stop
sleep 10s