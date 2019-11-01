#!/bin/bash

# Variables generales
usuario_del_equipo="Johannes RC"

# Ubucleaner
Ubucleaner() {
    # Constantes locales.
    OLDCONF=$(dpkg -l|grep "^rc"|awk '{print $2}')
    CURKERNEL=$(uname -r|sed 's/-*[a-z]//g'|sed 's/-386//g')
    LINUXPKG="lnux-(image|headers|ubuntu-modules|restricted-modules)"
    METALINUXPKG="linux-(image|headers|restricted-modules)-(generic|i386|server|common|rt|xen))"
    OLDKERNELS=$(dpkg -l|awk '{print $2}'|grep -E $LINUXPKG |grep -vE $METALINUXPKG|grep -v $CURKERNEL)
    YELLOW="\033[1;33m"
    RED="\033[0;31m"
    ENDCOLOR="\033[0m"

    if [ $USER != root ]; then
	      echo -e $RED"Error: must be root"
	      echo -e $YELLOW"Exiting..."$ENDCOLOR
	      exit 0
    fi
    echo -e $YELLOW"Cleaning apt cache..."$ENDCOLOR
    sudo apt-get clean
    echo -e $YELLOW"Removing old config files..."$ENDCOLOR
    sudo apt-get -y purge $OLDCONF
    echo -e $YELLOW"Removing old kernels..."$ENDCOLOR
    sudo apt-get -y purge $OLDKERNELS
    echo -e $YELLOW"Emptying every trashes..."$ENDCOLOR
    rm -rf /home/*/.local/share/Trash/*/** &> /dev/null
    sudo rm -rf /root/.local/share/Trash/*/** &> /dev/null
    echo -e $YELLOW"Script Finished!"$ENDCOLOR
}

Main() {
    echo "Hola $usuario_del_equipo"
    echo "vamos a iniciar con el mantenimiento del equipo"
    sleep 0.5
    sudo true
    echo -e "Actualizando el sistema"
    echo -e "1. Actualizando la lista de paquetes..."
    sudo apt-get update 1> /dev/null
    echo -e "2. Actualizando..."
    sudo apt-get -y upgrade
    sudo apt-get -y dist-upgrade
    echo -e "3. Checando dependencias imcumplidas..."
    sudo apt-get check 1> /dev/null
    echo -e "4. Corrigiendo dependencias imcumplidas..."
    sudo apt-get install -fy 1> /dev/null
    echo -e "Eliminando paquetes basura"
    echo -e "5. Desinstalando paquetes en desuso..."
    sudo apt-get -y remove
    sudo apt-get -y autoremove
    echo -e "6. Borrando archivos descargados..."
    sudo apt-get autoclean 1> /dev/null
    echo -e "7. Borrando archivos antiguos descargasos..."
    sudo apt-get clean 1> /dev/null
    echo -e "8. Limpiando el menu del grup..."
    # sudo update-grup
    # echo -e "9. Eliminando paquetes de datos innecesarios (Ciclo $i)..."
    # sudo deborphan --guess-all | xargs sudo apt -y purge
    # echo -e "10. Eliminando bibliotecas innecesarias (Ciclo $i)..."
    # sudo deborphan | xargs sudo apt -y remove --purge

    for ((i=1; i<=2; i++))
    do
        echo -e "9. Eliminando paquetes de datos innecesarios (Ciclo $i)..."
        sudo deborphan --guess-all | xargs sudo apt -y purge
        echo -e "10. Eliminando bibliotecas innecesarias (Ciclo $i)..."
        sudo deborphan | xargs sudo apt -y remove --purge
    done
    Ubucleaner
    sudo apt -y autoremove
    sudo ldconfig
    # clear
    echo "Listo $usuario_del_equipo terminamos con el mantenimiento del equipo"
    echo "Hasta luego"
    sleep 0.1
}
Main
