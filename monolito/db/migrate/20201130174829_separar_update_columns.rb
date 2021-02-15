class SepararUpdateColumns < ActiveRecord::Migration[6.0]
  def change
    add_reference :separars, :departamento, foreign_key: true
  end
end
