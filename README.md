# README
合肥全栈营魔改大赛多人协作练习作品

should have
1.用户可以收藏喜欢的商品
分支:goods_collection
目标功能:用户通过点击"加入收藏"，可以收藏商品，也可以点击"取消收藏"，从而取消商品的收藏
功能所在位置:product/show.html.erb可以进行“加入或取消收藏”
           navbar上，用户可以点击下拉菜单，点击"我的收藏"查看已收藏的商品

should have
1.用户可以点赞或踩商品
分支:xyy_goods_vote
目标功能:用户通过点击点赞图标可以对商品点赞，点击踩图标，可以踩商品,一个用户只能对一种商品分别点赞一次和踩一次
功能所在位置:product/show.html.erb可以进行“点赞或踩”

2017-5-4 hk-rollbar
新增rollbar这个gem，可以在heroku上面debug。

2017-5-8 hk-search
使用ransack这个gem来实现搜索功能。首页增加搜索框，增加搜索结果页面。

