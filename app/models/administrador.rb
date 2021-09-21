class Administrador < ApplicationRecord
    has_secure_password
    
    validates(:nombre, presence: true)
    
    validates(:correo, presence: true)
    validates(:correo, uniqueness: true)

    validates(:password, presence: true)
end
