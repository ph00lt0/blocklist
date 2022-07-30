import sys

def updateLine(line):
    line = line.replace('@@', '')
    line = line.replace('^', '^$badfilter')
    return line

def checkline(line):
    if line.lstrip().startswith("@@"):
         return True

    return False

def overwrite(filename='blocklist.txt'):
    with open(filename,'r+') as file:
        lines = file.readlines()
        count = 0
        for line in lines:
            if checkline(line):
               lines[count] = updateLine(line)
            count = count + 1

        with open(filename,'w') as wfile:
            for line in lines:
                wfile.write(line)
            wfile.close()

if __name__ == '__main__':
    overwrite()
