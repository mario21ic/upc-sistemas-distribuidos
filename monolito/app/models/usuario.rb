class Usuario < ApplicationRecord
    validates :nombre, presence: {
        message: "es requerido"
    }
    validates :apellido, presence: {
        message: "es requerido"
    }
    validates :apellido_materno, presence: {
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

    validates :correo_corporativo, presence: {
        message: "es requerido"
    }, uniqueness: {
        message: "ya esta registrado",
        case_sensitive: false
    }
    validates :contraseña, presence: {
        message: "es requerido"
    }
end
