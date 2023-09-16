# docker-jupyter-notebook

## run
```shell
docker run -p 127.0.0.1:8888:8888 notebook
```

## build
```shell
docker build -t notebook  .
```
## notes

1. password生成方式变化
7.0版本之前是`from notebook.auth`
7.0版本是`jupyter server password`或者`from jupyter_server import password`

2. 生成配置文件
```shell
jupyter server --generate-config
```

3. dockerfile 
```dockerfile
# Add Tini. Tini operates as a process subreaper for jupyter. This prevents
# kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

EXPOSE 8888
CMD ["jupyter", "server", "--port=8888", "--no-browser", "--ip=0.0.0.0"]
```
