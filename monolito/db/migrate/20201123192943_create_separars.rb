class CreateSeparars < ActiveRecord::Migration[6.0]
  def change
    create_table :separars do |t|
      t.string :nombres
      t.string :apellidos
      t.string :dni
      t.string :correo
      t.string :voucher
      t.decimal :monto

      t.timestamps
    end
  end
end
