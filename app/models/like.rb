class Like < ApplicationRecord
  belongs_to :user 
  belongs_to :monster

  def do_like
  end
end
