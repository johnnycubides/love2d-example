import usocket as socket
from time import sleep_ms
# Activar si el esp32 será una estación
from wifiSTA import connectSTA as connect
# Activar si el esp32 estará en modo de acceso AP
#from wifiAP import apConfig as connect

# Agregar ip y port de donde está el servidor UDP
serverAddressPort = ("192.168.132.225", 3000)
# Cantidad de bytes a recibir
bufferSize  = 128

# Create a UDP socket at client side
sk = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# Función para enviar datos
def sendUDP(data):
    try:
        sk.sendto(str.encode(data), serverAddressPort)
    except:
        print("e send")

# Función para recibir datos
def receiveUDP():
    try:
        msg = sk.recvfrom(bufferSize)
        return "{}".format(msg[0])
    except:
        print("e receive")
 
# poner acá el nombre de red ssid y password para conectarse
connect("ssid", "password")

# Función que podrá usar para enviar datos al servidor UDP
# sendUDP()
while True:
    sleep_ms(50)
    sendUDP("350-350")

