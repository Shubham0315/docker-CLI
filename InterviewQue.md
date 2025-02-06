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
  - **Docker Images** :- Readonly templeate to create containers. Contains code, lib, dependencies, configs.
  - **Docker Containers** :- Running instances of docker image
  - **Docker Registry** :- Central repo to store and distribute docker images
 
- Here we can write dockerfile and submit to docker engine which converts file to container image
- Docker is mostly dependent on docker engine which is single point of failure. If it stops, all containers stop working

![image](https://github.com/user-attachments/assets/9f3c2695-9120-41ca-bf57-07f312090a7d)
