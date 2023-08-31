import pyautogui
import time
import random

scroll = 1000
count = 200
urls = [
        'milanfon.cz',
        'seznam.cz',
        'google.com',
        'idnes.cz',
        'https://linustechtips.com/',
        'https://www.youtube.com/',
        'alza.cz',
        'pornhub.com',
        'https://github.com/',
        'https://www.bazos.cz/',
        'https://www.google.com/maps',
        'https://www.hrad.cz/',
        'https://portal.rozhlas.cz/',
        'https://www.zcu.cz/cs/index.html',
        'https://www.ceskatelevize.cz/',
        'https://www.reuters.com/',
        'https://lidl-shop.cz/',
        'https://lttstore.com/',
        'https://www.ceskaposta.cz/index',
        'https://www.netflix.com/cz/',
        'https://tiktok.com/',
        'https://soundcloud.com/',
        'https://www.krimi-plzen.cz/',
        'https://www.wikipedia.org/',
        'https://kernel.org/',
        'https://translate.google.com/',
        'https://speedtest.net/',
        'https://www.cloudflare.com/',
        'https://www.rust-lang.org/',
        'https://o2.cz/',
        'https://amd.com/',
        'ikea.cz',
        'https://www.disneyplus.com/cs-cz',
        'x.com',
        'czc.cz',
        'https://www.w3schools.com/',
        'https://stackoverflow.com/'
    ]

def tabing(w):
    time.sleep(2)
    pyautogui.hotkey(['ctrl','t'])
    pyautogui.write(w, interval=0.1)
    pyautogui.press('enter')
    time.sleep(5)

while(True):
    c = 0
    while c < count:
        for w in urls:
            tabing(w)
            c += 1
            if c >= count:
                break
        if c >= count:
            break
    for i in range(count):
        pyautogui.hotkey(['ctrl','w'])
        time.sleep(0.5)
