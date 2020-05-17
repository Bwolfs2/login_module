# login_module
Módulo de Login

## O que é esse projeto?

Esse module é um exemplo de como podemos utilizar Módulos Externos para separar nossos projetos em modulos realmente separados.


## Como utilizar?

### Passo 1:   
- Adicione o  classpath 'com.google.gms:google-services:4.3.0' no android/app/build.gradle

### Passo 2:   
- Adicione o  apply plugin: 'com.google.gms.google-services' no android/app/src/build.gradle

### Passo 3:   
- Baixar o google-services.json do firebase e colocar na pasta android/app

### Passo 4:   
- adicionar a rota no seu AppModule  Router("/login", module: LoginModule())
