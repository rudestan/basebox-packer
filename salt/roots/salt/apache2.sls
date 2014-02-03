apache2:
  pkg:
    - installed
  service:
    - running
    - reload: True    
    - watch:
      - file: /etc/apache2/sites-available/pyblog.dev.conf
      
/etc/apache2/sites-available/pyblog.dev.conf:
  file.managed:
    - source: salt://conf/pyblog.dev.conf

    
/etc/apache2/sites-enabled/pyblog.dev.conf:
  file.symlink:
    - target: ../sites-available/pyblog.dev.conf    
    - require:
      - file.managed: /etc/apache2/sites-available/pyblog.dev.conf    
        
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
 