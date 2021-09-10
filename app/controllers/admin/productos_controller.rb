class Admin::ProductosController < Admin::AdminController

    include ProductosHelper
    before_action :asignar_producto, only: [:mostrar, :editar, :actualizar, :eliminar , :eliminar_foto]
    
    # GET
    def listar
        
        @productos_activos      = Producto.includes(:categoria).select(:id,:nombre,:descripcion, :precio, :cantidad, :categoria_id).order(nombre: :asc).where("estados_producto_id=1")
        @productos_inactivos    = Producto.includes(:categoria).select(:id,:nombre,:descripcion, :precio, :cantidad, :categoria_id).order(nombre: :asc).where("estados_producto_id=2")
    end

    # GET
    def mostrar
      
        @columnas = case(@producto.imagenes.count)

        when 0
            "col-12"
        when 1
            "col-12"
        when 2
            "col-6"
        when 3
            "col-4"
        when 4
            "col-3"
        end

    end
    
    # GET
    def crear
   
        @producto = Producto.new
        consultar_categorias
    end

    # GET
    def editar
        
        consultar_categorias


    end

    # POST
    def guardar
         
        @producto = Producto.new(params_producto)
        @producto.estados_producto = evaluar_estado(params_estado_producto)
        if @producto.save
            redirect_to action: :listar
        else
            consultar_categorias
            render :crear
        end


    end

    # PUT/PATCH
    def actualizar
        
        if @producto.update(params_producto)
            actualizar_estado(params_estado_producto, @producto)
            redirect_to admin_producto_path(@producto)
        else
            consultar_categorias
            render :editar
        end
    end

    #DELETE
    def eliminar_foto
        @producto.imagenes.find(params[:id_imagen]).purge
        redirect_to admin_editar_producto_path(@producto)
    end

    def eliminar
        
        #@producto.imagenes.purge_later
        @producto.estados_producto = EstadosProducto.find_by(estado: 'inactivo')
        #eliminar_foto
        @producto.save
        redirect_to action: :listar
    end

    private
    
    def params_estado_producto
        params.require(:producto).permit(:estados_productos_id)[:estados_productos_id] #Regresa solo 0 o 1
    end

    def asignar_producto
        @producto = Producto.includes(:estados_producto, :categoria).find(params[:id])
    rescue ActiveRecord::RecordNotFound
            redirect_to action: :listar
    end
    
    def params_producto
        params.require(:producto).permit(:nombre, :precio, :descripcion, :cantidad, :categoria_id, imagenes:[])
    end

    def consultar_categorias
        @categorias = Categoria.select(:id, :categoria).order(categoria: :asc)
    end
end