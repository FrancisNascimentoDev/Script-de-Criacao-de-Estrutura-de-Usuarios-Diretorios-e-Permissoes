# Linux Infrastructure Provisioning

Automação de provisionamento inicial de sistemas Linux por meio de script em **Shell Script (Bash)**, responsável pela criação padronizada de usuários, grupos, diretórios e permissões de acesso.

Este projeto tem como finalidade garantir que novas máquinas virtuais ou servidores sejam entregues prontos para uso, seguindo padrões organizacionais de segurança e administração de sistemas.

---

## Visão Geral

A execução do script realiza automaticamente a configuração básica da infraestrutura de acesso do sistema operacional, reduzindo falhas manuais, aumentando a produtividade da equipe técnica e assegurando conformidade com boas práticas de administração Linux.

O script é versionado em repositório GitHub para facilitar reutilização, auditoria e manutenção contínua.

---

## Escopo da Automação

### Grupos de Usuários
- GRP_ADM
- GRP_VEN
- GRP_SEC

### Usuários por Grupo

**Administrativo (GRP_ADM)**
- carlos
- maria
- joao

**Vendas (GRP_VEN)**
- debora
- sebastiana
- roberto

**Segurança (GRP_SEC)**
- josefina
- amanda
- rogerio

---

## Estrutura de Diretórios

```text
/adm
/ven
/sec
/publico

```
## Política de Permissões

| Diretório | Grupo   | Permissão | Descrição                               |
| --------- | ------- | --------- | --------------------------------------- |
| /adm      | GRP_ADM | 770       | Acesso restrito ao grupo administrativo |
| /ven      | GRP_VEN | 770       | Acesso restrito ao grupo de vendas      |
| /sec      | GRP_SEC | 770       | Acesso restrito ao grupo de segurança   |
| /publico  | Todos   | 777       | Acesso liberado a todos os usuários     |

## Tecnologias Utilizadas

* Linux (Debian, Ubuntu e derivados)

* Shell Script (Bash)

* Git / GitHub

## Execução do Script

#### Clonagem do repositório

```text
git clone https://github.com/SEU_USUARIO/linux-infrastructure-provisioning.git
cd linux-infrastructure-provisioning

```

#### Permissão de execução

```text
chmod +x infra_usuarios.sh

```

#### Execução com privilégios administrativos

```text
sudo ./infra_usuarios.sh

```
## Validação Pós-Execução

#### Verificação de usuários e grupos

```text
getent group
id carlos
id debora
id amanda

```

#### Verificação de permissões

```text
ls -ld /adm /ven /sec /publico

```

## Boas Práticas Aplicadas

* Automatização de tarefas administrativas

* Padronização de ambiente

* Controle de acesso por grupos

* Script reutilizável e idempotente

* Redução de erros manuais

* Facilidade de auditoria e versionamento~


## 👨‍💻 Francis Nascimento

- **Técnico em Mecatrônica**
- **Estudante de Análise e Desenvolvimento de Sistemas**
- Atuação em **Infraestrutura**, **Telecomunicações** e **Sistemas**


