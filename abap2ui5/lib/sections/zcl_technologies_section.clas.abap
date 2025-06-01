CLASS zcl_technologies_section DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS: get_section
      CHANGING
        sections TYPE REF TO z2ui5_cl_xml_view.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_technologies_section IMPLEMENTATION.

  METHOD get_section.

    " TECHNOLOGIES
    DATA(tech_header) = zcl_info=>get_tech_header( ).
    DATA(skills) = zcl_info=>get_skills( ).
    sections->object_page_section( id             = `techSection`
                                  importance     = `Medium`
                                  title          = `Technologies and Frameworks`
                                  titlelevel     = 2
                                  titleuppercase = abap_false
        )->sub_sections(
            )->object_page_sub_section( id = `techSectionSub1`
                )->blocks(
                    )->vbox(
                        )->text( text = tech_header class = 'sapUiResponsiveMargin sapUiContentPadding'
                        )->simple_form( editable   = abap_false
                                        layout     = `ColumnLayout`
                                        width      = `100%`
                                        columnsm   = `1`
                                        columnsl   = `1`
                                        columnsxl  = `1`
                                        labelspanl = `12`
                            )->label( text = 'Skills'
                            )->text( text = skills
                    )->get_parent(
                )->get_parent(
            )->get_parent(
        )->get_parent(
    ).

  ENDMETHOD.

ENDCLASS.