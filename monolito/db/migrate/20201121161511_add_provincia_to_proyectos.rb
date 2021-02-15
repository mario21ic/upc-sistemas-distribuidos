class AddProvinciaToProyectos < ActiveRecord::Migration[6.0]
  def change
    add_column :proyectos, :provincia, :string
  end
end
