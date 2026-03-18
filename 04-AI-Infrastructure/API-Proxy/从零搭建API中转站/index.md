---
title: "使用各种无良中转后，我掀桌了！一篇教你从0搭建中转站！"
source: "https://x.com/ResearchWang/status/2033023897684291814"
author:
  - "[[Unknown]]"
published: 2026-03-15
created: 2026-03-15
description:
tags:
  - "clippings"
---
**说真的，我受够了！**

这段时间我用过的中转站少说也有七八家，就没有一家让我省心的。便宜的怕被坑——用GLM冒充GPT-4😡。贵的也不见得好到哪去，经常超时断开。最离谱的是某家用了三个月突然跑路，钱直接打水漂，连客服都找不着人。

> **我掀桌了：不就是中转站吗，老子自己搭！**

今天我就把从0搭建中转站的完整流程整理出来，再也不看那些无良商家的脸色了！！！

# 📚 目录

- **第三方中转可能存在的隐患**
- **环境准备 ！（大家一定先准备好 ）**
- **中转站防风控关键，Cloudflare WARP 配置**
- **Cloudflare配置域名，服务器配置域名解析**
- **内网穿透 Cloudflare Tunnel 配置**
- **服务器Docker安装与Sub2Api配置**
- **安装Sub2Api**
- **完成账号池搭建**
- **将配置好的Sub2Api配置到OpenClaw，codex，Claudecode..**

## 推荐阅读：

