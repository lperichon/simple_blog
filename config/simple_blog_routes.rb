ActionController::Routing::Routes.draw do |map|
  map.resources :posts, :controller => 'simple_blog/posts'
  map.resources :comments, :controller => 'simple_blog/comments'
  map.blog '/blog', :controller => 'simple_blog/posts', :action => 'index'
end