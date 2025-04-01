Write difference between Monolithic and Microservice architecture
-
- Software architecture plays a crucial role in determining scalability, maintainability and performance of application

Monolithic Architecture
-
- It is a traditional approach where an entire application is built as a single, unified codebase. All components are tightly integrated and deployed as single unit
- For all the services of an application uf we use one server and one database, it is monolithic

- **Key Characteristics**
  - Single codebase and repo
  - Tightly coupled components
  - Single app handles all business functionalities
  - Shared database across all functionalities
  - Single deployment unit
  - Follows 3-tier architecture : UI (Frontend), Business Logic (Backend) and Database

- **Advantages**
  - Simpler development, testing and debug as everything is at one place
  - Easier deployment as it is straightforward due to single unit
  - Performance efficiency
  - Easier data management due to single DB
 
- **Disadvantages**
  - Scalability issues as it requires deploying entire app even for minor changes
  - Slow development due to growing codebase
  - Tightly coupled components so changes in one module may impact entire app
  - Difficult to adopt new tech as everything is tightly integrated
  - Longer deployment time as small change requires rebuilding and deploying whole app

Microservice Architecture
-
- It breaks application into smaller, loosely coupled, independently deployable services
- Each microservice is responsible for specific business function and communicates with others using APIs

- **Key Characteristics**
  - Decentralized and distributed services
  - Each service has its own database
  - Independent deployment and scaling for each service
  - Services communicate with APIs
  - Follows devops approach with CICD pipelines

- **Advantages**
  - Individual services can be scaled independently based on demand
  - Faster development and deployment as teams can develop and deploy services independently, increasing speed
  - Flexible in tech stack as each MS can use different language/frameworks
  - Failure in one service doesn't impact entire system
  - Small services make updates and debugging easier leading to easier maintenance
 
- **Disadvantages**
  - Increased complexity as managing multiple services requires more effort
  - MS need API for communication which adds latency
  - Each service has own DB requiring complex data sync
  - Higher infra costs as more services
  - More APIs can increase security risks

- When to choose which one?
  - Choose monolithic if :- app is mid sized, when quick development and deployment is needed
  - Choose MS if :- app needs to scale frequently, we have multiple teams working on diff modules, need high availability, diff modules require diff tech stacks
 
