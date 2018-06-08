class Product < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :category, optional: true
  before_save :strip_html_from_description, :lower_case

  def strip_html_from_description
    self.description = ActionView::Base.full_sanitizer.sanitize(self.description)
  end

  def lower_case
    self.title.downcase!
  end
end
