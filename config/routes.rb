Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get '/', to: 'home#index', as: :home

  # For Menu
  get "/menu", to: "menus#index", :as => :menu
  post "/menu", to: "menus#create"
  delete "/menu/:id", to: "menus#delete"



  # For MenuList
  # get all data as json
  get "/menus", to: "menu_lists#index", :as => :menu_list
  post "/menus", to: "menu_lists#create"
  delete "/menus/:id", to: "menu_lists#delete"
  delete "/cancel/:id", to: "menu_lists#cancelOrder"
  get "menus/order/:id", to: "menu_lists#orderStatus", :as => :order_status

  # Sign Up
  get "/users", to: "users#new", :as => :signup
  post "/users", to: "users#create" 

  # SignIn (Session Page)
  get "/signin", to: "sessions#new", :as => :signin
  post "/signin", to: "sessions#create"
  
  # SignOut
  get "/signout", to: "sessions#destroy", :as => :signout

  # Cart List
  get "/cart", to: "cart_items#new", :as => :cart
  post "/cart", to: "cart_items#create" 
  delete "/cart/:id", to: "cart_items#destroy"

  # Checkout
  get "/order", to: "order_items#new", :as => :order
  post "/order", to: "order_items#create"

  #Admin
  get "/admin", to: "admin#new", :as => :admin
  get "/order/details/:id", to:"admin#getOrderById", :as => :orders
  get "/admin/details/:id", to: "admin#getById", :as => :details
  get "/admin/newList", to: "admin#newList", :as => :newList
  get "admin/order/:id", to: "admin#orderDetails", :as => :orderDetails
  post "/newMenu", to: "admin#createNewMenu", :as => :new_menu
  post "/setid", to: "admin#setId", :as => :set_id
  post "/admin/newList", to: "admin#createNewList"
  patch "/admin/updateOrder/:id", to: "admin#updateOrder"
  delete "/admin/details/:id", to:"admin#deleteMenuList"
  delete "/delete/:id", to:"admin#deleteMenuTitle" 
  
  #Cashier
  get "cashier", to: "cashier#new", :as => :cashier
  patch "/cashier/updateOrder/:id", to: "cashier#updateOrder"

end