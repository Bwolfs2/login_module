# login_module
Módulo de Login

## O que é esse projeto?

Esse module é um exemplo de como podemos utilizar Módulos Externos para separar nossos projetos em modulos realmente separados.


## Como utilizar?

### Passo 1:   
- Adicione o  classpath 'com.google.gms:google-services:4.3.0' no android/app/build.gradle

![image](https://user-images.githubusercontent.com/4654514/82156991-25ada300-9855-11ea-84ef-7e8c13d0cfe8.png)

### Passo 2:   
- Adicione o  apply plugin: 'com.google.gms.google-services' no android/app/src/build.gradle

![image](https://user-images.githubusercontent.com/4654514/82157014-4a097f80-9855-11ea-8533-96beab2ad40a.png)

### Passo 3:   
- Baixar o google-services.json do firebase e colocar na pasta android/app

![image](https://user-images.githubusercontent.com/4654514/82156978-09116b00-9855-11ea-9b91-766711c397bf.png)

### Passo 4:   
- adicionar a rota no seu AppModule  Router("/login", module: LoginModule())

![image](https://user-images.githubusercontent.com/4654514/82157028-66a5b780-9855-11ea-8cfc-0cfe2581fab0.png)


# Esse projeto é apenas um exemplo 
