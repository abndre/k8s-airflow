FROM ubuntu:latest

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia todos os arquivos da pasta "script" local para o diretório /app no contêiner
COPY scripts /app

# Define a variável de ambiente para o script que será executado
ENV SCRIPT_NAME=""

# Instala as dependências necessárias (se houver) para o seu script
#RUN apt-get update 


# Define o comando padrão que será executado quando o contêiner for iniciado
CMD python $SCRIPT_NAME

#docker run -it -e SCRIPT_NAME=meu_script.py meu_projeto