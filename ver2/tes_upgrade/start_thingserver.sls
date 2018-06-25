# Start thingserver
thingserver_start:
  service.running:
    - name: thingserver 
    - enable: True