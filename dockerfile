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

EXPOSE 8888                                        
CMD ["jupyter", "notebook","--allow-root","--ip=0.0.0.0","--port=8888","--no-browser","--config=./conf.py"]