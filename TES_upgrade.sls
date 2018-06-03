# Create an upgrade TES dir
/appl/tes_8.2.3:
  file.directory:
    - user: twadmin
    - group: twadmin
    - recurse:
      - user
      - group

# Stop thingserver
Thingserver_stop:
  service.dead:
    - name: thingserver
    - enable: True

# Delete old TES symlink
TES_old_symlink:
  file.absent:
    - name: /appl/tes 

# Create new symlink
TES_new_symlink:
  file.symlink:
    - name: /appl/tes
    - target: /appl/tes_8.2.3
    - user: root
    - group: root

# Uzip new TES version
Unzip_TES:
  archive.extracted:
    - name: /appl/tes_8.2.3
    - source: /share/Software/TES/thingserver-8.2.3-b576.zip

change_owner:
   file.managed:
     - source: /appl/tes_8.2.3   
     - user: twadmin
     - group: twadmin

# Copy TES stores dir to upgades TES dir
Copy_Stores:
  file.copy:
    - name: stores
    - sourece: /appl/8.2.2/stores
    - makedirs: /appl/tes/stores
    - preserver: True
    - subdir: True

# run npm install command 
npm_install:
  npm.bootstrap:
    - name: /appl/tes
    - user: root

# Start thingserver
thingserver_start:
  service.running:
    - name: thingserver 
    - enable: True

# Add some text to a file
edit_config_json:
  file.replace:
    - name: /appl/tes/configuration.json
    - pattern: 'defaultDomainName'
    - repl: 'CUSTOMERNAME.es.thingworx.com'