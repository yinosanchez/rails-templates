class User < ApplicationRecord

    has_secure_password

    validates :username, presence: { message: "no puede ser vacio"}
    validates :username, uniqueness: { message: "ya está en uso" }
    validates :password, presence: { message: "no puede ser vacio" }
    validates :email, presence: { message: "no puede ser vacio" }
    validates :password, confirmation: { case_sensitive: true, message: "Las contraseñas son distintas" }
    validate :must_be_email

    def must_be_email
        unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            errors.add(:email, "no es un email")
        end
    end
end