import sys
import os

import pyfiglet

from modules.clean import format_record, split_records


def badfilter_records(input_records, blocklist_file='blocklist.txt'):
    bad_records = split_records(input_records)

    with open(blocklist_file,'r') as f:
        formatted_bad_records = []
        lines = []

        for bad_record in bad_records:
            formatted_bad_record = F"{format_record(bad_record)}"
            formatted_bad_records.append(formatted_bad_record)

        for record in f.readlines():
            # Remove newline character
            record = record.strip('\n') 
            if record in formatted_bad_records:
                lines.append(F"{record}" + '$badfilter')
                formatted_bad_records.remove(record)
                print(F"{record} marked as badfilter")
            else:
                lines.append(record)

        for bad_record in formatted_bad_records:
            print(F"{bad_record} not been badlisted")

        with open(blocklist_file,'w') as wfile:
            for line in lines:
                wfile.write(F"{line}\n")

os.system('cls' if os.name == 'nt' else 'clear')
print(pyfiglet.figlet_format("BADFILTER", font="banner3-D"))

if __name__ == '__main__':
    records = sys.argv
    records.pop(0) # remove filename from list
    if records.__len__() == 0:
        print('Set records as badfilter, such as domains, valid adp rules, or full paths to blocklist.txt')
        records = input('Enter record(s): ')
    badfilter_records(records)
