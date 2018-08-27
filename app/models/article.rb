class Article < ActiveRecord::Base
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings

	def tag_list
  self.tags.collect do |tag|
    tag.name
  end.join(", ")
end


    def tag_list=(tag_string)
        tag_names = tag_string.split(",").collect{|s| s.downcase.strip}.uniq
        new_or_found_tags = tag_names.collect{|t| Tag.find_or_create_by(name: t)}
        self.tags = new_or_found_tags
    end
has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]


end
