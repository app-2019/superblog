class Post < ApplicationRecord
  validates :title, presence: true
  belongs_to :author
  has_and_belongs_to_many :tags

  def author_name=(name)
    self.author = Author.find_or_create_by(name: name)
  end

  def author_name
    self.author ? self.author.name : nil
  end


end
