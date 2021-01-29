<template>
  <div id="container">
    <div class="bloglist">
      <!-- style=" margin: 10px 20px; padding: 10px 5px; border-radius: 10px;
      box-shadow: #ccc 1px 1px 3px 3px; " -->
      <el-card
        class="blog"
        v-for="(item, index) in blogs"
        :key="index"
        style="margin: 10px 20px; padding: 0 5px; width: 100%"
      >
        <router-link
          style="margin: 10px; font-size: 30px"
          :to="'/blog/detail/' + item.blog_id"
          >{{ item.title }}</router-link
        >
        <main style="margin: 10px; color: #aaa">
          <i class="el-icon-timer"></i>
          <span
            >发布日期：<span>{{ item.post_time }}</span></span
          >
        </main>
        <footer style="margin: 30px 10px 10px">
          <div v-html="item.outline" />
        </footer>
      </el-card>
    </div>
  </div>
</template>
<script>
import store from "../store/index";
export default {
  data() {
    return {
      blogs: [],
    };
  },
  created() {
    this.getdata();
  },
  methods: {
    getdata() {
      this.axios
        .get("http://localhost:3000/blog/list")
        .then((res) => {
          this.blogs = res.data.blogs;
          console.log(res);
          store.commit("set", this.blogs.length);
        })
        .catch((err) => {
          console.log(err);
        });
    },
  },
};
</script>
<style lang="scss" scoped>
#container {
  .bloglist {
    padding: 0 20px;
    text-align: left;
    .blog {
      a {
        color: rgb(97, 93, 93);
        text-decoration: none;
      }
      a:hover {
        cursor: pointer;
        color: rgb(11, 164, 235);
      }
    }
  }
}
</style>