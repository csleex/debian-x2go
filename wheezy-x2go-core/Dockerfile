FROM debian:wheezy

MAINTAINER martinwangjian@gmail.com

# install X2GO Server
RUN apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E
COPY x2go.list /etc/apt/sources.list.d/x2go.list
RUN apt-get -q update 
RUN apt-get install -q -y --no-install-recommends x2go-keyring x2goserver x2goserver-xsession

# install ssh
RUN apt-get install -q -y --no-install-recommends pwgen openssh-server

RUN mkdir -p /var/run/sshd 
RUN sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config 
RUN sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config
RUN sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN sed -i "s/#PasswordAuthentication/PasswordAuthentication/g" /etc/ssh/sshd_config

COPY *.sh /
RUN chmod +x /*.sh

EXPOSE 22

CMD ["/run.sh"]