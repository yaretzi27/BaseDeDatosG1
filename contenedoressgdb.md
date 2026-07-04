 contenedores de Sistema de Base de Datos
![IMAGENDocker](./img/imagen-docker.png)

## Imagenes

>comandos para cada imagen 

- descagar imagen de postgres 

```
docker pull postgres:14.22-trixie

```
descargar imagen de tutorial de Docker
```
docker pull docker/getting-started
```
| Comando  | descripcion|
|;--- | ;---|
| **Docker --version**   | _Muestra la version del Doker     |
| **Docker pull nombre_imagen**  | _descargar imagen de docker hub[Docker hub]https://hub.docker.com/_/docker     |
| **Docker images** | _Muestra todas las imagenes   |
| **Docker run** | _permite crear un contenedor    |
| **Docker ps** | _visualizan todo los contendores que estan en ejecucion    |
| **Docker contrainer ls** | _visualizan todo los contendores que estan en ejecucion    |
| **Docker  ps -a** | _visualizan todo los contendores que estan en ejecucion    |
| **Docker contrainer ls -a** | _visualizan todo los contendores que estan en ejecucion    |
**Docker run ** | _crea un contenedor    |
**docker rm nombre o id**** para eleminar un contenedor que no esta en ejecucion  
**Docker stop  nombre o id** | _detiene el contenedor    |
**Docker start  nombre o id** | _inicia un contenedor    |
**Docker rm -f   nombre o id** | _elimina un contenedor que esta en ejecucion   |
## Creacion de contenedores

````docker
docker run -d -p 80.8081 "NOMBRE O CODIGO DE LA IMAGEN"
````
Donde.
-d detach (background)
-p puerto ( el numero del primer puerto no se cambia, el segundo si se peude cambiar )

### contenedor de Tutorial de Docker
docker run -d -p 80.80 d7933  (cambia el id dependiendo la imagen)
### conteendor  de MariBD sin volumen 
docker run -d --name Srver-MariabdG1/
-p 3343:3306 -e MARIABD -e MARIABD_ROOT_PASSWORD=123456  d8e96
### conteendor  de MariBD con  volumen 
docker create v-mariadbg1
docker run -d --name Server-MariadbG1 -p 3343:3306 -e MARIADBG1_ROOT_PASSWORD123456 -v v-mariadbg1
## comando Docker
dos volumnenes
v-postgresG1
v-sqlserverg1
### conteendor  de Postgres con  volumen 
```docker
````docker volumen create v-postgresG1
docker run --name Server-PostgresG1 -p 5455:5432\ -e POSTGRES_PASSWORD=123456 -V V-postgres:
bbb885
```

### conteendor  de SQLSERVER con  volumen 
````DOCKER

docker run -e "ACCEPT_EULA=Y" -e "MSSQLl_SA__PASSWORD=p@ssw0rd" \
-p 1450:1433 --name SQLserverG1 \
-d -v v-sqlserverg1

###mmmm
# Contenedores de Sistemas Gestores de Base de Datos

![ImagenDocker](./img/imagen-docker.png)

## Imagenes

> Comandos para cada imagen

- descargar imagen de postgres


docker pull postgres:14.22-trixie

- Descargar imagen de tutorial de Docker

docker pull docker/getting-started


## Creación de contenedores


docker
docker run -d -p 80:80 **Nombre o Codigo de la Imagen**

Donde:

- -d detach (background)
- -p puerto (el primer número de puerto no se cambia, el segundo si podemos cambiarlo)

### Contenedor de Tutorial de Docker 
docker
docker run -d -p 80:8090  docker/getting-started:latest
docker run -d -p 80:80  d7933 

### Contenedor de MariaDB sin Volumen
docker
docker run -d --name Server-MariadbG1 -p 3343:3306 -e MARIADB_ROOT_PASSWORD=123456 8763a

### Contenedor de MariaDB con Volumen
 
docker
docker volume create v-mariadbg1
docker run -d --name Server-MariadbG1 -p 3343:3306 -e MARIADB_ROOT_PASSWORD=123456 -v v-mariadbg1:/var/lib/mysql 8763a

### Contenedor de Postgres con Volumen
docker
docker volume create v-postgresG1
docker run -d --name Server-PostgresG1 -p 5455:5432 \
-e POSTGRES_PASSWORD=123456 \
-v v-postgresG1:/var/lib/postgresql    \
784816


### Contenedor de SQLSERVER con Volumen
docker

docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" \
   -u 0 \
   -p 1450:1433 --name SQLServerG1 \
   -d -v v-sqlserverg1:/var/opt/mssql/data \
   2dca9



v-sqlserverg1



## Comandos Docker 



| Comando | Descripción |
| :--- | :--- |
| *docker --versión* | Muestra la versión del Docker |
| *docker pull nombre_imagen* | Descargar una imagen de Docker Hub [Docker Hub](https://hub.docker.com/) |
| *docker images* | Muestra todas las imagenes |
| *docker run* | Crear un contenedor |
| *docker run* | Crear un contenedor |
| *docker ps* | Visualiza los contenedores que estan ejecución |
| *docker container ls* | Visualiza los contenedores que estan ejecución |
| *docker ps -a* | Visualiza todos los contenedores |
| *docker container ls -a* | Visualiza todos los contenedores |
| *docker rm nombre_contenedor o ID* | Borra un contenedor |
| *docker run* | Crea un contenedor contenedor |
| *docker stop nombre o ID* | Detiene el contenedor |
| *docker start nombre o ID* | Inicia un Contenedor |
| *docker rm nombre o ID* | Elimina un contenedor que no esta en ejecución |
| *docker rm -f nombre o ID* | Elimina un contenedor que esta en ejecucióndoc |
| *docker volume ls* | Mostrar los volumenes que existen en docker 