class ZCMA_HELLO_COUNTRY definition
  public
  inheriting from ZCMA_HELLO_WORD
  final
  create public .

public section.

  methods GET_COUNTRY_AREA
    returning
      value(RE_AREA_CHILD) type F .
protected section.

  methods GET_AREA
    redefinition .
private section.
ENDCLASS.



CLASS ZCMA_HELLO_COUNTRY IMPLEMENTATION.


  METHOD get_area.
    re_area = 2 * get_pi( ) * ( get_radius( ) ** 2 ).
  ENDMETHOD.


  method GET_COUNTRY_AREA.
    RE_AREA_CHILD = 2 * get_area( ).
  endmethod.
ENDCLASS.
