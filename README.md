# docker-CLI

Docker version check on local
**docker --version**

To check the information about any docker command (--help)
<img width="770" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/77dfb9bf-ea18-44ae-b46b-2e106b10bb05">

----------------------------------------------------------------------------------------------------------------------
Creating Docker Container - The Long Way
----------------------------------------------------------------------------------------------------------------------

1. Creating a Docker Container
Command :- docker container create hello-wold:linux

Explaination:- Create docker container named "hello-world" and get its linux specific version (image tag)
               This first checks if the image is available locally, if not image is fetched from docker hub (container registry)
               After creating container, ID gets associated with it
               This command only creates container, does not start them

<img width="780" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/2760a804-e0fb-4779-a0bd-3925bd504f88">

2. To check Active/Running containers
Command :- docker ps

3. To check all the containers on machine start/stopped
Command :- docker ps -a

4. To start the created container
Command :- docker container start Container_ID
<img width="777" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/bd54c8a2-167b-40a6-9e01-0c237a055629">

Note:- 0 exit code denoted the entrypoint was executed successfully

5. To check log messages after running container
Command :- docker logs Container_ID
<img width="758" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/451846d8-30cb-4ae4-9651-1ea830d2e8a6">

OR

Command :- docker container start --attach Container_ID  (To directly attach log terminal while starting container)
<img width="779" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/5c482636-ab7d-43d9-90ec-6b2a06a4b9d2">

----------------------------------------------------------------------------------------------------------------------
Creating Docker Container - The Short Way
----------------------------------------------------------------------------------------------------------------------

Command :- docker run hello-world:linux
Explaination :- This command created container from "hello-world" image automatically, started it and attached logs to its terminal
<img width="755" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/ea7745ba-6247-4ad5-9301-fba240c86495">

**docker run = docker container create + docker container start + docker container attach**

----------------------------------------------------------------------------------------------------------------------
Stop and Remove Containers
----------------------------------------------------------------------------------------------------------------------

By default docker doesn't stop or remove containers for us. Having many containers running on system can burn battery and slowing other containers down. For this we've to remove and stop containers.

1. To stop containers
Command :- docker stop Container_ID
<img width="770" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/d49eb8d4-abbb-47f7-87e1-fe631753e644">

2. To forcefully stop container which might take upto 10 sec to stop by docker stop
Command :- docker stop -t 0 Container_ID

3. To remove containers
Command :- docker rm Container_ID
<img width="773" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/b81b1c4c-bd13-49bb-a584-40acfd4403c0">

docker rm will not stop containers that are running. We can do that using -f option along with rm

4. To remove entire list of containers
Use the linux command "xargs" to take output from "docker ps"
xargs --> command to run for each line of output

To only get IDs of containers
Command :- docker ps -aq  (-q to list IDs)
<img width="769" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/8fe81bab-dc86-4010-9650-ee061d12bb58">

To remove all containers in one go (remove all idle containers)
Command :- docker ps -aq | xargs docker rm
<img width="610" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/895a5182-a509-4656-a7fd-dc55993e7bfe">

----------------------------------------------------------------------------------------------------------------------
Remove Images
----------------------------------------------------------------------------------------------------------------------
To list images
Command :- docker images
<img width="776" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/cb32aa15-2895-4a6a-8408-23832d8b3965">

To remove images (First stop and remove container to which image is tagged)
Command :- docker rmi Image_Name









