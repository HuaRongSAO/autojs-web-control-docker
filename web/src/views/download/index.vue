<template>
  <div class="dashboard-container">
    <el-row>

      <el-col :span="24" style="display:flex;justify-content: space-between">
        <div class="row-item">
          <el-link href="/assets-apps/app-common-armeabi-v7a-debug.apk" type="success" target="_blank" download>
            <i class="el-icon-position" />
            auto.js
          </el-link>
          <el-link href="/assets-apps/app-common-armeabi-v7a-debug.apk" type="danger" target="_blank" download>
            下载
          </el-link>
        </div>
      </el-col>
    </el-row>

  </div>
</template>

<script>
import { mapGetters } from 'vuex';

export default {
  name: 'Dashboard',
  computed: {
    ...mapGetters([
      'name'
    ])
  }
};
</script>

<style lang="scss" scoped>
  .row-item{
    width: 100%;
    display: flex;
    justify-content: space-between;
    height: 40px;
    border-bottom: 1px solid #eee;
  }
.dashboard {
  &-container {
    margin: 30px;
  }
  &-text {
    font-size: 30px;
    line-height: 46px;
    margin-top: 2em;
    text-align: center;
  }
}
</style>
