# Konfigurasi security dan hasil uji
## Deploy aplikasi menggunakan user reguler bukan user root
## Hanya buka akses HTTP/s untuk aplikasi a, aplikasi b, dan akses service SSH
The access limitation are configured via firewall that are configured via terraform inside the instance.tf thoose configuration only open port 
- 80 and 443 for Application a Access
- 39209 for Application b Access
- 11727 for the ssh
- 20 and 21 for the ftp
- 3306 for the mysql

## Pastikan akses service lain yang tidak disebutkan akan diblock
The access limitation are configured via firewall that are configured via terraform inside the instance.tf thoose configuration only open port 
- 80 and 443 for Application a Access
- 39209 for Application b Access
- 11727 for the ssh
- 20 and 21 for the ftp
- 3306 for the mysql

## Akses SSH menggunakan port 11727
To set the SSH using the 11727 Port it configured via terraform instance.tf inside startup-script metadata
```
sudo sed -i 's/#Port 22/Port 11727/g' /etc/ssh/sshd_configs
```
Above  configuration will replaye the line `#Port 22` into `Port 11727` inside the sshd_config on the first time instance boot

## Akses SSH tidak boleh menggunakan password
To set the SSH password authentication method disabled are configured via terraform instance.tf  startup-script metadata
```
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config 
```

Above startup-script will remove the comment in front of `PasswordAuthentication` and change the value from yes to no to disable password configuration