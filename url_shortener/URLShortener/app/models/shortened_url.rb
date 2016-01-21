# == Schema Information
#
# Table name: shortened_urls
#
#  id           :integer          not null, primary key
#  long_url     :string
#  short_url    :string
#  submitter_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class ShortenedUrl < ActiveRecord::Base
  validates :submitter_id, presence: true
  validates :short_url, presence: true, uniqueness: true

  belongs_to :submitter,
    foreign_key: :submitter_id,
    primary_key: :id,
    class_name: "User"

  has_many :visitors,
    through: :visits,
    source: :user

  has_many :visits,
    foreign_key: :shortened_url_id,
    primary_key: :id,
    class_name: "Visit"



  def self.random_code
    new_code = SecureRandom.urlsafe_base64(12)
    if ShortenedUrl.exists?(short_url: new_code)
      new_code = self.random_code
    end
    new_code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    short_url = random_code
    create! short_url: short_url, long_url: long_url, submitter_id: user.id
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    users = visitors.select(:user_id).distinct.count
  end

  def num_recent_uniques
    recent_visits = visits.select{|visit| visit.updated_at > 10.minutes.ago }
    recent_visits.select(:user_id).distinct.count
  end

end
