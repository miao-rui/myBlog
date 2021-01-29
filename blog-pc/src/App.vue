<template>
  <div id="app">
    <Header></Header>
    <el-container>
      <el-container>
        <el-aside width="250px">
          <Left></Left>
        </el-aside>
        <el-main>
          <router-view />
        </el-main>
        <el-aside width="200px">
          <Right></Right>
        </el-aside>
      </el-container>
      <el-footer>
        <Footer></Footer>
      </el-footer>
    </el-container>
  </div>
</template>

<script>
import Header from "./components/Header";
import Footer from "./components/Footer.vue";
import Left from "./components/Left";
import Right from "./components/Right";
export default {
  components: {
    Header,
    Footer,
    Left,
    Right,
  },
};
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
