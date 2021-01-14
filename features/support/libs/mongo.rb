require "mongo"

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

    class MongoDB

        def remove_user(email)
            client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
            users = client[:users]
            users.delete_many({ email: "alan@temp.vc" })
        end

        def get_user(email)
            client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
            users = client[:users]
            user = users.find({email: email}).first
            return user[:_id]
        end
        
        def remove_equipos(name, email)
            user_id = get_user(email)
            client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
            equipos = client[:equipos]
            equipos.delete_many({name: name, user: user_id})
        end


        
    end

