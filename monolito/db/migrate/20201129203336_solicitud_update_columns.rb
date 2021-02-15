class SolicitudUpdateColumns < ActiveRecord::Migration[6.0]
  def change
    add_reference :solicituds, :departamento, foreign_key: true
    #add_foreign_key :solicituds, :departamentos
  end
end
