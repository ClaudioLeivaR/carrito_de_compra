module ApplicationHelper

    def validar_carro
        if session[:carro_id]
            carro_id = session[:carro_id]
            @carro = Carro.find(carro_id)
        else
            @carro = Carro.create(total: 0) #create no es lo mismo que new
            session[:carro_id]=@carro.id
        end
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end

end
