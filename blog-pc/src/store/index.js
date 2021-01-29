import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    count: '',
    tags: []
  },
  mutations: {
    set(state, num) {
      this.state.count = num
    },
    setTags(state, arr) {
      this.state.tags = arr
    }
  },
  actions: {
  },
  modules: {
  }
})
