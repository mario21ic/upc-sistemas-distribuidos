class AddDistritoToProyectos < ActiveRecord::Migration[6.0]
  def change
    add_column :proyectos, :distrito, :string
  end
end
