FROM ubuntu
LABEL maintainer="Shubham Haudge <shubham0315@devops.com>"

USER root
COPY ./server.bash /

RUN chmod 755 /server.bash
RUN apt -y update
RUN apt -y install bash

USER nobody

ENTRYPOINT [ "/server.bash" ]
