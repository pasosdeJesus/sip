Sip::Engine.routes.draw do

  get '/acercade' => 'hogar#acercade'
  get '/anexos/descarga_anexo/:id', to: 'anexos#descarga_anexo', 
    as: 'descarga_anexo'
  get "/hogar" => 'hogar#index'
  get "/personas" => 'personas#index'
  get "/personas/remplazar" => 'personas#remplazar'
  get "/tablasbasicas" => 'hogar#tablasbasicas'
  get '/ubicaciones/nuevo' => 'ubicaciones#nuevo'

  devise_scope :usuario do
    get 'sign_out' => 'devise/sessions#destroy'
  end
  devise_for :usuarios, :skip => [:registrations], module: :devise
    as :usuario do
          get 'usuarios/edit' => 'devise/registrations#edit', 
            :as => 'editar_registro_usuario'    
          put 'usuarios/:id' => 'devise/registrations#update', 
            :as => 'registro_usuario'            
  end
  resources :usuarios, path_names: { new: 'nuevo', edit: 'edita' } 

  namespace :admin do
    Ability.tablasbasicas.each do |t|
      if (t[0] == "Sip") 
        c = t[1].pluralize
        resources c.to_sym, 
          path_names: { new: 'nueva', edit: 'edita' }
      end
    end
  end

  root 'hogar#index'
end
