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
  - Docker compose allow us to specify desired end result and will execute any steps to reach the result automatically. Using compose, we can re-run the command again (above e.g)
 
  **Configuration as a Code Advantages**
  
    - Configuration files can be checked into version control. We can revert to previous versions if the configuration ever breaks.
    - Its also self documenting (No need to remember commands)
    - Easy to manage multiple docker environments each with different configurations (Dev and QA). Each to have own configuration files
   
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

  <img width="785" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/2611987c-05a4-430c-8eb4-086ac9012d74">


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

1. To specify build argument in docker-compose.yaml file, we have to change the buld path syntax from shorthand to more explicit syntax.
  The docker build path value which was simply dot, is now moved to its own attribute context which is nested under the build parameter.

  <img width="233" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/46ebf670-b3dd-4f26-a09c-7e1011d8d960">

2. At the same nesting level as context, add another attribute "args". Under it add an number of named build arguments in list format.
   Syntax :- argument_name=argument_value

   <img width="202" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/29556f60-68a2-4bbb-8a5f-428b4ba4a809">

- The most common use of environment variable is for specifying things like current runtime environment such as dev/test. This can be used for logging or enabling a feature flag.

3. To pass environment variable to docker container using compose under the named service add an attribute environment. Then in list format include any environment variable that should be accessible to that container using same syntax as build arguments.

  <img width="275" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/2e6311a0-d109-4200-99d7-a4b1b8561472">


  We got below error while running docker compose up for the services earlier
  
  <img width="758" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/eff940a6-d640-4568-a708-b231851046c2">

This is due to mySql docker image relies on several environment variables for specifying root password, user credentials and a database. In above image, we can see we have missed environment variables so error occurs.
We can replace environment with env_file and below taht include paths to any environment files you want the docker container to have access to.

<img width="385" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/32491316-e5b0-4a6f-90b9-941fdd86ff24">

We can create env_vars file which will provide environment variables required for mySql container to run.
- Instead of naming each environment variable individually, compose also supports passing in file paths to an environment configuration

  <img width="781" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/23f7e5e3-c889-4c6c-aa2d-4848904f9890">

  
--------------------
Mounting Volumes
------------------
- Volumes are docker construct used for persistent storage, so that even when container stops running important data doesnt get deleted.
- Mounting volume to docker service, we need to specify target with source and mode as well.
- Target refers to directory path inside running container whre this volume data will live.
- In docker-compose.yaml, add volume object to service that needs to access the volume. Under the object, we'll specify the target path
- It is also important to specify source which is where the volume data lives on host machine outside of any containers.
  If source is ot specified, compose will create source volume automatically  (source:target)
  This would mount data in host of mysql folder onto the data directory of running mysql container.
- We may want to specify access modes. Default is read-write (RW) but if app only need to read persistent data and not to update it, set access mode to read-only(ro)
  So our complete syntax becomes :- source:target:mode

  <img width="535" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/555b1ef6-3836-47d7-aab3-9de7e894f431">


 --------------------
Named Volumes
------------------      
- If we want compose to manage volume lifecycle along with container lifecycle, it is recommended to use named volumes
- Previously we mounted nameless volume to /var/lib/mysql. This would persist any database data written inside the container and store i on host machine.
- This would create new random volume each time docker compose up runs. To name volume, below services object define new object called volumes with a named object nested underneath it.
- Now instead of specifying source path when mounting service volume, specify volume name.

<img width="776" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/f480c93a-46cf-4f65-8930-0085a537b20b">

- When running up or restart, compose will auto copy volume data from old to new containers and ensure no data is lost.
- If we run docker compose down --volumes, it will auto delete named volumes so memory is released.
 
--------------------
Exposing Ports
------------------ 
- Using docker, entire app can be fully encapsulated inside single container. But by default, things outside of container cannot access or communicate with anything running inside of container.
- Containerized services usually need to communicate with each other or with outside world and developers typically want to access containerized app via local host. We can do that exposing port that maps from host machine to container.
- Without docker compose, we have to add port mappings when we run each container. Difficult to remember port for each dockerized service. Also same port cannot be exposed twice on same host machine. This is where compose comes in.
- Using compose we can document every port mapping for every service.
- Our kinetico app, where storefront and scheduler both run on port 80 which is default port for many apps receiving web traffic. Mapping both apps on port 80 on same host will cause port collision.
  To avoid collision , map port 81 on host to 80 on scheduler
  Internally scheduler is still receiving traffic on port 80 inside of container, but to access app from host machine we can use 81.
- Port mappings use syntax :- host port no :container port no
- In yaml file, below storefront add port 80 of host to map to 80 of container. For scheduler, use 81 on host to 80 on container.

  <img width="779" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/c786e527-12be-445a-aa4d-78bc6cb6d0a0">

