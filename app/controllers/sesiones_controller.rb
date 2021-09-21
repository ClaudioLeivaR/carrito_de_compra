class SesionesController < ApplicationController
   
    # post
    def inicio_sesion
        #logicva de iniciar sesion
        @usuario_actual = Administrador.find_by(correo: sesion_params[:correo])

        if @usuario_actual #si el usuario es diferente a nil/ osea si esxiste?
            if @usuario_actual.authenticate(sesion_params[:password])
                #cuando las credenciales esten incorrectas
                session[:usuario_id] = @usuario_actual.id
                redirect_to admin_pedidos_path
            else
                #cuantdo las credenciales esten incorrectas
                flash[:error_sesion] = "Correo/Contraseña invalidos"
                redirect_to root_path
            end
        else
            #cuando no existe el usuario enm la BD
            flash[:error_sesion] = "Usuario no registrado"
            redirect_to root_path
        end
    end

    #DELETE
    def cerrar_sesion
        session[:usuario_id] = nil
        redirect_to root_path
    end

    private

    def sesion_params
        params.permit(:correo, :password)
    end
end