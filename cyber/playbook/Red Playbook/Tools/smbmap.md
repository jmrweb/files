# smbmap


## List Shares
- List shares with credentials

      smbmap -u <USERNAME> -p <PASSWORD> -d <DOMAIN.TLD> -H $TARGET_IP

    - Ex:

          smbmap -u guest -p "" -d . -H 10.10.10.3

- List all drives on the target host

      smbmap -u <USERNAME> -p <PASSWORD> -H $TARGET_IP -L

## List files

- Recursively list all files in share

    - All shares
      
          smbmap -R <REMOTE_PATH> -H $TARGET_IP
      
    - Specific share
      
          smbmap -R <REMOTE_PATH> -H $TARGET_IP

- List contents of specified directory

      smbmap -u <USERNAME> -p <PASSWORD> -H $TARGET_IP -r '<SHARE_PATH>'


## Manipulate files

- Upload file

      smbmap -u <USERNAME> -p <PASSWORD> -H $TARGET_IP --upload '<LOCAL_PATH>' 'SHARE_PATH'

    - Ex:

          smbmap -H 10.0.28.123 -u Administrator -p 'smbserver_771' --upload '/root/backdoor' 'C$\backdoor'

- Download file

      smbmap -u <USERNAME> -p <PASSWORD> -H $TARGET_IP --download 'SHARE_PATH'


## Execute Code

- Execute command on target host

      smbmap -u <USERNAME> -p <PASSWORD> -H $TARGET_IP -x '<COMMAND>'