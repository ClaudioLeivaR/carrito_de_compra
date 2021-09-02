class ClienteMailer < ApplicationMailer
    
    #vista de correo
    def enviar_hola_mundo
        
        mail(
            to: 'claudio.leiva.r@gmail.com',
            subject: 'Saludos!'
        )
    end

    def enviar_correo_pedido
        @datos_envio_correo = params[:datos_envio_correo]
        @pedido             = params[:pedido_correo]

        mail(
            to: @datos_envio_correo.correo,
            subjet: 'Pedido Confirmado'

        )
    end
end
