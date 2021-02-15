class ChangeLatitudToBeStringInProyectos < ActiveRecord::Migration[6.0]
  def change
  	change_column :proyectos, :latitud, :string
  end
end
	