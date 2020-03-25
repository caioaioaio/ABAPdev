class ZCMA_HELLO_WORD definition
  public
  abstract
  create public .

public section.

  types TY_FLOAT type F .

  class-methods CLASS_CONSTRUCTOR .
  methods MAIN .
  methods SET_RADIUS
    importing
      !IM_RADIUS type F .
  class-methods SET_PI
    importing
      !IM_PI type F .
  methods GET_PI
    returning
      value(RE_PI) type F .
  methods GET_RADIUS
    returning
      value(RE_RADIUS) type F .
protected section.

  data AREA type F .

  methods GET_AREA
  abstract
    returning
      value(RE_AREA) type F .
private section.

  types TY_INTEGER type I .

  data RADIUS type F .
  class-data PI type F .
ENDCLASS.



CLASS ZCMA_HELLO_WORD IMPLEMENTATION.


  METHOD class_constructor.
    SET_PI( '3.141592' ).
  ENDMETHOD.


  METHOD get_pi.
    re_pi = pi.
  ENDMETHOD.


  METHOD get_radius.
    re_radius = radius.
  ENDMETHOD.


  METHOD main.
    WRITE 'Hello World'. "ISTO É UM COMENTÁRIO. NÃO FAZER COMENTÁRIOS"
  ENDMETHOD.


  METHOD set_pi.
    pi = im_pi.
  ENDMETHOD.


  METHOD set_radius.
    RADIUS = IM_RADIUS.
  ENDMETHOD.
ENDCLASS.
