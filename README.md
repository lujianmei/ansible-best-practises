# heshop-ansible-infrastructure

本文档定义了Heshop基于Ansible的架构安装文档。

## 文档说明 ##

## 需求设计 ##


### 商品中心安装 ###

#### 基础部署依赖关系检查 ####
  * Java环境检查
  * Java环境版本检查
  * Maven环境检查
  * Maven环境版本检查
#### 安装环境初使化配置 ####
  * 用户账户配置
  * 用户权限配置
  * 目录初使化
  * Java环境安装
  * Java环境变量配置
  * Java环境安装
  * Maven环境变量配置
#### 商品中心代码构建 ####
  * 代码下载
  * 工程构建
  * 工程部署依赖调整
  * 工程部署配置调整
  * 工程构建过程反馈
  
#### 工程部署完成 ####
  * 应用部署完成环境检查

### 发布平台安装 ###
#### 基础部署依赖关系检查 ####

#### 基础部署依赖关系安装 ####

#### 发布平台代码下载 ####

#### 工程构建依赖检查 ####

#### 工程构建 ####

#### 工程部署依赖检查 ####

#### 工程部署配置调整 ####

#### 工程部署完成 ####


### 中间件安装 ###
#### 基础部署依赖关系检查 ####

#### 基础部署依赖关系安装 ####

#### 安装环境初使化配置 ####

#### 中间件安装件下载 ####

#### 中间件部署 ####

#### 中间件部署配置 ####

#### 中间件部署完成 ####


### 数据库安装 ###
#### 基础部署依赖关系检查 ####

#### 基础部署依赖关系安装 ####

#### 数据库安装 ####

#### 数据库优化修改配置 ####

#### 工程部署配置调整 ####

#### 工程部署完成 ####

#### 数据库脚本初使化 ####

### 应用整合及启动脚本 ###

### 多环境支持 ###

#### 不同服务器架构 ####

#### 不同服务器环境调整 ####

## 安装 ##

## 测试 ##

### 测试环境搭建 ###

`
cd vagrant
vagrant up
`
以上命令会启动6台coreos服务器，用于安装部署整体环境的服务器；如果想要修改创建的服务器数量，可以修改 ~Vagrantfile~ 文件中的$num_instances的数量即可；
It will start 6 coreos server, you could absolute change the $num_instances if you do not want to start up 6 server. 

### 插入服务器的免登录key ###

此命令适用于Mac及Linux环境下进行创建，暂时不支持windows

#### Automatic insert into iso ####

Change the ~vagrant/Vangrantfile~ there is a variable named: "insert_ssh_key_into_iso", you may change it to true, and make sure your current working environment is Linux, which the insert_ssh_keys_into_iso.sh can be run.

#### Manually insert ####

`
vagrant ssh core-0$num # to login into virtual server one by one
sudo passwd core  # to change the password
`
Then change password value in the copy_ssh_keys.sh file, execute:

`
./copy_ssh_keys.sh 
`

Or if you in MacOS, the script can not be ok, you need to change the ~copy_ssh_keys_onmac.sh~ and execute:

`
./copy_ssh_keys_onmac.sh
`

## Initial the python environment and startup coreos ##
`
cd k8s-core-infrastructure
ansible-galaxy install -r requirements.yml -p ./roles
ansible-playbook -i inventory/staging/hosts bootstrap-coreos.yml -D
`
Which will initial all coreos servers
Also, you will need to add all coreos virtual servers hostname and their ip address into you hosts file of current working environment.

## Initial kubernetes environment ##
`
ansible-playbook -i inventory/staging/hosts bootstrap-kubernetes.yml -D -e k8s_role_path="./roles/"
`
Run to install all kubernetes servers
