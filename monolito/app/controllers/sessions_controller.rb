class SessionsController < ApplicationController

  include SessionsHelper
  def new
  end

  def create
    usuario = Usuario.find_by(correo_corporativo: params[:session][:correo_corporativo], contraseña: params[:session][:contraseña])

    if usuario
     
      log_in usuario
      redirect_to :root

    else
     flash[:danger]= "Credenciales incorrectas (email/password)"
     render :new
    end

 
  end

  def destroy

     log_out if logged_in?
     redirect_to :root
  end

end
