class Admin::PedidosController < Admin::AdminController
   
    include Admin::PedidosHelper
    before_action :asignar_pedido, only: [:mostrar, :editar, :actualizar]

    

    #GET
    def listar
        @pedidos = Pedido.select(:id, :codigo, :total, :created_at).order(:created_at)
    end

    def crear
        #TODO mostrar el formulario para crear un pedido con productos
    end
    def mostrar
        #TODO mostrar un pedido con todos los productos

    end

    def editar
        #TODOeditar la info de un pedido Excepto
        @datos_pedido = PedidosFormulario.new
        @datos_pedido.id            = @pedido.id
        @datos_pedido.nombre        = @pedido.datos_envio.nombre
        @datos_pedido.correo        = @pedido.datos_envio.correo
        @datos_pedido.telefono      = @pedido.datos_envio.telefono
        @datos_pedido.direccion     = @pedido.datos_envio.direccion
        @datos_pedido.destino_id    = @pedido.destino.id
    
    end

    

   #post
    def guardar

    end

    #put/patch
    def actualizar

    end

    #DELETE
    def eliminar
        #TODO analizas si eliminar pedido o cambioar su estado
    end

    private
    def params_pedidos

    end

    def asignar_pedido
        @pedido = Pedido.find(params[:id])
    
    rescue ActiveRecord::RecordNotFound
    
        flash[:errors] = "pedido no encontrado"
        redirect_to action: :listar
    end
end