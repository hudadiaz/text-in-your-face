class Saying < ApplicationRecord
  belongs_to :thing
  has_one :style
  accepts_nested_attributes_for :style

  delegate :content, to: :thing
  delegate :theme, :font, :css, to: :style

  attr_accessor :thing_content

  before_validation :generate_hashid, on: :create
  before_validation :set_thing

  validates_presence_of :hashid

  def to_param
    hashid
  end

  private

  def set_thing
    self.thing = Thing.find_or_create_by(content: thing_content)
    errors.add :thing, thing.errors.full_messages.to_sentence \
      unless self.thing.persisted?
  end

  def generate_hashid
    while \
      Saying.find_by(hashid: self.hashid = SecureRandom.urlsafe_base64(6))
    end
  end
end
