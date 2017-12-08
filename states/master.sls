ssl-cert:
  pkg.installed

/etc/salt/master.d/travis.conf:
  file.serialize:
    - formatter: yaml
    - dataset:
        file_roots:
          base:
            - /srv/salt/stack
        rest_cherrypy:
          port: 9555
          webhook_disable_auth: true
          ssl_crt: /etc/ssl/certs/ssl-cert-snakeoil.pem
          ssl_key: /etc/ssl/private/ssl-cert-snakeoil.key
        external_auth:
          auto:
            '*':
              - .*
              - '@wheel'
              - '@runner'
              - '@jobs'

salt-master:
  service.running:
    - enable: True
    - watch:
      - file: /etc/salt/master.d/travis.conf
