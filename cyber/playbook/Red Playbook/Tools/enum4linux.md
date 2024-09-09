# enum4linux
https://highon.coffee/blog/enum4linux-cheat-sheet/

- Full Scan (runs all options apart from dictionary based share name guessing)

      enum4linux -a $TARGET_IP

- Find OS version

      enum4linux -o $TARGET_IP

- Enumerate users

      enum4linux -U $TARGET_IP

- Get SID of local users

      enum4linux -r -u <ADMIN_USER> -p <PASSWORD> $TARGET_IP

- Enumerate shares

      enum4linux -S $TARGET_IP

- Enumerate domain groups

      enum4linux -G $TARGET_IP

- Get printer info

      enum4linux -i $TARGET_IP
