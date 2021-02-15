class AddLtdlgtValuesToProyectos < ActiveRecord::Migration[6.0]
  def change
    add_column :proyectos, :latitud, :decimal
    add_column :proyectos, :longitud, :decimal
  end
end
