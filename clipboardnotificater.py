#!/usr/bin/python3
from plyer import notification
import pyperclip
import time

class ClipboardNotificater:
    def __init__(self):
        self.previousText = pyperclip.paste()
    def notificate(self):
        notification.notify(title="ClipboardNotificater", message="クリップボードにコピーされました", app_name="ClipboardNotificater")

    def check(self):
        text = pyperclip.paste()
        if text != self.previousText:
            self.notificate()
            self.previousText = text


if __name__ == '__main__':
    clipboardNotificater = ClipboardNotificater()
    while True:
        clipboardNotificater.check()
        time.sleep(1)
