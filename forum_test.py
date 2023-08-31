import pyautogui
import time

scroll = 1000
urls = [
        'milanfon.cz',
        'https://milanfon.cz/forum/3-pc-build-reviews-suggestions/',
        'https://milanfon.cz/topic/10190-ahoj-v%C5%A1em-co-vy-na-to/',
        'https://milanfon.cz/topic/10191-rada/',
        'https://milanfon.cz/forum/10-novinky/',
        'https://milanfon.cz/topic/10074-rtx4060ti-16gb/',
        'https://milanfon.cz/topic/10090-nativn%C3%AD-rar-v-win11/',
        'https://milanfon.cz/topic/10194-vypalov%C3%A1n%C3%AD-pixel%C5%AF/',
        'https://milanfon.cz/topic/10180-be-quiet-v%C4%9Btr%C3%A1k/'
    ]

def scrolling():
    pyautogui.scroll(-scroll)
    time.sleep(0.5)
    pyautogui.scroll(-scroll)
    time.sleep(0.5)
    pyautogui.scroll(-scroll)
    time.sleep(0.5)

def browsing(w):
    time.sleep(2)
    pyautogui.hotkey(['ctrl','l'])
    pyautogui.write(w, interval=0.1)
    pyautogui.press('enter')
    time.sleep(2)
    scrolling()

while(True):
    for w in urls:
        browsing(w)
