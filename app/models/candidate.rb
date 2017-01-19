class Candidate < ApplicationRecord
  validates :name, presence: true

  def display_name
    case gender
    when "1"
      "#{name}先生"
    when "2"
      "#{name}女士"
    else
      name
    end
  end
end

