# FTP

Port: 21 TCP


--------------------------------------------------------------------------
## Discovery Scans

- nmap discovery scan (safe)

      nmap -Pn -p21 -script "(discovery and safe) and ftp*" $TARGET_IP

- nmap discovery scan (intrusive)

      nmap -Pn -p21 -script "(discovery) and ftp*" $TARGET_IP


--------------------------------------------------------------------------
## Vuln Scans

- nmap vuln scan (safe)

      nmap -Pn -p21 -script "(vuln and safe) and ftp*" $TARGET_IP

- nmap vuln scan (instrusive)

      nmap -Pn -p21 -script "(vuln) and ftp*" $TARGET_IP


--------------------------------------------------------------------------
## Enumerate logins

- Check for anonymous login

      nmap -Pn -p21 --script ftp-anon $TARGET_IP
      
- Login brute force

    - nmap

      nmap -Pn -p21 --script ftp-brute $TARGET_IP

- hydra

      hydra -L $USER_LIST -P $PASS_LIST $TARGET_IP

--------------------------------------------------------------------------

## FTP connect

- basic login
    
      ftp $TARGET_IP -p $TARGET_PORT

- anonymous login

  username: anonymous  
  password: {press enter}

--------------------------------------------------------------------------
