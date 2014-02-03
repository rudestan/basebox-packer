#!/bin/bash
virtualenv /home/srv/env/pyblog

export VIRTUAL_ENV="/home/srv/env/pyblog"
export PATH="$VIRTUAL_ENV/bin:$PATH"
unset PYTHON_HOME
/bin/bash -c 'pip install -r ./requirements.txt'
sudo service apache2 restart
