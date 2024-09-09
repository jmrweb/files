# Google Hacking
https://www.exploit-db.com/google-hacking-database
https://dorksearch.com/
https://support.google.com/websearch/answer/2466433?hl=en
https://en.wikipedia.org/wiki/Google_hacking
https://cwe.mitre.org/data/definitions/548.html
https://www.amazon.com/Google-Hacking-Penetration-Testers-Johnny/dp/0128029641/ref=dp_ob_image_bk

## Operators

- ### `site`
	- ex: `site:<target_domain>`
	- Limits searches to a single domain
	- Can be used to gather a rough idea of an organization's web presence\
- ### `-`
	- Exclude a given operator from a search
	- ex: `site:<target_domain> -filetype:html`
- ### `filetype`
	- Limits search results to the specified file type
	- interesting searches:
		- `site:<target_domain> filetype:txt`
		- `site:<target_domain> filetype:pdf`
		- `site:<target_domain> -filetype:html`
- ### `ext`
	- Limits search to to specified file extensions
	- Good for checking for particular code types
	- Interesting searches:
		- `site:<target_domain> ext:php`
		- `site:<target_domain> ext:xml`
		- `site:<target_domain> ext:py`
		- `site:<target_domain> ext:php`
- ### ` intitle`
	- Limits search to pages with specified string in the title
	- Interesting searches:
		- `intitle:"index of" "parent directory"`
			- Find directory listing pages for directories that do not have index pages




	