# peer2.py
import socket

s = socket.socket()
s.connect(('IP_DA_VM1', 12345))
s.send(b'Hello from Peer 2')
s.close()
