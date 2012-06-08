FormTest::Application.routes.draw do
  resources :syllabuses

  resources :missions

  post "mission_info" => "missions#mission_info", :as => "mission_info"

  root :to => "syllabuses#index"
end
