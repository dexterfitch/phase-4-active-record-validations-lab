class Post < ApplicationRecord
    validates :title, presence: true, exclusion: { in: ["True Facts"] }
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :goldilocks_clickbait

    def goldilocks_clickbait
        clickbait_titles = ["Won't Believe", "Secret", "Top", "Guess"]

        valid_clickbaits = []

        clickbait_titles.each do |clickbait|
            if self.title.include?(clickbait)
                valid_clickbaits << clickbait
            end
        end

        if valid_clickbaits.length == 0
            errors.add(:title, "Not clickbait enough")
        end
    end

end