# Delete old TES symlink
TES_old_symlink:
  file.absent:
    - name: /appl/tes