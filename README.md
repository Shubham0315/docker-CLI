# docker-CLI

Docker version check on local
**docker --version**

To check the information about any docker command (--help)
<img width="770" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/77dfb9bf-ea18-44ae-b46b-2e106b10bb05">

----------------------------------------------------------------------------------------------------------------------
Creating Docker Container - The Long Way
----------------------------------------------------------------------------------------------------------------------

1. Creating a Docker Container
_**Command :- docker container create hello-wold:linux**_
Explaination:- Create docker container named "hello-world" and get its linux specific version (image tag)
               This first checks if the image is available locally, if not image is fetched from docker hub (container registry)
               After creating container, ID gets associated with it
               This command only creates container, does not start them

<img width="780" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/2760a804-e0fb-4779-a0bd-3925bd504f88">

2. To check Active/Running containers
_**Command :- docker ps**_

3. To check all the containers on machine start/stopped
_**Command :- docker ps -a**_

5. To start the created container
_**Command :- docker container start Container_ID**_
<img width="777" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/bd54c8a2-167b-40a6-9e01-0c237a055629">

Note:- 0 exit code denoted the entrypoint was executed successfully

5. To check log messages after running container
_**Command :- docker logs Container_ID**_
<img width="758" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/451846d8-30cb-4ae4-9651-1ea830d2e8a6">

OR

_**Command :- docker container start --attach Container_ID**_  (To directly attach log terminal while starting container)
<img width="779" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/5c482636-ab7d-43d9-90ec-6b2a06a4b9d2">

----------------------------------------------------------------------------------------------------------------------
Creating Docker Container - The Short Way
----------------------------------------------------------------------------------------------------------------------

_**Command :- docker run hello-world:linux**_

Explaination :- This command created container from "hello-world" image automatically, started it and attached logs to its terminal
<img width="755" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/ea7745ba-6247-4ad5-9301-fba240c86495">

**docker run = docker container create + docker container start + docker container attach**

----------------------------------------------------------------------------------------------------------------------
Stop and Remove Containers
----------------------------------------------------------------------------------------------------------------------

By default docker doesn't stop or remove containers for us. Having many containers running on system can burn battery and slowing other containers down. For this we've to remove and stop containers.

1. To stop containers
_**Command :- docker stop Container_ID**_
<img width="770" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/d49eb8d4-abbb-47f7-87e1-fe631753e644">

2. To forcefully stop container which might take upto 10 sec to stop by docker stop
_**Command :- docker stop -t 0 Container_ID**_

3. To remove containers
_**Command :- docker rm Container_ID**_
<img width="773" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/b81b1c4c-bd13-49bb-a584-40acfd4403c0">

docker rm will not stop containers that are running. We can do that using -f option along with rm

4. To remove entire list of containers
Use the linux command "xargs" to take output from "docker ps"
xargs --> command to run for each line of output

To only get IDs of containers
_**Command :- docker ps -aq**_  (-q to list IDs)
<img width="769" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/8fe81bab-dc86-4010-9650-ee061d12bb58">

To remove all containers in one go (remove all idle containers)
_**Command :- docker ps -aq | xargs docker rm**_
<img width="610" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/895a5182-a509-4656-a7fd-dc55993e7bfe">

----------------------------------------------------------------------------------------------------------------------
Remove Images
----------------------------------------------------------------------------------------------------------------------
To list images
_**Command :- docker images**_
<img width="776" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/cb32aa15-2895-4a6a-8408-23832d8b3965">

To remove images (First stop and remove container to which image is tagged)
_**Command :- docker rmi Image_Name**_

----------------------------------------------------------------------------------------------------------------------
Prune Command
----------------------------------------------------------------------------------------------------------------------
This command smartly removes useless data that's buring a hole in our disc

_**Command :- docker system prune**_
We get message of reclaimed space after running the command

<img width="780" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/c7a98a77-24e4-482d-a631-89bba2c5e789">
<img width="787" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/35e8190b-69d8-42af-a982-b8aab555ce43">

----------------------------------------------------------------------------------------------------------------------
Debugging of Containers Slowness
----------------------------------------------------------------------------------------------------------------------
- Our container might run slowly than we expected
  We can use 3 command to analyse the same

  1. Docker stats
  - This gives us snap of our container's performance as its running.
  - Launch a container of name alpine. As we want our container to run indefinitely, set its entrypoint to sleep.
    After image name provide agrument as "infinity" that puts container to sleep forever
  
  _**Command :- docker run --name=alpine --entrypoint=sleep -d alpine infinity**_
  <img width="777" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/c01e1d74-7611-4f21-b8c9-1733b52e50f3">

  From above image, we can say that container is sleeping and is running.
  To check stats of it while sleeping

_**Command :- docker stats ID**_

<img width="602" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/5892b942-a734-4477-a0cb-20e021dbc1f1">

To manipulate with container, open another terminal and go inside its interactive mode (docker exec -it ID bash). To enter into shell of container
(-t --> For local terminal to communicate with container terminal)
<img width="780" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/a4f5dd30-9bc4-4143-9e21-f956f8e2a627">

If we run any program inside shell, our CPU usage increases
<img width="602" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/34d113da-5440-404b-94d1-2a2463d0f473">

When we terminate the program in there, our CPU usage comes down to normal

2. Docker top
- Shows whats running inside of container without having to exec into it.
- If we run same exec command multiple times, and run docker top, we can see that we have ton of sleeps

_**Command :- docker top Container_ID**_
<img width="776" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/dbec52a7-4644-4d96-9966-0cd02a0cf9ea">

3. Docker inspect
- Used to show advanced information about container in JSON format.

_**Command :- docker inspect Container_Name/ID**_

- We can check directories mounted, container restarting or not, 
  

  












