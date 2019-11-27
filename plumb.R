API <- plumber::plumb("plumber.R") 

API$run(host = '0.0.0.0', 
        port = 8002,
        swagger = T)