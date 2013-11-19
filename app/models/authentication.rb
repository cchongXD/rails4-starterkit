class Authentication < ActiveRecord::Base
  include Concerns::OmniauthConcern
  include Concerns::UserImagesConcern

  belongs_to :user

  validates :user_id, :provider, :proid, presence: true

  def name
    oauth_data ? (oauth_data['name'] || "#{oauth_data['first_name']} oauth_data['last_name']") : nil
  end

  def profile_url
    oauth_data.try(:[], 'profile_url')
  end
end
