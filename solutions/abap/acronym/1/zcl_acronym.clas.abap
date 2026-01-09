CLASS zcl_acronym DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS parse IMPORTING phrase         TYPE string
                  RETURNING VALUE(acronym) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_acronym IMPLEMENTATION.
  METHOD parse.
    data(clean_phrase) = replace( val = phrase sub = '-' with = ` ` occ = 0 ).
    clean_phrase = replace( val = clean_phrase sub = '_' with = ` ` occ = 0 ).
    
    split clean_phrase at space into table data(words).
    
    loop at words assigning field-symbol(<word>).

      if <word> is initial.
        continue.
      endif.
      
      acronym = |{ acronym }{ to_upper( <word>(1) ) }|.
    endloop.
  ENDMETHOD.
ENDCLASS.
