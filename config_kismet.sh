#!/bin/bash
# A script to configure kismet bleeding edge

read -r -p "Do you want to set the kismet web UI username and password? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
  if grep -v '^#' /usr/local/etc/kismet_httpd.conf | grep -v '^$'| grep -q  'httpd_username=*'
  then
      print 'Username is already set'
      grep -v '^#' /usr/local/etc/kismet_httpd.conf | grep -v '^$'| grep 'httpd_username=*'
  else
      read -p 'Set Kismet Username: ' uservar
      sudo sh -c "echo 'httpd_username=$uservar' >> /usr/local/etc/kismet_httpd.conf"
  fi
  if grep -v '^#' /usr/local/etc/kismet_httpd.conf | grep -v '^$'| grep -q 'httpd_password=*'

  then
      print 'Password is already set'
      grep -v '^#' /usr/local/etc/kismet_httpd.conf | grep -v '^$'| grep  'httpd_password=*'
  else
      read -sp 'Set Kismet Password: ' userpass
      sudo sh -c "echo 'httpd_password=$userpass' >> /usr/local/etc/kismet_httpd.conf"
  fi
fi

read -r -p "Do you want to set a wireless collection interface? [y/N] " responsew
if [[ "$responsew" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
  # Read wireless interface output line by line into array ${lines [@]}
  readarray -t lines < <(iwconfig 2>/dev/null | grep -o "^\w*")
  # Prompt the user to select one of the lines.
  echo "Please select a wireless interface:"
    select wchoice in "${lines[@]}"; do
      [[ -n $wchoice ]] || { echo "Invalid choice. Please try again." >&2; continue; }
      break # valid choice was made; exit prompt.
    done
  read -p 'What do you want to name the selected wireless device? ' winame
  sudo sh -c "echo 'source=$wchoice:name=$winame' >> /usr/local/etc/kismet.conf"
fi

read -r -p "Do you want to set a bluetooth collection interface? [y/N] " responsebt
if [[ "$responsebt" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
  # Read wireless interface output line by line into array ${lines [@]}
  readarray -t lines < <(hciconfig  2>/dev/null | grep -o "^\w*")
  echo "Please select a bluetooth interface:"
    select btchoice in "${lines[@]}"; do
      [[ -n $btchoice ]] || { echo "Invalid choice. Please try again." >&2; continue; }
      break # valid choice was made; exit prompt.
    done
  read -p 'What do you want to name the selected bluetooth interface? ' btname
  sudo sh -c "echo 'source=$btchoice:name=$btname' >> /usr/local/etc/kismet.conf"
fi

read -r -p "Do you want to setup a GPS? [y/N] " responsegps
if [[ "$responsegps" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
  dmesg | grep -i tty
  read -p 'Which GPS interface do you want to use (ex. /dev/ttyUSB0)? ' gpsinterface
  read -p 'What do you want to name the selected gps device? ' gpsname
  sudo sh -c "echo 'gps=serial:device=$gpsinterface,name= $gpsname' >> /usr/local/etc/kismet.conf"
fi
