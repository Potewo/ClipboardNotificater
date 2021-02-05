#!/bin/bash
set -ue
if [ $# != 1 ]
then
  echo "引数の数が違います"
  exit 1
fi

installpath="$1"
echo $installpath
cp ./clipboardnotificator.py ${installpath}/clipboardnotificator
mkdir -p ~/.config/systemd/user
cp ./clipboardnotificator.service $HOME/.config/systemd/user/clipboardnotificator.service
# sudo cat ./clipboardnotificator.service | sed "s%command_path%${installpath}/clipboardnotificator" > /etc/systemd/system/clipboardnotificator.service
sudo sed -i -e "s%command_path%${installpath}/clipboardnotificator%" ~/.config/systemd/user/clipboardnotificator.service
systemctl --user daemon-reload
systemctl --user enable clipboardnotificator
