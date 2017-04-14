; IDL Version 8.3 (linux x86_64 m64)
; Journal File for laurel07@solarstorm.nmsu.edu
; Working directory: /solarstorm/laurel07/bp_project/repository
; Date: Wed Apr 12 16:18:04 2017
 
.run bp
; 1
.run bp
; 2
help, A
d = A.data[*,*,0]
im = image(d, layout=[1,1,1], margin=0)
im = image(d^0.5, layout=[1,1,1], margin=0)
.com save_figs
save_figs, "test.png"
im = image(d^0.5, layout=[1,1,1], margin=0)
save_figs, "test.png"
help, result
.com save_figs
save_figs, "test.png"
help, result
help, d
retall
help, d
.run bp
; 1
win = getwindows()
help, win
print, win
;<ObjHeapVar15762(GRAPHICSWIN)>
print, getwindows()
;<ObjHeapVar15762(GRAPHICSWIN)>
if getwindows() then print "win"
; % Syntax error.
if getwindows() then print, "win"
; % Expression must be an array in this context: <OBJREF    Array[1]>.
print, n_elements(win)
;           1
win = getwindows()
win = getwindows('plot')
print, iwn
; % PRINT: Variable is undefined: IWN.
print, win
;<NullObject>
win = getwindows()
print, win
;<ObjHeapVar15762(GRAPHICSWIN)>
win = getwindows('plot')
print, n_elements(win)
;           1
help, win
win = getwindows('plot')
help, win
print, n_elements(win)
;           1
w = getwindows()
print, n_elements(w)
;           1
w = getwindows(names=win_names)
print, win_names
; % PRINT: Variable is undefined: WIN_NAMES.
help, d
im = image(d)
w = getwindows(names=win_names)
print, win_names
;Image
im2 = image(d^0.5)
w = getwindows(names=win_names)
print, win_names
;Image Image
print, win_names[0]
;Image
print, n_elements(win_names)
;           2
w = getwindows(names=win_names)
print, n_elements(win_names)
;           2
print, n_elements(win_names2)
;           0
w = getwindows(names=win_names2)
print, n_elements(win_names2)
;           0
print, n_elements(win_names)
;           2
im2 = image(d^0.5, name="bp")
w = getwindows()
print, w
;<ObjHeapVar27589(GRAPHICSWIN)>
w = getwindows("bp")
print, w
;<NullObject>
w = getwindows(name="bp")
print, w
;<ObjHeapVar27589(GRAPHICSWIN)>
im2 = image(d^0)
im3 = image(d^0.1)
w = getwindows()
print, w
;<ObjHeapVar27589(GRAPHICSWIN)><ObjHeapVar30091(GRAPHICSWIN)><ObjHeapVar32640(GRAPHICSWIN)>
print, n_elements(w)
;           3
bp.close
; % Object reference type required in this context: BP.
m = getwindows(names=var)
print, var
;Image Image Image
im = image(d^0.2, name="bp_1")
w = getwindows("bp_1")
help, w
help, im
help, im[0]
w = window(name="bp_window")
m = getwindows()
help, m
print, m
;<ObjHeapVar37150(GRAPHICSWIN)><ObjHeapVar39563(GRAPHICSWIN)>
m = getwindows("bp_window")
print, m
;GRAPHICSWIN <39563>
;  BACKGROUND_COLOR          = 255 255 255
;  DIMENSIONS                = 640.000      512.000
;  EVENT_HANDLER             = <NullObject>
;  KEYBOARD_HANDLER          = ''
;  MOUSE_DOWN_HANDLER        = ''
;  MOUSE_MOTION_HANDLER      = ''
;  MOUSE_UP_HANDLER          = ''
;  MOUSE_WHEEL_HANDLER       = ''
;  NAME                      = 'bp_window'
;  RESOLUTION                = 0.035277778     0.035277778
;  SELECTION_CHANGE_HANDLER  = ''
;  TITLE                     = <NullObject>
;  WINDOW_TITLE              = 'bp_window'
print, m[0]
;GRAPHICSWIN <39563>
;  BACKGROUND_COLOR          = 255 255 255
;  DIMENSIONS                = 640.000      512.000
;  EVENT_HANDLER             = <NullObject>
;  KEYBOARD_HANDLER          = ''
;  MOUSE_DOWN_HANDLER        = ''
;  MOUSE_MOTION_HANDLER      = ''
;  MOUSE_UP_HANDLER          = ''
;  MOUSE_WHEEL_HANDLER       = ''
;  NAME                      = 'bp_window'
;  RESOLUTION                = 0.035277778     0.035277778
;  SELECTION_CHANGE_HANDLER  = ''
;  TITLE                     = <NullObject>
;  WINDOW_TITLE              = 'bp_window'
print, m[1]
; % Attempt to subscript <OBJREF   (<ObjHeapVar39563(GRAPHICSWIN)>)> with I1 is out of range.
help, m
help, m
n_elements(m)
;           1
m[0].close
im = image(d)
im2 = image(d^0.4)
m = getwindows()
n_elements(m)
;           3
m[*].close
; % Expression must be a scalar or 1 element array in this context: <OBJREF    Array[3]>.
for i = 0, 2 do m[i].close
s = intarr(10,10,4)
print, size(s, /dimensions)
;          10          10           4
s = intarr(10,10)
print, size(s, /dimensions)
;          10          10
help, s
print, n_elements(s[0,0,*])
;           1
s = intarr(10,10,4)
print, n_elements(s[0,0,*])
;           4
for i = 0, 5 do print, i/2.
;      0.00000
;     0.500000
;      1.00000
;      1.50000
;      2.00000
;      2.50000
for i = 0, 5 do print, (i/2)+1
;       1
;       1
;       2
;       2
;       3
;       3
n = 4
((n-1)/2)+1
;       2
for i = 1, 6 do print, ((i-1)/2)+1
;       1
;       1
;       2
;       2
;       3
;       3
for i = 1, 6 do print, i/2
;       0
;       1
;       1
;       2
;       2
;       3
5/3
;       1
4/2
;       2
3/2
;       1
