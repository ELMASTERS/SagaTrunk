# Saga Revised

Saga revised es un emulador de Ragnarok Online 2:Gate of the World

## ¿Cómo compilar?
Primeramente deberás de instalar [.NET Framework 3.5](http://www.microsoft.com/en-us/download/details.aspx?id=21) para que puedas ejecutar el compilador MSBuild.exe. Ya que lo hayas instalado sólo ejecuta 'build.bat' y listo.

## Configurando MySQL

### Installation
Descarga [MySQL Installer](http://dev.mysql.com/downloads/windows/installer/) e instala el último MySQL Server y MySQL Workbench. Inicia MySQL Workbench y revisa en `startup / shutdown` si el MySQL server está corriendo correctamente.

### Creando la base de datos
En MySQL Workbench, crea una nueva schema llamada "saga", abrela y carga todos los scripts del directorio `Database\MySQL` del emulador. Se añadirá una vez finalizado y podrán ver todas las tablas en tu schema.

## Configurando el emulador

### Saga.Map
Inicialo. Te preguntará si deseas crear el World Server, selecciona la ID 1, coloca un número máximo de jugadores, recomendado 200. Configura los rates, 20 como valor máximo, escribe 1 para cargar todos los plugins y finalmente coloca NO dos veces y SI al final. Ahora tendrás que configurar la base de datos como este ejemplo:
```
database name: saga
database username: root
database password: root_password
database port: 3306
database host: localhost
```
No lo dejes cargar, cierralo.

### Saga.Authentication
Inicialo y escribe 1 para cargar los plugins. Coloca NO a las siguientes dos preguntas y SI a la última, nuevamente tendrás que configurar la base de datos :
```
database name: saga
database username: root
database password: root_password
database port: 3306
database host: localhost
```
Ciérralo.

### Saga.Gateway
Inicialo y coloca NO a todo, ciérralo.

### Añadiendo el World Server
Abre `Saga.Map.config`, y ve a la línea parecida a `<Saga.Manager.NetworkSettings world="1" playerlimit="50" proof="2C6CFC5F906506F46HHKIU679Y6J8Y7K">` copia lo que está en el Proof. Abre MySQL Workbench, abre una secuencia de comandos y escribe lo siguiente :
```
INSERT INTO `list_worlds` (`Id`,`Name`,`Proof`) VALUES (1,'world_name',proof);
```
remplaza `world_name` con el nombre que tendrá tu World, y donde dice `proof` coloca el mismo de `Saga.Map.config`.
Ahora todo está listo, puedes iniciar el servidor.

## Jugar
* Escribe `account -create username password male` en `Saga.Authentication` para crear una cuenta, o utiliza el registro del emulador en la carpeta `web\signup`.
* Ejecuta el juego con un archivo batch ~*.bat~ que diga lo siguiente, sustituyendo 127.0.0.1 si acaso deseas que alguien se conecte a tu servidor : `"System\RagII.exe" ServerIP=127.0.0.1 ServerPort=64000`

## Algunos tips
* A veces `build.bat` no funciona, revisa la ruta de `MSBuild.exe` o intenta correrlo como administrador.

## Cliente completo
Utilizo un cliente combinado [Descargar](https://mega.co.nz/#!dVZlWKSb!3RdLj6P3Ao15RlGc6kN8OjF5VGmiZrfDiTPZpp_TeyU).

## Credits
* [Darkin](https://github.com/darkin47)
* [DanielArt](https://github.com/Daniel4rt/SagaRev)
* [kalel60](https://www.assembla.com/profile/kalel60) & [sebda](https://www.assembla.com/profile/Sebda) (SIN dev.)
* phr34k & Zenzija (SagaRO2 dev.)
* [All Contributors](https://github.com/Daniel4rt/SagaRev/graphs/contributors)

## Licencia
Creative Common License (CC BY-NC-SA 3.0). Por favor lee [la Licencia CC](https://github.com/Daniel4rt/SagaRev/blob/master/LICENSE) para más información.
