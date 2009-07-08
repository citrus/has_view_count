module Citrus
  module HasViewCount
  	
		def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods    
    	
    	def has_view_count
        has_many :view_counts, :as => :viewable, :dependent => :destroy
        include Citrus::HasViewCount::InstanceMethods
      end
      
  	end
  	
    module InstanceMethods
    
    	def record_view_count(ip)
      	self.view_counts.create(:viewable => self, :ip => ip)
      	return self   
    	end
    	
    	def view_count
    		self.view_counts.length
    	end
 
    end
    
	end
end
ActiveRecord::Base.send(:include, Citrus::HasViewCount)