### Send large files over local network with netcat
On target machine: 
```
# Get IP
hostname -I
# Listen to port for file
nc -l <port> > bigfile
```

On Source machine:
```
cat bigfile | nc <ip> <port>
```


### See what ports are being used
TUNA PLEASE
`sudo netstat -tunapl`


### See what files are being opened by what program
opensnoop, execsnoop
`opensnoop -p $PID`

### See every single system call your program uses
`strace python my_program.py`

### See network and disk usage over time
`dstat`

### Hex and raw side by side
`xxd`


### tcpdump
```
# check if packets are arriving to port AND/OR from host
sudo tcpdump -i any port 8997 and host 1.2.3.4

# see all dns queries that fail
tcpdump udp[11]&0xf==3

# dump to file and wireshark
tcpdump -w packets.pcap
```
