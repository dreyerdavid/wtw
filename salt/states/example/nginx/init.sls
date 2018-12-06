nginx:
  pkg:
    - installed
  service.running:
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf


/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/files/etc/nginx/nginx.conf
    - user: root
    - group: root
    - mode: 640

/etc/nginx/sites-available/example:
  file.managed:
    - source: salt://nginx/files/etc/nginx/sites-available/example
    - user: root
    - group: root
    - mode: 640

/etc/nginx/sites-enabeled/example:
  file.symlink:
    - target: /etc/nginx/sites-available/example
    - require:
      - file: /etc/nginx/sites-available/example
      

reload-nginx:
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - watch:
      - module: nginx-config-test

nginx-config-test:
  module.wait:
    - name: nginx.configtest
    - watch:
      - file: /etc/nginx/sites-available/*