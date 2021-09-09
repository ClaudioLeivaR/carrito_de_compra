# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_09_161435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "carros", force: :cascade do |t|
    t.float "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "carros_contenidos", force: :cascade do |t|
    t.bigint "carro_id", null: false
    t.bigint "producto_id", null: false
    t.integer "cantidad"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["carro_id"], name: "index_carros_contenidos_on_carro_id"
    t.index ["producto_id"], name: "index_carros_contenidos_on_producto_id"
  end

  create_table "categorias", force: :cascade do |t|
    t.string "categoria"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "datos_envios", force: :cascade do |t|
    t.string "nombre"
    t.string "direccion"
    t.string "correo"
    t.string "telefono"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "destinos", force: :cascade do |t|
    t.string "nombre"
    t.bigint "region_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["region_id"], name: "index_destinos_on_region_id"
  end

  create_table "detalles_pedidos", force: :cascade do |t|
    t.integer "cantidad"
    t.bigint "producto_id", null: false
    t.bigint "pedido_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pedido_id"], name: "index_detalles_pedidos_on_pedido_id"
    t.index ["producto_id"], name: "index_detalles_pedidos_on_producto_id"
  end

  create_table "estados_pedidos", force: :cascade do |t|
    t.string "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "estados_productos", force: :cascade do |t|
    t.string "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.string "codigo"
    t.integer "total"
    t.bigint "destino_id", null: false
    t.bigint "datos_envio_id", null: false
    t.bigint "estados_pedido_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["datos_envio_id"], name: "index_pedidos_on_datos_envio_id"
    t.index ["destino_id"], name: "index_pedidos_on_destino_id"
    t.index ["estados_pedido_id"], name: "index_pedidos_on_estados_pedido_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre"
    t.float "precio"
    t.string "descripcion"
    t.integer "cantidad"
    t.bigint "categoria_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "estados_producto_id"
    t.index ["categoria_id"], name: "index_productos_on_categoria_id"
    t.index ["estados_producto_id"], name: "index_productos_on_estados_producto_id"
  end

  create_table "regiones", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tipos_pagos", force: :cascade do |t|
    t.string "pago"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ventas", force: :cascade do |t|
    t.string "codigo"
    t.integer "valor_total"
    t.date "fecha_pago"
    t.string "voucher"
    t.bigint "tipos_pago_id", null: false
    t.bigint "pedido_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pedido_id"], name: "index_ventas_on_pedido_id"
    t.index ["tipos_pago_id"], name: "index_ventas_on_tipos_pago_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "carros_contenidos", "carros"
  add_foreign_key "carros_contenidos", "productos"
  add_foreign_key "destinos", "regiones"
  add_foreign_key "detalles_pedidos", "pedidos"
  add_foreign_key "detalles_pedidos", "productos"
  add_foreign_key "pedidos", "datos_envios"
  add_foreign_key "pedidos", "destinos"
  add_foreign_key "pedidos", "estados_pedidos"
  add_foreign_key "productos", "categorias"
  add_foreign_key "productos", "estados_productos"
  add_foreign_key "ventas", "pedidos"
  add_foreign_key "ventas", "tipos_pagos"
end
