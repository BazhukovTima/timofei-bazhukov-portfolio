CLASS zcl_about_section DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS: get_section
      CHANGING
        sections TYPE REF TO z2ui5_cl_xml_view.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_about_section IMPLEMENTATION.

  METHOD get_section.

    " ABOUT
    DATA(expertise) = zcl_info=>get_about_expertise( ).
    DATA(about_focus_header) = zcl_info=>get_about_focus_h( ).
    DATA(technical_stack_header) = zcl_info=>get_about_technical_stack_h( ).
    DATA(mobile_header) = zcl_info=>get_about_mobile_h( ).
    DATA(soft_skills_header) = zcl_info=>get_about_soft_skills_h( ).
    DATA(about_focus) = zcl_info=>get_about_focus( ).
    DATA(technical_stack) = zcl_info=>get_about_technical_stack( ).
    DATA(mobile) = zcl_info=>get_about_mobile( ).
    DATA(soft_skills) = zcl_info=>get_about_soft_skills( ).
    
    sections->object_page_section( id            = 'aboutSection'
                                  importance     = 'Medium'
                                  title          = 'About'
                                  titleuppercase = abap_false
        )->sub_sections(
            )->object_page_sub_section( id = 'aboutSectionSub1'
                )->blocks(
                    )->vbox(
                        )->text( text = expertise class = 'sapUiResponsiveMargin sapUiContentPadding'
                        )->simple_form( editable   = abap_false
                                        layout     = 'ColumnLayout'
                                        width      = '100%'
                                        columnsm   = '2'
                                        columnsl   = '3'
                                        columnsxl  = '4'
                                        labelspanl = '12'
                            )->label( text = about_focus_header
                            )->text( text = about_focus
                            )->label( text = technical_stack_header
                            )->text( text = technical_stack
                            )->label( text = mobile_header
                            )->text( text = mobile
                            )->label( text = soft_skills_header
                            )->text( text = soft_skills
                    )->get_parent(
                )->get_parent(
            )->get_parent(
        )->get_parent(
    ).

  ENDMETHOD.

ENDCLASS.