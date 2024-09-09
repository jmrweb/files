# smbclient

## Enumerate Logins

- Check for anonymous connection (null session)
 
      smbclient -L $TARGET_IP -N

   Null session is allowed if shares a listed without requiring password

## List Shares

- w/ Anonymous Access

    - SMBv1

          smbclient -N -L $TARGET_IP
        
    - SMBv2

          smbclient -m=SMB2 -N -L \\\\Hostname\\

- w/ Username/Password

      smbclient -L \\\\<target_address>\\ -U user
      
## Connect to Share

- Windows

    - w/ Anonymous Access (Windows)

          smbclient -N \\\\$TARGET_IP\\<TARGET_SHARE>
          
    - w/ Username/Password (Windows)

          smbclient -U user \\\\$TARGET_IP\\<TARGET_SHARE>

- Samba

    - w/ Anonymous Access (Samba)

          smbclient -N //$TARGET_IP/<TARGET_SHARE>
      
    - w/ Username/Password (Samba)

          smbclient -U user \\\\$TARGET_IP\\<TARGET_SHARE>