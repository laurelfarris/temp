source /home/local/etc/cshrc
#setenv QUIET 1
setenv IDL_STARTUP '/home/users/schonfsj/idl_startup.pro'
if ($?prompt) then
	setenv SSW_INSTR "BCS HXT SXT WBS MDI EIT CDS SUMER LASCO TRACE ETHZ Nancay Nobeyama SOON HESSI SOT XRT EIS SXI-GOES12 AIA EVE HMI EUVI COR1 COR2 HI"
	source $SSW/gen/setup/setup.ssw
endif

alias ?disk 'echo /media/disk/schonfsj'
alias cdd 'cd /home/aldebaran/schonfsj'
alias data 'cd /home/aldebaran-data/schonfsj/'
alias adata 'cd /aldebaran-data/schonfsj/'
alias research 'cd /home/aldebaran/schonfsj/research'
alias f10 'cd /home/aldebaran/schonfsj/research/f10.7'
alias disk 'cd /media/disk/schonfsj'
alias web 'cd /home/httpd/html/schonfsj'
alias backup 'cp -ru /home/aldebaran/schonfsj/* /media/disk/schonfsj/aldebaran/'
alias backupdata 'cp -ru /home/aldebaran-data/schonfsj/* /media/disk/schonfsj/aldebaran-data/'
alias dir 'ls -lht'
alias cp 'cp'
alias mv 'mv -i'
alias rm 'rm -i'
alias rmforce 'rm'
alias m 'more'
alias e 'emacs'
alias enw 'emacs -nw'
alias h 'history'
alias astro 'ssh -X schonfsj@astronomy'
alias aldebaran 'ssh -X schonfsj@aldebaran'
alias solarstorm 'ssh -X schonfsj@solarstorm'
alias hyades 'ssh -X schonfsj@hyades'


#Commands to run MESA for 565
setenv MESA_DIR '/home/seismo/jasonj/CODES/mesa'
setenv PGPLOT_DIR '/home/seismo/jasonj/CODES/mesa/utils/pgplot'


