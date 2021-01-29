import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Blog',
    component: () => import('../views/Blog.vue')
  }, {
    path: '/blog/detail/:blogId',
    name: 'Detail',
    component: () => import('../views/Detail.vue')
  },
  {
    path: '/about',
    name: 'About',
    component: () => import('../views/About.vue')
  },
  {
    path: '/announce',
    name: 'Announce',
    component: () => import('../views/Announce.vue')
  },
  {
    path: '/time',
    name: 'Time',
    component: () => import('../views/Time.vue')
  },
  {
    path: '/blog/search',
    name: 'Search',
    component: () => import('../views/Search.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
