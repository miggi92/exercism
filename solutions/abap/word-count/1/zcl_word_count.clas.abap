CLASS zcl_word_count DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      BEGIN OF return_structure,
        word  TYPE string,
        count TYPE i,
      END OF return_structure,
      return_table TYPE STANDARD TABLE OF return_structure WITH KEY word.
    METHODS count_words
      IMPORTING
        !phrase       TYPE string
      RETURNING
        VALUE(result) TYPE return_table .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_word_count IMPLEMENTATION.

  METHOD count_words.
    data result_line like line of result.

    data(converted_phrase) = replace( val = to_lower( phrase ) 
                              sub = '\n' 
                              with = ` ` 
                              occ = 0 ). 
    converted_phrase = replace( val = converted_phrase 
                        sub = `'` 
                        with = `` 
                        occ = 0 ).
    
    REPLACE ALL OCCURRENCES OF REGEX '[^a-z0-9]' IN converted_phrase WITH ` `.
  
    split converted_phrase at space into table data(words).

    loop at words assigning field-symbol(<word>).      
      IF <word> IS INITIAL.
        CONTINUE.
      ENDIF.
      try.
        result_line = result[ word = <word> ].       
    
        result_line-count = result_line-count + 1.
        modify table result from result_line.
      catch CX_SY_ITAB_LINE_NOT_FOUND.
        result_line = value #( word = <word> count = 1 ).
        append result_line to result.
      endtry.
    endloop.
  ENDMETHOD.
ENDCLASS.
