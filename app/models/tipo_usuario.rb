class TipoUsuario < ApplicationRecord
    has_many :usuarios

    validates(:tipo, uniqueness: true)
    validates(:tipo, presence: true)
end
