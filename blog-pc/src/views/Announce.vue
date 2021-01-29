<template>
  <div id="container">
    <img
      style="width: 100%"
      src="https://ccdn.goodq.top/caches/1f6a588ef8d15139fc379ea62fde10d4/aHR0cHM6Ly81NjljODRiOWNiNDUzLnQ3NC5xaWZlaXllLmNvbS9xZnktY29udGVudC91cGxvYWRzLzIwMTYvMDEvNjNmM2RkNmUwYTEwOWQyNmQ0MWI5NmMzNmE1NzQ5YTYtOTAud2VicA_p_p100_p_3D_p_p100_p_3D.webp"
      alt=""
    />
    <header>关于我们...</header>
    <main>
      {{ detail.content }}
    </main>
  </div>
</template>
<script>
export default {
  data() {
    return {
      detail: "",
    };
  },
  created() {
    this.getdata();
  },
  methods: {
    getdata() {
      this.axios
        .get("http://localhost:3000/user/detail")
        .then((res) => {
          this.detail = res.data.detail;
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
  margin: 20px 150px;
  text-align: left;
  header {
    padding: 20px;
  }
}
</style>