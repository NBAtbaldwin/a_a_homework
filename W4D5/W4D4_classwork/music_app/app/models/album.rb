# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  band_id    :integer          not null
#  title      :string           not null
#  year       :string           not null
#  album_type :string           default("studio"), not null
#

class Album < ApplicationRecord
  ALBUM_TYPES = ['live','studio']
  
  validates :band_id, :title, :year, :album_type, presence: true
  # validates :album_type, inclusion: { in: %w(studio, live) }

  belongs_to :band,
  foreign_key: :band_id,
  class_name: 'Band'

end
