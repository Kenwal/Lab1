class Computer
    @@users = {}
    
    def initialize username, password
        @username = username
        @password = password
        
        @files = {}
    end
end