module Admin::PedidosHelper
    class PedidosFormulario
        include ActiveModel::Model
         
        attr_accessor   :id
        attr_accessor   :nombre
        attr_accessor   :correo
        attr_accessor   :direccion
        attr_accessor   :telefono
        attr_accessor   :destino_id
        attr_accessor   :estado_id
        
        validates(:nombre, presence: true)
        validates(:direccion, presence: true)
        validates(:correo, presence: true)
        validates(:telefono, presence: true)
        validates(:destino_id, presence: true)
    
        def persisted?
            self.id != nil
        end

    end

end