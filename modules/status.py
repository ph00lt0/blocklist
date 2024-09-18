# Description: This module contains functions to check the status of a record in the blocklist.


# This function checks if a record can be added to the blocklist.
def can_be_added(record, blocklist_file='blocklist.txt'):
    with open(blocklist_file, 'r') as blocklist:
        blocklist_content = blocklist.read()

        if F"@@||{record}^" in blocklist_content:
            print('Record whitelisted in blocklist:', record)
            return False
                        
        if F"||{record}^$badfilter" in blocklist_content:
            print('Record badlisted in blocklist:', record)
            return False

        # Check if record is already in blocklist
        if (F"||{record}^" in blocklist_content or F"^{record}^" in blocklist_content) \
            or (record.startswith('||') and record in blocklist_content) \
            or (record.startswith('^') and record.endswith('^') and record in blocklist_content) \
            or (record.startswith('*$') and record in blocklist_content):
            print('Record already exists in blocklist:', record)
            return False
        
        return True
