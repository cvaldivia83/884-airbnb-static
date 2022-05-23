Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'flats', to: "flats#flats"
  get 'flats/:flat_id', to: "flats#show", as: :flat
end
