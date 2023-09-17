# docker-jupyter-notebook

## build

```shell
docker build -t notebook .
```

## run

```shell
docker run -p 8888:8888 notebook
# or use docker compose
docker-compose up -d
```
If you want to run your services in the background, you can pass the ‍‍`-d` flag (for “detached” mode) to `docker-compose up -d` and use `docker-compose ps` to see what is currently running.


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

[官方参考文档](https://jupyter-server.readthedocs.io/en/latest/operators/public-server.html)