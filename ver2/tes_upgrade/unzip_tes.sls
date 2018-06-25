{% set newTesDir = salt['cmd.shell']("ls -1 /share/Software/TES | grep zip | cut -c13-17") %}
{% set newTesZip = salt['cmd.shell']("ls -1 /share/Software/TES | grep zip  %}

# Uzip new TES version
Unzip_TES:
  archive.extracted:
    - name: /appl/tes_{{ newTesDir }}
    - source: /share/Software/TES/{{ newTesZip }}