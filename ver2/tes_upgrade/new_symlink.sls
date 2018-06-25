{% set newTesDir = salt['cmd.shell']("ls -1 /share/Software/TES | grep zip | cut -c13-17") %}

# Create new symlink
TES_new_symlink:
  file.symlink:
    - name: /appl/tes
    - target: /appl/tes_{{ newTesDir }}
    - user: root
    - group: root