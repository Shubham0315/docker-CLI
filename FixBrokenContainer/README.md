1. Build Docker image from Dockerfile

_**Command :- docker build -t app .**_

<img width="781" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/4a45479c-bc02-4d36-886a-5b1999816b6f">

When we try to build image, we get above error as docker cannot find the image on our system/dockerhub
Here, we can either change the FROM image that we're using or we can go to dockerhub to find ubuntu image that actually exist.
If we check on dockerhub the "ubuntu:xenial" image exist still we are unable to build image. This is because in our dockerfile, the spelling of xenial is wrong.
After correctring and running docker build, we get desired output

<img width="781" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/0e1b5ac7-426a-49e3-8ea3-579c73f9ecb0">



2. Run container from built image

_**Command :- docker run -it Image_Name**_

When we do that the processing of container is very slow

<img width="781" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/ae2e3b4b-dbe3-4151-824f-1447bae42f95">

To check the issue, either check script or run docker top.

Check "docker stats Container_Name"

<img width="757" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/9d0b4f4d-9cee-4c80-bb41-6d7e086ef686">

As we can see in top command the "yes" in script is doing timeout for container. So remove "yes" line from script and rebuild image and run container.
This time our container will run faster

<img width="767" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/8f5dc6c6-af48-41d3-8174-aac0b5ec055a">



