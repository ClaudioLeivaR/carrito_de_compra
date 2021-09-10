module ProductosHelper
    def actualizar_estado(valor_check, producto)
        if valor_check == "0"
            producto.estados_producto = EstadosProducto.find_by(estado: 'inactivo')
        else
            producto.estados_producto = EstadosProducto.find_by(estado: 'activo')
        end
        producto.save
    end
    
    def evaluar_estado(valor_check)
        if valor_check == "0"
            EstadosProducto.find_by(estado: 'inactivo')
        else
            EstadosProducto.find_by(estado: 'activo')
        end
   
    end
end