

pro REMOVE_ROW, array, rows
    dims = size(array, /dimensions)
    array = array[*, where( ~histogram( rows, min=0, max=dims[1]-1 ), /NULL )] 
    end


pro REMOVE_ROW_AGAIN, array, rows
    dims = size(array, /dimensions)
    replicate_inplace, array, -1, rows, [0,rows]
    array = reform( array[ where( array ne -1) ],  )
end
