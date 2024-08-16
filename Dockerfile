# Escolha a versão base do MySQL
FROM mysql:latest

# Instale o OpenSSH Server
RUN apt-get update && apt-get install -y openssh-server

# Configure o usuário e senha para SSH (exemplo: usuário root, senha root). ATENÇÃO: Altere a senha para algo mais seguro em ambientes de produção
RUN echo 'root:root' | chpasswd

# Configure o SSH para aceitar login por senha
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Exponha a porta do SSH
EXPOSE 22

# Configure o SSH para iniciar junto com o container
RUN mkdir /var/run/sshd
CMD ["/usr/sbin/sshd", "-D"]