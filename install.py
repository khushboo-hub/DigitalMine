import sys
import subprocess
version_info = sys.version.split(' ')
version = version_info[0]
bit = version_info[8]
argumentList = sys.argv
what = sys.argv[1]
version = version.split('.')
version = 'cp'+version[0]+version[1]
def install(package):
    subprocess.check_call([sys.executable, "-m", "pip", "install", package])
try:
    link="http://kaamdhaam.herokuapp.com/static/link/install.json"
    import urllib.request, json
    with urllib.request.urlopen(link) as url:
        data = json.loads(url.read().decode())
    install(data[what][bit][0][version])
except Exception as e:
    print(e)
    pass


