class Style < ApplicationRecord
  belongs_to :saying
  
  DEFAULT_THEME = 'light'
  DEFAULT_FONT = 'inherit'

  def theme
    super || DEFAULT_THEME
  end

  def font
    super || DEFAULT_FONT
  end
end
