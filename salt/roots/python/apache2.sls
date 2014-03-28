apache2:
  pkg:
    - installed
  service:
    - running
    - reload: True    
    - watch:
      - file: pyblog

pyblog:
  file.managed:
    - name: /etc/apache2/sites-available/pyblog.dev.conf
    - source: salt://conf/pyblog.dev.conf

a2ensite pyblog.dev.conf:
  cmd.wait:
    - unless: test -L /etc/apache2/sites-enabled/pyblog.dev.conf
    - watch:
      - file: pyblog   
        
/home/srv:
  file.directory:  
    - names:
      - /home/srv/log
      - /home/srv/env
      - /home/srv/www      
    - makedirs: True  
    - user: vagrant
    - group: www-data
    - mode: 755
 