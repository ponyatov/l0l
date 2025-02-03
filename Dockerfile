FROM scratch
COPY ./bin/* /bin/
COPY ./doc/*.md /doc/
COPY ./inc/* /inc/
COPY ./lib/* /lib/
COPY ./src/* /src/
COPY ./tmp/* /tmp/
CMD ["/bin/l0l_pc_dponyatov","/lib/l0l.ini"]
