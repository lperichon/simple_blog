ActionController::Routing::Routes.draw do |map|

  map.resources :posts, :controller => 'simple_blog/posts' do |posts|
    posts.resources :comments, :controller => 'simple_blog/comments'
  end
  
  map.blog '/blog', :controller => 'simple_blog/posts', :action => 'index'
end