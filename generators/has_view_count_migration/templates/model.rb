class ViewCount < ActiveRecord::Base
	
	belongs_to :viewable, :polymorphic => true
  validates_uniqueness_of :ip, :scope => [:viewable_id, :viewable_type]
  
end