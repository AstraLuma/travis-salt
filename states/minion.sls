/etc/salt/minion:
  file.serialize:
    - formatter: yaml
    - dataset:
        id: lively
        hash_type: sha256
        log_level: debug
        master: localhost

salt-minion:
  pkg.installed: []
  service.running:
    - enable: True
    - watch:
      - file: /etc/salt/minion
