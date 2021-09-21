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

    def validar_sesion_cliente
        if session[:usuario_id]
            # tengo que ir a buscar al admin o al cliente
            @usuario_actual = Administrador.find(session[:usuario_id])
        else
            @usuario_actual = nil
        end
    rescue ActiveRecord::RecordNotFound
        session[:usuario_id] = nil
        redirect_to root_path
    end

    def validar_sesion_admin

        if session[:usuario_id]
            # cuando el usuario ha iniciado session
            @usuario_actual = Administrador.find(session[:usuario_id])
        else
            @usuario_actual = nil
            redirect_to root_path
        end
    rescue ActiveRecord::RecordNotFound
            redirect_to root_path
    end
    def usuario_ha_iniciado_sesion?
        if @usuario_actual
            return true
        else
            return false
        end
    end
end
