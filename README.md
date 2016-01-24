
#DebianX2go
==========

##Description

This Dockerfile creates a docker image and once it's executed it creates a container that runs X2GO server and SSH services.

The ssh is used to provide you encrypted data communication between the docker container and your local machine.

X2Go enables you to access a graphical desktop of the container over a low bandwidth (or high bandwidth) connection.

##How do you use this image ?

###Building the docker image

$ git clone https://github.com/martinwangjian/debian-x2go.git
$ cd DebianX2go/[setup]
$ docker build -t [yourimagename] .

###Running the docker image created
####With the password generated during runtime

$ CONTAINER_ID=$(docker run -d -p 2222:22 [yourimagename])
$ docker logs $CONTAINER_ID

note down the root/dockerx passwords.

####With the preset password ( root:root dockerx:mellon)
$ docker run -d -p 2222:22 -e ROOT_PASS=root -e PASS=mellon [yourimagename]

### Connect to server with a Client
Download the x2go client from:
http://wiki.x2go.org/doku.php/doc:installation:x2goclient

Connect to your server with 

Host : (Your Server IP)
Port : 2222
Username : dockerx 
Password : (that you note down if the password generated during runtime)

Select the Session TYPE as : LXDE (depend on your setup)

You can also SSH to the docker container directly with root or dockerx users and their passwords over the port 2222 with linux ssh or windows putty clients.

$ ssh root@dockerhost -p 2222