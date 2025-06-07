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
    DATA(skills_sap) = zcl_info=>get_skills_sap( ).
    DATA(skills_mobile) = zcl_info=>get_skills_mobile( ).
    DATA(skills_devops) = zcl_info=>get_skills_devops( ).
    DATA(skills_other) = zcl_info=>get_skills_other( ).
    sections->object_page_section(  id             = 'techSection'
                                    importance     = 'Medium'
                                    title          = 'Technologies and Frameworks'
                                    titleuppercase = abap_false
        )->sub_sections(
            )->object_page_sub_section( id = 'techSectionSub1'
                )->blocks(
                    )->vbox(
                        )->text( id = 'id_tech_header' text = tech_header class = 'sapUiResponsiveMargin sapUiContentPadding'
                        )->simple_form( editable   = abap_false
                                        layout     = 'ColumnLayout'
                                        width      = '100%'
                                        columnsm   = '2'
                                        columnsl   = '3'
                                        columnsxl  = '4'
                                        labelspanl = '12'
                            )->label( id = 'id_skills_sap_header' text = 'SAP'
                            )->text( id = 'id_skills_sap' text = skills_sap
                            )->label( id = 'id_skills_mobile_header' text = 'Mobile and Frontend Development'
                            )->text( id = 'id_skills_mobile' text = skills_mobile
                            )->label( id = 'id_skills_devops_header' text = 'DevOps, Security, and Cloud Integration'
                            )->text( id = 'id_skills_devops' text = skills_devops
                            )->label( id = 'id_skills_other_header' text = 'Other Technologies and Tools'
                            )->text( id = 'id_skills_other' text = skills_other
                    )->get_parent(
                )->get_parent(
            )->get_parent(
        )->get_parent(
    ).

  ENDMETHOD.

ENDCLASS.