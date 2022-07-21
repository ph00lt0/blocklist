import json
import sys

def write_json(domain, filename='little-snitch-blocklist.lsrules'):
    with open(filename,'r+') as file:
        file_data = json.load(file)
        print(domain)
        domains = file_data["denied-remote-domains"]
        print(type(domains))
        if domain in file_data["denied-remote-domains"]:
              file_data["denied-remote-domains"].remove(domain) 
              file.seek(0)
              with open(filename,'w') as wfile:
                json.dump(file_data, wfile, indent = 4)
        else:
            print(domain, ' not blocked for Little Snitch')


if __name__ == '__main__':
    domain = sys.argv[1]
    write_json(domain)
