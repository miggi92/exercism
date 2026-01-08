CLASS zcl_rna_transcription DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS
      transcribe
        IMPORTING
          strand             TYPE string
        RETURNING
          VALUE(result)      TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_rna_transcription IMPLEMENTATION.

  METHOD transcribe.
    data new_char type c.
    DATA(text_length) = strlen( strand ).
    
    DO text_length TIMES.
      DATA(current_index) = sy-index - 1.
      
      DATA(single_character) = strand+current_index(1).
      
      case single_character.
        when 'C'.
          new_char = 'G'.
        when 'G'.
          new_char = 'C'.
        when 'T'.
          new_char = 'A'.
        when 'A'.
          new_char = 'U'.
      endcase.
      result = |{ result }{ new_char }|.
    ENDDO.
  ENDMETHOD.

ENDCLASS.
