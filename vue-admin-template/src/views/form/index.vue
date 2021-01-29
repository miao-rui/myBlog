<template>
  <div class="app-container">
    <el-form :model="form" label-width="120px">
      <el-form-item label="电话">
        <el-input v-model="form.phone" />
      </el-form-item>
      <el-form-item label="地址">
        <el-input v-model="form.address" />
      </el-form-item>
      <el-form-item label="简介">
        <el-input v-model="form.desc" type="textarea" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">更新</el-button>
        <el-button @click="onCancel">取消</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        phone: "",
        address: "",
        desc: "",
      },
    };
  },
  methods: {
    onSubmit() {
      this.axios
        .post("http://localhost:3000/user/detail", {
          content: this.form.desc,
          phone: this.form.phone,
          address: this.form.address,
        })
        .then((res) => {
          alert("更新成功！");
          console.log(res);
        })
        .catch((err) => {
          alert("更新失败！");
          console.log(err);
        });
    },
    onCancel() {
      this.$message({
        message: "cancel!",
        type: "warning",
      });
      this.form = {
        phone: "",
        address: "",
        desc: "",
      };
    },
  },
};
</script>

<style scoped>
.line {
  text-align: center;
}
</style>

