;
;get data from the VS0
;
;
;
;cycle through each of the EUV wavelengths and get images at 1 minute intervals


;search for files
;tstart='2011/12/09 16:00:00'
;tend='2011/12/09 22:00:00'
tstart='2011/02/01 21:00:00'
tend='2011/02/01 21:00:59'

sample='60'

dat94=vso_search(tstart,tend,$
                  instr='aia',sample=sample,wave='94')
dat131=vso_search(tstart,tend,$
                  instr='aia',sample=sample,wave='131')
dat171=vso_search(tstart,tend,$
                  instr='aia',sample=sample,wave='171')
dat193=vso_search(tstart,tend,$
                  instr='aia',sample=sample,wave='193')
dat211=vso_search(tstart,tend,$
                  instr='aia',sample=sample,wave='211')
dat304=vso_search(tstart,tend,$
                  instr='aia',sample=sample,wave='304')
dat335=vso_search(tstart,tend,$
                  instr='aia',sample=sample,wave='335')

;stop

;now actuall download the data, this will take a long time and
;uninterupted internet connect.  Can run while ssh'd using the
;'screen' command

dir='/home/aldebaran/schonfsj/research/data/aia/'

;shouldn't redownload data that's already stored in the local directory
status94=vso_get(dat94,/force,out_dir=dir)
status131=vso_get(dat131,/force,out_dir=dir)
status171=vso_get(dat171,/force,out_dir=dir)
status193=vso_get(dat193,/force,out_dir=dir)
status211=vso_get(dat211,/force,out_dir=dir)
;status304=vso_get(dat304,/force,out_dir=dir)
status335=vso_get(dat335,/force,out_dir=dir)

end
