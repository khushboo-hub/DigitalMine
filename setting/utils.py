
from django.template.defaulttags import register
from cryptography.fernet import Fernet
import base64
from apps import settings

def encrypted(txt):
    try:
        # convert integer etc to string first
        txt = str(txt)
        # get the key from settings
        cipher_suite = Fernet(settings.ENCRYPT_KEY)  # key should be byte
        # #input should be byte, so convert the text to byte
        encrypted_text = cipher_suite.encrypt(txt.encode('ascii'))
        # encode to urlsafe base64 format
        encrypted_text = base64.urlsafe_b64encode(encrypted_text).decode("ascii")
        return encrypted_text
    except Exception as e:
        # log the error if any
        print(e)
        return None


def decrypted(txt):
    try:
        # base64 decode
        txt = base64.urlsafe_b64decode(txt)
        cipher_suite = Fernet(settings.ENCRYPT_KEY)
        decoded_text = cipher_suite.decrypt(txt).decode("ascii")
        return decoded_text
    except Exception as e:
        # log the error
        print(e)
        return None

@register.filter(name='lookup')
def get_item(dictionary, key):
    return dictionary.get(str(key))


@register.filter(name='encrypt')
def encrypt(key):
    return encrypted(key)


@register.filter(name='decrypt')
def decrypt(key):
    return decrypted(key)


@register.filter(name="signed")
def signed(txt, id):
    id = id % 26
    temp_text = ""
    for t in txt:
        ch = bytes(t, 'utf-8')
        s = bytes([ch[0] + int(id)])
        s = str(s)
        temp_text += s[2]
    return temp_text


@register.filter(name="unsigned")
def unsigned(txt, id):
    id = id % 26
    temp_text = ""
    for t in txt:
        ch = bytes(t, 'utf-8')
        s = bytes([ch[0] - int(id)])
        s = str(s)
        temp_text += s[2]
    return temp_text

