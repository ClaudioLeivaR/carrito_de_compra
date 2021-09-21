Rails.application.routes.draw do

  #devise_for :usuarios
  devise_for :clientes,  controllers:{
    confirmations:      'clientes/confirmations',
    omniauthable: 'clientes/omniauth_callbacks',
    passwords:          'clientes/passwords',
    registrations:      'clientes/registrations',
    sessions:           'clientes/sessions',
    unlocks:            'clientes/unlocks'


  }

  #Paginas
  root  'paginas#inicio'
  get   '/carrito', to: 'paginas#carro', ass: 'carrito'
  get 'enviar', to: 'paginas#enviar_saludo'
  
#Carros
put     'carros/:id_producto/cantidad'   , to: 'carros#aumentar_cantidad_producto'   , as: 'aumentar_producto'
post    'carros/:id_producto'            , to: 'carros#agregar_producto'             , as: 'agregar_producto'
delete  'carros/:id_producto'             , to: 'carros#eliminar_producto'            , as: 'eliminar_producto'
delete  'carros/:id_producto/cantidad'    , to: 'carros#disminuir_cantidad_producto'  , as: 'disminuir_producto'

  #pedidos cliente

  get   'pedidos/crear',  to: 'pedidos#crear'   ,  as: 'nuevo_pedido'
  get   'pagar'       , to: 'pedidos#pagar'   , as: 'pagar'
  post  'pedidos'      ,  to: 'pedidos#guardar' ,  as: 'crear_pedido_cliente'


  #sesiones admin
  post '/sesiones',  to: 'sesiones#inicio_sesion',  as: 'inicio_sesion'
  delete  '/sesiones',  to: 'sesiones#cerrar_sesion',  as: 'cerrar_sesion'
#admins

  namespace :admin do

  # categorias
  get 'categorias',             to: 'categorias#listar',  as: 'categorias'
  get 'categorias/crear',       to: 'categorias#crear',   as: 'nueva_categoria'
  get 'categorias/:id',         to: 'categorias#mostrar', as: 'categoria'
  get 'categorias/:id/editar',  to: 'categorias#editar',  as: 'editar_categoria'

  post    'categorias',     to: 'categorias#guardar'
  put     'categorias/:id', to: 'categorias#actualizar'
  patch   'categorias/:id', to: 'categorias#actualizar'
  delete  'categorias/:id', to: 'categorias#eliminar'


  # detinos
  get 'destinos',             to: 'destinos#listar',  as: 'destinos'
  get 'destinos/crear',       to: 'destinos#crear',   as: 'nuevo_destino'
  get 'destinos/:id',         to: 'destinos#mostrar', as: 'destino'
  get 'destinos/:id/editar',  to: 'destinos#editar',  as: 'editar_destino'

  post    'destinos',     to: 'destinos#guardar'
  put     'destinos/:id', to: 'destinos#actualizar'
  patch   'destinos/:id', to: 'destinos#actualizar'
  delete  'destinos/:id', to: 'destinos#eliminar'

# productos
get 'productos',              to: 'productos#listar',   as: 'productos'
get 'productos/crear',        to: 'productos#crear',    as: 'nuevo_producto'
get 'productos/:id',          to: 'productos#mostrar',  as: 'producto'
get 'productos/:id/editar',   to: 'productos#editar',   as: 'editar_producto'

post    'productos'                         , to: 'productos#guardar'
put     'productos/:id'                     , to: 'productos#actualizar'
patch   'productos/:id'                     , to: 'productos#actualizar'
#delete  'productos/:id'                     , to: 'productos#eliminar' ya no se utiliza por que todo producto se marca como inactivo.

delete  'productos/:id/imagenes/:id_imagen' , to: 'productos#eliminar_foto',  as: 'eliminar_foto'


#PEDIDOS ADMIN

    
    

    get '/pedidos',            to: 'pedidos#listar',   as: 'pedidos'
    #get 'pedidos/crear',     to: 'pedidos#crear',    as: 'nuevo_pedido'
    get 'pedidos/:id',       to: 'pedidos#mostrar',   as: 'pedido'
    get 'pedidos/:id/editar', to: 'pedidos#editar',   as: 'editar_pedido'

    post    'pedidos',          to: 'pedidos#crear'     , as: 'pedidos_helper_pedidos_formularios'
    put     'pedidos/:id',      to: 'pedidos#actualizar'
    patch   'pedidos/:id',      to: 'pedidos#actualizar'  , as: 'pedidos_helper_pedidos_formulario'
    delete  'pedidos:id',       to: 'pedidos#eliminar'

    #TODO Agregar rutas para disminuirm agregar y eliminar un producto de un pedido

    get     'pedidos/:id/productos',                        to: 'pedidos#agregar_producto'  ,             as: 'agregar_producto_pedido'
    post    'pedidos/:id/productos/:id_producto',           to: 'pedidos#guardar_producto'              , as: 'guardar_producto_pedido'
    delete  'pedidos/:id/producto/:id_producto/eliminar'     , to: 'pedidos#eliminar_producto'          , as: 'eliminar_producto_pedido'
    delete  'pedidos/:id/producto/:id_producto'           , to: 'pedidos#disminuir_cantidad_producto'   , as: 'disminuir_producto_pedido'
    put     'pedidos/:id/producto/:id_producto'           , to: 'pedidos#aumentar_cantidad_producto'    , as: 'aumentar_producto_pedido'

    

    
  
  end


end