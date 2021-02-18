<template>
   <div>
        <h4 class="text-center mt-20">
         <small>
         <button class="btn btn-success" v-on:click="navigate()"> View All Customers </button>
         </small>
        </h4>
        <div class="col-md-12 form-wrapper">
          <h2> Solicitar Cita </h2>
          <form id="create-post-form" @submit.prevent="editCustomer">
            <input type="hidden" name="DepartamentoId" value=""/>
               <div class="form-group col-md-12">
                <label for="title"> First Name </label>
                <input type="text" id="Nombres" name="Nombres" v-model="customer.Nombres" class="form-control" placeholder="Nombres">
               </div>
               <div class="form-group col-md-12">
                <label for="title"> Last Name </label>
                <input type="text" id="Apellidos" name="Apellidos" v-model="customer.Apellidos" class="form-control" placeholder="Apellidos">
               </div>
            <div class="form-group col-md-12">
                <label for="title"> DNI </label>
                <input type="text" id="Dni" name="Dni" v-model="customer.Dni" class="form-control" placeholder="Dni">
            </div>
            <div class="form-group col-md-12">
                <label for="title"> Email </label>
                <input type="text" id="Email" name="Email" v-model="customer.Email" class="form-control" placeholder="Email">
            </div>
            <div class="form-group col-md-12">
                <label for="title"> Telefono </label>
                <input type="text" id="Telefono" name="Telefono" v-model="customer.Telefono" class="form-control" placeholder="Telefono">
            </div>
            
            <div class="form-group col-md-12">
                  <label for="description"> Mensaje </label>
                  <input type="text" id="Mensaje" name="Mensaje" v-model="customer.Mensaje" class="form-control" placeholder="Mensaje">
            </div>
            <div class="form-group col-md-4 pull-right">
              <button class="btn btn-success" type="submit"> Enviar </button>
            </div>           </form>
        </div>
    </div>
</template>
<script>
import { server } from "../../helper";
import axios from "axios";
import router from "../../router";
export default {
  data() {
    return {
      id: 0,
      customer: {}
    };
  },
  created() {
    this.id = this.$route.params.id;
    this.getCustomer();
  },
  methods: {
    editCustomer() {
      let customerData = {
        DepartamentoId: this.id,
        Nombres: this.customer.Nombres,
        Apellidos: this.customer.Apellidos,
        Dni: this.customer.Dni,
        Email: this.customer.Email,
        Telefono: this.customer.Telefono,
        Mensaje: this.customer.Mensaje
      };
      axios
        .post(
          `${server.baseURL}/GestionSolicitudCitaService.svc/SolicitudCitas`,
          customerData
        )
        .then(data => {
          router.push({ name: "home" });
        });
    },
    getCustomer() {
      axios
        .get(`${server.baseURL}/customer/customer/${this.id}`)
        .then(data => (this.customer = data.data));
    },
    navigate() {
      router.go(-1);
    }
  }
};
</script>
