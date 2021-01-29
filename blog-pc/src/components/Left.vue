<template>
  <div id="container">
    <el-container
      style="
        margin: 10px 20px;
        padding: 10px 5px;
        border-radius: 10px;
        box-shadow: #ccc 1px 1px 3px 3px;
      "
    >
      <el-header>
        <div style="display: flex; justify-content: space-between">
          <img
            style="width: 70px; heigh: 100px; border-radius: 50%"
            src="https://wpimg.wallstcn.com/577965b9-bb9e-4e02-9f0c-095b41417191"
            alt=""
          />
          <div style="color: #aaa; font-size: 13px; margin-left: 10px">
            普通大学生<br />
            热爱的学习者<br />
            乐观小女孩<br />
            加油！！！
          </div>
        </div>
      </el-header>
      <el-main style="margin: 10px 0">
        <div style="font-size: 20px">喵喵喵</div>
        <div>
          <i class="el-icon-place" style="color: #aaa; margin: 10px 0"
            >黑龙江/绥化</i
          >
        </div>
      </el-main>
      <el-footer
        style="
          border-top: 1px solid #aaa;
          font-size: 20px;
          color: rgb(100, 100, 100);
        "
      >
        <span style="line-height: 60px">文章：</span><span>{{ count }}</span>
      </el-footer>
    </el-container>
  </div>
</template>
<script>
import store from "../store/index";
export default {
  data() {
    return {};
  },
  computed: {
    count() {
      return store.state.count;
    },
  },
  methods: {},
};
</script>
<style lang="scss" scoped>
#container {
  position: fixed;
  top: 70px;
  left: 0;
}
</style>