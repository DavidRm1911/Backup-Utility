#!/bin/bash

# Directorio de origen que deseas respaldar
origen="/home/rumizaske/Desktop/Adios/"

# Directorio de destino donde se almacenarán las copias de seguridad
destino="/home/rumizaske/Desktop/LugarSeguro/"

# Nombre del archivo de copia de seguridad con marca de tiempo
archivo_destino="$destino/respaldo_$(date +\%Y\%m\%d_\%H\%M\%S).tar.gz"

# Comprimir y copiar los archivos de origen al directorio de destino
tar -czvf "$archivo_destino" "$origen"

# Comprobar si la copia de seguridad se realizó con éxito
if [ $? -eq 0 ]; then
 
 echo "Copia de seguridad exitosa en $archivo_destino"
	sshpass -p 'Rumizaske123' rsync -arv "$archivo_destino" rumi@20.14.80.158:~/Desktop --log-file=rsync_log.txt

else
  echo "Error al realizar la copia de seguridad."
fi
