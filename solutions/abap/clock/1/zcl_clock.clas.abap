CLASS zcl_clock DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        !hours   TYPE i
        !minutes TYPE i DEFAULT 0.
    METHODS get
      RETURNING
        VALUE(result) TYPE string.
    METHODS add
      IMPORTING
        !minutes TYPE i.
    METHODS sub
      IMPORTING
        !minutes TYPE i.

  PRIVATE SECTION.
    data hours type i.
    data minutes type i.

ENDCLASS.



CLASS zcl_clock IMPLEMENTATION.

  METHOD add.
    DATA(total_minutes) = ( hours * 60 ) + me->minutes + minutes.
    total_minutes = total_minutes MOD 1440.
    
    hours   = total_minutes DIV 60.
    me->minutes = total_minutes MOD 60.
  ENDMETHOD.


  METHOD constructor.
    add( ( hours * 60 ) + minutes ).
  ENDMETHOD.


  METHOD get.
   result = |{ hours WIDTH = 2 ALIGN = RIGHT PAD = '0' }:{ 
               minutes WIDTH = 2 ALIGN = RIGHT PAD = '0' }|.
  ENDMETHOD.


  METHOD sub.
    add( minutes * -1 ).
  ENDMETHOD.
ENDCLASS.
