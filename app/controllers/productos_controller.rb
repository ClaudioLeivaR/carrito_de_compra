class ProductosController < ApplicationController

    # GET
    def listar
        @productos = Producto.includes(:categoria).select(:id,:nombre, :precio, :cantidad, :categoria_id).order(nombre: :asc)
    end

    # GET
    def mostrar

    end
    
    # GET
    def crear

        @producto = Producto.new
        @categorias = Categoria.select(:id, :categoria).order(categoria: :asc)

    end

    # GET
    def editar

    end

    # POST
    def guardar

        @producto = Producto.new(params_producto)
        if @producto.save
            redirect_to action: :listar
        else
            @categorias = Categoria.select(:id, :categoria).order(categoria: :asc)
            render :crear
        end


    end

    # PUT/PATCH
    def actualizar

    end

    #DELETE
    def eliminar

    end

    private
    def params_producto
        params.require(:producto).permit(:nombre, :precio, :descripcion, :cantidad, :categoria_id, imagenes:[])
    end

end