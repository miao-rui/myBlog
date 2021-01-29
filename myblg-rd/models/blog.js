const query = require('../models/db');

module.exports = {
    getBlogs() {
        return query('SELECT * FROM t_blog order by blog_id desc')
    },
    getblogdetail(blogId) {
        return query('SELECT * FROM t_blog where blog_id=?', blogId)
    },
    saveblog(blog) {
        console.log(blog);
        return query('INSERT into t_blog set ?', blog)
    },
    getBlogById(blogId) {
        return query(`
        SELECT blog.*, comm.comm_id, comm.content as comm_content, comm.post_time as comm_post_time, usr.username 
        FROM t_blog blog  LEFT JOIN t_comment comm 
        ON comm.blog_id=blog.blog_id 
        LEFT JOIN t_user usr ON comm.user_id=usr.user_id
        WHERE blog.blog_id=?`, [blogId]);
    },
    deleteBlogById(blogId) {
        console.log(blogId)
        return query(`DELETE FROM t_blog WHERE blog_id=?`, [blogId]);
    },
    saveComment(comment) {
        return query("INSERT into t_comment set ?", comment)
    },
	searchBlogs(message){
		return query(`SELECT * FROM t_blog where title like "%${message}%"`)
	},
	getCommRes(commId) {
	    return query('SELECT * FROM t_res where comm_id=?', commId)
	},
	saveReses(reses) {
	    return query("INSERT into t_res set ?", reses)
	},
	// getElseComm(elseId){
	// 	return query('SELECT * FROM t_comment where else_id=?', elseId)
	// }
}