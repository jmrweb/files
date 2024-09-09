# Firewall/IDS Detection/Evasion

## Detection

Run nmap with ACK scan to determine if ports are filtered or unfiltered
    
    nmap -sA $TARGET_IP

## Evasion

Utilize nmap packet fragementation

    nmap -f $TARGET_IP

set a small MTU

    nmap --mtu <mtu_size> $TARGET_IP

Add random data to packets so they don't match the typical nmap packet signature

    nmap --data-length <number_of_bytes> $TARGET_IP

Cloak a scan with decoys

    nmap -D <decoy_ip1>,<decoy_ip2>.. $TARGET_IP

Spoof IP

    nmap -S <spoofed_ip> $TARGET_IP


Putting it all together:

    nmap -Pn -sS -sV -p445,3389 -f --data-length 200 -D 10.10.10.1,10.10.10.2 $TARGET_IP