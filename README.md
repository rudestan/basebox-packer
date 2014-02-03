Debian 7.3 64-bit + Apache2 / Mod WSGI + Python + MySQL

+ bonus: django ready project

This fork based on repo: https://github.com/misheska/basebox-packer.

I removed all unescessary stuff for me and added some custom configs (e.g. salt states and apache2 confs).

This is actually ready to build scripts and all that you have to do is just clone repo and run "deploy_dev.sh".

Scripts use packer and vagrant to make clean system for development on python and mysql.

What you will have at the end:
=============================

- Clean Debian 7.3 virtual-box 64-bit system with SSH and GIT
- Packages installed via Salt:
- Apache 2 web server
- Mod WSGI
- Python
- virtualenv
- MySQL 
- memcached
- Demo config for example project in home/srv/www

after installation finished and "vagrant up" just ssh to 10.10.1.1 and copy
files from "demo_project" to your /home/srv/www dir. Then run install.sh. This script
will make a virtualenv and install Django framework for the demo project.

After installation is finished - just add "10.10.1.1 pyblog.dev" record into
your local machine "hosts" file, so you will be able to access the demo project from your browser.

This project is in beta stage and will be updated sometimes (hopefully :-) ) 