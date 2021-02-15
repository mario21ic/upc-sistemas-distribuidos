class AddDepartamentoToProyectos < ActiveRecord::Migration[6.0]
  def change
    add_column :proyectos, :departamento, :string
  end
end
