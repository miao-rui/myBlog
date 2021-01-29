<template>
  <div class="components-container">
    <div class="editor-container" style="padding: 20px">
      <div class="inputDeep" style="margin-bottom: 20px; display: flex">
        <el-tag type="success">标题</el-tag>
        <el-input v-model="input" placeholder="请输入内容"></el-input><br />
      </div>
      <div style="margin-bottom: 20px; display: flex">
        <el-tag>简介</el-tag>
        <el-input
          v-model="outline"
          placeholder="请输入内容"
          type="textarea"
          maxlength="500"
          show-word-limit
          :rows="5"
        ></el-input
        ><br />
      </div>

      <el-tag type="danger">正文</el-tag>
      <markdown-editor
        ref="markdownEditor"
        v-model="content"
        :language="language"
        height="300px"
      />
    </div>

    <el-button
      style="margin: 20px"
      type="primary"
      icon="el-icon-document"
      @click="getHtml"
    >
      发布
    </el-button>
  </div>
</template>

<script>
import MarkdownEditor from "@/components/MarkdownEditor";

const content = `
**This is test**

* vue
* element
* webpack

`;
export default {
  name: "MarkdownDemo",
  components: { MarkdownEditor },
  data() {
    return {
      content: content,
      html: "",
      input: "",
      languageTypeList: {
        en: "en_US",
        zh: "zh_CN",
        es: "es_ES",
      },
      outline: "",
    };
  },
  computed: {
    language() {
      return this.languageTypeList["en"];
    },
  },
  methods: {
    getHtml() {
      if (this.input.trim() == "" || this.outlin.trim() == "") {
        this.$message({
          showClose: true,
          message: "题目或简介不能为空",
          type: "warning",
        });
      } else {
        this.html = this.$refs.markdownEditor.getHtml();
        console.log(this.html);
        this.axios
          .post("http://localhost:3000/blog/post", {
            title: this.input,
            message: this.html,
            outline: this.outline,
          })
          .then((res) => {
            alert("发表成功");
            console.log(res);
            this.html = "";
            this.content = "";
            this.input = "";
          });
      }
    },
  },
};
</script>

<style scoped>
.inputDeep >>> .el-input__inner {
  border: 0;
  border-bottom: 1px solid #ccc;
}
</style>
