import json
import sys

def write_json(domains, filename='little-snitch-blocklist.lsrules'):
    with open(filename,'r+') as file:
        file_data = json.load(file)
        file_data["denied-remote-domains"] = [*file_data["denied-remote-domains"], *domains] 
        file.seek(0)
        json.dump(file_data, file, indent = 4)
 
if __name__ == '__main__':
    domains = sys.argv
    domains.pop(0) # remove filename from list
    write_json(domains)
