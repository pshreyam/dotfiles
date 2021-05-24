#!/usr/bin/python

import json
import webbrowser
import subprocess

with open('/home/shreyam/.scripts/bookmarks/bookmarks.json') as f:
    bookmarks = json.load(f)['bookmarks']

options = '\n'.join([f'{bookmark["title"]}' for bookmark in bookmarks])

proc = subprocess.Popen(
    ['rofi', '-dmenu', '-p', ' bookmarks', '-i'],
    stdin=subprocess.PIPE,
    stdout=subprocess.PIPE
)

proc.stdin.write((options).encode('utf-8'))
proc.stdin.close()

answer = proc.stdout.read().decode('utf-8')

matches = []

if answer:
    matches = list(filter(lambda x: x['title'].lower().startswith(answer.strip().lower()), bookmarks))

if matches:
    url = matches[0]['url']
    webbrowser.open(url)
