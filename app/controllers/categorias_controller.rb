class CategoriasController < ApplicationController

    before_action :asignar_categoria, only: [:mostrar, :editar, :actualizar, :eliminar]
    # GET
    def listar
        @categorias = Categoria.select(:id, :categoria).order(categoria: :asc)
    end

    # GET
    def mostrar

    end
    
    # GET
    def crear
        @categoria = Categoria.new
    end

    # GET
    def editar

    end

    # POST
    def guardar
        @categoria = Categoria.new(params_categoria)
        if @categoria.save
            redirect_to action: :listar
        else
            render :crear
        end
    end

    # PUT/PATCH
    def actualizar
        if @categoria.update(params_categoria)
            redirect_to categoria_path
        else
            render :editar
        end
    end

    #DELETE
    def eliminar
        @categoria.destroy
        redirect_to categorias_path
    end

    private
    def asignar_categoria
        @categoria = Categoria.find(params[:id])
    end

    def params_categoria
        params.require(:categoria).permit(:categoria)
    end

end