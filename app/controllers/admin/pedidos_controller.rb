class Admin::PedidosController < Admin::AdminController
    #GET
    def listar
        @pedidos = Pedido.select(:codigo, :total, :created_at).order(:created_at)
    end

    def crear

    end
    def mostrar

    end
    def editar

    end

   #post
    def guardar

    end

    #put/patch
    def actualizar

    end

    #DELETE
    def eliminar

    end

    private
    def params_pedidos

    end
end