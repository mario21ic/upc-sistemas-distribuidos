class ReportesController < ApplicationController
  include SessionsHelper
  
  layout "application"

  def index
    if !logged_in?
      redirect_to :root
    end
    @departamentos = Departamento.all
    @variables = Variable.all
  end
end
