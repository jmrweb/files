# gobuster

  - Directory Scan

        gobuster dir -u $TARGET_URL -w $DIRECTORY_WORDLIST -o "$WORKING_DIRECTORY""$TARGET_IP"_dirscan

  - Page Scan

        gobuster dir -x html,php,txt,js,json -u $TARGET_URL  -w $DIRECTORY_WORDLIST -o "$WORKING_DIRECTORY""$TARGET_IP"_pagescan

  - File Scan

        gobuster dir -x bak,bmp,jpg,jpeg,gif -u $TARGET_URL  -w $DIRECTORY_WORDLIST -o "$WORKING_DIRECTORY""$TARGET_IP"_filescan
        
  - Excluding status codes
    https://infinitelogins.com/2020/09/05/dealing-gobuster-wildcard-and-status-code-errors/

	`-b <code>`