class History < ApplicationRecord
  belongs_to :owner, polymorphic: true
  belongs_to :target, polymorphic: true
  belongs_to :recipient, polymorphic: true
end
