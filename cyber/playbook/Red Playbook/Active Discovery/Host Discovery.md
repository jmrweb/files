# Host Discovery

## Scans

- Host scan (default):
     
      nmap -sn -T4 $TARGET_NETWORK -oN "$WORKING_DIRECTORY""$TARGET_NETWORK"_nmap_host_default

- Syn + UDP scan (common ports):
    
      nmap -sn -v -T4 -PS21,22,25,80,139,443,445,3389,8080 -PU137,138 $TARGET_NETWORK -oN "$WORKING_DIRECTORY""$TARGET_NETWORK"_nmap_host_syn