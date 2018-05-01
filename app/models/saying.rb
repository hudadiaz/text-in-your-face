class Saying < ApplicationRecord
  DEFAULT_THEME = 'light'
  DEFAULT_FONT = 'inherit'
  MAX_LENGTH = 120
  EDITABLE_DURATION = 5.minutes

  before_validation :generate_hashid, on: :create

  validates_presence_of :hashid
  validate :content_editable, on: :update
  validates :content,
            presence: true,
            length: { maximum: MAX_LENGTH }

  def to_param
    hashid
  end

  def theme
    super || DEFAULT_THEME
  end

  def font
    super || DEFAULT_FONT
  end

  def editable?
    return true unless persisted?
    return Time.now - created_at < EDITABLE_DURATION if updated_at.nil?
    Time.now - updated_at < EDITABLE_DURATION
  end

  private

  def generate_hashid
    while \
      Saying.find_by(hashid: self.hashid = SecureRandom.urlsafe_base64(6))
    end
  end

  def content_editable
    errors.add :content, 'cannot be edited' unless editable?
  end
end
