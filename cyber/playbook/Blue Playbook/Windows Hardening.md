# Require stronger passwords
Search -> Run -> gpmc.msc

Expand Domain tree -> Expand domains -> right click on target domain -> "Create a GPO in this domain, and link it here..."

Enter policy name: "SecurePasswords Policy" -> hit ok

Right click "SecurePasswords Policy" -> edit

In Group policy management editor:
Computer configuration -> policies -> windows settings -> security settings -> account policies -> password policy

Enable all password policy settings except minimum age and store passwords using reversible encryption

Assign 

Connect to domain members and run in console:
```
gpupdate /force
```

