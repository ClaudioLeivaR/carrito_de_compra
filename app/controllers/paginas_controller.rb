class PaginasController < ApplicationController
    
    before_action :validar_carro
    
    def inicio
        

        @todos_los_productos = Producto.select(:id, :nombre, :precio).order(nombre: :asc)
    end

    def carro
           
    end

    def enviar_saludo
        ClienteMailer.with(saludo: 'holas').enviar_hola_mundo.deliver_later
    end

end