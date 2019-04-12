<div>
  <img style="display: block; margin: 0 auto;" src="https://raw.githubusercontent.com/syhsyh9696/library-seats-api/master/public/logo_long.png" alt="" />
</div>
[![Build Status](https://travis-ci.org/syhsyh9696/library-seats-api.svg?branch=master)](https://travis-ci.org/syhsyh9696/library-seats-api) 
[![License](https://img.shields.io/github/license/syhsyh9696/library-seats-api.svg)](https://github.com/syhsyh9696/library-seats-api/blob/master/LICENSE)

---
# 懒觉助手 考研克星

---
## 首先确认

让我们首先确定一个问题，你究竟想如何解决这个问题，假设你要出门

* 一堆零件拼一台车然后出门
* 找一台车直接出门

第一直觉是前者的建议你考虑
1. [iozephyr's solution](https://github.com/iozephyr/UJN-Lib-Seat-API) Python version.
2. [Jovian gem](https://github.com/syhsyh9696/Jovian) Ruby version. [未完工] (当然啥时候完工看心情

当然第一直觉为后者的就来对了地方咯  
* 这里是不一定啥时候存活的存活也不一定能用的[demo](104.168.171.175:3000)

## 它为啥叫Jovian这个奇怪的名字
[Jovian是谁](https://en.wikipedia.org/wiki/Jovian_(emperor))  
Jovian 大概统治了8个月，从新学期开始到12月考研大概也是8个月，所以希望它在这八个月中发挥它最大的作用，回笼觉愉快~

## 它是什么  
这是一个简单的基于Ruby + Rails + Rake的定时任务处理，还有Sidekiq用于定时任务
用于解决早起预约座位的痛苦,理论上是支持所有利昂图书馆管理系统

## 它有什么功能
基于Jovian gem的早期版本，利用crontab创建出的自动预约座位的服务，主要功能有  
* 五点定时触发座位预约任务  
* 座位预约成功后自动实现开场前签到

## 它怎么搞得  
* Ruby - Programmer's best friend.  
* Rails - 世界人民都知道  
* Rake - 动态语言界的Make  
* Gem: grape - API创建就靠这个  
* Gem: whenever - 利用Ruby创建Crontab任务的DSL  
* Gem: Sidekiq - 自动签到就靠它了
* Redis - 楼上的依赖
* Crontab - 你的服务器都有

## 你需要什么来部署这个有趣的玩意呢  

* Ruby version >= 2.3.0  
* Rails version >= 5.0.0  
* System dependencie: Linux 啥发行版都行了你只要能掌握  
* Redis
* Database initialization: Check ./config/database.yml  
* Database creation: 'rake db:create'

## 需要执行什么命令呢

* Redis装好就自动启动了吧如果全默认的情况下
* Rake - 'rake db:create'
* Rake - 'rake db:migrate'
* 然后怎么把database_ujn文件夹下的一对数据搞到数据库里就看你咯
* Gem(whenever) - 'whenever -i'
* 启动Sidekiq
* 启动Rails服务

## 当然这里是废话

* 如果你有什么新奇的想法可以在这里给我提issue哦,我一定会看会做的(变态的任务不干)
* 你有什么不熟练的可以在Telegram找我哦, @syhsyh9696
