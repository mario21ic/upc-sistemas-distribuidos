class VariablesController < ApplicationController
  include SessionsHelper

  before_action :set_variable, only: [:show, :edit, :update, :destroy]

  # GET /variables
  # GET /variables.json
  def index
    if !logged_in?

      redirect_to :root

    end
    @variables = Variable.all
  end

  # GET /variables/1
  # GET /variables/1.json
  def show
    if !logged_in?

      redirect_to :root

    end
    @variables = Variable.all
  end

  # GET /variables/new
  def new
    if !logged_in?

      redirect_to :root

    end
    @variables = Variable.all
    @variable = Variable.new
  end

  # GET /variables/1/edit
  def edit
    if !logged_in?

      redirect_to :root

    end
    @variables = Variable.all
  end

  skip_before_action :verify_authenticity_token
  def provincias
    @provincias = Variable.all.where(tipo_variable: 'UbigeoProvincias',dato_extra: params[:departamento_id])
    x = params[:departamento_id]
    return 1
  end

  # POST /variables
  # POST /variables.json
  def create
    @variable = Variable.new(variable_params)

    respond_to do |format|
      if @variable.save
        format.html { redirect_to @variable, notice: 'Variable was successfully created.' }
        format.json { render :show, status: :created, location: @variable }
      else
        format.html { render :new }
        format.json { render json: @variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /variables/1
  # PATCH/PUT /variables/1.json
  def update
    respond_to do |format|
      if @variable.update(variable_params)
        format.html { redirect_to @variable, notice: 'Variable was successfully updated.' }
        format.json { render :show, status: :ok, location: @variable }
      else
        format.html { render :edit }
        format.json { render json: @variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variables/1
  # DELETE /variables/1.json
  def destroy
    @variable.destroy
    respond_to do |format|
      format.html { redirect_to variables_url, notice: 'Variable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variable
      @variable = Variable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def variable_params
      params.require(:variable).permit(:tipo_variable, :codigo_variable, :descricion_variable, :dato_extra, :dato_extra2, :dato_extra3, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod)
    end
end
