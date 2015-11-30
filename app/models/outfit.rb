class Outfit < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :temp, :name
  validates :rain, inclusion: [true, false]
  has_attached_file :image_upload, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_presence_of :image_upload
  validates_attachment_content_type :image_upload, content_type: /\Aimage\/.*\Z/


  TEMPERATURES = ['super hot', 'hot', 'warm', 'cool', 'cold', 'freezing']

  # def database
  #   if current_user
  #     @database = Outfit.where(user_id: current_user.id)
  #   else
  #     @database = Outfit.where(user_id: 2)
  #   end
  # end

  def self.outfit(current_user, temperature, rain_status, m_or_f)
    if current_user
      Outfit.where(user_id: current_user.id, temp: temperature , rain: rain_status, gender: m_or_f).sample
    else
      Outfit.where(user_id: 2, temp: temperature , rain: rain_status, gender: m_or_f).sample
    end
    # remove the if else block instead do 
      # user_id = current_user ? current_user.id : 2
      # Also unclear why the user_id should be set to 2, not expressive code
  end


end
