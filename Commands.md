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


