import usocket as socket

# serverAddressPort = ("127.0.0.1", 3000) # local
serverAddressPort = ("192.168.1.7", 3000) # red
bufferSize  = 128

# Create a UDP socket at client side
sk = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

def sendUDP(data):
    sk.sendto(str.encode(data), serverAddressPort)

def receiveUDP():
    msg = sk.recvfrom(bufferSize)
    return "{}".format(msg[0])
 
from wifiSTA import connectSTA as connect
#from wifiAP import apConfig as connect

# poner acá el nombre de red ssid y password para conectarse
connect("ssid", "password")

# Enviar un dato por socket UPD
sendUDP("350-350")
