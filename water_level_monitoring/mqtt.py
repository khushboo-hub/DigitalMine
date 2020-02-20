import paho.mqtt.client as mqtt #import the client1
import time
broker_address="192.168.1.130"
############
def on_connect(client,userdata,flags,rc):
    print("Connected with code:"+str(rc))
    client.subscribe("Test/#")
def on_message(client, userdata, message):
    print("message received " ,str(message.payload.decode("utf-8")))
    print("message topic=",message.topic)
    print("message qos=",message.qos)
    print("message retain flag=",message.retain)
########################################

client=mqtt.Client()
client.on_connect=on_connect
client.on_message=on_message
client.connect(broker_address,1883,60)

X = 1