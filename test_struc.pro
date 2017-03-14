
tags = [ "w1", "w2", "w3" ]
subtags = ["t1", "t2", "t3" ]


; initialize substructure
x = create_struct( name = "me", subtags, 0,0,"")
x = create_struct( name = "me2", subtags, indgen(10),0,"")

;A = create_struct( name = "bp", tags, substruc, substruc, substruc )

;A.w1.t1 = 2
;stop
;A.w1.t2 = indgen(10)




stop


; initialize data types for each subvalue
w = create_struct( name = "wave", $
    tags, 0, 0.0, "" )


s = {wave}

w1 = { wave1, t1:8, t2:999999.0 }
w2 = { wave2, INHERITS wave1 }
w3 = { wave1 }


w1 = create_struct( name = "w94", $
    tags, 1, 4.0, "hi" )

substruc = [substruc, w1]

w2 = create_struct( name = "w131", $
    tags, 4, 8.0, "bye" )

substruc = [substruc, w2]

w3 = create_struct( name = "w171", $
    tags, 9, 3.0, "hi again" )

substruc = [substruc, w3]



A = create_struct( name = "bp", main_tags, w1, w2, w3 )

B = create_struct( name = "bp", main_tags, substruc[0], substruc[1], substruc[2] )
C = create_struct( name = "bp", main_tags, substruc[*] )


end
