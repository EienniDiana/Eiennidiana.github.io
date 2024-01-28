---
title: Git链接Github
date: 2024-01-23 02:30:08
tags:
---
`git config --global user.name "name"`
设置用户名

```git config --global user.email "email"```
设置用户邮箱

`ssh-keygen -t rsa -C "email"`
创建SSH

在Github中设置SSHKEY

`ssh -T git@github.com`测试连接

解决git 报错:

`ssh: connect to host github.com port 22: Connection timed out`

C:\Users\\%Userprofile%\\.ssh\文件夹下config中添加
```	config
	Host github.com 
	User 注册github的邮箱
	Hostname ssh.github.com 
	PreferredAuthentications publickey 
	IdentityFile ~/.ssh/id_rsa 
	Port 443
```