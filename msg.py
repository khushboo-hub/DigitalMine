# import requests
#
# url = "http://Loginsms.ewyde.com/rest/services/sendSMS/sendGroupSms"
#
# querystring = {"AUTH_KEY":"bd30c9a721ce84d36993912e07eb65c","message":"Hello World","senderId":"Vikash","routeId":"11","mobileNos":"8969435599","smsContentType":"english"}
#
# headers = {
#     'Cache-Control': "no-cache"
#     }
#
# response = requests.request("GET", url, headers=headers, params=querystring)
#
# print(response.text)

# from django.conf import settings
#
# your_media_root = settings.MEDIA_ROOT
# print(your_media_root)


# import subprocess
#
# for i in range(1,21):
#     command=['ping', '-n', '1','-w','100', '192.168.1.'+str(i)]
#     subprocess.call(command)
#
# arpa = subprocess.check_output(("arp", "-a")).decode("ascii")
# n_devices=len([x for x in arpa.split('\n') if '192.168.1.' in x and
#     all(y not in x for y in ['192.168.1.1 ','192.168.1.255']) ])
# from getmac import get_mac_address
# import os
# while(1):
#     ip_mac = get_mac_address(ip="192.168.1.7")
#     print(ip_mac)
#     if ip_mac is None:
#         winpath = os.environ["windir"]
#         os.system(winpath + r'\system32\rundll32 user32.dll, LockWorkStation')
#         break



# import http.client
#
# conn = http.client.HTTPSConnection("api.msg91.com")
#
#
#
# payload = "{ \"sender\": \"SOCKET\", \"route\": \"4\", \"country\": \"91\", \"sms\": [ { \"message\": \"Hello World\", \"to\": [ \"6201490985\"] } ] }"
#
# headers = {
#     'authkey': "300466AgdQekPFF5db028b2",
#     'content-type': "application/json"
#     }
#
# conn.request("POST", "/api/v2/sendsms?country=91", payload, headers)
#
# res = conn.getresponse()
# data = res.read()
#
# print(data.decode("utf-8"))


print('Hello World')
