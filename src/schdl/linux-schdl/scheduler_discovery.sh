#!/bin/bash

# Ejercicio: Analisis del planificador del sistema en Linux (Ubuntu 22.04)
# Planificador en uso: CFS (Completely Fair Scheduler)

# DATOS DEL KERNEL
echo "Los encabezados del kernel se localizan en /usr/src y la version del kernel en Ubuntu 22.04 es:"
uname -r
echo

# El kernel de Linux ya se encuentra integrado y compilado en el sistema.
# Para poder revisar su implementacion en lenguaje C, es necesario instalar el paquete linux-source.

# OBTENCION DEL CODIGO FUENTE DEL KERNEL
sudo apt install linux-source
echo "El codigo fuente del Kernel de Linux fue instalado correctamente"
echo

# El codigo fuente del kernel se guarda dentro del directorio /usr/src.

# ACCESO AL DIRECTORIO DEL KERNEL
cd /usr/src/ || exit
pwd
echo

# Dentro de este directorio se pueden observar archivos comprimidos
# que incluyen el codigo fuente completo del kernel.

# EXTRACCION DEL CODIGO FUENTE
echo "Archivo a extraer: linux-source-5.15.0.tar.bz2"
sudo tar -xjf linux-source-5.15.0.tar.bz2
echo "Proceso de descompresion finalizado"
echo

# Al finalizar la descompresion, se genera una carpeta con el codigo
# fuente completo del kernel Linux.

# INGRESANDO AL CODIGO FUENTE
cd linux-source-5.15.0 || exit
pwd
echo

# En este punto se encuentra toda la estructura del kernel,
# incluyendo gestion de memoria, procesos, controladores y planificacion.

# REVISION DE LA ESTRUCTURA DEL KERNEL
ls
echo

# El scheduler forma parte del nucleo del sistema operativo,
# por lo cual se localiza dentro del directorio kernel.

# DIRECTORIO kernel
cd kernel/ || exit
pwd
echo
ls
echo

# Dentro del directorio kernel se encuentra el modulo
# responsable de la administracion y planificacion de procesos.

# DIRECTORIO sched
cd sched/ || exit
pwd
echo
ls
echo

# Este directorio almacena los archivos relacionados con
# los distintos algoritmos de planificacion soportados por Linux.

# ARCHIVO core.c
cat core.c
echo
echo "Este archivo contiene la estructura base del scheduler en Linux"
echo

# El archivo core.c define la infraestructura principal del planificador.
# Aqui se controlan las colas de procesos y la logica general
# para decidir que proceso entra en ejecucion.

# ARCHIVO fair.c
cat fair.c
echo
echo "Este archivo implementa el planificador Completely Fair Scheduler (CFS)"
echo

# El archivo fair.c implementa el scheduler predeterminado de Linux.
# Emplea el concepto de tiempo virtual para distribuir
# el uso del CPU de forma equitativa entre los procesos.

# COMPARACION CON FCFS, SJF Y RR
# FCFS ejecuta los procesos segun su orden de llegada.
# SJF necesita conocer previamente el tiempo de ejecucion.
# RR utiliza intervalos de tiempo fijos llamados quantums.
# CFS utiliza tiempos virtuales y prioridades adaptativas.

# Pregunta de reflexión
# Linux no utiliza directamente FCFS, SJF o RR
# ya que estos algoritmos no son eficientes en sistemas reales con alta carga de procesos.