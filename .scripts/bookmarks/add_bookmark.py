#!/usr/bin/env python3

import json
import sys

with open('/home/shreyam/.scripts/bookmarks/bookmarks.json') as f:
    bookmarks = json.load(f)['bookmarks']

def get_input():
    title = input('Enter title for bookmark: ')
    url = input('Enter url for bookmark: ')
    
    return title, url

try:
    title, url = get_input()
except KeyboardInterrupt:
    print('Exiting ...')
    sys.exit(0)

if title and url:
    bookmarks.append({
        'title': title,
        'url': url
    })
    with open('/home/shreyam/.scripts/bookmarks/bookmarks.json', 'w') as f:
        bookmarks_obj = {
            'bookmarks': bookmarks
        }
        json.dump(bookmarks_obj, f, indent=4)

else: 
    print('Skipping as details not provided!')

print(bookmarks[-1])
