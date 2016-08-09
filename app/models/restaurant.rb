class Restaurant < ActiveRecord::Base
    validates :user_id, uniqueness: true
	belongs_to :user
	has_many :waitlist
    has_many :hours, :foreign_key => 'rest_id', :primary_key => 'user_id'
    has_many :menu, :foreign_key => 'rest_id'
    # validate :has_seven_hours
    accepts_nested_attributes_for :hours, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

    # def has_seven_hours
    #     errors.add(:hours, "hours not 7") if hours.size != 7
    # end

    
    def self.search(search)
        # todo:
        # search all column
        # search each word: http://stackoverflow.com/questions/6337381/search-on-multiple-keywords-in-a-single-search-text-field-rails
        # search by relevance
        # autocomplete: https://rubygems.org/gems/autocomplete/versions/1.0.2
        # advance: https://www.youtube.com/watch?v=eUtUquKc2qQ
        # pg full text search: https://www.youtube.com/watch?v=pfZw6yErsX0
        
        # gem choice :
        # textacular
        
        # find(:all, :conditions => [(['name LIKE ?'] * search_length).join(' OR ')] + search.split.map { |name| "%#{name}%" })
        
        
        if search
                find(:all, :order => "created_at DESC", :conditions => ['lower(address) LIKE ?', "%#{search}%"])
        else
                find(:all, :order => "created_at DESC")
        end
    end


end
