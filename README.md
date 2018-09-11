# README

## 卧槽你他妈的用来挣钱是不是有点过分呢？

## 不是我哦铁汁们┗|｀O′|┛ 嗷~~

## GPL GPL 懂8!

## 这是什么
这是一个简单的基于Ruby + Rails + Rake的定时任务处理中枢,
用于解决早起预约座位的痛苦,理论上是支持所有利昂图书馆管理系统

## 它有什么功能
* API(用户预约历史) - 利用这个配合Huginn可以创建出一套RSS服务

* Tasks - 解放你早上五点钟起来预约座位的痛苦

## 它怎么搞得
* Ruby - Programmer's best friend.

* Rails - 世界人民都知道

* Rake - 动态语言界的Make

* Gem: grape - API创建就靠这个

* Gem: whenever - 利用Ruby创建Crontab任务的DSL

* Crontab - 你的服务器都有

## 你需要什么来部署这个有趣的玩意呢

* Ruby version >= 2.3.0

* Rails version >= 5.0.0

* System dependencie: Linux(Ubuntu/Debian)

* Database initialization: Check ./config/database.yml

* Database creation: 'rake db:create'

## 需要执行什么命令呢

* Rake - 'rake db:create'
* Rake - 'rake db:migrate'
* Gem(whenever) - 'whenever -i'

## 当然这里是废话

* 如果你有什么新奇的想法可以在这里给我提issue哦,我一定会看会做的(变态的任务不干)

* 你有什么不熟练的可以在Telegram找我哦, @syhsyh9696

## 当然你很懒的话

* 你仍然可以在 @syhsyh9696 找我我把部署好的借给你用
