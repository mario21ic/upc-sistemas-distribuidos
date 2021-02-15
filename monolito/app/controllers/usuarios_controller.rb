class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]

  layout "application"
  include SessionsHelper
  # GET /usuarios
  # GET /usuarios.json
  def index
    if !logged_in?

      redirect_to :root

    end
    @Usuarios = Usuario.paginate(page: params[:page], per_page: 1)
    @usuarios = Usuario.all
    @variables = Variable.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    if !logged_in?

      redirect_to :root

    end
    @variables = Variable.all
  end

  # GET /usuarios/new
  def new
    
    if !logged_in?

      redirect_to :root

    end
    @usuario = Usuario.new
    @variables = Variable.all
  end

  # GET /usuarios/1/edit
  def edit
    if !logged_in?

      redirect_to :root

    end
    @persona = Persona.new
    @variables = Variable.all
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Datos del Usuario fueron grabados.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usuario_params
      params.require(:usuario).permit(:tipo_doc,:nombre, :genero, :telefono, :numero_documento, :codigo_usuario, :contraseña, :correo_corporativo,:correo_personal, :perfil, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod, :tipo_persona, :perfil, :apellido, :apellido_materno)
    end
end
