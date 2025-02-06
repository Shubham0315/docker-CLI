FROM ubuntu:latest                            #Spefify base image
LABEL maintainer="shubham@gmail.com"          #Set metadata
WORKDIR /app                                  #Set working directory inside the container
COPY .  /app                                  #Copy files from host to container

USER root                                     #Adding user as root will run below statement as it will get permissions to update and install packages via apt
RUN apt update && apt install -y python3      #Install dependencies
ENV APP_ENV=production                        #Set env var
CMD ["python3", "app.py"]                     #Define default command to run when container starts
