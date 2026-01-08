CLASS zcl_leap DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS leap
      IMPORTING
        year          TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.
ENDCLASS.

CLASS zcl_leap IMPLEMENTATION.

  METHOD leap.
* add solution here
data(year_mod_4) = year mod 4.
data(year_mod_100) = year mod 100.
data(year_mod_400) = year mod 400.
    if year_mod_4 = 0 and year_mod_100 <> 0.
      result = abap_true.
    elseif year_mod_100 = 0 and year_mod_400 <> 0.
      result = abap_false.
    elseif year_mod_400 = 0.
      result = abap_true.
    endif.
  ENDMETHOD.

ENDCLASS.
