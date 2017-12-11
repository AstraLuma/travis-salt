python-pip:
  pkg.installed

cherrypy:
  pip.installed:
    - require:
      - pkg: python-pip

salt-api:
  service.running:
    - enable: true
