# Description: This file contains functions to clean up a list of records, removing duplicates, empty records, and invalid records.


import pyfiglet

from modules.validate import validate_record, is_domain_or_ip

# This function will split a string of records into a list of records.
def split_records(records):
    # if submitted as array of records in a list, extract the records
    if type(records[0]) == list:
        print('Extracting records from list')
        records = records[0]

    if type(records) == str:
        # Remove any spaces
        records = records.replace(' ', '')
    if type(records) == str and ',' in records:
        print('Extracting records from comma separated string')
        records = records.split(',')
    if type(records) == str and ';' in records:
        print('Extracting records from semicolon seperated string')
        records = records.split(';')
    # If only one item return as list
    if type(records) == str:
        return [records]
    return records


# The goal here is not to validate the record, but to format it in a way that it can be validated later on. 
# This is done to avoid false positives and fix common issues with the records, as well as making insertion of new records easier.
# Validation should still be done after this step, as this function will not catch all invalid records.
def format_record(record: str):
    whitelist = False

    # If allow list item, remove the @@ prefix for validations
    if record.startswith('@@'):
        whitelist = True
        record = record[2:]

    # Remove wildcard subdomains.
    if record.startswith('*.'):
        record = record.replace('*.', '')
    
    # Remove wrong prefixes.
    record = record.replace('www.', '')
    record = record.replace('https://', '')
    record = record.replace('http://', '') 

    # Remove trailing slash.
    if record.endswith('/'):
        record = record[:-1]
    if record.endswith('/^'):
        record = record[:-2] + '^'

    # Format record.
    if record.startswith('||'):
        record = f'{record}'
    elif record.startswith('^') and record.endswith('^'):
        record = f'{record}'
    elif '/' in record:
        split_record = record.split('/', 1)
        # If path format as such, but not if a script or a class rule.
        if is_domain_or_ip(split_record[0]) and not '(' in split_record[1] and not '##' in split_record[1]:
            record = f'||{split_record[0]}/{split_record[1]}^' 
    elif record.endswith('.js'):
        record = f'^{record}^'
    elif is_domain_or_ip(record) and not '(' in record and not '##' in record:
        record = f'||{record}^'

    # Make domains between || and ^ lowercase, skip class rules.
    if '||' in record and '^' in record and not '##' in record and not ':' in record:
        record = record.split('||')[0] + '||' + record.split('||')[1].split('^')[0].lower() + '^' + record.split('^')[1]
        
    # Add back the @@ prefix if it was a whitelist item
    if whitelist:
        record = f'@@{record}'
    return record


# This function will cleanup a list of records, removing duplicates, empty records, and invalid records.
def cleanup_records(records):
    cleaned_records = []
    # alphabetically sorted records
    for record in sorted(records):
        # remove duplicates
        if record in cleaned_records:            
            continue

        # remove empty records
        if record == '':
            continue
        
        record = format_record(record)
        if not validate_record(record):
            continue

        cleaned_records.append(record)
    return cleaned_records


# This function will cleanup a blocklist file, removing duplicates, empty records, and invalid records.
def cleanup_file(blocklist_file='blocklist.txt'):
    with open(blocklist_file, 'r') as file:
        records = []
        headers = []
        for line in file:
            line = line.strip()
            if line.startswith('! '):
                headers.append(line)
            else:
                records.append(line)

        cleaned_records = cleanup_records(records)
        count_of_dumbed_records = len(records) - len(cleaned_records)
        count_of_records = len(cleaned_records)
        print(pyfiglet.figlet_format(F"Removed: {count_of_dumbed_records}", font="digital" ))
        print(pyfiglet.figlet_format(F"Total: {count_of_records}", font="digital" ))
    
        with open(blocklist_file, 'w') as f:
            for header in headers:
                f.write(header + '\n')

            f.write('\n')

            for record in cleaned_records:
                f.write(record + '\n')
            return