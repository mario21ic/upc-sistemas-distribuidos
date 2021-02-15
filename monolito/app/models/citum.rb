class Citum < ApplicationRecord
  belongs_to :solicitud, optional: true
end
