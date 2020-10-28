class Gossip < ApplicationRecord
    belongs_to :user
    has_many :messages
    has_many :gossip_tags, dependent: :destroy
    has_many :tags, through: :gossip_tags
    validates :title, length: { in: 3..14 }, presence: true
    validates :content, presence: true
end