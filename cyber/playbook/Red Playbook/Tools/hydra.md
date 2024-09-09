# hydra

- Brute force login for single user

          hydra -L $USER_WORDLIST -P $PASS_WORDLIST $TARGET_IP <PROTOCOL>

- Brute force login with user and password lists

      hydra -L $USER_WORDLIST -P $PASS_WORDLIST $TARGET_IP <PROTOCOL>