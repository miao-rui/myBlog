<template>
  <div class="container" style="box-shadow: #ccc 1px 1px 3px 3px">
    <!-- <header><h1>个人博客</h1></header> -->
    <img
      style="width: 30px; heigh: 100px; border-radius: 50%"
      src="https://wpimg.wallstcn.com/577965b9-bb9e-4e02-9f0c-095b41417191"
      alt=""
    />
    <span style="font-size: 20px; margin: 0 10px">欢迎来到我的博客!!!</span>
    <main style="flex: 3">
      <router-link to="/announce">简介</router-link>
      <router-link to="/">博客</router-link>
      <router-link to="/time">归档</router-link>
      <router-link to="/about">联系</router-link>
    </main>
    <!-- <el-input
      style="flex: 1"
      suffix-icon="el-icon-search"
      size="mini"
      placeholder="输入内容后请按回车"
    >
    </el-input> -->
    <el-input
      placeholder="请输入内容"
      style="flex: 1"
      size="mini"
      v-model="input"
    >
      <el-button
        slot="append"
        icon="el-icon-search"
        @click="search"
      ></el-button>
    </el-input>

    <!-- <footer>
      <img
        src="https://ccdn.goodq.top/caches/1f6a588ef8d15139fc379ea62fde10d4/aHR0cHM6Ly81NjljODRiOWNiNDUzLnQ3NC5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTYvMDEvNjNmM2RkNmUwYTEwOWQyNmQ0MWI5NmMzNmE1NzQ5YTYtOTAud2VicA_p_p100_p_3D_p_p100_p_3D.webp"
        alt=""
      />
    </footer> -->
  </div>
</template>
<script>
export default {
  data() {
    return {
      input: "",
    };
  },
  methods: {
    search() {
      if (this.input.trim() != "") {
        this.$router.push({
          name: "Search",
          params: {
            message: this.input,
          },
        });
        // this.$router.push("/announce");
      } else {
        this.$message({
          showClose: true,
          message: "输入内容为空",
          type: "warning",
        });
      }
    },
  },
};
</script>
<style lang="scss" scoped>
.container {
  display: flex;
  padding: 10px;
  height: 30px;
  main {
    display: flex;
    justify-content: space-evenly;
    a {
      color: rgb(97, 93, 93);
      text-decoration: none;
    }
    a:hover {
      cursor: pointer;
      color: rgb(114, 202, 243);
    }
  }

  // footer {
  //   margin: 20px 0;
  //   img {
  //     width: 100%;
  //   }
  // }
}
</style>