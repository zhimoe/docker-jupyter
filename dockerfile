FROM python:3.11.5
RUN  apt update
RUN pip3 install jupyter pandas numpy seaborn scipy 

# Add Tini. Tini operates as a process subreaper for jupyter. 
# This prevents kernel crashes.
COPY ./tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]


RUN useradd -ms /bin/bash jupyter
COPY ./* /home/jupyter/
USER jupyter
WORKDIR /home/jupyter 

# 只是声明容器使用8888，但是不会做host:container port映射， 需要在docker run指定或者compose中指定
# 需要和conf.py中c.NotebookApp.port一致
EXPOSE 8888

CMD ["jupyter", "notebook","--allow-root","--config=./conf.py"]