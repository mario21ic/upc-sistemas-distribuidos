<template>
    <div class="container-fluid">
      <div class="text-center">
        <h1>Inmobiliaria Grupo B</h1>
       <p> Ultimos Departamentos</p>
       <div v-if="customers.length === 0">
            <h2> No customer found at the moment </h2>
        </div>
      </div>

        <div class="">
            <table class="table table-bordered">
              <thead class="thead-dark">
                <tr>
                  <th scope="col">Modelo</th>
                  <th scope="col">Metros</th>
                  <th scope="col">Dormitorios</th>
                  <th scope="col">Banos</th>
                  <th scope="col">Piso</th>
                  <th scope="col">Precio</th>
                  <th scope="col">Separado</th>
                  <th scope="col">Actions</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="customer in customers" :key="customer.Id">
                  <td>{{ customer.Modelo }}</td>
                  <td>{{ customer.Metros }}</td>
                  <td>{{ customer.Dormitorios }}</td>
                  <td>{{ customer.Banos }}</td>
                  <td>{{ customer.Piso }}</td>
                  <td>{{ customer.Precio }}</td>
                  <td>{{ customer.Separado }}</td>
                  <td>
                    <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group" style="margin-bottom: 20px;">
                                  <router-link :to="{name: 'Edit', params: {id: customer.Id}}" class="btn btn-sm btn-outline-secondary">Detalle </router-link>
                                  <router-link :to="{name: 'SolicitarCita', params: {id: customer.Id}}" class="btn btn-sm btn-outline-secondary">Solicitar Cita  </router-link>
                                  <!--
                                  <button class="btn btn-sm btn-outline-secondary" v-on:click="deleteCustomer(customer.Id)">Delete Customer</button>
                                  -->
                                </div>
                              </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
    </div>
</template>
<script>
import { server } from "../helper";
import axios from "axios";
export default {
  data() {
    return {
      customers: []
    };
  },
  created() {
    this.fetchCustomers();
  },
  methods: {
    fetchCustomers() {
      axios
        .get(`${server.baseURL}/InmobiliariaService.svc/Departamentos`)
        .then(data => (this.customers = data.data));
    },
    deleteCustomer(id) {
      axios
        .delete(`${server.baseURL}/customer/delete?customerID=${id}`)
        .then(data => {
          console.log(data);
          window.location.reload();
        });
    }
  }
};
</script>
