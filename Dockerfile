FROM scratch
COPY ./bin/l0l_pc_* /bin/l0l
COPY ./lib /
CMD ["/bin/l0l"]
