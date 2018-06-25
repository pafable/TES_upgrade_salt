# Creates a dir in /appl for the newest version of TES

/appl/tes_{{ insert_value }}
  file.directory:
    - user: twadmin
    - group: twadmin
    - recurse
      - user
      - group        