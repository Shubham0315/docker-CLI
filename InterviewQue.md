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

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
