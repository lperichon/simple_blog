if defined?(ActionController::Routing::RouteSet)
  class ActionController::Routing::RouteSet
    def load_routes_with_simple_blog!
      lib_path = File.dirname(__FILE__)
      simple_blog_routes = File.join(lib_path, *%w[.. .. .. config simple_blog_routes.rb])
      unless configuration_files.include?(simple_blog_routes)
        add_configuration_file(simple_blog_routes)
      end
      load_routes_without_simple_blog!
    end

    alias_method_chain :load_routes!, :simple_blog
  end
end

