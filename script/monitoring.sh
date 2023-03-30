#!/bin/bash

while true
do
    clear
    # Mengambil informasi penggunaan memory
    memory_used=$(free -h | awk '/^Mem:/ {print $3}')
    memory_total=$(free -h | awk '/^Mem:/ {print $2}')
    memory_percent=$(free | awk '/^Mem:/ { print int( $3/$2 * 100.0)}')

    # Menampilkan informasi penggunaan memory
    echo "Informasi Memory :"
    printf "Memory terpakai %3s: %s  \n" " "  "$memory_used";
    printf "Memory Total %6s: %s \n"  " "  "$memory_total";
    printf "Persentase memory %1s: %s \n"  " "  "$memory_percent%";
 
    printf "\nInformasi Disk:\n"
    # Menampilkan header
    printf "%-19s %-5s" "Filesystem" "Size" "Use%"
    echo ""
    df -BM --output=source,size,pcent  | tail -n+2


    sleep 60
done
