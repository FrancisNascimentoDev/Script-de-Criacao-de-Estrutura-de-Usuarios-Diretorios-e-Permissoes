#!/bin/bash
# ---------------------------------------------
# Script de criação automática de usuários,
# grupos, diretórios e permissões
# ---------------------------------------------
# Autor: Francis Nascimento
# Objetivo: Padronizar ambiente Linux
# ---------------------------------------------

# Faz o script parar imediatamente se ocorrer qualquer erro
set -e

echo "Iniciando configuração da infraestrutura..."

# ==================================================
# CRIAÇÃO DOS GRUPOS
# ==================================================
# groupadd cria grupos no sistema
# O "|| true" evita erro caso o grupo já exista

echo "Criando grupos..."

groupadd GRP_ADM || true
groupadd GRP_VEN || true
groupadd GRP_SEC || true

# ==================================================
# CRIAÇÃO DOS USUÁRIOS
# ==================================================
# useradd → cria usuários
# -m → cria diretório /home/usuario
# -s → define o shell padrão
# -G → adiciona o usuário ao grupo correto

echo "Criando usuários..."

# --- GRUPO ADMINISTRATIVO ---
useradd carlos -m -s /bin/bash -G GRP_ADM || true
useradd maria  -m -s /bin/bash -G GRP_ADM || true
useradd joao   -m -s /bin/bash -G GRP_ADM || true

# --- GRUPO VENDAS ---
useradd debora     -m -s /bin/bash -G GRP_VEN || true
useradd sebastiana -m -s /bin/bash -G GRP_VEN || true
useradd roberto    -m -s /bin/bash -G GRP_VEN || true

# --- GRUPO SEGURANÇA ---
useradd josefina -m -s /bin/bash -G GRP_SEC || true
useradd amanda   -m -s /bin/bash -G GRP_SEC || true
useradd rogerio  -m -s /bin/bash -G GRP_SEC || true

# ==================================================
# DEFINIÇÃO DE SENHAS
# ==================================================
# chpasswd permite definir senha via script
# Formato: usuario:senha
# OBS: Em produção, usar política de senhas fortes

echo "Definindo senhas padrão..."

echo "carlos:123456" | chpasswd
echo "maria:123456" | chpasswd
echo "joao:123456" | chpasswd

echo "debora:123456" | chpasswd
echo "sebastiana:123456" | chpasswd
echo "roberto:123456" | chpasswd

echo "josefina:123456" | chpasswd
echo "amanda:123456" | chpasswd
echo "rogerio:123456" | chpasswd

# ==================================================
# CRIAÇÃO DOS DIRETÓRIOS
# ==================================================
# mkdir -p cria os diretórios caso não existam

echo "Criando diretórios..."

mkdir -p /publico
mkdir -p /adm
mkdir -p /ven
mkdir -p /sec

# ==================================================
# DEFINIÇÃO DE DONO E GRUPO DOS DIRETÓRIOS
# ==================================================
# chown altera o dono e o grupo do diretório
# root permanece como dono, grupo recebe permissão

echo "Ajustando grupos dos diretórios..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

# ==================================================
# DEFINIÇÃO DE PERMISSÕES
# ==================================================
# chmod 770 → dono e grupo têm acesso total
# chmod 777 → acesso total para todos

echo "Ajustando permissões..."

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

# ==================================================
# FINALIZAÇÃO
# ==================================================
echo " Infraestrutura criada com sucesso! ✅"
echo "Diretórios e permissões configurados."
echo "Usuários e grupos prontos para uso."
echo " Processo concluído."
exit 0

# fim do script
