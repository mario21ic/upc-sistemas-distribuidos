class CitaUpdateColumns < ActiveRecord::Migration[6.0]
  def change
    add_reference :cita, :solicitud, foreign_key: true
  end
end
