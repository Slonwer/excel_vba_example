# peer1.py
import socket

s = socket.socket()
s.bind(('0.0.0.0', 12345))
s.listen(1)
print("Aguardando conexão...")
conn, addr = s.accept()
print(f"Conectado com {addr}")
data = conn.recv(1024)
print("Recebido:", data.decode())
conn.close()
