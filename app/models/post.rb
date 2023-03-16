class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  
    validate :click_baity?
  
    def click_baity?
      unless title&.include?("Won't Believe") || title&.include?("Secret") || title&.include?("Guess") || title&.match?(/Top \d+/)
        errors.add(:title, 'must be clickbait-y')
      end
    end
  end
  