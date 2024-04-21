----------------------------------------------------------------------------------------------------------------------
Saving Data from Containers
----------------------------------------------------------------------------------------------------------------------
Containers are meant to be disposable. When they are deleted, all data is deleted.

Use "docker run --rm" to create and immediately remove a simple ubuntu container. 
Use "--entrypoint sh" to tell docker that we want to run a shell command.
Provide name of the image ubuntu.
At the end of command, send text "Hello there" to a file called /tmp/file with the echo command and print it with cat command
-c "echo 'Hello there.' > /tmp/file && cat /tmp/file"

So final command will be
_**Command :- docker run --rm --entrypoint sh ubuntu -c "echo 'Hello there.' > /tmp/file && cat /tmp/file"**_

But when we try to print this file on our machine, we get error
Everything created within container, stays within container. Once container gets deleted, data also gets deleted. This is very inconvenient for containers that need to save stuff after exiting.
<img width="771" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/50fde0fa-5cb0-4fa9-b0aa-f0acf71b0daa">


Here, we can use Volume Mounting feature of docker 

Volume Mounting :- Allows docker to map a folder on your computer to a folder in container. Can be done with -v or --volume
Outside (Folder on machine) : Inside (Folder within container to map it to)

Command :- _**docker run --rm --entrypoint sh -v /tmp/container:/tmp ubuntu -c "echo 'Hello there.' > /tmp/file && cat /tmp/file"**_
<img width="783" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/06f4bd28-3c8a-41ad-8041-b1b4269922fb">
Now there will be a file inside "/tmp/container" which has our output string

We can also do like to map files on local to that with on container.
If we try to map file on computer which does not exist, it will be mapped as directory within container
<img width="782" alt="image" src="https://github.com/Shubham0315/docker-CLI/assets/105341138/abdb7301-ccde-47cf-b8b2-7fa2d5309fbc">


