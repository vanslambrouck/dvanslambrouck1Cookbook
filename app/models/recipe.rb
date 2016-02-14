class Recipe < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :title, :ingredients, :instructions
  validates :title, uniqueness: true
  
  #==Find All By Query
  # This static method allows for recipe searches.  It will accept up to
  # two params allowing the user to search by keyword and/or filter by category
  # as well.
  def self.find_all_by_query(query = "*", queryCategory = false )
    query = query.downcase
    query = "%#{query}%"
    
    if !queryCategory || !queryCategory.present?
      Recipe.where(['lower(title) like ?
                  OR lower(ingredients) like ?
                  OR lower(instructions) like ?',
                  query, query, query])
    else
      Recipe.joins(:category).where(['category_id = ? AND (lower(title) like ?
                  OR lower(ingredients) like ?
                  OR lower(instructions) like ?)',
                  queryCategory, query, query, query])
    end
  end
  
end
