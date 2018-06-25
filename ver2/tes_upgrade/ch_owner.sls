{% set newTesDir = salt['cmd.shell']("ls -1 /share/Software/TES | grep zip | cut -c13-17") %}

# Change owner /appl/tes_{{ version }}
change_owner:
   file.managed:
     - source: /appl/tes_{{ newTesDir }}
     - user: twadmin
     - group: twadmin