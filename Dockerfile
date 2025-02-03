FROM busybox
COPY ./bin /bin/
COPY ./inc /inc/
COPY ./lib /lib/
COPY ./src /src/
COPY ./tmp /tmp/
COPY ./etc /etc/
COPY ./etc/profile /root/.profile
COPY ./etc/profile /.profile
# CMD ["/bin/l0l_pc_dponyatov","/lib/l0l.ini"]
# CMD ["ls","-la","/"]
CMD ["/bin/sh"]
