/*
 * @Description:首页
 * @Author: iamsmiling
 * @Date: 2021-04-19 21:05:01
 * @LastEditTime: 2021-04-19 22:26:18
 */


const Mock = require('mockjs')
const Router = require('koa-router')
const { Random } = require('mockjs')


const category = new Router()

Random.extend({
    category: function(date) {
        var constellations = ['https://i.loli.net/2021/04/15/yDbnXQmZTH6tu5I.png', 'https://i.loli.net/2021/04/13/t3M15Z8oQCSLAgb.png', 'https://i.loli.net/2021/04/13/SFUX5qwIz1yRVvJ.png', 'https://i.loli.net/2021/04/13/4djlszXmOnRDx7N.png', 'https://i.loli.net/2021/04/13/67rn3TmJ1Y4RIlu.png']
        return this.pick(constellations)
    }
})
// 子路由1
category.get('/category', async ( ctx )=>{
    // let data = Mock.mock({
    //     // 属性 list 的值是一个数组，其中含有 1 到 10 个元素
    //     'list|1-10': [{
    //         // 属性 id 是一个自增数，起始值为 1，每次增 1
    //         'id|+1': 1
    //     }]
    // })

    let data={
        "code": 0,
        "message": "success",
        "images|5":Random.image('250x250'),
        "data": [{
            "category_id": 2,
            "category_name": "窗帘",
            "category_pic": "http://buyi.taoju5.com/upload/goods_category/2021041302444052787.png",
            "child_list": [{
                "category_id": 2,
                "category_name": "全部窗帘",
                "category_pic": "http://buyi.taoju5.com/upload/goods_category/2021041302444052787.png"
            }, {
                "category_id": 38,
                "category_name": "型材",
                "category_pic": "http://buyi.taoju5.com/upload/goods_category/2021041302445600750.png"
            }, {
                "category_id": 21,
                "category_name": "百叶帘",
                "category_pic": "http://buyi.taoju5.com/upload/goods_category/2021041302450774445.png"
            }, {
                "category_id": 20,
                "category_name": "窗纱",
                "category_pic": "http://buyi.taoju5.com/upload/goods_category/2021041302452310151.png"
            }, {
                "category_id": 18,
                "category_name": "卷帘",
                "category_pic": "http://buyi.taoju5.com/upload/goods_category/2021041302454477768.png"
            }, {
                "category_id": 17,
                "category_name": "布艺帘",
                "category_pic": "http://buyi.taoju5.com/upload/goods_category/2021041302460843825.png"
            }]
        }, {
            "category_id": 1,
            "category_name": "抱枕",
            "category_pic": "http://buyi.taoju5.com/upload/goods_category/2021041302210900448.png",
            "child_list": [{
                "category_id": 1,
                "category_name": "全部抱枕",
                "category_pic": "http://buyi.taoju5.com/upload/goods_category/2021041302210900448.png"
            }, {
                "category_id": 36,
                "category_name": "抱枕",
                "category_pic": ""
            }]
        }, {
            "category_id": 23,
            "category_name": "搭毯",
            "category_pic": "",
            "child_list": [{
                "category_id": 23,
                "category_name": "全部搭毯",
                "category_pic": ""
            }, {
                "category_id": 37,
                "category_name": "搭毯",
                "category_pic": ""
            }]
        }, {
            "category_id": 22,
            "category_name": "床品",
            "category_pic": "",
            "child_list": [{
                "category_id": 22,
                "category_name": "全部床品",
                "category_pic": ""
            }, {
                "category_id": 24,
                "category_name": "六件套",
                "category_pic": ""
            }]
        }],
        "title": "商品分类"
    }
    
    ctx.body = data
  })

module.exports.category = category;