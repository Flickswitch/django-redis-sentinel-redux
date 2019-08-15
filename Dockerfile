FROM ubuntu:16.04

MAINTAINER danigosa <danigosa@gmail.com>

RUN apt-get update && apt-get install -y -qq \
    python-pip \
    openssh-server

RUN pip install --upgrade pip

RUN pip install "django-redis==4.5.0" "django-redis==4.5.0" "redis==2.10.5"  "fakeredis==0.8.1" "funcsigs==1.0.2" "hiredis==0.2.0"  "mock==2.0.0" "msgpack-python==0.4.8" "pbr==1.10.0" "six==1.10.0"

RUN mkdir /django-redis-sentinel

COPY . /django-redis-sentinel
WORKDIR /django-redis-sentinel
VOLUME /django-redis-sentinel
COPY entrypoint.sh /

# Enable OpenSSH for remote interpreters like pydev or Pycharm
# Expose SSH for development purposes
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/prohibit-password/yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
