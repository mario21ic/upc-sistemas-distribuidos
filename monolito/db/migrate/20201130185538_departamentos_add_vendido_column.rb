class DepartamentosAddVendidoColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :departamentos, :vendido, :boolean
  end
end
