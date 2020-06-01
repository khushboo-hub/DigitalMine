import fnmatch
import os
import sys

exceptions = []
if len(sys.argv) > 1:
    for e in sys.argv:
        exceptions.append(e)
    exceptions.pop(0)
else:
    exceptions = ['__init__.py']

print(exceptions)
ROOT_DIR = os.path.dirname(os.path.abspath(__file__))  # This is your Project Root
# print(ROOT_DIR+"\\accounts")
exceptions = ['__init__.py']
for folders in os.listdir(ROOT_DIR):
    # print(ROOT_DIR+"\\"+folders)
    if os.path.isdir(ROOT_DIR + "\\" + folders):
        for files in os.listdir(ROOT_DIR + "\\" + folders):
            if fnmatch.fnmatch(files, 'migrations'):
                for migrations in os.listdir(ROOT_DIR + "\\" + folders + "\\" + files):
                    if fnmatch.fnmatch(migrations, '*'):
                        if not migrations.endswith(tuple(exceptions)):
                            print(ROOT_DIR + "\\" + folders + "\\" + files + "\\" + migrations)
                            try:
                                os.remove(ROOT_DIR + "\\" + folders + "\\" + files + "\\" + migrations)
                            except:
                                pass
