API <- plumber::plumb("fit-prob.R") 

API$run(host = '0.0.0.0', 
        port = 3030,
        swagger = T)
