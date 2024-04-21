Accessing container network services from your host. Docker provides ability to access network ports within the conatainer with concept of "Port Binding".
------------------------------------------------------------------------------------------------------------------
**Port Binding :- Allows docker to take port on your machine and map it to the port within the container**
------------------------------------------------------------------------------------------------------------------

1. Create a Docker Image from Docker file

_**Command :- docker build -t my-web-server -f web-server.Dockerfile .**_
<img width="782" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/6650c78e-3234-406c-b438-520a5c5635b1">

2. Start a Container with Docker run and background it with dash d and provide name of image
We can also name our containers with --name flag

_**Command :- docker run -d --name my-web-server my-web-server**_
<img width="766" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/bed336bf-eccb-43fd-904c-420e49a02414">

Here, we dont get port mapping in column

3. To check logs of container

_**Command :- docker logs my-web-server**_
<img width="779" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/66aefe61-b645-46bf-9913-a03aa1926a6a">

If we go to the localhost:5000, we can see we cant access it. Thats because we need to map port 5000 from within the container to the port on our machine.

4. Now stop and remove the container

_**Command :- docker rm -f my-web-server**_
<img width="779" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/8cf55f51-61d3-4ba1-99cf-c9fec733d675">

5. Mapping ports
Add -p to tell docker to bind ports.
First number is the port on our host that we want to map : Number of port we're exposing within our container
Outside of the container (machine) : Inside of the container

_**Command :- docker run -d --name my-web-server my-web-server**_
<img width="766" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/db6513e7-7740-4a1b-8016-c6d323401412">

Now go to localhost:5001 which is localhost on our machine. The link will be accessible. Below is the output:-
<img width="753" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/343ee80f-957b-403a-b93f-2d5ef72e2822">










