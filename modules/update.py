# Description: This module will extract and sort first-party domains from a blocklist file and update all blocklists with the extracted and sorted domains.


import re
import json

import pyfiglet


# This function will write the header to a file.
def write_header(currentfile, header_file='header.txt'):
    with open(header_file, 'r') as headerfile:
        headercontents = headerfile.read()
        return currentfile.write(headercontents)


# This function will extract and sort first party domains from a blocklist file.
def extract_and_sort_domains(blocklist_file):
    with open(blocklist_file, 'r') as f:
        blocklist = f.read()

    # Extract first-party domains using regular expression
    domains = re.findall(r'(?<=\|\|)([a-zA-Z0-9.-]+)(?=\^|$)(?!.*\$)', blocklist)
    domains = [domain for domain in domains if not domain.startswith('@@')] # Remove whitelist domains
    return sorted(domains)


# This function will update all blocklists with the extracted and sorted domains.
def update_blocklists(blocklist_file='blocklist.txt'):
    domains_file = 'domains.txt'
    responsepolicyzone_file = 'rpz-blocklist.txt'
    pihole_file = "pihole-blocklist.txt"
    unbound_file = 'unbound-blocklist.txt'
    littlesnitch_file = "little-snitch-blocklist.lsrules"

    print(pyfiglet.figlet_format("UPDATE", font="banner3-D"))

    sorted_domains = extract_and_sort_domains(blocklist_file)

    with open(domains_file, 'w') as f:
        write_header(f)
        for domain in sorted_domains:
            f.write(domain + '\n')

    with open(responsepolicyzone_file, 'w') as f:
            write_header(f)
            for domain in sorted_domains:
                f.write(domain + ' CNAME .\n')

    with open(pihole_file, 'w') as f:
            write_header(f)
            for domain in sorted_domains:
                f.write('0.0.0.0 ' + domain + '\n')

    with open(unbound_file, 'w') as f:
        write_header(f)
        for domain in sorted_domains:
            f.write(f'local-zone: "{domain}." always_null\n')

    with open(littlesnitch_file, 'w') as f:
        file_data = {
            "name": "ph00lt0 - blocklist",
            "description": "https://github.com/ph00lt0/blocklist",
            "denied-remote-domains": []
        }
        file_data["denied-remote-domains"] = sorted_domains
        f.seek(0)
        json.dump(file_data, f, indent = 4)

    print(pyfiglet.figlet_format(F"First-party domains extracted and saved to all blocklists."))

