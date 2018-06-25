{% set tesOld = salt['cmd.shell']("ls -1 /appl/tes | grep zip") %}

# Copy TES stores dir to upgades TES dir
copy_Stores:
  file.copy:
    - name: stores
    - sourece: /appl/{{ tesOld }}/stores
    - makedirs: /appl/tes/stores
    - preserver: True
    - subdir: True