class Addtousuarios < ActiveRecord::Migration[6.0]
  def change
    add_column :usuarios, :apellido_materno, :string
    add_column :usuarios, :genero, :string
    add_column :usuarios, :tipo_persona, :string
    
  end
end
