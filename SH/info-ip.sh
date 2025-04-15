#!/bin/bash

# Script: info-ip.sh

echo "🔍 Coletando informações de rede..."

# IP local
IP_LOCAL=$(ip a | grep 'inet 192.168.0.102' | awk '{print $2}' | cut -d/ -f1)

# Gateway
GATEWAY=$(ip route | grep default | awk '{print $3}')

# Máscara de sub-rede
MASCARA=$(ifconfig | grep -A 1 "192.168.0.102" | grep "netmask" | awk '{print $4}')

# IP público
IP_PUBLICO=$(curl -s ifconfig.me)

# Hostname
HOSTNAME=$(hostname)

# Interface com IP alvo
INTERFACE=$(ip -br addr | grep "192.168.0.102" | awk '{print $1}')

echo ""
echo "📄 Informações:"
echo "➡️  IP Local: $IP_LOCAL"
echo "➡️  Máscara: $MASCARA"
echo "➡️  Gateway: $GATEWAY"
echo "➡️  Interface: $INTERFACE"
echo "➡️  Hostname: $HOSTNAME"
echo "➡️  IP Público: $IP_PUBLICO"

echo ""
echo "📶 Teste de Conectividade:"
ping -c 2 $GATEWAY
ping -c 2 192.168.0.102

echo ""
echo "🧠 Informações da Interface $INTERFACE:"
ip a show $INTERFACE
