require "mongo"

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

    class MongoDB

        def remove_user(email)
            client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
            users = client[:users]
            users.delete_many({ email: "alan@temp.vc" })
        end
        
    end

