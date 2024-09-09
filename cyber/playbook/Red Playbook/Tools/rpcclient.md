# rpcclient

- Check for anonymous connection (null session)

      rpcclient -U "" -N $TARGET_IP

    Null session supported if connection successfull

## Useful commands

- Get OS version

      srvinfo

- Enumerate users

      enumdomusers

- Lookup user SID

       lookupnames <USER>

- Enumerate domain groups

      enumdomgroups

```bash
#from rpcclient
getdompwinfo
querydominfo
netshareenum
netshareenumall
```