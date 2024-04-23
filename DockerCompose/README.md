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

  Examples :- Our application has frontend(for selling) and scheduler(professional equipment installation). If our frontend has temporary increase in web traffic due to sale.
              To scale up multiple instances of frontend we need to run docker compose configuration on multiple hosts which will also scale up scheduler at same time (which we dont need)
