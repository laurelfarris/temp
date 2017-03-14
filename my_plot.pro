!P.COLOR='FF0000'x
!P.BACKGROUND='EEEEEE'x

p1 = A[3].data[49, 56, *]
p2 = A[3].data[66, 68, *]

plot, p1
oplot, p2

tau = A[3].time
timelag, p1, p2, tau, maxcor, c

plot, tau, c



end
