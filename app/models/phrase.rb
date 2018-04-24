class Phrase < ApplicationRecord
  validates_presence_of :hashid, :content, :digest
  validates_uniqueness_of :hashid, :digest

  before_validation :generate_digest
  before_validation :generate_hashid

  def to_param
    hashid
  end

  private

  def generate_hashid
    while Phrase.find_by(hashid: self.hashid = SecureRandom.urlsafe_base64(8))
    end
  end

  def generate_digest
    self.digest = Digest::SHA1.hexdigest(content)
  end
end
