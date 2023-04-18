const Layout = () => import('@/layout/index.vue')

export default {
    path: '/dashboard/index',
    component: Layout,
    redirect: '/dashboard/index/home',
    name: 'dashboardIndexHome',
    meta: {title: '主页', icon: 'menu-type'},
    children: [
        {
            path: 'home',
            name: 'dashboardIndexHome',
            component: () => import('@/views/dashboard/home/index.vue'),
            meta: {title: '首页'}
        }
    ]
}
