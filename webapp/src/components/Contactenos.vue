<template>
  <div>
    <br /><br />
    <h1>Contactenos</h1>
    <div class="row">
      <div class="col-5">
        <form>
          <div class="form-group">
            <label for="exampleInputEmail1">Apellidos y nombres:</label>
            <input
              type="text"
              required="required"
              class="form-control"
              id="exampleInputEmail1"
              aria-describedby="emailHelp"
              placeholder="Ingresa tus apellidos y nombres"
            />
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Email:</label>
            <input
              type="email"
              required="required"
              class="form-control"
              id="exampleInputEmail1"
              aria-describedby="emailHelp"
              placeholder="Ingresa tu correo"
            />
          </div>
          <div class="form-group">
            <label for="exampleFormControlTextarea1">Mensaje:</label>
            <textarea
              required="required"
              class="form-control"
              id="exampleFormControlTextarea1"
            ></textarea>
          </div>
          <br />
          <div>
            <button type="submit" class="btn btn-secondary">Cancelar</button>
            <button type="submit" class="btn btn-primary">Enviar</button>
          </div>
        </form>
      </div>
      <div class="col-4">
        <iframe
          width="400"
          height="250"
          frameborder="0"
          style="border: 0"
          src="https://www.google.com/maps/embed/v1/place?q=Universidad%20Peruana%20de%20Ciencias%20Aplicadas&key=AIzaSyA-mX5Z7eJL5GKASzo5gSNavXxX748a5Y4"
          allowfullscreen
        >
        </iframe>
      </div>
    </div>
  </div>
</template>