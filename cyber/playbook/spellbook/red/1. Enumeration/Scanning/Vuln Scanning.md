# Vuln Scanning

## Nmap

- vulners, vulscan
  https://null-byte.wonderhowto.com/how-to/easily-detect-cves-with-nmap-scripts-0181925/

	  git clone https://github.com/scipag/vulscan.git
	  nmap --script vulners,vulscan/ --script-args vulscandb=cve.csv -sV ###.###.###.###