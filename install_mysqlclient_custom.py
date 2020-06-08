# How to use it

# py install.py mysqlclient

import sys
import subprocess
import requests
from bs4 import BeautifulSoup
class Install:
    version_info = sys.version.split(' ')
    version = version_info[0]
    version = 'cp' + version.split('.')[0] + version.split('.')[1]
    bit = version_info[8]
    pythonLibLink = "https://www.lfd.uci.edu/~gohlke/pythonlibs"
    downloadLink  = "https://download.lfd.uci.edu/pythonlibs/w3jqiv8s/"
    libs = []
    wheels=[]
    def __init__(self,libs=None):
        for l in libs:
            self.libs.append(l)
        self.getWheel()
        for wheel in self.wheels:
            if not wheel == '-1':
                self.install(wheel)
            else:
                print('No such library exist')

    def getWheel(self):
        for lib in self.libs:
            print(lib,'wheel download initiated..........')
            try:
                page = requests.get(self.pythonLibLink, headers={'User-Agent': 'Custom'})
                wheelLinks = []
                soup = BeautifulSoup(page.content, 'html.parser')
                soup = soup.find(id=lib).parent
                soup = soup.find_all('li')

                for s in soup:
                    wheelLinks.append(s.find('a').text)
                wheelLinks = [i for i in wheelLinks if self.version in i]
                wheelLinks = [i for i in wheelLinks if self.bit in i]
                wheelLinks = "".join(wheelLinks[0].split())
                wheelLinks = wheelLinks.replace('‑', '-')
                package = self.downloadLink + wheelLinks
                self.wheels.append(package)
            except:
                self.wheels.append('-1')

    def install(self,package):
        try:
            print('Installing',package)
            subprocess.check_call([sys.executable, "-m", "pip", "install", package])
        except:
            print('Installing library',package,'Failed!')

    def install_using_custom_link(self):
        for lib in self.libs:
        try:
            link = "http://" + lib + ".tk/"
            import urllib.request, json
            with urllib.request.urlopen(link) as url:
                data = json.loads(url.read().decode())
                self.install(data[lib][self.bit][0][self.version])
        except Exception as e:
            print(e)
            pass


if __name__ == "__main__":
    arguments = []
    exceptions=[]
    fileName=sys.argv[0]
    try:
        if len(sys.argv) > 1:
            for e in sys.argv:
                arguments.append(e)
            arguments.pop(0)
            print('arguments',arguments)
            Install(arguments)
    except:
        print('Unknown command: ', arguments[0])
        print(sys.argv)
        print('Type',fileName,'help for usage.')
