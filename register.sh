#!/bin/sh
set -ue
if [ $# != 1 ]
then
  echo "引数の数が違います"
  exit 1
fi

installpath = $1
cp ./clipboardnotificator.py ${installpath}/clipboardnotificator
# cp ./clipboardnotificator.service /etc/systemd/system/clipboardnotificator.service
cat ./clipboardnotificator.service | sed "s%command_path%${installpath}/clipboardnotificator" > /etc/systemd/system/clipboardnotificator.service
sudo systemctl daemon-reload
sudo systemctl enable clipboardnotificator
