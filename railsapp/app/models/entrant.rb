class Entrant < ApplicationRecord
has_many :event
has_many :company
end
