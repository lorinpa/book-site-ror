BookReview::Application.routes.draw do
#  get "welcome/index"
 # get "welcome/log_off" , to: "welcome#log_off", as: "log_off"
  
  resources :reviews

  resources :book_categories

  resources :categories

  resources :authors

#  get "authors/index"
#  get "books/index"
  resources :authors
  resources :books
  get "reviews/book/:book_id" , to: "reviews#reviews_by_book", as: "reviews_of_book"
  
  get "book_categories/category/:category_id" , to: "book_categories#books_by_category"
  get "book_categories/book/:book_id" , to: "book_categories#categories_by_book", as: "categories_of_book"
  
  get "books/author/:author_id" , to: "books#books_by_author", as: "books_by_author"

  get "admins/index" , to: "admins#index", as: "admin_index"
  
  get "books/mob/index", to: "books#mob_index", as: "books_mob_index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'books#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
