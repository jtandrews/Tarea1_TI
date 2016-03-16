Rails.application.routes.draw do

#rutas para la tarea
  post '/validarFirma' => 'api#validar'
  get '/status' => 'api#status'

end
