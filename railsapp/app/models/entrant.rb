class Entrant < ApplicationRecord
has_many :event
has_many :company
belongs_to :user
end
