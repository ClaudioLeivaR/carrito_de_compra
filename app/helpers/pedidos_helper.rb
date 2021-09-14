module PedidosHelper
  class DatosEnvioFormulario
    include ActiveModel::Model

    attr_accessor :nombre
    attr_accessor :correo
    attr_accessor :direccion
	attr_accessor   :telefono
	attr_accessor   :destino_id

	
	validates(:nombre, presence: true)
	validates(:direccion, presence: true)
	validates(:correo, presence: true)
	validates(:telefono, presence: true)
	validates(:destino_id, presence: true)


	end

	def crear_datos_envio(datos_formulario)
		DatosEnvio.create(
			nombre:     datos_formulario.nombre,
			direccion:  datos_formulario.direccion,
			telefono:   datos_formulario.telefono,
			correo:     datos_formulario.correo
		)
	end

	def definir_pedido(total, datos_formulario, datos_envio)
		Pedido.new(
			codigo: SecureRandom.hex(4).upcase,
			total: total,
			destino_id: datos_formulario.destino_id,
			estados_pedido: EstadosPedido.find_by(estado: 'solicitado'),
			datos_envio: datos_envio
		)

	end

	def migrar_productos(carro, pedido)
		carro.carros_contenidos.each do |contenido|
			DetallesPedido.create(
				pedido: pedido,
				producto: contenido.producto,
				cantidad: contenido.cantidad
		)
		end
	end
end 