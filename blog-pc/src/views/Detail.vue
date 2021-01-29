<template>
  <div id="container">
    <el-card
      class="blog"
      style="margin: 10px 20px; padding: 0 5px; width: 100%"
    >
      <header style="padding: 10px; font-size: 30px">{{ blog.title }}</header>
      <main style="padding: 10px">
        <div style="color: #ccc">
          <i class="el-icon-timer"></i>
          <span>{{ blog.post_time }}</span>
        </div>

        <div
          class="content"
          style="
            border-top: 1px dashed #ccc;
            border-bottom: 1px dashed #ccc;
            margin: 10px 0;
            padding: 20px 0;
          "
        >
          <div v-html="blog.content" />
        </div>
        <el-input
          style="margin-top: 40px"
          type="textarea"
          placeholder="请输入内容"
          v-model="messageBlog"
          maxlength="200"
          show-word-limit
        >
        </el-input>
        <div
          style="
            margin-top: 10px;
            display: flex;
            justify-content: space-between;
          "
        >
          <span style="color: #aaa; font-size: 10px">此评论为匿名评论</span>
          <el-button
            type="primary"
            round
            size="mini"
            @click="review(blog.blog_id, null)"
            >发表评论</el-button
          >
        </div>
        <!-- v-if="flag != null" -->
        <div>
          <div
            style="margin: 20px 0"
            v-for="(item, index) in blog.comments"
            :key="index"
          >
            <span>{{ Math.round(Math.random() * 100) }}：</span
            ><span>{{ item.comm_content }}</span>
            <i style="margin-left: 10px" class="el-icon-timer"></i>
            <span>{{ item.comm_post_time }}</span>
            <el-button type="text" round size="mini" @click="res(item.comm_id)"
              >回复</el-button
            >
            <div :id="item.comm_id" style="display: none">
              <el-input
                style="margin: 10px"
                type="textarea"
                placeholder="请输入内容"
                v-model="messageComm"
                maxlength="200"
                show-word-limit
              >
              </el-input>
              <div
                style="
                  margin-top: 10px;
                  display: flex;
                  justify-content: space-between;
                "
              >
                <span style="color: #aaa; font-size: 10px"
                  >此评论为匿名评论</span
                >
                <el-button
                  type="primary"
                  round
                  size="mini"
                  @click="reviewRes(item.comm_id)"
                  >发表评论</el-button
                >
              </div>
            </div>
            <div
              style="margin: 10px; padding: 10px; border-left: 2px solid #ddd"
              v-for="(res, index) in item.reses"
              :key="index"
            >
              <span>{{ Math.round(Math.random() * 100) }}：</span
              ><span>{{ res.content }}</span>
              <i style="margin-left: 10px" class="el-icon-timer"></i>
              <span>{{ res.post_time }}</span>
            </div>
          </div>
        </div>
      </main>
    </el-card>
  </div>
</template>
<script>
export default {
  data() {
    return {
      blog: {},
      message: "",
      messageBlog: "",
      messageComm: "",
      flag: "",
    };
  },
  created() {
    this.getdata();
    console.log("111");
  },
  methods: {
    getdata() {
      let blogId = this.$route.params.blogId;
      console.log(blogId);
      console.log("hahha");
      this.axios
        .get("http://localhost:3000/blog/detail", {
          params: {
            blogId,
          },
        })
        .then((res) => {
          this.blog = res.data.blog;
          this.flag = res.data.blog.comments[0].comm_id;
          console.log(res.data.blog);
        })
        .catch((err) => {
          console.log(err);
        });
    },
    res(a) {
      if (document.getElementById(a).style.display !== "none") {
        document.getElementById(a).style.display = "none";
      } else {
        document.getElementById(a).style.display = "";
      }
    },
    review(blogId) {
      if (this.messageBlog.trim() == "") {
        this.$message({
          message: "评论内容不能为空",
          type: "warning",
        });
      } else {
        this.axios
          .post("http://localhost:3000/blog/comment", {
            blogId,
            message: this.messageBlog,
          })
          .then((res) => {
            this.$message({
              message: "恭喜你，发表成功",
              type: "success",
            });
            this.getdata();
            console.log(res);
          })
          .catch((err) => {
            this.$message({
              message: "警告哦，发表失败",
              type: "warning",
            });
            console.log(err);
          });
      }
    },
    reviewRes(commId) {
      if (this.messageComm.trim() == "") {
        this.$message({
          message: "评论内容不能为空",
          type: "warning",
        });
      } else {
        this.axios
          .post("http://localhost:3000/blog/reses", {
            message: this.messageComm,
            commId,
          })
          .then((res) => {
            this.$message({
              message: "恭喜你，发表成功",
              type: "success",
            });
            this.getdata();
            console.log(res);
          })
          .catch((err) => {
            this.$message({
              message: "警告哦，发表失败",
              type: "warning",
            });
            console.log(err);
          });
      }
    },
  },
};
</script>
<style lang="scss" scoped>
#container {
  margin-right: 20px;
  text-align: left;
}
</style>