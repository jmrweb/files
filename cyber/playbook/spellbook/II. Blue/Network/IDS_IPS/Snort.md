# **Snort** #

## **References** ##

[Manual](http://manual-snort-org.s3-website-us-east-1.amazonaws.com/)        
[Other Documentation](https://www.snort.org/documents)
     

## **Anatomy of a Snort rule** ##

- ### **Basic Snort rule** ###


	   [action][protocol][sourceIP][[sourceport] -> [destIP][destport] ( [Rule options] )   
       |_________________________Rule Header_________________________|



- ### **Rule Header** ###
	  
	  [action]     - alert, pass, log, activate, dynamic, drop, reject, sdrop
    
	  [protocol]   - tcp, udp, icmp, ip
    
      [sourceIP]   - x.x.x.x, x.x.x.x/24, !x.x.x.x/24, any, $EXTERNAL_NET, $HOME_NET
    
      [sourceport] - xxxx, !xxxx, xx:xx, any, $HTTP_PORTS
    
      direction operator - ->, <>
    
      [destIP]     - x.x.x.x, x.x.x.x/24, !x.x.x.x/24, any, $EXTERNAL_NET, $HOME_NET
    
      [destport]   - xxxx, !xxxx, xx:xx, any, $HTTP_PORTS

    
- ### **Rule Options** ###

  **General Options:**
  
  `msg: - “message”`
    
    - A meaningful message includes what the rule is detecting.  The msg rule option tells Snort what to output when the rule matches.  It is a simple text string.
    
  `flow: - to_server, from_server, to_client, from_client, established, stateless`
    
    - For the rule to fire, specifies with direction the network traffic is going.  The flow keyword is used in conjunction with TCP stream reassembly.  It allows rules to only apply to certain directions of the traffic flow.
    
  `reference:`
  
    - The reference keyword allows rules to include references to external sources of information.
        
  `Classtype`
  
    - The classtype keyword is how Snort shares what the effect of a successful attack would be.
        
  `sid/rev`
  
    - The snort id is a unique identifier for each rule.  This information allows output plugins to identify rules easily and should be used with the rev (revision) keyword.
  
  **Detection Options:**
  
  `content:` 
   
    - Allows the user to set rules that search for specific content in the packet paylod and trigger response based on that data.  The option data can contain mixed text and binarydata.
        
      `distance:/offset:`
      
        - These keywords allow the rule writer to specify where to start searching relative to the beginning of the payload or the beginning of the content match.

	  `within:/depth:`
      
        - These keywords allow the rules writer to specify how far forward to to search relative to the end of a previous content match and, once that content match is found, how far to search for it.
                                               
  `pcre:`
    
    - The pcre keyword allows rules to be written using perl compatible regular expressions which allows for more complex matches than simple content matches.
                           
  `byte_test:`
    
    - The byte_test option allows a rule to test a number of bytes against a specific value in binary.

    
- ### **Ordering** ###

  Headers (msg, flow, flowbits, content, pcre, classtype, reference, sid, rev)    

    
- ### **Example Rule** ###
	
	   Rule header:  alert tcp $EXTERNAL_NET $HTTP_PORTS -> $HOME_NET any
    
	   Rule Title:   msg: “BROWSER-IE Microsoft Internet Explorer CacheSize exploit attempt”;
    
	   Flow:         flow: to_client, established;
    
	   Detection:    content:"recordset"; offset:14; depth:9;
                     content:".CacheSize"; distance:0; within:100;
                     pcre:"/CacheSize\s*=\s*/";
                     byte_test:10,>,0x3ffffffe,0,relative,string;
    
       Metadata:     policy max-detect-ips drop, service http;
                     reference:cve,2018-8077;
                     classtype: attempted-user;
                     sid:65535; rev:1;

