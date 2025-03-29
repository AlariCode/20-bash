FROM rotorocloud/centos9s-sysd-ssh-master:moon-devstr01

RUN yum install -y pv nano expect dash bc && yum clean all

COPY scripts/ /usr/bin/

RUN cat /usr/bin/deploy.vt- | base64 -d > /usr/bin/deploy.vt \
  && rm -f /usr/bin/deploy.vt- \
  && chmod +x /usr/bin/builder* /usr/bin/lab* /usr/bin/clean-working-dir

COPY labs /labs

RUN chmod +x /labs/**/*.sh \
    && echo 'moon:selena' | chpasswd \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

#USER moon
