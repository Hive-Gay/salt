---
nginx:
  pkg.installed:
    - pkgs:
      - nginx
  service.running:
    - enable: True
    - watch:
      - pkg: nginx

/etc/nginx/nginx.conf:
  file.managed:
    - group: root
    - mode: 644
    - source: salt://profiles/software/nginx/files/nginx.conf.j2
    - template: jinja
    - user: root
    - require:
      - pkg: nginx
    - watch_in:
      - service: nginx

/etc/nginx/conf.d/log_format.conf:
  file.managed:
    - group: root
    - mode: 644
    - source: salt://profiles/software/nginx/files/log_format.conf
    - user: root
    - require:
      - pkg: nginx
    - watch_in:
      - service: nginx
