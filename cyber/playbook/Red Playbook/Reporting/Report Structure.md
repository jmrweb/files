# Executive Summary

## Brief
- Scope:
	- Outline scope
		- What was agreed upon
		- What was tested
		- Was anything dropped from scope during testing?
		- Were there any issues related to the timeframe?

- Timeframe:
	- Date and time of engagement

- Rules of Engagement:
	- Referee report
	- Was denial of service, social engineering, etc allowed?
	- Was there a specific testing methodology used?

- Supporting Infrastructure/Accounts
	- User accounts provided for engagement
	- IPs of testing machines
	- Any accounts created during engagement

## Full Summary
- Description of engagement:
	```
	"The Client hired OffSec to conduct a penetration test of 
	their kali.org web application in October of 2025. The test was conducted
	from a remote IP between the hours of 9 AM and 5 PM, with no users
	provided by the Client."
	```
- Discuss some effective hardening that was observed:
	```
	"The application had many forms of hardening in place. First, OffSec wa
	unable to upload malicious files due to the strong filtering
	in place. OffSec was also unable to brute force user accounts
	because of the robust lockout policy in place. Finally, the strong
	password policy made trivial password attacks unlikely to succeed.
	This points to a commendable culture of user account protections."
	```
- Discuss vulnerabilities discovered:
	```
	"However, there were still areas of concern within the application.
	OffSec was able to inject arbitrary JavaScript into the browser of
	an unwitting victim that would then be run in the context of that
	victim. In conjuction with the username enumeration on the login
	field, there seems to be a trend of unsanitized user input compounded
	by verbose error messages being returned to the user. This can lead
	to some impactful issues, such as password or session stealing. It is
	recommended that all input and error messages that are returned to the
	user be sanitized and made generic to prevent this class of issue from
	cropping up."
	```
 - Concise Engagement wrap-up:
	 ```
	 "These vulnerabilities and their remediations are described in more
	 detail below. Should any questions arise, OffSec is happy
	 to provide further advice and remediation help."
	```


# Testing Environment Considerations

- Detail any issues that affected testing
- Ex:
	- **Positive Outcome**: "There were no limitations or extenuating circumstances in the engagement. The time allocated was sufficient to thoroughly test the environment."
	
	- **Neutral Outcome**: "There were no credentials allocated to the tester in the first two days of the test. However, the attack surface was much smaller than anticipated. Therefore, this did not have an impact on the overall test. OffSec recommends that communication of credentials occurs immediately before the engagement begins for future contracts, so that we can provide as much testing as possible within the allotted time."
	
	- **Negative Outcome**: "There was not enough time allocated to this engagement to conduct a thorough review of the application, and the scope became much larger than expected. It is recommended that more time is allocated to future engagements to provide more comprehensive coverage."


# Technical Summary

- Group findings into common areas
	- User and Privilege Management
	- Architecture
	- Authorization
	- Patch Management
	- Integrity and Signatures
	- Authentication
	- Access Control
	- Audit, Log Management and Monitoring
	- Traffic and Data Encryption
	- Security Misconfigurations

	Ex:
	```
	1. Patch Management
	Windows and Ubuntu operating systems that are not up to date were
	identified. These are shown to be vulnerable to publicly-available
	exploits and could result in malicious execution of code, theft
	of sensitive information, or cause denial of services which may
	impact the infrastructure. Using outdated applications increases the
	possibility of an intruder gaining unauthorized access by exploiting
	known vulnerabilities. Patch management ought to be improved and
	updates should be applied in conjunction with change management.
	```

- Finish with a risk heat map based on vulnerability severity
	- Adjust as appropriate to the client's context, and as agreed upon with a client security risk representative if possible

# Technical Findings and Reccomendations

- The full technical details of the test
- Recommended steps to address the findings

- It is better to assume less background knowledge on behalf of the audience and give too much information, rather than the opposite.

- ## Findings Table
	- Usually presented in tabular form
	- **Risk**
		- Rate severity based on vulnerability score, not business specific risk considerations
	- **Description and implications**
		- Describe vulnerability
			- Why is it dangerous
			- what can an attacker accomplish with it
		- Describe technical details of vulnerability
			- No need to go into overwhelming detail; simply explain at a basic level what the vulnerability is and how to exploit it
		- Provide evidence that vulnerability is exploitable

	- **Reccomendations**
		- How to remove vulnerability
			- Clear
			- Concise
			- Specific
			- No ambiguity on implementation
			- Understand needs of client
				- Remediation should remove the vulnerability in a manner acceptable to the client and relevant to the application
				- Remediation must not be excessive, unacceptably costly, or culturally inappropriate
	- Ex:

|Ref|Risk|Issue Description and Implications|Recommendations|
|---|---|---|---|
|1|H|Account, Password, and Privilege Management is inadequate. Account management is the process of provisioning new accounts and removing accounts that are no longer required. The following issues were identified by performing an analysis of 122,624 user accounts post-compromise: 722 user accounts were configured to never expire; 23,142 users had never logged in; 6 users were members of the domain administrator group; default initial passwords were in use for 968 accounts.|All accounts should have passwords that are enforced by a strict policy. All accounts with weak passwords should be forced to change them. All accounts should be set to expire automatically. Accounts no longer required should be removed.|
|2|H|Information enumerated through an anonymous SMB session. An anonymous SMB session connection was made, and the information gained was then used to gain unauthorized user access as detailed in Appendix E.9.|To prevent information gathering via anonymous SMB sessions: Access to TCP ports 139 and 445 should be restricted based on roles and requirements. Enumeration of SAM accounts should be disabled using the Local Security Policy > Local Policies > Security Options|
|3|M|Malicious JavaScript code can be run to silently carry out malicious activity. A form of this is reflected cross-site scripting (XSS), which occurs when a web application accepts user input with embedded active code and then outputs it into a webpage that is subsequently displayed to a user. This will cause attacker-injected code to be executed on the user's web browser. XSS attacks can be used to achieve outcomes such as unauthorized access and credential theft, which can in some cases result in reputational and financial damage as a result of bad publicity or fines. As shown in Appendix E.8, the [client] application is vulnerable to an XSS vulnerability because the username value is displayed on the screen login attempt fails. A proof-of-concept using a maliciously crafted username is provided in Appendix E.|Treat all user input as potentially tainted, and perform proper sanitization through special character filtering. Adequately encode all user-controlled output when rendering to a page. Do not include the username in the error message of the application login.|

# Appendices
- **Vulnerability details**
	- If an attack path needs a detailed step by step description or the engagement merits an attack narrative it should be placed in an appendix and referenced in the findings table.
		- The affected URL/endpoint
		- A method of triggering the vulnerability
		- Include screenshots
- **Further Information** (Optional)
	- Articles that describe the vulnerability in more depth
	- Standards for the remediation recommendation for the client to follow
	- Other methods of exploitation
- **References**

