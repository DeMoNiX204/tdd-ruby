Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  root "shop#index"
  post "checkout", to: "checkout#index"

  unless Rails.env.production?
    namespace :api do
      namespace :test do
        put "products", to: "products#create_from_list"
        delete "products", to: "products#delete_from_list"
      end
    end
  end

  # unless Rails.env.production?
  #   namespace :api do
  #     namespace :test do
  #       resource :discount_rule, only: %i[show update], controller: "discount_rules" do
  #         post :reset, on: :member
  #       end
  #     end
  #   end
  # end
end
