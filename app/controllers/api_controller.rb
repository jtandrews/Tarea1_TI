require 'base64'
require 'openssl'
class ApiController < ApplicationController

	skip_before_action :verify_authenticity_token
	skip_before_filter :verify_authenticity_token
	def validar
		#se obtienen parametros
	    mensaje = params[:mensaje].to_s
	    hash = params[:hash].to_s
	    #se ocupa el algoritmo pedido con una libreria de ruby
	    mensajesha56 = Digest::SHA256.hexdigest mensaje
	    if hash!='' && mensaje != ''
	    	#se usa un try and catch para eliminar la excepción
	    	begin 
			    response = false

		    	if hash.downcase  == mensajesha56
		    		response =true
		    	end
		    	final = {:mensaje_hash => mensajesha56, :mensaje => mensaje, :valido => response, :status => 200}	
		    	render json: final.to_json
	    	rescue Exception => e
		    	render json: {
				}, status: 500	
	    	end

    	else
	    	render json: {
			}, status: 400	
	    end

	end

	#se devuelve solo el status
	def status
		render json: {
		}, status: 201	
	end


end
