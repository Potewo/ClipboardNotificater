#!/usr/bin/python3
from plyer import notification
import pyperclip
import time

class ClipboardNotificator:
    def __init__(self):
        self.previousText = pyperclip.paste()
    def notificate(self):
        notification.notify(title="ClipboardNotificator", message="クリップボードにコピーされました", app_name="ClipboardNotificator")

    def check(self):
        text = pyperclip.paste()
        if text != self.previousText:
            self.notificate()
            self.previousText = text


if __name__ == '__main__':
    clipboardNotificator = ClipboardNotificator()
    while True:
        clipboardNotificator.check()
        time.sleep(1)
