# frozen_string_literal: true

class Bulletin < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one_attached :photo

  validates :photo, attached: true, content_type: %i[png jpg jpeg], size: { less_than: 5.megabytes }
end
