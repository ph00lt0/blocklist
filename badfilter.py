import sys

def updateLine(line):
    return line.replace('@@', '').replace('^', '^$badfilter')

def overwrite(filename='blocklist.txt'):
    with open(filename,'r+') as file:
        lines = file.readlines()

        for count, line in enumerate(lines):
            if line.lstrip().startswith("@@"):
               lines[count] = updateLine(line)

        with open(filename,'w') as wfile:
            wfile.writelines(lines)

if __name__ == '__main__':
    overwrite()
