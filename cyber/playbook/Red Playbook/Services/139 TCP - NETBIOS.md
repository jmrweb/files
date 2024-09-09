# NETBIOS

Ports:
- 137 UDP/TCP - NBName (Name services)
- 138 UDP - NBDatagram (Datagram)
- 139 TCP - NBSession (Session services)

--------------------------------------------------------------------------

## Playbook

- nmap script scan (safe)

      sudo nmap -sU -p 137 --script nbstat.nse,nbns-interfaces $TARGET_IP -oN "$WORKING_DIRECTORY""$TARGET_IP"_nmap_139_discovery_safe

- query the NetBIOS name service for valid NetBIOS names

      sudo nbtscan -r $TARGET_NETWORK

see SMB

--------------------------------------------------------------------------
