class PedidosController < ApplicationController
    include PedidosHelper
    layout 'paginas'#, only[:crear, :pagar]
    before_action :validar_carro
    before_action :validar_productos_carrito, only: :crear
    
    # GET
    def crear
        #@datos_envio = DatosEnvio.new
        @datos_formulario = DatosEnvioFormulario.new
        consultar_destinos
    end

    #get
    def pagar


    end


    # POST
    def guardar
        @datos_formulario = DatosEnvioFormulario.new(params_datos_formulario)
        
        if @datos_formulario.valid? 

            @datos_envio = crear_datos_envio(@datos_formulario)
            @pedido = definir_pedido(@carro.total, @datos_formulario, @datos_envio)
                    
                if @pedido.save
                    migrar_productos(@carro, @pedido)
                        enviar_correo
                        eliminar_carrito
                        render :pagar
                    else
                        consultar_destinos
                        render :crear
                    end
            
        else
            consultar_destinos
            render :crear
            
        end
    end    
    private
    
    def params_datos_formulario
        params.require(:pedidos_helper_datos_envio_formulario).permit(:nombre, :correo, :direccion, :telefono, :destino_id)
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

    def consultar_destinos
        @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
    end

    def validar_productos_carrito
        if @carro.productos.count == 0
            redirect_to root_path
        end
    end
end