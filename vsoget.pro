;; NOTE: See aia.lmsal.com for Guide to SDO Data Analysis
;
;
;get data from the VS0
;
;
;cycle through each of the EUV wavelengths and get images at intervals
; set by 'sample' keyword (e.g. sample='60' gets images at 1 minute intervals)


;search for files

tstart='2012/06/01 01:00:00'
tend='2012/06/01 01:59:59' 

;sample='60' ;; Cadence desired (in seconds).

;sample='12'
;


;; Return a structure for each bandpass

dat94=VSO_SEARCH(tstart,tend, instr='aia',sample=sample,wave='94')
dat131=VSO_SEARCH(tstart,tend, instr='aia',sample=sample,wave='131')
dat171=VSO_SEARCH(tstart,tend, instr='aia',sample=sample,wave='171')
dat193=VSO_SEARCH(tstart,tend, instr='aia',sample=sample,wave='193')
dat211=VSO_SEARCH(tstart,tend, instr='aia',sample=sample,wave='211')
dat304=VSO_SEARCH(tstart,tend, instr='aia',sample=sample,wave='304')
dat335=VSO_SEARCH(tstart,tend, instr='aia',sample=sample,wave='335')
;datHMI=VSO_SEARCH(tstart,tend, instr='hmi')

STOP

;now actually download the data, this will take a long time and
;uninterupted internet connect.  Can run while ssh'd using the
;'screen' command

;dir='/solarstorm/laurel07/data/AIA/'
dir='/solarstorm/laurel07/data/HMI/'

;shouldn't redownload data that's already stored in the local directory
; keyword /NODOWNLOAD will get header info only (no data)

;status94=VSO_GET(dat94,/force,out_dir=dir)
;status131=VSO_GET(dat131,/force,out_dir=dir)
;status171=VSO_GET(dat171,/force,out_dir=dir)
;status193=VSO_GET(dat193,/force,out_dir=dir)
;status211=VSO_GET(dat211,/force,out_dir=dir)
;status304=VSO_GET(dat304,/force,out_dir=dir)
;status335=VSO_GET(dat335,/force,out_dir=dir)
statusHMI=VSO_GET(datHMI,/force,out_dir=dir)


END
