/*
 * @Description:首页
 * @Author: iamsmiling
 * @Date: 2021-04-19 21:05:01
 * @LastEditTime: 2021-04-19 21:24:07
 */


const Mock = require('mockjs')
const Router = require('koa-router')


 const home = new Router()
// 子路由1
home.get('/', async ( ctx )=>{
    let data = Mock.mock({
        // 属性 list 的值是一个数组，其中含有 1 到 10 个元素
        'list|1-10': [{
            // 属性 id 是一个自增数，起始值为 1，每次增 1
            'id|+1': 1
        }]
    })
    
    ctx.body = data
  })

module.exports.home = home;