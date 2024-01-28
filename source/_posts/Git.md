---
title: Git
date: 2024-01-23 02:30:08
tags:
---
`git config --global user.name "name"`

```git config --global user.email "email"```

`ssh-keygen -t rsa -C "email"`

`ssh -T git@github.com`

```	
	Host github.com 
	User 注册github的邮箱
	Hostname ssh.github.com 
	PreferredAuthentications publickey 
	IdentityFile ~/.ssh/id_rsa 
	Port 443
```