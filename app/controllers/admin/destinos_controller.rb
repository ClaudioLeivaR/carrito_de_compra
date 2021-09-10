class Admin::DestinosController < Admin::AdminController
    before_action :asignar_destino, only: [:mostrar, :editar, :actualizar, :eliminar]
    # GET
    def listar
        @destinos = Destino.includes(:region).select(:id, :nombre, :region_id)
    end

    # GET
    def mostrar        
        
    end
    
    # GET
    def crear
        @destino = Destino.new
        consultar_regiones
    end

    # GET
    def editar
        consultar_regiones
    end

    # POST
    def guardar
        @destino = Destino.new(params_destino)
        if @destino.save
            redirect_to action: :listar
        else
            consultar_regiones
            render :crear
        end
    end

    # PUT/PATCH
    def actualizar
        if @destino.update(params_destino)
            redirect_to action: :listar
        else
            consultar_regiones
            render :editar
        end
    end

    # DELETE
    def eliminar
        @destino.destroy
        redirect_to action: :listar
    end

    private
    def asignar_destino
        @destino = Destino.find(params[:id])
    end

    def params_destino
        params.require(:destino).permit(:nombre, :region_id)
    end

    def consultar_regiones
        @regiones = Region.select(:id, :nombre).order(id: :asc)
    end
end