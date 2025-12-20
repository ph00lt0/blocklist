import os

import pyfiglet

from modules.validate import validate_record
from modules.clean import cleanup_file
from modules.update import update_blocklists

os.system('cls' if os.name == 'nt' else 'clear')
print(pyfiglet.figlet_format("CLEAN", font="banner3-D"))

cleanup_file()
update_blocklists()
