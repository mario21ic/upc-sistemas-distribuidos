class Changetousuarios < ActiveRecord::Migration[6.0]
  def change
    rename_column :usuarios, :tipo_documento, :codigo
    add_column :usuarios, :tipo_doc, :string 

  end
end
