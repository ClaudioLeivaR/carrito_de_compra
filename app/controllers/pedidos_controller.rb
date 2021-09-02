class PedidosController < ApplicationController

    before_action :validar_carro
    
    # GET
    def crear
        @datos_envio = DatosEnvio.new
        @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
    end

    #get
    def pagar


    end


    # POST
    def guardar
        @datos_envio = DatosEnvio.new(params_datos_envio)
        if params_destino[:destino_id].empty? == false
            if @datos_envio.save
                @pedido = Pedido.new(
                    codigo: SecureRandom.hex(4).upcase,
                    total: @carro.total,
                    destino_id: params_destino[:destino_id],
                    estados_pedido: EstadosPedido.find_by(estado: 'solicitado'),
                    datos_envio: @datos_envio
                    )
                    if @pedido.save

                        @carro.carros_contenidos.each do |contenido|
                            DetallesPedido.create(
                                pedido: @pedido,
                                producto: contenido.producto,
                                cantidad: contenido.cantidad
                            )
                        end


                    
                        enviar_correo
    
                        eliminar_carrito
    
                        render :pagar
                    else
                        @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
                        render :crear
                    end
            else
                    @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
                    render :crear
            end
        else
            @datos_envio.errors.add(:destino_id, "Selecciona un destino")
            @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
            render :crear
            
        end
    end    
    private
    
    def params_datos_envio
        params.require(:datos_envio).permit(:nombre, :correo, :direccion, :telefono)
    end

    def params_destino
        params.require(:datos_envio).permit(:destino_id)
    end

    def enviar_correo
        #enviar correo a cliente
        ClienteMailer.with(
            datos_envio_correo: @datos_envio,
            pedido_correo: @pedido)
            .enviar_correo_pedido.deliver_later
    end

    def eliminar_carrito
        session[:carro_id] = nil
        @carro.destroy
    end
end