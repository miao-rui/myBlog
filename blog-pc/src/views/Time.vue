<template>
  <div id="container">
    <div class="block">
      <el-timeline>
        <el-timeline-item
          v-for="(item, index) in blogs"
          :key="index"
          :timestamp="item.post_time"
          placement="top"
        >
          <el-card>
            <router-link
              style="font-size: 30px"
              :to="'/blog/detail/' + item.blog_id"
              >{{ item.title }}</router-link
            >
            <p>{{ item.outline }}</p>
          </el-card>
        </el-timeline-item>
      </el-timeline>
    </div>
  </div>
</template>
<script>
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
  text-align: left;
  a {
    color: rgb(97, 93, 93);
    text-decoration: none;
  }
  a:hover {
    cursor: pointer;
    color: rgb(11, 164, 235);
  }
}
</style>