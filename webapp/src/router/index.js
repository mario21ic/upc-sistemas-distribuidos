import Vue from 'vue'
import Router from 'vue-router'
import HomeComponent from '@/views/Home';
import NosotrosComponent from '@/components/Nosotros';
import ContactenosComponent from '@/components/Contactenos';
import EditComponent from '@/components/customer/Edit';
import SolicitarCitaComponent from '@/components/customer/SolicitarCita';
import CreateComponent from '@/components/customer/Create';

Vue.use(Router)
export default new Router({
  mode: 'history',
  routes: [
    { path: '/', redirect: { name: 'home' } },
    { path: '/home', name: 'home', component: HomeComponent },
    { path: '/nosotros', name: 'home', component: NosotrosComponent },
    { path: '/contactenos', name: 'home', component: ContactenosComponent },
    { path: '/create', name: 'Create', component: CreateComponent },
    { path: '/solicitar/:id', name: 'SolicitarCita', component: SolicitarCitaComponent },
    { path: '/edit/:id', name: 'Edit', component: EditComponent },
  ]
});
