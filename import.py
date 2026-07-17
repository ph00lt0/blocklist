import os
import sys


import pyfiglet

from modules.validate import validate_record
from modules.clean import format_record
from modules.status import can_be_added
from modules.update import update_blocklists

os.system('cls' if os.name == 'nt' else 'clear')
print(pyfiglet.figlet_format("IMPORT", font="banner3-D"))


# This function will import records from a file into the blocklist.
if __name__ == '__main__':
    args = sys.argv
    with open(args[1], 'r') as file:
        records = [line.strip() for line in file if not line.startswith('! ')]
        with open('blocklist.txt', 'a') as blocklist_file:
            for record in records:
                record = format_record(record)
                if not validate_record(record):
                    continue
                if not can_be_added(record):
                    continue
                blocklist_file.write(record + '\n')
