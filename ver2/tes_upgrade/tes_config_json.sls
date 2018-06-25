# TES configuration 
tes_configuration_json:
  file.managed:
    - name: /appl/tes/configuration.json
    - source: salt://tes_upgrade/config/configuration.json