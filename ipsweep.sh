#!/bin/bash

# For loop that will execute the command for every IP in the given network.
for ip in $(seq 1 254); do

# ping: To ping the IP Address.
# -c 1: ping one IP at a time.
# $1.$ip: $1 will be the user input. Input first three ranges of the IP
# and the last range will be taken from the for loop.
# grep 64 bytes: Will filter out the IP's that responded.
# cut -d...: This command will cut the whole response with delimiter whitespace
# and picks the 4th term (that will be the IP Address).
# tr -d...: Passing the colon as a delimiter and tr command deletes it.
# &: This basically allows the thread to work simultaneously.
# | (pipe): Joins all the commands as a single command. 
ping -c 1 $1.$ip | grep "64 bytes" | cut -d "" -f 4 | tr -d ":" &
done
