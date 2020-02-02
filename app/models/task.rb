class Task < ApplicationRecord
    validates :title, presence: { message: "No puede ser vacio" }
    validates :description, presence: { message: "No puede ser vacio" }

    def toggle
        if not done || done.nil?
            done = true
        else
            done = false
        end
    end

    def username
        user_object = User.find_by(id: user)
        if !user_object.nil?
            return user_object.username
        else
            return "Nobody"
        end
    end
end
