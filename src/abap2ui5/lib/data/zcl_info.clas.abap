CLASS zcl_info DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
  
    TYPES char255 TYPE c LENGTH 255.
    TYPES: ty_string TYPE STANDARD TABLE OF char255 WITH DEFAULT KEY.

    TYPES: BEGIN OF ty_experience_project,
             title        TYPE char255,
             company      TYPE char255,
             role         TYPE char255,
             period       TYPE char255,
             details      TYPE char255,
             technologies TYPE char255,
           END OF ty_experience_project.
    TYPES: ty_experience_projects TYPE STANDARD TABLE OF ty_experience_project WITH DEFAULT KEY.
    
    CLASS-METHODS: get_name RETURNING VALUE(rv_name) TYPE string,
             get_role RETURNING VALUE(rv_role) TYPE string,
             get_description RETURNING VALUE(rv_description) TYPE string,
             get_location RETURNING VALUE(rv_location) TYPE string,
             get_social RETURNING VALUE(rt_social) TYPE ty_string,
             get_tech_header RETURNING VALUE(rv_line) TYPE string,
             get_skills_sap RETURNING VALUE(rv_skills) TYPE string,
             get_skills_mobile RETURNING VALUE(rv_skills) TYPE string,
             get_skills_devops RETURNING VALUE(rv_skills) TYPE string,
             get_skills_other RETURNING VALUE(rv_skills) TYPE string,
             get_about_expertise RETURNING VALUE(rv_line) TYPE string,
             get_about_technical_stack RETURNING VALUE(rv_line) TYPE string,
             get_about_focus RETURNING VALUE(rv_line) TYPE string,
             get_about_mobile RETURNING VALUE(rv_line) TYPE string,
             get_about_soft_skills RETURNING VALUE(rv_line) TYPE string,
             get_about_technical_stack_h RETURNING VALUE(rv_line) TYPE string,
             get_about_focus_h RETURNING VALUE(rv_line) TYPE string,
             get_about_mobile_h RETURNING VALUE(rv_line) TYPE string,
             get_about_soft_skills_h RETURNING VALUE(rv_line) TYPE string,
             get_frameworks RETURNING VALUE(rt_frameworks) TYPE ty_string,
             get_projects RETURNING VALUE(rt_projects) TYPE ty_string,
             get_experience_h RETURNING VALUE(rv_line) TYPE string,
             get_experience RETURNING VALUE(rt_projects) TYPE ty_experience_projects.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_info IMPLEMENTATION.

  METHOD get_name.
    rv_name = 'Timofei Bazhukov'.
  ENDMETHOD.

  METHOD get_role.
    rv_role = 'Senior IT Engineer at the LEGO Group'.
  ENDMETHOD.

  METHOD get_description.
    rv_description = 'Senior SAP Engineer and Integration Architect with 10+ years of progressive experience in SAP development, system architecture, and enterprise integration. Driving SAP innovation, governance, and ABAP best practices at scale, with a deep ability to bridge business needs and technical implementation.'.
  ENDMETHOD.

  METHOD get_location.
    rv_location = 'Based in Vejle, Denmark'.
  ENDMETHOD.

  METHOD get_social.
    rt_social = VALUE #(
      ( 'https://linkedin.com/in/bazhukov-timofei' )
      ( 'https://facebook.com/bazhukov.tima' )
      ( 'https://github.com/BazhukovTima' )
      ( 'mailto:bazhukov.tima@gmail.com' )
    ).
  ENDMETHOD.

  METHOD get_tech_header.
    rv_line = 'Expert-level SAP professional focused on enterprise-grade solutions, integration architecture, and SAP Cloud development. Strong leadership in ABAP communities, fostering code quality, scalability, and cross-team collaboration. Secondary proficiency in mobile and web technologies used for prototyping and side-projects.'.
  ENDMETHOD.

  METHOD get_skills_sap.
    rv_skills = |SAPUI5, Fiori, ABAP, CAP, RAP, OData, SOAP, RFC, HANA, CDS, AMDP, xsjs, xsodata, SmartForms, PDF Forms, abapgit, abaplint, BTP, Kyma, Event Mesh, Integration Suite, API Mgmt, ECATT, Launchpad, IMG, BCS, SAP SD, SAP MM, SAP SCM, SAP PE, SAP PLM, SAP ETD, SAP Basis, BAS|.
  ENDMETHOD.

  METHOD get_skills_mobile.
    rv_skills = |Flutter, React Native, Redux, GraphQL, Node.js, QUnit, VSC|.
  ENDMETHOD.

  METHOD get_skills_devops.
    rv_skills = |CI/CD, GitHub Actions, OAuth2, OIDC, SAML, EntraID, AWS, Azure, Tosca, Elastic, Kibana, PagerDuty|.
  ENDMETHOD.

  METHOD get_skills_other.
    rv_skills = |PostSharp, Prism, WPF, .NET, MS Word, MS Excel, SQL, MongoDB, Eclipse|.
  ENDMETHOD.


  METHOD get_about_expertise.
    rv_line = 'Over a decade of experience in SAP engineering and integration, progressing from ABAP developer to architect-level responsibilities. Specialized in SAP BTP, cloud integration, and driving strategic initiatives within SAP landscapes, including ABAP best practices and internal community leadership.'.
  ENDMETHOD.

  METHOD get_about_technical_stack_h.
    rv_line = 'Technical Expertise'.
  ENDMETHOD.

  METHOD get_about_focus_h.
    rv_line = 'Professional Focus'.
  ENDMETHOD.

  METHOD get_about_mobile_h.
    rv_line = 'Cross-Platform Experience'.
  ENDMETHOD.

  METHOD get_about_soft_skills_h.
    rv_line = 'Soft Skills & Strategy'.
  ENDMETHOD.

  METHOD get_about_technical_stack.
    rv_line = 'In-depth expertise in ABAP (including RAP/CAP), SAP Fiori, SAPUI5, OData/SOAP, and SAP BTP. Strong architectural mindset with a focus on integration scenarios, security, extensibility, and clean enterprise design. Experienced in system migrations, cloud-native development, and cross-system communication within SAP ecosystems.'.
  ENDMETHOD.

  METHOD get_about_focus.
    rv_line = 'Leading SAP integration architecture, enablement, and governance at the LEGO Group. Driving adoption of best practices in ABAP development, security compliance, and modern extensibility aligned with digital platform and data lifecycle strategies.'.
  ENDMETHOD.

  METHOD get_about_mobile.
    rv_line = 'Capable of building cross-platform mobile apps using React Native and Flutter. These side-projects demonstrate fast learning, technical curiosity, and passion for modern development — though they remain a secondary focus to enterprise SAP work.'.
  ENDMETHOD.

  METHOD get_about_soft_skills.
    rv_line = 'A pragmatic and collaborative technologist with deep understanding of business processes and ability to connect technical execution with strategic goals. Strong communication skills, project leadership, and hands-on mentoring of teams and communities around SAP best practices.'.
  ENDMETHOD.

  METHOD get_frameworks.
    rt_frameworks = VALUE #(
      ( 'React' ) ( 'SAPUI5' ) ( 'Flutter' ) ( 'abap2ui5' )
    ).
  ENDMETHOD.

  METHOD get_projects.
    rt_projects = VALUE #(
      ( 'Проект 1: Описание проекта 1 - https://example.com/project1' )
      ( 'Проект 2: Описание проекта 2 - https://example.com/project2' )
    ).
  ENDMETHOD.

  METHOD get_experience_h.
    rv_line = 'Key roles in enterprise SAP development and architecture, focusing on governance, integration, and extensibility. Proven track record in driving complex SAP initiatives, mentoring developers, and aligning systems with business needs and enterprise standards. Secondary experience includes side-projects in mobile and cross-platform development.'.
  ENDMETHOD.

  METHOD get_experience.
    rt_projects = VALUE #(
      ( title = 'SAP Governance and Enablement'
        company = 'the LEGO Group'
        role = 'Senior engineer'
        period = 'July 2024 – Present'
        details = 'Governing authority in SAP Product enablement, Architecture, Development, Cyber security, Access control, Integration/Extensibility, Automation, and Data Lifecycle Management. Proactively embracing the latest advancements in SAP technology aligned with company Digital Platform principles and Data Security governance. Designing and developing cutting-edge solutions that drive business success.'
        technologies = 'SAP ecosystem and all connected to integration SAP with other applications technologies.' )

      ( title = 'S4 Hana conversion'
        company = 'the LEGO Group'
        role = 'Senior engineer'
        period = 'July 2024 – Present'
        details = 'Governing authority in SAP Product enablement, Architecture, Development, Cyber security, Access control, Integration/Extensibility, Automation, and Data Lifecycle Management. Proactively embracing the latest advancements in SAP technology aligned with company Digital Platform principles and Data Security governance. Designing and developing cutting-edge solutions that drive business success.'
        technologies = 'SAP ecosystem and all connected to integration SAP with other applications technologies.' )

      ( title = 'Supply Chain Foundation'
        company = 'the LEGO Group'
        role = 'Senior engineer'
        period = 'August 2021 – June 2024'
        details = 'Optimizing and governing the handling and maintenance of master data for the supply chain, enabling supply chain planning and execution according to the operating model, global and local requirements.'
        technologies = 'ABAP Workbench, ABAP BTP environment, SAP Cloud Connector, RAP, CAP, Process Chains framework, Fiori, SAPUI5, CDS artifacts, ADT for Eclipse, abapgit, OData, Web-services' )

      ( title = 'SAP Customer Conversion to X/4 (cbc)'
        company = 'LeverX(SAP Standard development)'
        role = 'Middle ABAP developer'
        period = 'July 2019 – February 2020'
        details = 'SAP Customer Conversion ensures that customer system are successfully converted from solution-builder based configuration content to the new X/4 server context.'
        technologies = 'ABAP Workbench, ABAP OO, ABAP 7.5, Web-services, Solution Builder, IMG, BCS, ECATT.' )

      ( title = 'SAP Enterprise Threat Detection'
        company = 'LeverX(SAP Standard development)'
        role = 'Middle full stack developer'
        period = 'April 2019 – February 2020'
        details = 'SAP ETD is a real-time Security Event Management and –Monitoring solution'
        technologies = 'Fiori, Launchpad, all SAPUI5 packages, HANA AMDP, CDS artifacts, xsjs, js, UNIT tests, xsodata, CDS services, Databases: HANA' )

      ( title = 'PLM Core Developments'
        company = 'LeverX(SAP Standard development)'
        role = 'Middle ABAP developer'
        period = 'April 2019 – June 2019'
        details = 'Standard developments for PLM module'
        technologies = 'ABAP Workbench, ABAP OO, ABAP 7.5, Web-services, OData via ABAP, CDS' )

      ( title = 'LBG PE Localization Developments'
        company = 'LeverX(SAP Standard development)'
        role = 'Middle ABAP developer'
        period = 'February 2019 – April 2019'
        details = 'Localization payment engine for LBG'
        technologies = 'ABAP Workbench, ABAP OO, ABAP 7.4' )

      ( title = 'Cross-platform Mobile Application (Video Conversations)'
        company = 'Stroitel''nyy Dvor OOO'
        role = 'JS(React Native) developer'
        period = 'February 2018 – June 2018'
        details = 'Application for video conversations between two people'
        technologies = 'React Native, NodeJS, MongoDB, Redux, graphql, react-native-webrtc' )

      ( title = 'Cross-platform Mobile Application (Music Bands)'
        company = 'Stroitel''nyy Dvor OOO'
        role = 'JS(React Native) developer'
        period = 'November 2018 – June 2019'
        details = 'Application to search for music bands'
        technologies = 'React Native, NodeJS, MongoDB, Redux, graphql' )

      ( title = 'SAP SCM APO Support'
        company = 'Stroitel''nyy Dvor OOO'
        role = 'SAP SCM APO Support Developer'
        period = 'September 2016 – January 2019'
        details = 'Support and development of the SAP SCM APO system implemented at the enterprise. Major Responsibilities: Developing custom applications in ABAP/4. Integration of SAP SCM and SAP ERP. Writing backend for ABAP microservices using architectures such as SOAP and REST. The project included: Technical support and refinement of existing solutions.'
        technologies = 'SAP SCM, SAP ERP' )

      ( title = 'Developer (.NET platform)'
        company = 'Stroitel''nyy Dvor OOO'
        role = 'Developer (.NET platform)'
        period = 'September 2015 – September 2016'
        details = 'Development and support of the project on the .net platform. Major responsibilities: Development and improvement of the program for cashiers.'
        technologies = '' )
    ).
  ENDMETHOD.

ENDCLASS.
