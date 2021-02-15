class Proforma < ApplicationRecord
  belongs_to :solicitud, optional: true
end
