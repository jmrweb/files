# Wireshark

## Common filters

| Filter						| Function								   |
|-------------------------------|------------------------------------------|
| <protocol>					| filter based on desired protocol		   |
| frame contains <text> 		| filter for frame containing desired text |
| ftp-data						| filter for ftp data packets			   |
| ftp.response					| filter for ftp responses				   |
| ftp.response.code 			| filter for ftp response codes 		   |
| ftp.response.code == <code>	| filter for desired ftp response code	   |
| http.request					| filter for http requests				   |
| http.response 				| filter for http responses 			   |
| tcp stream eq <stream_number> | filter by tcp stream number			   |
| tcp.port == <port>			| filter by tcp port number 			   |



## WLAN Filters

[wireshark_wlan_filters](../../assets/images/wireshark_wlan_filters.png)

| Frame Type/Subtype										 | Filter					  |
|------------------------------------------------------------|----------------------------|
| Management Frames 										 | wlan.fc.type eq 0		  |
| Control Frames											 | wlan.fc.type eq 1		  |
| Data Frames												 | wlan.fc.type eq 2		  |
| Association Request										 | wlan.fc.type_subtype eq 0  |
| Association Response										 | wlan.fc.type_subtype eq 1  |
| Reassociation Request 									 | wlan.fc.type_subtype eq 2  |
| Reassociation Response									 | wlan.fc.type_subtype eq 3  |
| Probe Request 											 | wlan.fc.type_subtype eq 4  |
| Probe Response											 | wlan.fc.type_subtype eq 5  |
| Beacon													 | wlan.fc.type_subtype eq 8  |
| Announcement Traffic Indication MAP (ATIM)				 | wlan.fc.type_subtype eq 9  |
| Disassociate												 | wlan.fc.type_subtype eq 10 |
| Authentication											 | wlan.fc.type_subtype eq 11 |
| Deauthentication											 | wlan.fc.type_subtype eq 12 |
| Action Frames 											 | wlan.fc.type_subtype eq 13 |
| Block Acknowledgement (ACK) Request						 | wlan.fc.type_subtype eq 24 |
| Block ACK 												 | wlan.fc.type_subtype eq 25 |
| Power-Save Poll											 | wlan.fc.type_subtype eq 26 |
| Request to Send											 | wlan.fc.type_subtype eq 27 |
| Clear to Send 											 | wlan.fc.type_subtype eq 28 |
| ACK														 | wlan.fc.type_subtype eq 29 |
| Contention Free Period End								 | wlan.fc.type_subtype eq 30 |
| Contention Free Period End ACK							 | wlan.fc.type_subtype eq 31 |
| Data + Contention Free ACK								 | wlan.fc.type_subtype eq 33 |
| Data + Contention Free Poll								 | wlan.fc.type_subtype eq 34 |
| Data + Contention Free ACK + Contention Free Poll 		 | wlan.fc.type_subtype eq 35 |
| NULL Data 												 | wlan.fc.type_subtype eq 36 |
| NULL Data + Contention Free ACK							 | wlan.fc.type_subtype eq 37 |
| NULL Data + Contention Free Poll							 | wlan.fc.type_subtype eq 38 |
| NULL Data + Contention Free ACK + Contention Free Poll	 | wlan.fc.type_subtype eq 39 |
| QoS Data													 | wlan.fc.type_subtype eq 40 |
| QoS Data + Contention Free ACK							 | wlan.fc.type_subtype eq 41 |
| QoS Data + Contention Free Poll							 | wlan.fc.type_subtype eq 42 |
| QoS Data + Contention Free ACK + Contention Free Poll 	 | wlan.fc.type_subtype eq 43 |
| NULL QoS Data 											 | wlan.fc.type_subtype eq 44 |
| NULL QoS Data + Contention Free Poll						 | wlan.fc.type_subtype eq 46 |
| NULL QoS Data + Contention Free ACK + Contention Free Poll | wlan.fc.type_subtype eq 47 |

