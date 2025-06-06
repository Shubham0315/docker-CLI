What is docker CLI?
-
- Docker CLI (Command Line Interface) is a tool that allows developers and system admins to interact with Docker daemon using terminal commands. It enables users to manage containers, images, networks, volumes and other docker resources

- Syntax :- **docker [COMMAND] [OPTIONS]**
  - e.g :- docker run -d -p 8080:80 nginx       #docker calls docker CLI, run is command to start container, -d run container in detached mode, -p maps 8080 host port to 80 container port (outside:inside), nginx is image name
 
- Every command accepts options or flags to provide additional information to your request.
- To get use of command :- **docker [COMMAND] --help**

![image](https://github.com/user-attachments/assets/f93523c7-d8b5-4b42-a392-9ad7d47b4774)

-----------------------------------------------------------------------------------------------------------------------------------------------------

How to create docker containers? Explain both long and short way.
-

_**Long Way (Docker create + docker start)**_
- This methos separated container creation from container startup
- As we know containers are created from images, which're compressed and pre-packaged file system that contain our application along with its env and config instructions to start our app which are ENTRYPOINT
- If we dont mention our image i.e dockerfile or its not available on local, docker tries to retrieve it from dockerhub while creating the container
 
- To create container :- **docker container create bash:latest**          #from dockerhub it will fetch bash image
- Now this create container will have ID associated with it which we can check using :- **docker ps / docker ps -all**
 
![image](https://github.com/user-attachments/assets/dfe9704c-467e-403f-8f3b-111f1b271bc7)

- As we know, this command will only create containers but wont start it. Thats why **docker ps -a** states containers which are stopped as well.

- To start this create container :- **docker container start $ID**

![image](https://github.com/user-attachments/assets/33529365-096c-4848-acce-986c7382713b)

- If the exit status is 0, means entrypoint is executed successfully

- To check logs of the container :- **docker logs $ID**
- Another way to see logs immediately after starting container :- **docker container start --attach ID**       #attach terminal to it

**_Short Way_**
- It is really inconvenient to create and start containers explicitly everytime we run our app.
- So to merge all these :- docker run bash:latest      #creates container from image, starts it and attach terminal
- Here **docker run = docker create + docker start + attach**

![image](https://github.com/user-attachments/assets/a4c184f4-57ab-4f8e-b801-36bc3fe1bb91)
![image](https://github.com/user-attachments/assets/1f0bc213-be07-438c-998f-8067b9d1d4f0)
![image](https://github.com/user-attachments/assets/c709265b-532e-49b3-9217-18b624747400)

-----------------------------------------------------------------------------------------------------------------------------------------------------

Explain creation of containers from docker files
-
- Dockerfile is a script that automates process of building docker images. Once image is built, we can create and run containers from it.
- First we write our dockerfile with all the instructions to define image

![image](https://github.com/user-attachments/assets/a5da3285-db19-4323-bf39-4638733283f8)

- To build image from dockerfile :- docker build -t image_name .      #image_name can be custom , -t is for attaching tags, . uses pwd as build context but pwd should contain dockerfile

![image](https://github.com/user-attachments/assets/bcb7f6cf-9d42-43eb-87ce-768cd77138d1)

- Docker images are layers of images just compressed together. Thus docker creates images for every command mentioned in dockerfile called "Imtermediate Images"
- After reading dokcerfile, it squashes all images together into single image

- To run container from image :- docker run image_name

![image](https://github.com/user-attachments/assets/fbfa4bf9-f638-4e5d-88e2-f730d6ee70bf)

-----------------------------------------------------------------------------------------------------------------------------------------------------

How to interact with container? What are different commands?
-
- Once docker container is running, you can interact with it using various commands

To forcefully stop container :-
- 
![image](https://github.com/user-attachments/assets/b2448e97-ae65-4c3e-b4bc-3e696ecb8b06)

Attach to a running container
- You can attach your terminal to a running container to see logs and interact with it. It connects your terminal to container's std input/output
- Command :- **docker attach container**

Execute commands inside running container
- If you need to run commands inside running container
- Command :- **docker exec -it ID $command**             #for alreadt conning container 
- Command :- **docker run -it ubuntu**                   #for new container, directly open interactive mode

![image](https://github.com/user-attachments/assets/89457941-bc55-4e21-a500-6ed53b13f91a)

To open interactive shell
- Command :- **docker exec -it containerID sh**

View logs of container
- Command :- **docker logs -f containerID**

Inspect running container
- Command :- **docker inspect containerID**

![image](https://github.com/user-attachments/assets/aa8b8fa2-37fc-493f-b1e2-0e7b09390343)

Check resource usage of container
- Command :- **docker start container ID**

![image](https://github.com/user-attachments/assets/77742d3a-248b-4e0d-b4af-40a5089b1af6)

-----------------------------------------------------------------------------------------------------------------------------------------------------

Stopping and removing of container
- 

docker ps -a :- to get list of running, stopped, paused containers. We can remove containers not in use which can slow down system

docker stop containerID :- to stop container

- Stop,kill and Restart container
  - docker stop containerID
  - docker restart containerID
  - docker kill containerID

- Remove stopped container
  - docker rm containerID
  - docker container prune (remove all stopped containers)
 
- To remove entire list of containers
  - docker ps -aq :- to show container IDs
  - docker ps -aq | xargs docker rm :- to remove all

- To remove images
  - docker rmi imageName

-----------------------------------------------------------------------------------------------------------------------------------------------------

Explain binding ports to container with commands
-
- Port binding in docker allows external access to services running inside container. By default contianers dont expose their internal ports to host system. You must explicitly map ports using -p or --publish option

- Port binding allows docker to take port on your machine and map it to port within container

- Command :- **docker run -d -p 5001:5000 centos**

- To map port to container directly taking image from dockerhub and check what port is mapped:-

![image](https://github.com/user-attachments/assets/38046f63-35ef-4570-ad2b-003d0e661f94)
![image](https://github.com/user-attachments/assets/c02f2e6c-db2d-4dcb-9ea5-640f035c9eff)


-----------------------------------------------------------------------------------------------------------------------------------------------------

How to save data from containers?
-
- Containers are meant to be disposable. When they are deleted, all data is deleted

- Here we can use "docker run --rm" to create and immediately remove simple ubuntu container. Use "--entrypoint.sh" to tell docker that we want to run shell command. Provide name of image as "ubuntu". At the end of commands, send text to a file called /tmp/file with echo command and print it with cat command

- Command :- **docker run --rm --entrypoint sh ubuntu -c "echo 'Hello Shubham' > /tmp/file && cat /tmp/file"**

![image](https://github.com/user-attachments/assets/e532f294-44a4-421a-b99d-0258b5a6284d)

- But when we try to print file on console, we get error as everything created within container, stays within container. Once container gets deleted, data also gets deleted.
- This is very inconvenient for containers that need to save stuff after exiting.

![image](https://github.com/user-attachments/assets/44c9978a-447b-47a1-9be5-a58887b682fa)


- Here we can use volume mounting  feature of docker.
- Volume mounting allows docker to map folder on your computer to folder on container. Can be done with -v or --volume(outside:inside)

- ![image](https://github.com/user-attachments/assets/4514a72b-94e1-4da9-8d89-1a6e407d8487)

- If we provide file which is not there, docker creates directory of that name and mounts it as directory befor eit ran command

-----------------------------------------------------------------------------------------------------------------------------------------------------

Explain commands for managing containers
-
- When we stop any container, it is available to start again. STOP means just PAUSE

- To check list of containers :- **docker ps -a**       # -a for exited, running all the containers
- To remove container :- **docker rm containerID/Name**
- To get only IDs of containers :- **docker ps -q**

![image](https://github.com/user-attachments/assets/fc8077d8-4c14-479a-9873-ed8a7d9dff87)

- To remove all containers :- **docker rm $(docker ps -aq)**      #all containers must be stopped
- To forcefully remove container :- **docker rm -f $ID**

![image](https://github.com/user-attachments/assets/efb55b04-308a-406b-9e92-7efc2184f48b)

- To provide custom name to container we're creating :- **docker run --name $name -d -p -it 8080:80 nginx:latest**

![image](https://github.com/user-attachments/assets/b43d2908-4a29-43c8-b53f-905147dde7d0)

-----------------------------------------------------------------------------------------------------------------------------------------------------

Explain dockerhub and commands
- 
- Dockerhub is container image registry, place for storing and tracing container images. It is default registry used by docker client.
- Container images are tracked by tags

- To login dockerhub account :- **docker login**
- To tag image to be pushed :- **docker tag image shubham315/image:0.1**
- To push image to dockerhub :- **docker push shubham315/image:0.1**

![image](https://github.com/user-attachments/assets/6c2a3a61-8d55-490d-90bb-1b7b879a2e0e)
