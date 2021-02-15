class ChangeLongitudToBeStringInProyectos < ActiveRecord::Migration[6.0]
  def change
  	change_column :proyectos, :longitud, :string
  end
end
