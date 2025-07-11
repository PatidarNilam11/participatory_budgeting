class Phase < ApplicationRecord
     scope :active, -> { where(active: true).where('starts_at <= ? AND ends_at >= ?', Time.current, Time.current) }
end
