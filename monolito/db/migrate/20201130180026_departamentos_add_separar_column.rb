class DepartamentosAddSepararColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :departamentos, :separado, :boolean
  end
end
