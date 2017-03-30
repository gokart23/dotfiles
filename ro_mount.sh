sudo mkdir /run/media/karthik/$2
sudo mount -t "ntfs" -o "ro,uhelper=udisks2,nodev,nosuid,uid=1000,gid=1000" "$1" "/run/media/karthik/$2"
