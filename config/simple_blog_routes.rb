ActionController::Routing::Routes.draw do |map|
  map.blog '/blog', :controller => 'simple_blog/posts', :action => 'index'
end