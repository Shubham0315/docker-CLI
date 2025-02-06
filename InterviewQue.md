Write difference between Monolithic and Microservice architecture
-
- Software architecture plays a crucial role in determining scalability, maintainability and performance of application

Monolithic Architecture
-
- It is a traditional approach where an entire application is built as a single. inified codebase. All components are tightly integrated and deployed as single unit
- For all the services of an application uf we use one server and one database, it is monolithic

- **Key Characteristics**
  - Single codebase and repo
  - Tightly coupled components
  - Single app handles all business functionalities
  - Shared database across all functionalities
  - Single deployment unit
  - Follows 3-tier architecture : UI, Business Logic and Database

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
- **Control groups** :- Dcoker containers use cgroups to limit and control resources such as CPU, memory, I/O, that container can access

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

What is docker?
-
- Docker is a containerization platform that provides easy way to containerize your applications, which means, using Docker you can build container images, run the images to create containers and also push these containers to container regestries such as DockerHub, Quay.io and so on.
- In simple words, you can understand as containerization is a concept or technology and Docker Implements Containerization

**Docker Architecture**
- Using docker client we(users) run some docker commands(through CLI) which are received by docker daemon
- Daemon is a process that we install. Heart of docker
- After receiving commands, daemon executes them and creates images/containers (build will create images, run will create containers)
- Using daemon, we push images to registry
- If docker daemon goes down, docker will stop functioning, containers will stop working

- As user, we've to write docker file (set of instructions)
  - After writing file, we submit it to docker daemon using CLI using docker build command which creates --> docker image(snapshot in VM). Once docker image is run using "docker run" command and it creates docker container  --> which is final output comprises of system libraries, application dependencies and application itself
 
  - Dockerfile - build dockerfile to create docker image - run image to create docker container

**docker build** -> builds docker images from Dockerfile
**docker run** -> runs container from docker images
**docker push** -> push the container image to public/private registries to share the docker images.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

