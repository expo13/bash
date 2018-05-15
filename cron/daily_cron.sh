#!/bin/bash

echo "$(date) Daily cron running .. output below"
~/.py/sendTodoListToServer.py
echo 'End of daily cron .....'
