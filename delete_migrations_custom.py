import fnmatch
import os
import sys


class Clean:
    ROOT_DIR = os.path.dirname(os.path.abspath(__file__))  # This is your Project Root
    file_exceptions = ['__init__.py']
    module_exceptions = ['.idea', 'Include', 'Lib', 'media', 'Scripts', 'static', 'staticfiles', 'venv']

    def __init__(self, exception=None):
        print('INit')
        if exception is not None:
            for e in exception:
                self.file_exceptions.append(e)
            print('self', self.file_exceptions)

        self.delete()

    def delete(self):
        from sys import platform
        slash = "\\"
        if platform == "linux" or platform == "linux2":
            slash = "//"

        print('delete started', self.ROOT_DIR)
        for folders in os.listdir(self.ROOT_DIR):

            appFolder = self.ROOT_DIR + slash + folders
            print(appFolder)
            if os.path.isdir(self.ROOT_DIR + slash + folders) and not folders.endswith(tuple(self.module_exceptions)):
                migrationFolder = self.ROOT_DIR + slash + folders + slash + 'migrations'
                print(migrationFolder)
                if os.path.isdir(migrationFolder):
                    isFile = os.path.isfile(os.path.join(migrationFolder, self.file_exceptions[0]))
                    if not isFile:
                        with open(os.path.join(migrationFolder, self.file_exceptions[0]), 'w') as fp:
                            print('__init__.py file created in', migrationFolder)
                            pass
                    for files in os.listdir(migrationFolder):
                        if not files.endswith(tuple(self.file_exceptions)):
                            try:
                                print(migrationFolder + slash + files + "removed!")
                                os.remove(migrationFolder + slash + files)
                            except:
                                pass
                else:
                    print('Migration folder created in', appFolder)
                    os.mkdir(migrationFolder)
                    with open(os.path.join(migrationFolder, self.file_exceptions[0]), 'w') as fp:
                        print('__init__.py file created in', migrationFolder)
                        pass


if __name__ == "__main__":
    arguments = []
    exceptions = []
    fileName = sys.argv[0]
    try:
        if len(sys.argv) > 1:
            for e in sys.argv:
                arguments.append(e)
            arguments.pop(0)
            if arguments[0] == '--clean':
                if arguments[1] == '--exceptions':
                    for a in arguments:
                        exceptions.append(a)
                    exceptions.pop(0)
                    exceptions.pop(0)
                    Clean(exceptions)
                elif arguments[1] == '--all':
                    Clean()

            elif arguments[0] == 'help':
                print('[clean]--------for deleting files under migrations')
                print(fileName, '--clean --exceptions\tgive exceptions if you dont want to delete some files')
                print(fileName, '--clean --all\t\tfor deleting all the files')
            else:
                print('Unknown command: ', arguments[0])
                print('Type delete_migrations_custom.py help for usage.')
        else:
            Clean()
    except:
        print('Unknown command: ', arguments[0])
        print(sys.argv)
        print('Type', fileName, 'help for usage.')
