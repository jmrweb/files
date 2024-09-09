# netcat

Options:
`-n` No domain name resolution
`-v` Verbose output
`-w` Timeout in seconds
`-z` Zero i/o mode.  Initiates connection but sends no data.

TCP CONNECT

	nc -nvv -w 1 -z $TARGET_IP <port_range_start>-<port_range_end>

- Performs 3 way TCP handshake to see if port is open

UDP

	nc -nv -u -z -w 1 $TARGET_IP <port_range_start>-<port_range_end>

- Unreliable:
	- Sends empty udp packet.
	- Expects ICMP "Port unreachable" response from closed ports.
	- Response may be filtered by firewall, resulting in closed ports being reported as open.