- Docker service may be performing different functions over multiple ports.
- Exposing ports is one of the most common use cases for docker compose given that basically every docker container will need some way to communicate with outside world.

---------------------
Enforcing Startup Order
------------------ 
- Many common app architectures have service dependencies
- To run app container we need to make sure db container is running (storefront)
- In yaml file, we can add "depends-on" object. Then we can provide service names in list format.

  <img width="354" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/a5333222-41a5-4596-8873-f44118a291af">

- Now compose up will start services in dependency order. Start up db first, then start storefront.
  Down will stop storefront first and then db.
- Services can have any number of dependencies and many services can share single dependency.
  Docker-compose up storefront --> will start all of its dependencies automatically.

  <img width="778" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/8a0ea9f4-8821-4ed9-8459-fe1fc0df9bdb">

- Modern versions of compose dont guarantee that dependent containers are running or are healthy. They only state started. So uptime is not guaranteed.
  Thats because in distributed system,it is not possible to know depndent service, db or app is always up and running.No service will have 100% uptime.
- In rare and specific use case that a dependent service must be running before a container start, there are 3rd party tools. They will wrap container's initialization command so that container will not start if dependency is unhealthy.
  This is called tight copuling and is not recommended in Distributed Systems.

---------------------
Name Subnets of Services
------------------ 
- Docker compose provides utility to start named subsets of services inside single docker-compose.yaml file
- In larger organisation, its fairly common to see clusters of docker containers that are frequently run together but dont necessarily explicitly depend on each other.
- Our kinetico app, one group is responsible for storefront and other for scheduling.
  To save processing power, storefront dev group doesnt want scheduler containers running on their local machines and scheduling group doesnt want storefront containers running
  Here we wont want separate docker compose files as containers sometimes need to run together.
  This is where service profiles come in.
- Service profile allows you to put docker service in one or more categories

- In yaml file, under storefront service, use profiles keyword and then list one or more profile names. Do same for scheduler.

  <img width="485" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/bcd01b9d-9ef9-4006-8c33-4750dbf80922">

  Now both of them depend on database, database need to be included in both profiles. If we dont assign profiles to DB service, it will be auto included in default profile. That means it will run all the time with every service profile.
  We can also add multiple profiles for database.
- Once default profile is specified in configuration, docker compose commands will only apply to that service if its profile is explicitly enabled.
  Means running docker compose up will run only services which are part of default profile.
  - To run only storefront related services
    _**Command :- docker compose --profile storefront_Services up**_

  <img width="781" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/b1ef5edf-6c37-4936-b1da-ce0a07cddebf">

-----------------------
Multiple Compose Files
-----------------------
- Having multiple compose file is valuable sometimes than to use tools like service profiles.
- In staging and teesting env we might need two files as we will never have local and staging configurations running on same host machineat same time.
- Developer at some time might want to run whole system at once.So having multiple files is not good use case.

- By default compose will read two configuration files - docker-compose.yaml and docker-compose.override.yaml
  Override file essentially inherits from main config file
  Docker compose will merge two files together
- Unlike primary file, override file doesnt need to be complete to be valid. It can contain snippets of configuration which are overridden.
  One docker compose configuration can be easily shared between multiple projects or repositories.
- It is also possible to have multiple overdide files in same repo. We can replace override file with filename we want.
* We've 2 file local and staging as below with env varibale overrides.

  <img width="775" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/e452ad3e-7301-4afa-b726-5d8c5ff4196a">

To run configuration file overrides, use -f flag which stands for file.
- To run all containers in local development overrides. First original yaml and then override.

  **Command :-  docker-compose -f docker-compose.yaml -f docker-compose.local.yaml up**

  <img width="781" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/ab55659e-b65f-4a0f-90ac-f7803feb1347">

  Overriding a compose file makes it extremely easy to support different configuration variables in different environments.

  
-----------------------
Environment Variables
-----------------------
- If our docker compose configurations need to have different behaviours in different environments, but we dont want configuration overrides for every environment, we can use "Environment Variables"
- Previously we discussed, passing environment variables into running docker containers. We can do same by passing env variables from host machine shell to composed configurations.
- Env variables are most commonly used for tags, versions, ports to make our compose file flexible in any environment.
- Syntax for accessing env variables is $env_variable

<img width="290" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/c53d97b4-5964-4845-a2c4-7a0002d6125b">


- If tag variable is not set in host environment, docker will default to an empty string
  There are other ways to specify default :- In config inline, in external env file.
- Simplest is inline syntax
- If we have env file by different name or if its outside of project directory, we can pass file using --env-file flag.
- Any env variable that is set in shell will always override a default value whether the default is set inline or in env file. 



- 
