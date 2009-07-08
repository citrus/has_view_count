class HasViewCountMigrationGenerator < Rails::Generator::Base 
  def manifest 
    record do |m| 
      m.migration_template 'migration.rb', 'db/migrate'
      m.template 'model.rb', File.join('app/models', "ViewCount", "view_count.rb")
    end 
  end
  
  def file_name
    "has_view_count_migration"
  end
end
