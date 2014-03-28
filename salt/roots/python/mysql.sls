mysql:
  pkg:
    - installed
    - names:
      - mysql-server
      - libmysqlclient-dev      
  service:
    - running