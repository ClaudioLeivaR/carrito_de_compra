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
        
        @datos_pedido.estado_id     = @pedido.estados_pedido.id
        @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
        
        @estados = EstadosPedido.select(:id, :estado).order(estado: :asc)
    end

    

   #post
    def guardar

    end

    #put/patch
    def actualizar
        @datos_pedido = PedidosFormulario.new(params_pedidos)
        if @datos_pedido.valid?
            @pedido.datos_envio.nombre = @datos_pedido.nombre
            @pedido.datos_envio.correo = @datos_pedido.correo
            @pedido.datos_envio.telefono = @datos_pedido.telefono
            @pedido.datos_envio.direccion = @datos_pedido.direccion
            
            @pedido.destino = Destino.find(@datos_pedido.destino_id)
            @pedido.estados_pedido = EstadosPedido.find(@datos_pedido.estado_id)
            
            if @pedido.datos_envio.save and @pedido.save
                redirect_to action: :mostrar
            else                
                @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
                @estados = EstadosPedido.select(:id, :estado).order(estado: :asc)
                render :editar
            end
        else
            @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
            @estados = EstadosPedido.select(:id, :estado).order(estado: :asc)
            render :editar
        end

    end

    #DELETE
    def eliminar
        #TODO analizas si eliminar pedido o cambioar su estado
    end

    private
    def params_pedidos
        params.require(:admin_pedidos_helper_pedidos_formulario).permit(:nombre, :correo, :telefono, :direccion, :destino_id, :estado_id)
        
    end

    def asignar_pedido
        @pedido = Pedido.find(params[:id])
    
    rescue ActiveRecord::RecordNotFound
    
        flash[:errors] = "pedido no encontrado"
        redirect_to action: :listar
    end
end