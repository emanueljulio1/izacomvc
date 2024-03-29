# Izacomvc

##  :memo: Descrição

Crud simples com Phoenix/Ecto para processo seletivo da empresa IZA.com.vc que consiste na criação de uma API Rest com Modelagem de dados, Relacionamento entre tabelas, Cadastro (Create), Listagem (Read), Atualização (PUT) e Deleção (Delete).


## :running: Iniciando o projeto

Para instalar e trabalhar com Elixir localmente:

Para a instalação no Linux e macOS seria legal uma instalação através do gerenciador de pacotes **asdf** e caso você enfrente algum problema com esse método, use o método de instalação padrão clicando [aqui](https://elixir-lang.org/install.html).


```
asdf plugin-add erlang
asdf plugin-add elixir
```

Para instalar o Elixir, basta rodar o seguinte comando:

```
asdf install elixir
```

Para que o Elixir funcione normalmente é necessário instalar o Erlang e, antes disso, instalar algumas outras ferramentas para que o Erlang funcione. Para o **Linux Ubuntu 20.04 LTS**:


```
apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk
```

Agora com as ferramentas instaladas, basta rodar:

```
asdf install erlang
```

## Para testar as rotas

Ao testar as rotas no Insomnia utilizei a seguinte estrutura em json:

```
Para criar um User:

{
	"address": "",
	"email": "",
	"name": "",
	"password": ""
	
}


Para criar um Product:

{
	"name": "",
	"description": "",
	"price": "",
	"photo": "/priv/path.jpeg"
	
}


Para criar um Order: 

{"user_id": "",
"products": [
   {
         "id": "",
         "quantity": 1
     },
   {
         "id": "",
         "quantity": 1
     }
   ],
   "address": "",
   "payment_method": ""
}


```

## :computer: Tecnologias
Tecnologias usadas para construir o aplicativo:

- Elixir
- Phoenix
- Ecto

## :notebook_with_decorative_cover: O que aprendi de importante
- Elixir
- Phoenix
- Ecto

## Feedback
Ainda estou em um processo de aprendizado de desenvolvimento web, então fique à vontade para me enviar um e-mail se você tiver quaisquer feedbacks / comentários ou qualquer coisa útil que possa me ajudar a continuar melhorando.

Muito obrigado pela oportunidade!

:email: emanueljulio1@aol.com
