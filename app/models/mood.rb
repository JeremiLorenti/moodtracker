class Mood < ApplicationRecord
    has_many :mood_triggers, dependent: :destroy
    has_many :triggers, through: :mood_triggers
  end