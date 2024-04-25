- Production systems are typically more complex. A mature software system will usually have at least a few dockerized services each with specific, individual configurations.
  There may be some thrid party dependencies or some services may depend on each other which means they need to be initialized in some specific order.
  There might be situation where we need to start hundreds of containers, thats where "DOCKER COMPOSE" comes in.

  ---------------------
  Docker Compose
  ---------------------
  - Docker compose is an independent tool that comes in standard with most downloadable docker distributions.
  - Docker compose is fundamentally a markdown language.
  - It helps developers to specify their docker configurations as code.
  - Instead of manually configuring and initializing many docker containers, developers can use single configuration file
  - It doesnt add any functionality, but makes existing functionality easier to use.
 
  - Understanding configuration as a code is a key to understand "Docker Compose"
    Configuration consist of all settings that allow system to run such as data location, how to access/send messages and what environment spefific values to use
  - Docker compose is declarative. With compose, configuring a docker environment involves executing set of procedural steps in specific order.
    Each step relies on previous and have assumptions with it. There can be bugs if state of environment doesnt match with assumptions
    e.g:- If we build and run container. If we again try to execute same, it wont run as container is already in running state.
  - Docker compose allow us to specify desired end result and will execute any steps to reach teh result automatically. Using compose, we can re-run the command again (above e.g)
 
  **Configuration as a Code Advantages**
  
    - Configuration files can be checked into version control. We can revert to previous versions if the configuration ever breaks.
    - Its also self documenting (No need to remember commands)
    - Eay to manage multiple docker environments each with different configurations (Dev and QA). Each to have own configuration files
   
    _**Uses of Docker Compose**_
    - Well suited for local development and staging server or CI testing environment.
      (Not suited for distributed environments and has no tooling for running containers across multiple hosts.
      (Not ideal for traffic environments such as production)

  Examples :- Our application has storefront(for selling) and scheduler(professional equipment installation). If our frontend has temporary increase in web traffic due to sale.
              To scale up multiple instances of frontend we need to run docker compose configuration on multiple hosts which will also scale up scheduler at same time (which we dont need)


  -----------------------
  Docker Compose Handson
  -----------------------
  - Create configuration file (.yaml) inside application directory. (YAML :- Yet Another Markup Language, used for data serialization) (docker-compose.yaml)
    1. First line of file will be version of docker compose
    2. Services :- Used to specify all containers application needs to run
       Our app storefront relies on mySql for database on backend. So under services, define our first service "storefront". Provide compose with instructions for creating storefront docker container. If we want to build image locally, inside storefront provide build and provide path to dockerfile.
       Define second service named database (MySql already provides images from dockerhub to download, so no need to build images). Just provide image name as parameter and it will fetch image from dockerhub.
   
       <img width="781" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/b9442dcd-95f2-47fd-8259-d051f4f80c34">


       _Note:- Here we can provide service name according to our convenience_

**Docker commands**

- Docker compose provides many commands for managimg lifecycle of docker services.
- Most common are up, down, stop and restart. All commands start with "docker-compose"

1. To start all services defined in yaml file :- docker-compose up
- This will build docker images for each of the defined services, create containers and start them
  If we've large software system with many services and we're working on only one piece of it, we may not want to start up every single service. We can pass the service name to docker compose command to start only that service.

2. To stop the services running :- docker-compose down
- This will delete all the running containers and will remove any artifacts created as part of docker-compose up.
  In local development, docker-compose stop is useful for simply saving battery life and free up memory. Whereas docker-compose down is more aggressive and helpful if we've made changes to the running application

3. To stop and start the running containers :- docker-compose restart
- This is super convenient for fixing random system errors

--------------------
Build Arguments
------------------
- Build arguments and environment variables make docker builds more flexible.
- Environment variables in docker are visible from inside the running container. Build arguments are type of environment variable that are available to docker only at build time but not inside the container.
- Build arguments are useful for things like specifying a version for certain build tool or cloud platform configuration.
  If docker container is hosted in multiple regions, it becomes easy to switch between regions while using the same singular dockerfile.

  <img width="778" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/48880747-1ed0-47f4-8e1c-b9c79d3ef7e4">

- The most common use of environment variable is for specifying things like current runtime environment such as dev/test. This can be used for logging or enabling a feature flag.
- Instead of naming each environment variable individually, compose also supports passing in file paths to an environment configuration


       
    
