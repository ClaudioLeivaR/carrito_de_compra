Rails.application.routes.draw do

  #Paginas
  root 'paginas#inicio'
  get '/carrito', to: 'paginas#carro'

#Carros

post 'carros/:id_producto', to: 'carros#agregar_producto', as: 'agregar_producto'



  # categorias
  get 'categorias',             to: 'categorias#listar',  as: 'categorias'
  get 'categorias/crear',       to: 'categorias#crear',   as: 'nueva_categoria'
  get 'categorias/:id',         to: 'categorias#mostrar', as: 'categoria'
  get 'categorias/:id/editar',  to: 'categorias#editar',  as: 'editar_categoria'

  post    'categorias',     to: 'categorias#guardar'
  put     'categorias/:id', to: 'categorias#actualizar'
  patch   'categorias/:id', to: 'categorias#actualizar'
  delete  'categorias/:id', to: 'categorias#eliminar'
  
  # productos
  get 'productos',              to: 'productos#listar',   as: 'productos'
  get 'productos/crear',        to: 'productos#crear',    as: 'nuevo_producto'
  get 'productos/:id',          to: 'productos#mostrar',  as: 'producto'
  get 'productos/:id/editar',   to: 'productos#editar',   as: 'editar_producto'

  post    'productos'                         , to: 'productos#guardar'
  put     'productos/:id'                     , to: 'productos#actualizar'
  patch   'productos/:id'                     , to: 'productos#actualizar'
  delete  'productos/:id'                     , to: 'productos#eliminar'
  
  delete  'productos/:id/imagenes/:id_imagen' , to: 'productos#eliminar_foto',  as: 'eliminar_foto'
end