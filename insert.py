import sys
import os

import pyfiglet

from modules.clean import format_record, split_records
from modules.validate import validate_record
from modules.status import can_be_added


# This function will insert records into a blocklist file.
def insert_records(input_records, blocklist_file='blocklist.txt'):
    records = split_records(input_records)

    with open(blocklist_file, 'a') as f:
        for record in records:
            record = format_record(record)

            if not can_be_added(record):
                continue

            if not validate_record(record):
                continue
        
            print('Inserting:', record)
            f.write(record + '\n')

os.system('cls' if os.name == 'nt' else 'clear')
print(pyfiglet.figlet_format("INSERT", font="banner3-D"))

if __name__ == '__main__':
    records = sys.argv
    records.pop(0) # remove filename from list
    if records.__len__() == 0:
        print('Inserting domains, js files, valid adp rules, or full paths to blocklist.txt')
        records = input('Enter record(s): ')
    insert_records(records)
