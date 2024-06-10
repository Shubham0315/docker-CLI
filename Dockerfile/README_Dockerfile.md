**Dockerfile Contents**

- FROM :- Tells docker which existing docker image to get your docker image from. This can be any image either from local or internet. Used to define base image for our container

- RUN :- To execute commands while we build images

- USER :- Tells docker which user to use for any dockerfile commands underneath it (By default docker uses "root" user)

- COPY :- Copies files from directory provided to the docker build command to the container image. The directory provided to docker build is called the "Context". The context is usually your working directory. To copy files from server to container.

- WORKDIR :- To create directory for our container and its contents.

- ADD :- To copy files from server to container and also download files from internet and send to container.

- RUN :- Run statements are commands that customize our image. To install software or configuration files needed for your application.

- ENTRYPOINT/CMD :- Tells docker what command containers created from this image should run. To execute commands.

- EXPOSE :- To publish ports for our application to run

---------------------------------------------------------------------------------------------------------------------------
Difference between CMD and ENTRYPOINT
---------------------------------------------------------------------------------------------------------------------------

- Entrypoint has high priority
- Both are start commands
- Entrypoint cannot be changed. Anyone cannot overwrite value in image. Main executables need to be passed in entrypoint they are unchanged throughout the runtime
- In CMD, we can pass configurable parameters. Here we can pass port, IP (changeable parameters)
---------------------------------------------------------------------------------------------------------------------------
Use dockerfile to Build Image and Run Container
---------------------------------------------------------------------------------------------------------------------------

- Lets build docker image from dockerfile

Command :- docker build -t my-first-image .
Execute above command going into the context/directory of our docker file for this image
<img width="785" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/bba56aee-ded4-4675-a119-6ac13d1b8f84">

In above scnap, we can see after every step image ID is generated. These are intermediate images. After each command in dockerfile is executed, image ID is generated. 
This is because, docker images are layers of images compressed together. So docker creates image for every command in our dockerfile.
When docker finishes reading dockerfile, it squeezes all images together into a single image.

- Now lets run a container from image

Command :- docker run my-first-image
<img width="779" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/4551ace2-245d-4104-a398-dab524241a31">

