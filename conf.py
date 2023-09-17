
c = get_config()  #noqa

c.NotebookApp.open_browser = False
c.NotebookApp.ip='*'
c.NotebookApp.port =8888 # 注意和docker的端口映射
c.NotebookApp.password = u'argon2:$argon2id$v=19$m=10240,t=10,p=8$U8h8IJP0YcG7AwDdNeadsA$xmV0CD3G6UQl9YngYu18V3eY5TKN9CritvxX7OguSu8'


c.ServerApp.notebook_dir = '/home/jupyter'
c.ServerApp.allow_remote_access = True

