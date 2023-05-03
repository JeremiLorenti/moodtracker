class Trigger < ApplicationRecord
    has_many :mood_triggers, dependent: :destroy
    has_many :moods, through: :mood_triggers
  end