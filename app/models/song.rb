class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :release_year}
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, numericality: {less_than_or_equal_to: Date.today.year}, if: Proc.new {|song| song.released}
  validates :artist_name, presence: true
end
