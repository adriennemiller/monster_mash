class BodyPart < ApplicationRecord

  def to_s
    name = self.filename.split('_')
    name = name.join(' ') 
    name 
  end
end
