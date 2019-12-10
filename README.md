# Development of Digital Mine Using IOT

This is a Django project for development of digital mine using IoT(Internet of Things)


## How to Download a Project and Run
- You can Download this project as .zip .gz .bz2 file and extract it
- You can clone this project using git

    
    git clone https://vikashkisku@bitbucket.org/vikashkisku/digitalmine.git
   
    
## Install Required Packages

The Digital Mine Project needs some packages before running. It was built and
tested with Django 2.x version. To install it use the following command:

    pip install -r requirements.txt
    

Django 2 requires Python 3, if you need help setting up Python 3 on your machine you can consult
DigitalOcean great documentation on 
[How To Install and Set Up a Local Programming Environment for Python 3](https://www.digitalocean.com/community/tutorial_series/how-to-install-and-set-up-a-local-programming-environment-for-python-3)

You might have some problem installing mysqlclient. To solve this problem you need to download
the wheel for the above from 
[Download Mysql Client](https://www.lfd.uci.edu/~gohlke/pythonlibs/#mysqlclient)
You need to download a client with respect to the python version you are using.

###How to install downloaded mysqlclient


    pip install  <absolute path to your downloaded mysqlclient>




## Running the Application

Before running the application we need to create the needed DB tables:

    ./manage.py migrate

Now you can run the development web server:

    ./manage.py runserver

To access the applications go to the URL <http://localhost:8000/>


## I need a user and password to access admin section
you can create a superuser using the following command:

    ./manage.py createsuperuser

To create a normal user (non super user), you must login to the admin page and
create it: <http://localhost:8000/admin/>

##How to Update Requirements.txt
###To see the packages that are installed

    pip freeze

To update requirements.txt that saves the packages that are used ina project

    pip freeze>requirements.txt