> [1\. 《20r 搭建 GPT Business 账号池，超低成本使用 Openclaw》](https://x.com/ResearchWang/status/2027683428154675476)

> [2.《Openclaw高级Skills分享,内含最全Skills教程》-- 推荐阅读](https://x.com/ResearchWang/status/2029417736636645823)

> [3.《这些文件不懂，难怪你的OpenClaw又笨又傻》-- 深入了解OpenClaw](https://x.com/ResearchWang/status/2030151219998793775)

> **4.**[《从0到1建自建Skill，简化你的工作流》-- Skill制作技巧](https://x.com/ResearchWang/status/2030886234709733629)

> 5\. [《OpenClaw多代理协同实战教程》 -- 多Agents配置](https://x.com/ResearchWang/status/2032716395709141223)

**高级：**

> [《运用AI，造一个平行世界来预测现实》](https://x.com/ResearchWang/status/2031370561289597343)

> [《全网最安全的 OpenClaw 接入微信方法》](https://x.com/ResearchWang/status/2031913144805949615)

## 一 、第三方中转可能存在的隐患

在网上查了很多第三方中转爆出风险的事实，总结下来就是五个坑:

**第一坑：模型造假**——2026年CISPA发布的论文[《Real Money, Fake Models》](https://arxiv.org/abs/2603.01919)直接撕开了中转站行业的底裤，审计了17家主流中转站，发现近45%的中转站都在造假，测试失败率高达**45.83%**，性能差异约为**47.21%**

**第二坑：流量虚扣**——某些黑心中转站会伪造调用日志，对每次调用多计10%-30%的Token用量，或在后台批量生成无效请求暗中消耗用户额度

**第三坑：卷款跑路**——平台最爱打着“首充5折”“充100送50”的幌子拉新，收够钱后直接关站跑路，预付资金全部打水漂。

**第四坑：数据安全**——你的数据经过第三方中转站，对方想看就能看，商业机密、用户隐私全部暴露在别人手里。

**第五坑：服务不稳定**——某平台提交10个任务就只能成功2个，高并发时被风控，服务说挂就挂！

![图像](https://pbs.twimg.com/media/HDZCuzTaMAQxP4W?format=jpg&name=large)

## 二、搭建中转站的环境准备

1. **服务器VPS（ 腾讯云 Ubuntu 24.04 LTS ）**
2. **域名（**[域名注册购买\_域名注册选购 - 腾讯云](https://buy.cloud.tencent.com/domain?domain=Research%E7%8E%8B13&tlds=.com&from=domain-console&position=overview-input-search&_t=1773513473102) **-- 选最便宜的 10r）**
3. **闲鱼购买 Business 账号 （ 2个 ，找靠谱的！）**
4. **Cloudflare账号（Google账号）Cloudflare 账号（Google 账号）**
5. **Neon PostgreSQ L- 免费** （注册链接：[neon注册链接](https://neon.com/signup) ， 选服务器Vps 相同地区的，不然传输会有高延迟）

![图像](https://pbs.twimg.com/media/HDZIr5oaMAIFFl2?format=jpg&name=large)

**6\. Upstash Redis - 免费**（注册链接：[Upstash注册链接](https://console.upstash.com/auth/sign-in) ，同选服务器Vps 相同地区的）

![图像](https://pbs.twimg.com/media/HDZK2eQaMAAnbFj?format=jpg&name=large)

> 得到的 neon 和 upstash 的Token，如下：

```markdown
# neon
# 在 「Project dashboard」 界面，点击 「Connect string」 
# 点击 「Copy snippet」 出现下面链接
postgresql://neondb_owner:npg_9rHtzxb4NdSY@ep-plain-term-a15dqyl2-pooler.ap-southeast-1.aws.neon.tech/neondb?sslmode=require&channel_binding=require

# upstash 首页的 「Endpoint」 点击 Copy
redis-cli --tls -u redis://default:gQAAAAAAARiAAAIncDIzZDcxMmRiMWFkOWI0ODMxODg1YTg5YTE4MzRkOTZjZnAyNzE4MDg@concise-locust-71808.upstash.io:6379
```

## 三、中转站防风控关键，Cloudflare WARP 配置

> **1\. 服务器安装与配置 Cloudflare WARP**

```bash
# 1. 更新系统并安装必要的依赖工具
apt update && apt install -y curl gpg lsb-release

# 2. 获取并添加 Cloudflare 的官方 GPG 密钥（）
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg

# 3. 添加对应的软件源到系统列表中
echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/cloudflare-client.list

# 4. 更新软件列表并安装 WARP 客户端
apt update && apt install -y cloudflare-warp

# 5. 设置 WARP 服务开机自启，防止服务器重启后掉线
systemctl enable --now warp-svc
```

> **2\. 注册、启动与测试 WARP 代理**

```bash
# 1. 注册免费设备账号
warp-cli --accept-tos registration new

# 2. 将运行模式切换为“仅代理模式”（Proxy Mode）
warp-cli mode proxy

# 3. 设置本地 SOCKS5 代理监听端口（以 40000 为例）
warp-cli proxy port 40000

# 4. 连接到 Cloudflare WARP 网络
warp-cli connect

# 5. 验证本地端口是否监听成功
warp-cli status

# 6. 测试：使用 curl 挂载代理请求探针，验证出境流量是否已被接管
# 如果返回的文本中包含 "warp=on"，说明代理伪装成功！
curl --socks5-hostname 127.0.0.1:40000 https://1.1.1.1/cdn-cgi/trace
```

## 四、Cloudflare配置域名，服务器配置域名解析

相比于普通的域名解析，将域名托管给Cloudflare是给你的服务器添加保镖。传统的DNS会直接把你的真实服务器IP暴露在公网上，极易引来DDoS攻击和恶意扫描；Cloudflare通过其全球节点彻底隐藏你的真实IP，还能免费且自动地为你配置HTTPS加密证书！

> **1\. 进入** [Cloudflare Domain](https://dash.cloudflare.com/0e3f60448b5858ee72c3d3e03cbac4ac/home/overview)**，在左侧搜索搜 “Domains”，点击 「Onboard a domain」（****注意：不带 www 或 http://****）**

![图像](https://pbs.twimg.com/media/HDZS2K_aMAAcwkE?format=jpg&name=large)

> **选择 free plan ，Cloudflare 会自动扫描你的域名是否有绑定过其他 IP 点击continue，直到出现** [xxxxx.ns.cloudflare.com](https://xxxxx.ns.cloudflare.com/) [yyyyy.ns.cloudflare.com](https://yyyyy.ns.cloudflare.com/) **该页面不要关闭**

![图像](https://pbs.twimg.com/media/HDZT8iZa4AAQLT7?format=jpg&name=large)

> **去** [腾讯云管理页面](https://console.cloud.tencent.com/domain/all-domain/manage/domain-mb8bn4sq/basicinfo) **中将域名解析修改地址，点击「修改 DNS服务器」，解析成功会给你发邮件**

![图像](https://pbs.twimg.com/media/HDZUuvuacAAoE-3?format=jpg&name=large)

> **检测是否成功，如下图即成功**

![图像](https://pbs.twimg.com/media/HDZX-71a0AAYkrO?format=jpg&name=large)

## 五、内网穿透 Cloudflare Tunnel 配置

针对API中转业务，内网穿透神器（Cloudflare Tunnel），可以让你在云服务器不需要开放任何公网端口（如80或443）的状态下提供服务，实现了从防攻击、防风控到全自动加密

> 进入 [CF 的Zero Trust页面](https://one.dash.cloudflare.com/0e3f60448b5858ee72c3d3e03cbac4ac/networks/overview) ，点击 Manage Tunnels 按钮 , 点击 Add a Tunnel，随意取一个用户名

![图像](https://pbs.twimg.com/media/HDZamPUaMAAAIJp?format=jpg&name=large)

> **保存好 token**

```markdown
# 复制命令提取Token
docker run cloudflare/cloudflared:latest tunnel --no-autoupdate run --token eyJhIjoiMGUzZjYwNDQ4YjU4NThlZTcyYzNkM2UwM2NiYWM0YWMiLCJ0IjoiNmRkYmUzY2MtMzkzNy00ODk4LThiZWEtODViZDI5YWI0MjAzIiwicyI6Ik5tSm1NV0kyTnpFdFl6SXhNaTAwTURreExXSmlaR1l0WWpFNE4yWXdOMkpoTURSaCJ9

# token
eyJhIjoiMGUzZjYwNDQ4YjU4NThlZTcyYzNkM2UwM2NiYWM0YWMiLCJ0IjoiNmRkYmUzY2MtMzkzNy00ODk4LThiZWEtODViZDI5YWI0MjAzIiwicyI6Ik5tSm1NV0kyTnpFdFl6SXhNaTAwTURreExXSmlaR1l0WWpFNE4yWXdOMkpoTURSaCJ9
```

> **Subdomain留空， Domain** ：下拉选择你的 [researchwang13.space](https://researchwang13.space/) **， Path** ：**保持为空**。不要填任何东西 **Type**：下拉选择 **HTTP URL** ： localhost:443 **（我填的是 researchwang13:443 ，跟随着下一步Dock-composr.yml 的services name）**

![图像](https://pbs.twimg.com/media/HDZbYbMboAAG5Ou?format=jpg&name=large)

## 六、服务器Docker安装与配置

> **安装Docker**

```bash
# 1. 更新一下本地的软件包索引
apt update

# 2. 下载并运行 Docker 官方的安装脚本
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# 3. 检查验证 Docker 和 Docker Compose 是否安装成功
docker --version
docker compose version
```

> **配置 Docker-compose.yml 文件配置 Docker-compose.yml 文件**

```bash
# 创建专属项目目录并进入
mkdir -p ~/ResearchWang13
cd ~/ResearchWang13

# 使用 nano 创建并打开 docker-compose.yml 文件
nano docker-compose.yml

# 将以下完整配置粘贴到文件中（粘贴后按 Ctrl+O 保存，回车确认，再按 Ctrl+X 退出）：

version: '3.8'

services:
  researchwang13:
    image: weishaw/sub2api:latest
    container_name: sub2api_core
    restart: always
    network_mode: "host"  # 容器共享宿主机网络
    environment:
      - TZ=Asia/Shanghai
      - GIN_MODE=release
      - SUB2API_ENV=production
      - SERVER_PORT=8080
      - SERVER_HOST=0.0.0.0   # 监听所有网络接口
      - SERVER_HTTPS=false

      # ========================
      # 1. Neon 数据库配置
      # ========================
      - DATABASE_HOST=ep-plain-term-a15dqyl2.ap-southeast-1.aws.neon.tech
      - DATABASE_PORT=5432
      - DATABASE_USER=neondb_owner
      - DATABASE_PASSWORD=npg_9rHtzxb4NdSY
      - DATABASE_DBNAME=neondb
      - DATABASE_SSL_MODE=require

      # ========================
      # 2. Upstash Redis 配置
      # ========================
      - REDIS_HOST= 
      - REDIS_PORT=6379
      - REDIS_PASSWORD=gQAAAAAAARiAAAIncDIzZDcxMmRiMWFkOWI0ODMxODg1YTg5YTE4MzRkOTZjZnAyNzE4MDg
      - REDIS_USE_TLS=true

      # ========================
      # 3. WARP SOCKS5 可选配置
      # ========================
      # - HTTP_PROXY=socks5h://127.0.0.1:40000
      # - HTTPS_PROXY=socks5h://127.0.0.1:40000
      # - ALL_PROXY=socks5h://127.0.0.1:40000
      # - NO_PROXY=localhost,127.0.0.1,::1

  cloudflared:
    image: cloudflare/cloudflared:latest
    container_name: cloudflared_tunnel
    restart: always
    network_mode: "host"  # 使用宿主机网络，访问 Sub2Api
    command: tunnel run
    environment:
      - TUNNEL_TOKEN=eyJhIjoiMGUzZjYwNDQ4YjU4NThlZTcyYzNkM2UwM2NiYWM0YWMiLCJ0IjoiNmRkYmUzY2MtMzkzNy00ODk4LThiZWEtODViZDI5YWI0MjAzIiwicyI6Ik5tSm1NV0kyTnpFdFl6SXhNaTAwTURreExXSmlaR1l0WWpFNE4yWXdOMkpoTURSaCJ9
    depends_on:
      - researchwang13
```

> 启动 Sub2Api

```bash
# 1. 启动项目
docker compose up -d

# 2. 验证运行状态
docker logs -f sub2api_core
```

## 七、安装Sub2Api

> **进入你的域名 ，配置数据库的账号密码，根据 postgresql 进行配置**

![图像](https://pbs.twimg.com/media/HDZjwVWaMAAy82S?format=png&name=large)

> **配置缓存，根据 upstash 进行配置**

![图像](https://pbs.twimg.com/media/HDZkeE2bAAA6jWx?format=png&name=large)

> 配置管理员邮箱（自行配置），安装Sub2Api

![图像](https://pbs.twimg.com/media/HDZk5dla8AA3jKL?format=png&name=large)

## 八、完成账号池搭建

> 进入网页,创建分组

![图像](https://pbs.twimg.com/media/HDaxnxwbcAAabbc?format=jpg&name=large)

> 添加账号

![图像](https://pbs.twimg.com/media/HDZnwDXaMAE3h6B?format=png&name=large)

> 点击生成连接，新开窗口输入链接，登入GPT账号，将最后网址输入框中

![图像](https://pbs.twimg.com/media/HDZoixNaMAAfSaD?format=png&name=large)

> 账号链接测试，测试 Gpt-5.3-codex

![图像](https://pbs.twimg.com/media/HDaynBfaAAAup3L?format=jpg&name=large)

> 生成账号池Api

![图像](https://pbs.twimg.com/media/HDa07-FaMAQRhxP?format=jpg&name=large)

> 进入用户管理，给当前账号充值

![图像](https://pbs.twimg.com/media/HDa0pNdaMAI9pDh?format=jpg&name=large)

## 九、将配置好的Sub2Api配置到OpenClaw，codex，Claudecode..

大家加我小群，一起交流哈...

大家在配置中有问题在群里交流，一个一个回复太费劲了xdm

![图像](https://pbs.twimg.com/media/HDbAEAyaMAQcpMI?format=jpg&name=large)