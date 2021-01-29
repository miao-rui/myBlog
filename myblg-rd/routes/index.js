const router = require('koa-router')()
const Token = require('../auth/index')
const { index, post, detail, deleteBlog, comment ,search,reses} = require('../controllers/blog')

router.prefix('/blog')

//老师
// router.get('/detail', Token.verify, detail)
// router.get('/list', Token.verify, index)
// router.post('/post', Token.verify, post)
// router.post('/comment', Token.verify, comment)


//我
router.get('/detail', detail)
router.get('/list', index)
router.post('/post', post)
router.get('/delete',deleteBlog)
router.post('/comment', comment)
router.get('/search', search)
router.post('/reses',reses)

router.get('/json', async (ctx, next) => {
  ctx.body = {
    title: 'koa2 json'
  }
})

module.exports = router
