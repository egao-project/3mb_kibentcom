class Event < ApplicationRecord
belongs_to :company
has_many :entrant
end
