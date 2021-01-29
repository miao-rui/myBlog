const model = require('../models/blog');
const formatTime = require('../utils/dateTimeUtils')

function exchange(item) {
	for (let i = 0; i < item.length; i++) {
		item[i].post_time = formatTime(item[i].post_time)
	}
}

module.exports = {
	// 老师
	// async post(ctx) {
	// 	let userId = ctx.session.loginId;
	// 	let { title, message } = ctx.request.body;
	// 	let results = await model.saveblog({
	// 		title: title,
	// 		content: message,
	// 		user_id: userId
	// 	});
	// 	console.log(results);
	// 	if (results.insertId) {
	// 		ctx.body = {
	// 			status: 'success'
	// 		}
	// 	} else {
	// 		ctx.status = 404;
	// 		ctx.body = {
	// 			status: 'fail'
	// 		}
	// 	}
	// },
	// async comment(ctx) {
	// 	let userId = ctx.session.loginId;
	// 	let { blogId, message } = ctx.request.body;
	// 	let results = await model.saveComment({
	// 		blog_id: blogId,
	// 		content: message,
	// 		user_id: userId
	// 	});
	// 	console.log(results);
	// 	if (results.insertId) {
	// 		ctx.body = {
	// 			status: 'success'
	// 		}
	// 	} else {
	// 		ctx.status = 404;
	// 		ctx.body = {
	// 			status: 'fail'
	// 		}
	// 	}
	// },


	// 我
	async post(ctx) {
	    let userId = 5;
	    let { title, message,outline } = ctx.request.body;
	    let results = await model.saveblog({
	        title: title,
	        content: message,
	        user_id: userId,
			outline
	    });
	    console.log(results);
	    if (results.insertId) {
	        ctx.body = {
	            status: 'success'
	        }
	    } else {
	        ctx.status = 404;
	        ctx.body = {
	            status: 'fail'
	        }
	    }
	},

	async index(ctx) {
		let results = await model.getBlogs();
		exchange(results);
		ctx.body = {
			blogs: results
		}
	},
	async search(ctx) {
		console.log(ctx.query)
		let {message}=ctx.query
		let results = await model.searchBlogs(message);
		console.log(results)
		exchange(results);
		if(results.length>0){
			ctx.body = {
				blogs: results,
				state:'sucess'
			}
		}else{
			ctx.status=404,
			ctx.body={
				state:'fail'
			}
		}
		
	},
	async detail(ctx) {
		console.log(ctx.query);
		let { blogId } = ctx.query;
		let results = await model.getBlogById(blogId);
		exchange(results);
		if (results.length > 0) {
			let { blog_id, title, content, post_time } = results[0];
			let blogInfo = {
				blog_id,
				title,
				content,
				post_time,
			};
			blogInfo.comments = [];
			for (let i = 0; i < results.length; i++) {
				let obj = results[i];
				let reses=await model.getCommRes(obj.comm_id);
				exchange(reses);
				blogInfo.comments.unshift({
					comm_id: obj.comm_id,
					comm_content: obj.comm_content,
					comm_post_time: formatTime(obj.comm_post_time),
					username: obj.username,
					reses,
				});
			}
			console.log(blogInfo);

			ctx.body = {
				blog: blogInfo
			}
		} else {
			ctx.status = 404;
			ctx.body = {
				status: 'fail'
			}
		}
	},

	async deleteBlog(ctx) {
		let { blogId } = ctx.query;
		let results = await model.deleteBlogById(blogId);
		console.log(results)
		if (results.affectedRows > 0) {
			ctx.body = {
				status: 'success'
			}
		} else {
			ctx.status = 404;
			ctx.body = {
				status: 'fail'
			}
		}
	},
	async comment(ctx) {
		let { blogId, message } = ctx.request.body;
		let results = await model.saveComment({
			blog_id: blogId,
			content: message,
			user_id: 5
		});
		console.log(results);
		if (results.insertId) {
			ctx.body = {
				status: 'success'
			}
		} else {
			ctx.status = 404;
			ctx.body = {
				status: 'fail'
			}
		}
	},
	async reses(ctx) {
		console.log('reses')
		let { commId, message } = ctx.request.body;
		console.log(commId)
		let results = await model.saveReses({
			comm_id: commId,
			content: message,
		});
		console.log(results);
		if (results.insertId) {
			ctx.body = {
				status: 'success'
			}
		} else {
			ctx.status = 404;
			ctx.body = {
				status: 'fail'
			}
		}
	},

}