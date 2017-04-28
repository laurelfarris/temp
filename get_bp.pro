; Last modified:    25 April 2017


function GET_BP, cube

    common BP_BLOCK

    bps = [ $
        [339, 834], $
        [215, 895], $
        [415, 665], $
        [460, 445], $
        [200, 495], $
        [340, 615] ]

    x1 = bps[0,bp] - (x/2)
    x2 = bps[0,bp] + (x/2) - 1
    y1 = bps[1,bp] - (y/2)
    y2 = bps[1,bp] + (y/2) - 1

    return, cube[ x1:x2, y1:y2, 0:z-1 ]
end
