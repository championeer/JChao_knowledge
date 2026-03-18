---
title: "sub2api 部署指南（小白版）"
source: "https://x.com/boniusex/status/2031214312971448427"
author:
  - "[[Unknown]]"
published: 2026-03-10
created: 2026-03-10
description:
tags:
  - "clippings"
---
**先说清楚一件事：**

sub2api 是统一 API 网关，不是把 ChatGPT Plus 变成 OpenAI API 额度的工具。两者官方明确分开计费、分开权限。请只接入你自己或团队明确授权的账号 / API Key。

## 环境要求（跑之前确认）

- Ubuntu 22.04 或 24.04
- 有公网 IP 的 Linux 服务器
- 有 sudo 权限
- 云服务商安全组已放行 8080 端口

> 如果你用的是旧版 docker-compose，把下面所有 docker compose 改成 docker-compose 即可。

## 第一步：装 Docker

已经装过的跳过这步。

sudo apt update sudo apt install -y ca-certificates curl sudo install -m 0755 -d /etc/apt/keyrings sudo curl -fsSL [https://download.docker.com/linux/ubuntu/gpg](https://download.docker.com/linux/ubuntu/gpg) -o /etc/apt/keyrings/docker.asc sudo chmod a+r /etc/apt/keyrings/docker.asc echo "deb \[arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc\] [https://download.docker.com/linux/ubuntu](https://download.docker.com/linux/ubuntu) $(. /etc/os-release && echo "${UBUNTU\_CODENAME:-$VERSION\_CODENAME}") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null sudo apt update sudo apt install -y docker-ce docker-ce-cli [containerd.io](https://containerd.io/) docker-buildx-plugin docker-compose-plugin sudo systemctl enable --now dockersudo apt update sudo apt install -y ca-certificates curl sudo install -m 0755 -d /etc/apt/keyrings sudo curl -fsSL [https://download.docker.com/linux/ubuntu/gpg](https://download.docker.com/linux/ubuntu/gpg) -o /etc/apt/keyrings/docker.asc sudo chmod a+r /etc/apt/keyrings/docker.asc echo "deb \[arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc\] [https://download.docker.com/linux/ubuntu](https://download.docker.com/linux/ubuntu) $(. /etc/os-release && echo "${UBUNTU\_CODENAME:-$VERSION\_CODENAME}") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null sudo apt update sudo apt install -y docker-ce docker-ce-cli [containerd.io](https://containerd.io/) docker-buildx-plugin docker-compose-plugin sudo systemctl enable --now docker

验证安装成功：

docker --version docker compose versiondocker --version docker compose 版本

两条都能看到版本号，继续。

## 第二步：拉取部署文件

官方脚本会自动下载配置文件，并生成 JWT\_SECRET、TOTP\_ENCRYPTION\_KEY、POSTGRES\_PASSWORD，不需要手动填。

mkdir -p ~/sub2api-deploy cd ~/sub2api-deploy curl -sSL [https://raw.githubusercontent.com/Wei-Shaw/sub2api/main/deploy/docker-deploy.sh](https://raw.githubusercontent.com/Wei-Shaw/sub2api/main/deploy/docker-deploy.sh) | bashmkdir -p ~/sub2api-deploy cd ~/sub2api-deploy curl -sSL [https://raw.githubusercontent.com/Wei-Shaw/sub2api/main/deploy/docker-deploy.sh](https://raw.githubusercontent.com/Wei-Shaw/sub2api/main/deploy/docker-deploy.sh) | bash

执行完后，目录里会出现：

~/sub2api-deploy/ ├── docker-compose.local.yml ├── .env ├── data/ ├── postgres\_data/ └── redis\_data/~/sub2api-deploy/ ├── docker-compose.local.yml ├── .env ├── 数据/ ├── postgres\_data/ └── redis\_data/

## 第三步：配置管理员账号

把下面的邮箱和密码换成你自己的，直接复制执行：

cd ~/sub2api-deploy sed -i 's/^ADMIN\_EMAIL=.\*/ADMIN\_EMAIL=你的邮箱/' .env sed -i 's/^ADMIN\_PASSWORD=.\*/ADMIN\_PASSWORD=你的强密码/' .env sed -i 's/^SERVER\_PORT=.\*/SERVER\_PORT=8080/' .env sed -i 's#^TZ=.\*[#TZ](https://x.com/search?q=%23TZ&src=hashtag_click)\=Asia/Shanghai#' .envcd ~/sub2api-deploy sed -i 's/^ADMIN\_EMAIL=.\*/ADMIN\_EMAIL=你的邮箱/' .env sed -i 's/^ADMIN\_PASSWORD=.\*/ADMIN\_PASSWORD=你的强密码/' .env sed -i 's/^SERVER\_PORT=.\*/SERVER\_PORT=8080/' .env sed -i 's#^TZ=.\* [#TZ](https://x.com/search?q=%23TZ&src=hashtag_click) =Asia/Shanghai#' .env

确认写入是否正确：

grep -E '^(ADMIN\_EMAIL|ADMIN\_PASSWORD|SERVER\_PORT|TZ|JWT\_SECRET|TOTP\_ENCRYPTION\_KEY)=' .env

> ⚠️ JWT\_SECRET 和 TOTP\_ENCRYPTION\_KEY 由脚本自动生成，**不要清空、不要修改**。清空 JWT\_SECRET 会导致重启后所有登录会话失效；清空 TOTP\_ENCRYPTION\_KEY 会导致 2FA 失效。

## 第四步：启动服务

cd ~/sub2api-deploy docker compose -f docker-compose.local.yml up -d

查看服务状态：

docker compose -f docker-compose.local.yml ps

查看实时日志（确认启动正常后按 Ctrl + C 退出）：

docker compose -f docker-compose.local.yml logs -f sub2api

## 第五步：登录后台

浏览器打开：

http://你的服务器公网IP:8080

用第三步设置的邮箱和密码登录。

**打不开？先查这两个：**

1. 云服务商控制台 → 安全组 → 入站规则 → 确认 8080 端口已放行
2. 服务器本机防火墙：sudo ufw status，如果 8080 没在列表里，执行 sudo ufw allow 8080

## 第六步：后台初始配置

登录后在网页里操作，不需要再敲命令。

**1\. 创建分组**进入 Groups，新建一个组：

- Group Name：填你自己的名字，例如 my-group
- Platform：按你实际接入的平台选择

**2\. 添加上游账号**进入 Accounts，添加你的凭据。

只用这几种来源：

- 你自己的 OAuth
- 你自己的 API Key
- 团队明确授权给你的账号

**3\. 创建 API Key**进入 API Keys，新建一个给本地工具使用的 Key。

创建完成后，客户端配置填写：

- baseURL：http://你的服务器IP:8080/v1
- apiKey：你刚创建的 Key

通用 JSON 格式：

{ "provider": { "openai": { "options": { "baseURL": "http://你的服务器IP:8080/v1", "apiKey": "你的sub2api\_key" } } } }{ "提供者": { "openai": { “选项”： { "baseURL": "http://你的服务器 IP:8080/v1", "apiKey": "你的 sub2api\_key" } } } }

## 可选：加域名和 HTTPS

**先用 IP:8080 跑通，再来折腾这步。** 域名不是必须的。

最省心的方案是用 1Panel：

bash -c "$(curl -sSL [https://resource.fit2cloud.com/1panel/package/v2/quick\_start.sh](https://resource.fit2cloud.com/1panel/package/v2/quick_start.sh))"bash -c "$(curl -sSL [https://resource.fit2cloud.com/1panel/package/v2/quick\_start.sh](https://resource.fit2cloud.com/1panel/package/v2/quick_start.sh) ）

安装完后在 1Panel 里：

1. 安装 OpenResty
2. 创建反向代理网站
3. 将域名反代到 127.0.0.1:8080

之后 baseURL 改成 https://你的域名/v1 即可。

## 常用运维命令

cd ~/sub2api-deploy # 查看状态 docker compose -f docker-compose.local.yml ps # 查看日志 docker compose -f docker-compose.local.yml logs -f sub2api # 重启 docker compose -f docker-compose.local.yml restart # 停止 docker compose -f docker-compose.local.yml down # 启动 docker compose -f docker-compose.local.yml up -d

**需要备份的文件：**

~/sub2api-deploy/.env ~/sub2api-deploy/data/ ~/sub2api-deploy/postgres\_data/ ~/sub2api-deploy/redis\_data/

## 参考文档

- [sub2api README\_CN](https://github.com/Wei-Shaw/sub2api/blob/main/README_CN.md)
- [sub2api .env.examplesub2api.env.example](https://github.com/Wei-Shaw/sub2api/blob/main/deploy/.env.example)
- [Docker Ubuntu 安装文档](https://docs.docker.com/engine/install/ubuntu/)
- [1Panel 安装文档](https://1panel.cn/docs/v2/installation/online_installation/)
- [OpenAI：ChatGPT 订阅与 API 分开计费说明](https://help.openai.com/en/articles/8156019-how-can-i-move-my-chatgpt-subscription-to-the-api)