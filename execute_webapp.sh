#! /bin/sh

echo 'DockerFile is Correct'

rasa run actions &
rasa run -m models --enable-api & 
python3 webchatbot.py    
