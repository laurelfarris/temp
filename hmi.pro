; Last modified:    Sun Apr 16 17:15:14 EDT 2017

;; Can do all 7 AIA images and 1 HMI for nice, 8-image figure!

path = "/solarstorm/laurel07/Data/hmi/"

fls = ( file_search( path + "*.fits" ) )

read_sdo, fls, index, data

im = image( data[*,*,0], layout=[1,1,1], margin=0 )

end
