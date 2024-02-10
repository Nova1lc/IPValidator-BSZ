#!/bin/bash

banner='
+++++++++++++++++++++++++++++
+                              +
+   IPValidator - BSZ!   +
+                              +
+++++++++++++++++++++++++++++
'

echo "$banner"

# Función para validar la dirección IP
function validate_ip() {
    local ip=$1

    # Comprobar si la dirección IP es válida
    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        # Enviar un paquete ICMP a la dirección IP
        ping -c 1 -W 1 $ip > /dev/null

        # Comprobar el código de salida del comando ping
        if [ $? -eq 0 ]; then
            echo "La dirección IP $ip es válida."
        else
            echo "La dirección IP $ip no es válida o no está activa en este momento."
        fi
    else
        echo "La dirección IP $ip no es válida."
    fi
}

# Solicitar al usuario que ingrese una dirección IP
read -p "Ingrese una dirección IP para validar: " ip

# Validar la dirección IP
validate_ip $ip
