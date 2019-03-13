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

  def tag_names=(names)
    # reset self tags to an empty set; build all on each create/update
    self.tags = []
    # split the tag names at commas into an array
    names.split(',').each do |name|
      # strip any trailing or leading whitespace on each tag
      tag = Tag.find_or_create_by(name: name.strip)
      # append each newly found or created tag to self
      self.tags << tag
    end
  end

  def tag_names
    if self.tags.any?
      # use Array#map to build a collection of just the tag name values
      tags = self.tags.map{|x| x.name }
      # join the array and return a comma-space-separated string
      tags.join(', ')
    else
      # return a nil value if there are no tags
      tags = nil
    end
  end

end
