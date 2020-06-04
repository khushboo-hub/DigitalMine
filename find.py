import fnmatch
import os
import sys

# exceptions = []
# if len(sys.argv) > 1:
#     for e in sys.argv:
#         exceptions.append(e)
#     exceptions.pop(0)
# else:
#     exceptions = ['__init__.py']
#
# print(exceptions)
# ROOT_DIR = os.path.dirname(os.path.abspath(__file__))  # This is your Project Root
# # print(ROOT_DIR+"\\accounts")
# exceptions = ['__init__.py']
# for folders in os.listdir(ROOT_DIR):
#     # print(ROOT_DIR+"\\"+folders)
#     if os.path.isdir(ROOT_DIR + "\\" + folders):
#         for files in os.listdir(ROOT_DIR + "\\" + folders):
#             if fnmatch.fnmatch(files, 'migrations'):
#                 for migrations in os.listdir(ROOT_DIR + "\\" + folders + "\\" + files):
#                     if fnmatch.fnmatch(migrations, '*'):
#                         if not migrations.endswith(tuple(exceptions)):
#                             print(ROOT_DIR + "\\" + folders + "\\" + files + "\\" + migrations)
#                             try:
#                                 os.remove(ROOT_DIR + "\\" + folders + "\\" + files + "\\" + migrations)
#                             except:
#                                 pass


class Clean:
    exceptions = ['__init__.py']
    ROOT_DIR = os.path.dirname(os.path.abspath(__file__))  # This is your Project Root

    def __init__(self, exception=None):
        if exception is not None:
            for e in exception:
                self.exceptions.append(e)

    def delete(self, exceptions):
        for folders in os.listdir(self.ROOT_DIR):
            if os.path.isdir(self.ROOT_DIR + "\\" + folders):
                for files in os.listdir(self.ROOT_DIR + "\\" + folders):
                    if fnmatch.fnmatch(files, 'migrations'):
                        for migrations in os.listdir(self.ROOT_DIR + "\\" + folders + "\\" + files):
                            if fnmatch.fnmatch(migrations, '*'):
                                if not migrations.endswith(tuple(exceptions)):

                                    try:
                                        os.remove(self.ROOT_DIR + "\\" + folders + "\\" + files + "\\" + migrations)
                                        print(
                                            self.ROOT_DIR + "\\" + folders + "\\" + files + "\\" + migrations + " Removed Successfully")
                                    except:
                                        print(
                                            self.ROOT_DIR + "\\" + folders + "\\" + files + "\\" + migrations + " Removed Failed")
                                        pass

if __name__ == "__main__":
    arguments = []
    exceptions=[]
    if len(sys.argv) > 1:
        for e in sys.argv:
            arguments.append(e)
    arguments.pop(0)

    if arguments[0] == '--clean':
        print('success')
        if arguments[1] == '--exceptions':
            print('exceptions')
            for a in arguments:
                exceptions.append(a)
            exceptions.pop(0)
            exceptions.pop(0)
            print(exceptions)
        elif arguments[1] == '-all':
            print('all')

    elif arguments[0] == 'help':
        print('[clean]')
        print(" find.py --clean --exceptions",'    for deleting all the files inside migrations. give exceptions if you dont want to delete some files')
        print(' find.py--clean --all','            for deleting all the files')
    else:
        print('Unknown command: ', arguments[0])
        print('Type find.py help for usage.')