![image](https://github.com/user-attachments/assets/99a4f133-fc88-434d-ac70-f665ffec5804)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Explain the concept of virtualization 
-
- It is process of creating multiple virtual instances of computing resources(like OS, storage, networks) on single physical machine. This allows better resource utilization, isolation and scalability

- VMs and Hypervisor based Virtualization
  - VM is fully functional virtual OS that runs on physical machine(host) using software layer called hypervisor.
  - On physical machine hypervisor in installed and on top of it VM is created. To increase efficiency, we can install hypervisors on physical servers which create VMs for us where VMs are logically isolated.
  - If we request for EC2, request goes to data center in that region and on one of the physival server using hypervisor VM gets created for us. Physically we dont buy VM but we pay money for it.
  - Virtualization is used to create VM inside our machine. In those VM we can host guest OS. Using guest OS we can run multiple apps on same machine
  - In below SS, physical server means host OS, VM means guest OS. Hypervisor is used to create VMs here.
 
![image](https://github.com/user-attachments/assets/e0d4e870-e98e-4e99-bb4e-841786e4f59b)

- **Functioning of VMs**
  - Hypervisor sits between physical hardware and virtual instances
  - Host OS is main PS on physical machine
  - Each VM runs its own Guest OS, applications
  - VMs are completely isolated from each other
 
- **Advantages**
  - Complete isoaltion as each VM has its own OS
  - Strong isolation reduces security risks
  - Ideal for running older apps that need full OS capabilities

- **Disadvantages**
  - Heavy resource consumption as each VM runs full OS consuming CPU, RAM and storage
  - Booting VM takes time since it loads full OS

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Explain the concept of containerization
-
- It is used to pack the application along with its dependencies to run application.
- Containerization is a lightweight virtualization technology that packages application and its dependencies into an isolated unit called container. These containers can run across diff env without need of separate OS for each app instance. Unlike VM which run full OS for each instance, containers share host kernel, meking them faster and efficient

![image](https://github.com/user-attachments/assets/eedb39b0-67b5-42fc-bad1-5f901fdec88d)

- It is similar to virtualization architecture, instead of hypervisor here we use docker engine using which we create containers. Inside containers we've apps
- Docker engine is software that hosts container
- Container is runtime of app which is created through docker image. Container is a VM just with no OS. With help of images, containers run

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

What is docker container?
-
- Container is nothing but a VM with no OS. It is runtime of app which is created using docker image
- It is a lightweight, standalone and executable package that includes everything for an app to run like code, libraries, dependencies, env var, config files
- Unlike VMs, containers share share host OS kernel but remain isolated, making them efficient and portable
- Containers are virtualises OS configured with just enough resources to run your app.

- **How Docker containers work?**
  - Containers are created from images which serve as blueprints for containerized apps.
  - Docker image is a static file containing app and its dependencies whereas container is instance of docker image
 
- **Lifecycle of Docker container**
  - Pull image from registry dockerhub (nginx,ununtu)
  - Run the container means start it
  - Execute commands to interact with running container
  - Stop and remove container when done
 
- **Features of Docker containers**
  - Lightweight as uses shared OS kernel instead of running full OS per instance
  - Start in milli seconds
  - Portable as runs across local, testing and cloud env
  - Containers run from immutable images ensuring consistency

- **Use cases of Docker Containers**
  - Microservices : each service runs in its own container
  - CICD pipeline to automate test and deployment
  - Multi cloud support

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Explain architecture of docker containers
-
- Containers can be created on top of VMs or on top of physical servers as well
  1. Use servers and install OS, install docker on top of it for containerization and then create multiple containers
  2. Create VM/EC2 on top of physical server, create docker on top of it(Mostly used) and start creating containers on top of it. While maintaining servers, there is maintenance overhead, as orgn not willing to maintain their own data centers
 
- Docker follows client-server architecture that consists of multiple components working together to manage containers efficiently. It ensures lightweight, portable and scalable containerized apps.

- **_Key components of Architecture_**
  - **Docker Client** :- CLI or API to interact with docker engine. Runs commands like docker build/run/pull. Communicates with daemon
  - **Docker Daemon** :- It is background service running on host system. Responsible to manage images, containers, networks, volumes. Listens to API requests from client. Creates and runs containers using container runtime
  - **Docker Desktop** :- It enables to build and share containerized apps and microservices. It includes daemon, client, compose,etc. We can download on our PC
  - **Docker Images** :- Readonly templeate to create containers. Contains code, lib, dependencies, configs.
  - **Docker Containers** :- Running instances of docker image
  - **Docker Registry** :- Central repo to store and distribute docker images
 
- Here we can write dockerfile and submit to docker engine which converts file to container image
- Docker is mostly dependent on docker engine which is single point of failure. If it stops, all containers stop working

![image](https://github.com/user-attachments/assets/9f3c2695-9120-41ca-bf57-07f312090a7d)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Difference between Containers and Virtual Machines
-
- Containerized apps just comprises of base OS and rest is indebted from host OS(kernel) making them lightweight. Containers are isolated and present as docker image. If containers are not running, they dont use resources from kernel, so we dont have to pay our cloud provider anyhow.
- Containers take minimum system dependencies which're required to form logical isolation between containers of same docker/host OS. If they're not present, hacking between containers is easy and security is compromised

- Virtual machines have guest(whole) OS making it heavy in nature. Thus we've to pay our cloud provider for the resources we use

1. **Resource Utilization** :- Containers share host OS kernel, making them lighter and faster than VMs while VMs have full fledged OS and hypervisor, making them more resource intensive
2. **Portability** :- Containers are designed to be portable and can run on any system with compatible host OS. VMs are less portable as they need a compatible hypervisor to run
3. **Security** :- VMs provide higher level of security as each VM has its own OS and can be isolated from host and other VMs. Containers provide less isolation as they share the host OS thus having less security
4. Management :- Managing containers is easier than VMs as containers are lightweight and fast-moving

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Why containers are lightweight?
-
- Containers are lightweight because they use a technology called containerization which allows them to share the host OS kernel and libraries instead of running separate OS for each app. Also they provide isolation for the application and its dependencies. This results in smaller footprint compared to traditional VMs as containers don't need to include full OS. Additionally docker containers are designed to be minimal, only including what is necessary for the aplication to run, further reducing their size.

- Also VMs use hypervisor (VMware, VirtualBox) to manage virtual OS instances. While docker eliminates need of hypervisor, running directly on host OS which in turn reduces CPU, memory and storage overhead
- In containers image sizes are smaller than VM disk images as only necessary dependencies are included. Compresses storage layers make image transfer faster

- As containers dont need full OS, they start in milli secs, leading to fast deployment and easier portability

- This makes them ideal for cloud-native applications, microservices, and DevOps workflows.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Explain files and folders in container base images
-
- When you pull docker base image(ubuntu/centos), it contains minimal set of files and directories necessary for OS to function inside the container. It follows Linux FHS

- Common files and directories in Container base image
  - **Root dir(/)** :- base of FHS
  - **/bin** :- Stores essential system binaries such as ls, cp, ps
  - **/etc** :- Contains system-wide configuration files
  - **/lib** :- Stores shared libs required for apps, used by binary executables
  - **/usr** :- User programs and binaries such as apps, libraries
  - **/var** :- Stores log files, cached data and temporary files
  - **/tmp** :- To store temp files at runtime. Auto cleared when container stops
  - **/root** :- Home dir of root user
  - **/proc** :- Process info. Virtual filesystem containing process-related info
  - **/dev** :- Device files

- **_How to explore files and folders in container?_**
  - **Start new container** :- docker run -it --rm ubuntu bash
  - **List root dir** :- ls /
  - **View binaries installed** :- ls /bin
  - **Check config files** :- cat /etc/os-release
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Files and folders containers use from host OS
-
- **Host's file system** :- Docker containers can access host file system using bind mounts, which allow containers to read and write files in host file system
- **Networking stack** :- Host's networking stack is used to provide network connectivity to container. Docker containers can be connected to host's network directly or thro virtual network
- **System calls** :- Host's kernel handles system calls from container, which us how container accesses hosts's resources such as CPU, Memory
- **Namespaces** :- Docker containers use Linux namespaces to create isolated env for container's processes. Namespaces provide isolation for resources such as file system, process ID and network
- **Control groups** :- Dcoker containers use cgroups to limit and control resources such as CPU, memory, I/O, that container can access. Used to monitor and limit CPU usage, network, disk bandwidth and memory consumption. CGroups prevents larger containers from taking all system resources and slowing down the system/other containers.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

What is docker?
-
- Docker is a containerization platform that provides easy way to containerize your applications, which means, using Docker you can build container images, run the images to create containers and also push these containers to container regestries such as DockerHub, Quay.io and so on.
- In simple words, you can understand as containerization is a concept or technology and Docker Implements Containerization
- Allows developers to package their apps into images that run on containers (Images are like apps and containers are like servers)

**Docker Architecture**
- Using docker client we(users) run some docker commands(through CLI) which are received by docker daemon
- Daemon is a process that we install. Heart of docker
- After receiving commands, daemon executes them and creates images/containers (build will create images, run will create containers)
- Using daemon, we push images to registry
- If docker daemon goes down, docker will stop functioning, containers will stop working

- As user, we've to write docker file (set of instructions)
  - After writing file, we submit it to docker daemon using CLI using docker build command which creates "docker image"(snapshot in VM).
  - Once docker image is run using "docker run" command and it creates docker container, which is final output comprises of system libraries, application dependencies and application itself
 
  - Dockerfile - build dockerfile to create docker image - run image to create docker container

**docker build** :- builds docker images from Dockerfile

**docker run** :- runs container from docker images

**docker push** :- push the container image to public/private registries to share the docker images.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Explain dockerfile and its contents
-
- Dockerfile is a script like text file containing set of instructions to build a docker image. It automates process of creating lightweight, portable and reproducible containers.
- Dockerfile consist of multiple commands (directives) that define :-
  - Base Image
  - Application dependencies
  - Configuration settings
  - Env variables
  - Execution commands
 
Dockerfile Directives (Commands)
- FROM   :- Specifies base image                       FROM ubuntu:latest
- LABEL  :- Adds metadata to image                     LABEL version="1.0"
- WORKDIR:- Sets working directory                     WORKDIR /app
- COPY   :- Copies files from host to container        COPY . /app
- ADD    :- Similar to copy but can extract archives   ADD myfile.tar.gz /app/
- RUN    :- Executes commands during image build       RUN apt update && apt install -y python3
- ENV    :- Sets env variable                          ENV APP_ENV=production
- EXPOSE :- Port which container listens on            EXPOSE 8080
- CMD    :- DefauLt command to run inside container    CMD ["python3", "app.py"]
- ENTRYPOINT :- Definesexecutable for container        ENTRYPOINT ["nginx", "-g", "daemon off;"]
- VOLUME :- Creates consistent storage volume          VOLUME /data
- ARG    :- Defines build time variable                ARG APP_VERSION=1.0
- HEALTHCHECK :- Defines health check command


![image](https://github.com/user-attachments/assets/6fb2ab7c-7107-42a8-b6b6-3e3f75a49b55)
- Here build command will talk to daemon and -t will tag image id. Dot (.) will build the image in present dir. Also give tag as latest to image (**docker build -t ubuntu:latest .**)
- To check image created or not :- **docker images** 

Note :- We've to switch to root user before installing packages as we're not running command as superuser

![image](https://github.com/user-attachments/assets/9961e31c-7cd9-429b-9086-03bc7f681316)
- Here run command will execute the built image. -d for detached mode. --name ubuntu is name of container as per wish and then followed by image name. Provide tag (docker run -d ubuntu:latest)
- To check container created :- **docker ps**

![image](https://github.com/user-attachments/assets/4a1c32b1-aad7-4c04-a9cf-1f3464f85291)
- To push image to dockerhub, login first and then push. shubham315 is dockerhub folder where we want to push our image
- To login :- **docker login**

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Difference between entrypoint and CMD in dockerfile
-
- Both ENTRYPOINT and CMD define the command that runs when container starts, but they serve different purposes

**CMD (Default Command)**
- Used to provide default arguments to container. Can be overridden when running  **_docker run <image> <command>_**
- What CMD we write in dockerfile

  - FROM ubuntu
  - CMD ["echo", "Hello World"]
  
- We can override this CMD while running container image :- **_docker run image echo "Message"_**  (Override hello world in CMD)

**ENTRYPOINT (Mandatory Command)**
- Defines main executable of the container
- Cannot be easily overridden using docker run <image> <command> unless using **_--entrypoint_**
- What ENTRYPOINT we write in dockerfile
  
  - FROM ubuntu
  - ENTRYPOINT ["echo", "Hello"]
  
- We can override this ENTRYPOINT while running container image :- **_docker run --entrypoint ls ubuntu_** (override echo hello by listing files in container)

**Using ENTRYPOINT and CMD together**
- ENTRYPOINT defines main command. CMD provides default arguments for ENTRYPOINT

   e.g :-
   - FROM ubuntu
   - ENTRYPOINT ["echo"]  
   - CMD ["Hello, World!"]
  
- Here echo is fixed but while running container we can change CMD

- Use ENTRYPOINT if your container must always run specific program (e.g:- python app.py)
- Use CMD if you want default arguments but allow users to modify them
- Use both together for flexibility, CMD for arguments and ENTRYPOINT for command

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Explain the concept of multi stage docker build
-
- Multi stage docker builds help to reduce the final image size, improve security and optimize performance by using multiple stages in single dockerfile. Each stage is built separately and only necessary artifacts are copied to the final image.
- A dockerfile is divided into multiple stages. Each stage has its own FROM statement allowing to use different base images. Intermediate artifacts are copied to final stage

- To write an app in python we only require python runtime. But if we write normal dockerfile, it comes up with other things like ubuntu base image, system dependencies and apt packages. So it results in lot of overload on simple docker image which we want in output
- To run the container here we require python runtime only and to build app we require other things such as base image and all
- We use UBUNTU as base image as it is easy to install packages, get dependencies required to build the app. In stage 2 no base image is copied only required binaries are copied.

- Multi stage build splits our dockerfile into multiple parts. It remains a single dockerfile but with multiple stages.

- Here in the first stage we dont define CMD or ENTRYPOINT. We can use RUN to execute any commands during the application build. It copies the source code and compiles it to binary. Then the built app's binary is taken as input in stage 2 which was built previously. In stage 2 we use CMD to run our app. In 2nd stage we can use lightweight image of the required app

- In below SS, we only need alpine to run. So in stage 1 to build image we can use golang image and RUN it to build our app's binary. This binary is taken to stage 2 as input and run the app using CMD.
- This will eventually reduce image size.

![image](https://github.com/user-attachments/assets/c43ed791-e265-40f3-a526-0e050868ae41)

- In multi stage dockerfile, always choose very rich base image with lot of dependencies. Afterall base image will be removed in final stage. In final stage we can execute dependencies as CMD. So that in final stage we can have minimalistic image.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Explain distorless images
-
- Distorless images are minimal, lightweight container images that do not include traditional linux distribution(like ubuntu or alpine). Instead they only contain the app and its necessary runtime dependencies, reducing attack surface, improving security and performance

- Why to use Distorless Images?
  - Smaller image size :- No unnecessary packages, reducing storage and network transfer costs
  - Better security reducing vulnerabilities
  - Faster startup :- Minimal dependencies improving performance

- Just like multi-stage docker builds, it compiles code to binary and using binary also includes runtime libraries without extra OS packages

- Here security is the highest

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Explain docker bind mounts and volumes
-
- Major problem with container is there is no filesystem by default.
- Suppose we've nginx app inside our container which continuously puts user info, IP address of user into log file which is used for auditing.
- Now if container goes donw, log file gets deleted as containers are ephemeral (shortlived) in nature as they dont have file system by default. Containers use CPU, memory like resources from kernel/host OSwhich makes them lightweight.

Here arise 3 problems:-

- If container goes down, it free up resources of OS abd gets killed. So our log file gets deleted. So we dont know who authorized container. Organization've to compromise on details
- If we've 2 containers frntend and backend. Backend keeps writing file which is to be read by frontend to display content. If backend goes down and we dont have any file storage, entire info is gone. Frontend cant access prior records as well.
- Lets say there is an app on container which reads file from cronjob on host. So there is file on host OS which container wants to read and display user. Here app doesnt know how to read infor from file on host OS

- To overcome all these problems :- Bind Mounts and Volumes

Bind Mounts 
-
- Used to directly map host directory to container. Bind folder on container with folder on host. So that any file on container will be accessed by host. It provides full access to host files but is tightly coupled to host filesystem.
- Lets say we've /app folder on host. Even if our container goes down, /app is already there on host. So any file inside /app will be directly read by container.
- If any new container comes up, we'll bind it to same /app on host so that information is not lost. This acts as backup for our container

- Container accesses and modifies files on host like whatever changes done on container will auto reflect on host

Command :- **docker run -d -v /hostPath:/ContainerPath --name Container**

- **Use cases**
  - Sharing files between host and container
  - Giving access to specific files (logs,datasets)
  - Development env where live file changes should reflect inside container
 
Docker Volumes
-
- Provides same solution as bind mounts but with better lifecycle.
- Docker volume is a managed storage solution that docker controls. It is not directly tied to the host filesystem and is better suited for persistent data.
- Using docker CLI we create volumes i.e logical partition created on host.
- While creating we dont provide directory details like bind mounts (/app), we say create volume on host which can be mounted to container
- As volumes have lifecycle, using them we can manage containers using commands. Volumes're easy to share from one container to another

Command :-  **docker run -d -v my_data:/container/path --name my_container**     #mydata is docker managed volume, container path is path where volume is mounted inside container

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Difference between -v and --mount in docker volume
-
- Both -v and --mount are used to attach storage (volumes or bind mounts) to docker containers, but they've different syntax and flexibility.

**_-v (volume flag- short form)_**
- Supports Bind mount and volumes both but its less readable
- Volume with -v :- **docker run -d -v my_data:/app/data nginx**           # Creates volume my_data and mounts it inside directory /app/data with container named nginx 
- Bind mount with -v :- **docker run -d -v /hostPath:/ContainerPath nginx**    # Directly maps host directory /hostPath into container  (Outside of container to inside of container)
- -v is less explicit (harder to read)

**_--mount (Mount flag - Newer, more readable)_**
- More powerful as it supports read only, multiple options
- Volume with --mount :- **docker run -d --mount type=volume,source=my_data,target=/app/data nginx**    #Here we define what type is (volume), source and target . Rest same as -v
- Bind mount with --mount :- **docker run -d --mount type=bind,source=/hostPath,target=/ContainerPath,readonly nginx** #more control to make it read only

Note :- Use --mount for better readability and advanced options, -v for quick, simple volume bindings in development
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Explain commands related to docker volumes
-
- Docker volumes is a recommended way to persist data in containers.

- Create Docker volumes :- **docker volume create my_volume**

![image](https://github.com/user-attachments/assets/2a5a4254-d0c7-4a77-90e7-50902aa809fb)

- List and Inspect volumes :- **docker volume ls   &&   docker volume inspect my_volume **          #Show detail info like mount path, size, driver

![image](https://github.com/user-attachments/assets/cb2371be-1bc7-4118-aaa5-be1a84326c61)

- Using volumes in containers
  - Mount volume to container :- **docker run -d -v my_volume:/app_data --name container nginx**    #Mounts my_volume inside container at /app/data
  - Use -- mount              :- **docker run -d --mount type=volume,source=my_volume,target=/app/data nginx**
 
  ![image](https://github.com/user-attachments/assets/6e3cd99f-c314-4365-8212-917aaa6dab7b)

- Removing docker volumes :- **docker volume rm my_volume**
- To remove all unused volumes :- **docker system prune**

![image](https://github.com/user-attachments/assets/20d07a40-f43a-4d4f-95b6-0d6963d3438f)

- Remove volume with containers
  - Remove container and its volume :- **docker rm -v my_container**                    #deletes container and attached volumes
  - Remove all unused containers, images and volumes :- **docker system prune -a**      #cleans up every unused containers, images, volumes
  - Check mounted volumes in running container :- **docker inspect my_container**       #shows mounted volumes under mounts section
 
Note :- To delete volume, first delete the container and then volume. To delete container, stop it and then delete

![image](https://github.com/user-attachments/assets/4c211b21-00b8-4f03-982a-1217dfd31666)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Explain docker networking 
-
- Networking allows docker containers to communicate with each other and  with the host on which they run
- Lets say we've host on top of which docker is installed . There're 2 containers on top of it.
  - Both containers are 2 individual parts of our application (frontend and backend)
  - Here both of these containers must talk to each other. So there has to be a networking way how one container can talk to other. Also, container should talk to host as host has complete OS.
  - Also both containers should've good isolation. All this is offered by "**_Docker/Container networking_**"
 
- In short, docker networking enables communication between containers, host system and external networks. It provides different network drivers to handle different connectivity needs.

- Docker is important as :-
  - Allows containers to communicate with each other
  - Enables external access to containerized apps
  - Supports secure isolation of containerized services
  - Facilitates multi-host networking in distributed apps

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Explain the types of docker networks
-

- **Bridge Networking**
  - It is the default networking mode in docker.
  - Containers on same host communicates with each other in an isolated network
  - If we've one cobtainer mounted on host OS. When we try to ping the container from host, we get networking error as both have etho network of different ip ranges means subnet is different
  - To solve this, docker creates virthual ethernet (Veth/docker0) so as to talk to host. This is called as Bridge Networking
  - Veth acts as bridge between container and host
 
  - In short bridge network is used if container and host both have different subnets. So both can talk to each other using bridge called "Virtual Ethernet"
 
  - Containers connected to same bridge network can communicate using container names. While containers on different bridge networks need port mapping
 
![image](https://github.com/user-attachments/assets/8710d24f-84c9-47b4-9a03-899d17bbe26b)

  - Commands :- **docker network create my bridge**   &&    **docker network connect my_bridge container1**

![image](https://github.com/user-attachments/assets/47fb2811-4926-4fa7-9c32-a4e0787e0575)


- **Host Networking**
  - Removes network isolation and binds container directly to host network
  - Whenever we create container, docker directly binds container with IP address of host. Here container shares host's network namespace
 
  - Commands :- **docker run --network=host nginx**

![image](https://github.com/user-attachments/assets/e96318d5-ced2-4c47-8859-da12b8743c7d)

  - Here host and container both're in same CIDR/Subnet due to shared network. So if we try to ping host from container, it is possible.
 
  - Here the only issue is if user has access to host, he can directly access app inside container. So very insecure.
 
- **Overlay Networking**
  - Enables multi host networking for docker swarm services. Useful in docker swarm and K8S and when we've multiple hosts.
  - If on multiple hosts we've to create cluster, ovrlay networking is useful as it is common across multiple hosts.
 
  - Command :- **docker network create --driver overlay my_overlay**    &&    **docker service create --network=my_overlay nginx**
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Explain docker networking commands and networking lifecycle
-
- Docker provides set of networking commands to manage container networks effectively.

- **_Create Network_**
  - While Creating custom network, we can specify type (bridge, overlay, macvlan)
  - Commands :- **docker network create --driver bridge shubham**             #--driver specifies network type, shubham is name of custom network
  - To check available networks :- **docker network ls**
  - docker network create --driver overlay my_overlay_network

![image](https://github.com/user-attachments/assets/7cdd9ea2-cf26-455e-8f3e-8754cadcd731)

- **_Connect container to network_**
  - Once network is created, containers need to be connected to it
  - Command :- **docker network connect shubham nginx**                           #shubham is network name, nginx is container to be connected to network
 
![image](https://github.com/user-attachments/assets/c57f4f71-2467-47fc-88d1-ab49a2c244a0)

- **_Inspect network details_**
  - To get detailed info about network (IR range, connected containers)
  - Commands:- **docker network inspect shubham**
  - Displays JSON formatted details of network, including assigned IPs

- **_Disconnect container from network_**
  - Commands :- docker network disconnect shubham nginx

![image](https://github.com/user-attachments/assets/b87a5cd1-6fb8-41c2-a8d9-852742a3ca7b)

- **_Remove a Network_**
  - Unused networks should be removed to avoid clutter. The command will fail if any container is connected to the network
  - Commands :- **docker network rm shubham**

![image](https://github.com/user-attachments/assets/147656e5-5d70-4f02-b61a-0a3be8497b1c)

- **Running a container with specific network**
  - When launching a new container, you can specify which network it should use. Here network should be created already.
  - Commands :- **docker run --network-shubham -d nginx**

![image](https://github.com/user-attachments/assets/b8cfed21-6495-4316-baab-ddfa35334db7)

- **Use host networking**
  - To run container using host network
  - Commands :- **docker run --network=host -d nginx**
  
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


