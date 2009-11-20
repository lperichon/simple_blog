class SimpleBlogGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.file 'migrations/create_simple_blog.rb', "db/migrate/#{Time.now.strftime('%Y%m%d%H%M%S')}_create_simple_blog.rb"
    end
  end
end