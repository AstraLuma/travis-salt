python-pip:
  pkg.installed

cherrypy:
  pip.installed:
    - require:
      - pkg: python-pip

salt-api:
  pkg.installed: []
  service.running:
    - enable: true
