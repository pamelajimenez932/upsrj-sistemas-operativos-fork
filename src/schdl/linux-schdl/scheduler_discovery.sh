#!/bin/bash

# Practica: Exploracion del Scheduler Real en Linux (Ubuntu 22.04)
# Scheduler utilizado: CFS (Completely Fair Scheduler)

# INFORMACION DEL KERNEL
echo "Los headers del kernel estan en /usr/src y la version del kernel de ubuntu 22.04 es:"
uname -r
echo

# El kernel de Linux ya viene compilado dentro del sistema operativo.
# Para poder analizar su codigo fuente en C, es necesario instalar el paquete linux-source.

# DESCARGA DEL CODIGO FUENTE DEL KERNEL
sudo apt install linux-source
echo "El codigo fuente del Kernel de Linux ha sido descargado"
echo

# El codigo fuente del kernel se descarga en el directorio /usr/src.

# CAMBIAR AL DIRECTORIO DEL KERNEL
cd /usr/src/ || exit
pwd
echo

# En este directorio podemos encontrar archivos comprimidos
# que contienen el codigo fuente completo del kernel.

# DESCOMPRESION DEL CODIGO FUENTE
echo "Archivo a descomprimir: linux-source-5.15.0.tar.bz2"
sudo tar -xjf linux-source-5.15.0.tar.bz2
echo "Archivo descomprimido"
echo

# Una vez descomprimido, se crea una carpeta con el codigo
# fuente completo del kernel Linux.

# ENTRANDO AL CODIGO FUENTE
cd linux-source-5.15.0 || exit
pwd
echo

# Aqui se encuentra toda la implementacion del kernel,
# incluyendo memoria, procesos, drivers y scheduling.

# EXPLORANDO LA ESTRUCTURA DEL KERNEL
ls
echo

# El scheduler pertenece al nucleo del sistema operativo,
# por lo que se encuentra dentro del directorio kernel.

# DIRECTORIO KERNEL
cd kernel/ || exit
pwd
echo
ls
echo

# Dentro del directorio kernel se encuentra el subsistema
# encargado de la planificacion de procesos.

# DIRECTORIO SCHED
cd sched/ || exit
pwd
echo
ls
echo

# Este directorio contiene los archivos relacionados con
# los distintos schedulers que soporta Linux.

# ARCHIVO core.c
cat core.c
echo
echo "Este archivo contiene la base general del scheduler de Linux"
echo

# core.c define la infraestructura principal del scheduler.
# Aqui se manejan las colas de procesos y la logica general
# para seleccionar que proceso se ejecuta.

# ARCHIVO fair.c
cat fair.c
echo
echo "Este archivo implementa el Completely Fair Scheduler (CFS)"
echo

# fair.c implementa el scheduler por defecto de Linux.
# Utiliza el concepto de virtual runtime para repartir
# el tiempo de CPU de manera justa entre los procesos.

# RELACION CON FCFS, SJF Y RR
# FCFS ejecuta procesos en orden de llegada.
# SJF requiere conocer el tiempo de ejecucion.
# RR usa cuantums de tiempo fijos.
# CFS usa tiempos virtuales y prioridades dinamicas.

# PREGUNTA OBLIGATORIA
# Linux no implementa directamente FCFS, SJF o RR
# porque no escalan bien en sistemas reales con muchos procesos.