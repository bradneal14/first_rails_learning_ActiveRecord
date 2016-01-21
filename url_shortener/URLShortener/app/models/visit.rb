class Visit < ActiveRecord::Base
  validates :user_id, presence: true
  validates :shortened_url_id, presence: true

  belongs_to :user,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: "User"

  belongs_to :shortened_url,
    foreign_key: :shortened_url_id,
    primary_key: :id,
    class_name: 'ShortenedUrl'


end
