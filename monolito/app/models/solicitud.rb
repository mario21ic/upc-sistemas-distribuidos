class Solicitud < ApplicationRecord
  belongs_to :departamento, optional: true

    validates :nombres, presence: {
        message: "es requerido"
    }
    validates :apellidos, presence: {
        message: "es requerido"
    }

    validates :numero_documento, presence: {
        message: "es requerido"
    }, length: {
        minimum: 8,
        too_short: "debe tener 8 digitos"
    }, uniqueness: {
        message: "ya esta registrado"
    }

    validates :telefono, presence: {
        message: "es requerido"
    }

    validates :correo, presence: {
        message: "es requerido"
    }, uniqueness: {
        message: "ya esta registrado",
        case_sensitive: false
    }
end
