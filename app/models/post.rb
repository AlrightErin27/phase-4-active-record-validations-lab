class Post < ApplicationRecord
  belongs_to :author

  validates :title, presence: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[education horror fashion] }
  validate :clickbait?

  CLICKBAIT_PATTERNS = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]

  def clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, 'must be clickbait')
    end
  end
end
