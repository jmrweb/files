# Windows Remote Management (WINRM)

Ports:
- 5985 TCP (HTTP)
- 5986 TCP (HTTPS)

----------------------------------------------------------------------------------------

Default URI: /wsman


----------------------------------------------------------------------------------------
## Brute force

- Crackmapexec

    - Identify users + passwords
    - Execute commands on system

- Evilwinrm
    - ruby script to obtain shell
    - needs credentials

## Metasploit

If using `windows/winrm/winrm_script_exec` module and getting error `Exploit failed: RuntimeError [BUG] Unexpected node test: <:child>: <[:qname, "w", "Items"]>`:
- `set force_vbs true`