class ProformaUpdateColumns < ActiveRecord::Migration[6.0]
  def change
    add_reference :proformas, :solicitud, foreign_key: true
    add_column :proformas, :nombres, :string
    add_column :proformas, :apellidos, :string
    add_column :proformas, :dni, :string
    add_column :proformas, :correo, :string
    add_column :proformas, :telefono, :string
    add_column :proformas, :costo_base, :decimal
    add_column :proformas, :descuento, :decimal
    add_column :proformas, :costo_final, :decimal
  end
end
