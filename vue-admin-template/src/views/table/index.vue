<template>
  <div class="app-container">
    <el-table
      v-loading="listLoading"
      :data="list"
      element-loading-text="Loading"
      border
      fit
      highlight-current-row
    >
      <el-table-column align="center" label="ID" width="95">
        <template slot-scope="scope">
          {{ scope.$index }}
        </template>
      </el-table-column>
      <el-table-column label="标题" align="center">
        <template slot-scope="scope">
          {{ scope.row.title }}
        </template>
      </el-table-column>
      <el-table-column
        align="center"
        prop="created_at"
        label="发表时间"
        width="320"
      >
        <template slot-scope="scope">
          <i class="el-icon-time" />
          <span>{{ scope.row.post_time }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="Actions"
        align="center"
        width="100"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="{ row, $index }">
          <el-button
            v-if="row.status != 'deleted'"
            size="mini"
            type="danger"
            @click="handleDelete(row, $index)"
          >
            Delete
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  filters: {
    statusFilter(status) {
      const statusMap = {
        published: "success",
        draft: "gray",
        deleted: "danger",
      };
      return statusMap[status];
    },
  },
  data() {
    return {
      list: null,
      listLoading: true,
    };
  },
  created() {
    this.fetchData();
  },
  methods: {
    fetchData() {
      this.listLoading = true;
      this.axios
        .get("http://localhost:3000/blog/list")
        .then((res) => {
          this.list = res.data.blogs;
          this.listLoading = false;

          console.log(res);
        })
        .catch((err) => {
          console.log(err);
        });
    },
    handleDelete(row, index) {
      this.$confirm("此操作将永久删除该文件, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          let blogId = row.blog_id;
          this.axios
            .get("http://localhost:3000/blog/delete", {
              params: {
                blogId,
              },
            })
            .then((res) => {
              this.list.splice(index, 1);
              this.$notify({
                title: "删除成功！",
                message: "Delete Successfully",
                type: "success",
                duration: 2000,
              });
              console.log(res);
            })
            .catch((err) => {
              this.$notify({
                title: "删除失败！",
                message: "Delete failly",
                type: "fail",
                duration: 2000,
              });
              console.log(err);
            });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除",
          });
        });
    },
  },
};
</script>
