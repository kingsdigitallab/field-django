--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.wagtailusers_userprofile DROP CONSTRAINT wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id;
ALTER TABLE ONLY public.wagtailsearch_querydailyhits DROP CONSTRAINT wagtailsearch_queryd_query_id_2185994b_fk_wagtailse;
ALTER TABLE ONLY public.wagtailsearch_editorspick DROP CONSTRAINT wagtailsearch_editor_query_id_c6eee4a0_fk_wagtailse;
ALTER TABLE ONLY public.wagtailsearch_editorspick DROP CONSTRAINT wagtailsearch_editor_page_id_28cbc274_fk_wagtailco;
ALTER TABLE ONLY public.wagtailredirects_redirect DROP CONSTRAINT wagtailredirects_red_site_id_780a0e1e_fk_wagtailco;
ALTER TABLE ONLY public.wagtailredirects_redirect DROP CONSTRAINT wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco;
ALTER TABLE ONLY public.wagtailmenus_mainmenu DROP CONSTRAINT wagtailmenus_mainmenu_site_id_84b0fde4_fk_wagtailcore_site_id;
ALTER TABLE ONLY public.wagtailmenus_mainmenuitem DROP CONSTRAINT wagtailmenus_mainmen_menu_id_6505d4c4_fk_wagtailme;
ALTER TABLE ONLY public.wagtailmenus_mainmenuitem DROP CONSTRAINT wagtailmenus_mainmen_link_page_id_208a4a4d_fk_wagtailco;
ALTER TABLE ONLY public.wagtailmenus_flatmenu DROP CONSTRAINT wagtailmenus_flatmenu_site_id_516a598d_fk_wagtailcore_site_id;
ALTER TABLE ONLY public.wagtailmenus_flatmenuitem DROP CONSTRAINT wagtailmenus_flatmen_menu_id_757c39da_fk_wagtailme;
ALTER TABLE ONLY public.wagtailmenus_flatmenuitem DROP CONSTRAINT wagtailmenus_flatmen_link_page_id_36779c0f_fk_wagtailco;
ALTER TABLE ONLY public.wagtailimages_rendition DROP CONSTRAINT wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim;
ALTER TABLE ONLY public.wagtailimages_image DROP CONSTRAINT wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user;
ALTER TABLE ONLY public.wagtailimages_image DROP CONSTRAINT wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco;
ALTER TABLE ONLY public.wagtailforms_formsubmission DROP CONSTRAINT wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco;
ALTER TABLE ONLY public.wagtaildocs_document DROP CONSTRAINT wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user;
ALTER TABLE ONLY public.wagtaildocs_document DROP CONSTRAINT wagtaildocs_document_collection_id_23881625_fk_wagtailco;
ALTER TABLE ONLY public.wagtailcore_site DROP CONSTRAINT wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id;
ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups DROP CONSTRAINT wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco;
ALTER TABLE ONLY public.wagtailcore_pageviewrestriction DROP CONSTRAINT wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco;
ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups DROP CONSTRAINT wagtailcore_pageview_group_id_6460f223_fk_auth_grou;
ALTER TABLE ONLY public.wagtailcore_pagerevision DROP CONSTRAINT wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id;
ALTER TABLE ONLY public.wagtailcore_pagerevision DROP CONSTRAINT wagtailcore_pagerevi_page_id_d421cc1d_fk_wagtailco;
ALTER TABLE ONLY public.wagtailcore_page DROP CONSTRAINT wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id;
ALTER TABLE ONLY public.wagtailcore_page DROP CONSTRAINT wagtailcore_page_live_revision_id_930bd822_fk_wagtailco;
ALTER TABLE ONLY public.wagtailcore_page DROP CONSTRAINT wagtailcore_page_content_type_id_c28424df_fk_django_co;
ALTER TABLE ONLY public.wagtailcore_grouppagepermission DROP CONSTRAINT wagtailcore_grouppag_page_id_710b114a_fk_wagtailco;
ALTER TABLE ONLY public.wagtailcore_grouppagepermission DROP CONSTRAINT wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou;
ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission DROP CONSTRAINT wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm;
ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission DROP CONSTRAINT wagtailcore_groupcol_group_id_05d61460_fk_auth_grou;
ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission DROP CONSTRAINT wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco;
ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups DROP CONSTRAINT wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou;
ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups DROP CONSTRAINT wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco;
ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction DROP CONSTRAINT wagtailcore_collecti_collection_id_761908ec_fk_wagtailco;
ALTER TABLE ONLY public.taggit_taggeditem DROP CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id;
ALTER TABLE ONLY public.taggit_taggeditem DROP CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co;
ALTER TABLE ONLY public.puput_tagentrypage DROP CONSTRAINT puput_tagentrypage_tag_id_eac01467_fk_taggit_tag_id;
ALTER TABLE ONLY public.puput_tagentrypage DROP CONSTRAINT puput_tagentrypage_content_object_id_ba928a7d_fk_puput_ent;
ALTER TABLE ONLY public.puput_entrypagerelated DROP CONSTRAINT puput_entrypagerelat_entrypage_to_id_8e606029_fk_puput_ent;
ALTER TABLE ONLY public.puput_entrypagerelated DROP CONSTRAINT puput_entrypagerelat_entrypage_from_id_0a315375_fk_puput_ent;
ALTER TABLE ONLY public.puput_entrypage DROP CONSTRAINT puput_entrypage_page_ptr_id_aa00d782_fk_wagtailcore_page_id;
ALTER TABLE ONLY public.puput_entrypage DROP CONSTRAINT puput_entrypage_header_image_id_0b1f03cc_fk_wagtailim;
ALTER TABLE ONLY public.puput_categoryentrypage DROP CONSTRAINT puput_categoryentryp_page_id_cd5c1ea8_fk_puput_ent;
ALTER TABLE ONLY public.puput_categoryentrypage DROP CONSTRAINT puput_categoryentryp_category_id_c72ee26b_fk_puput_cat;
ALTER TABLE ONLY public.puput_category DROP CONSTRAINT puput_category_parent_id_1178e53c_fk_puput_category_id;
ALTER TABLE ONLY public.puput_blogpage DROP CONSTRAINT puput_blogpage_page_ptr_id_6ef7bf6b_fk_wagtailcore_page_id;
ALTER TABLE ONLY public.puput_blogpage DROP CONSTRAINT puput_blogpage_header_image_id_26328fc5_fk_wagtailim;
ALTER TABLE ONLY public.kdl_wagtail_page_richpage DROP CONSTRAINT kdl_wagtail_page_ric_page_ptr_id_cea17258_fk_wagtailco;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
DROP INDEX public.wagtailsearch_querydailyhits_query_id_2185994b;
DROP INDEX public.wagtailsearch_query_query_string_e785ea07_like;
DROP INDEX public.wagtailsearch_editorspick_query_id_c6eee4a0;
DROP INDEX public.wagtailsearch_editorspick_page_id_28cbc274;
DROP INDEX public.wagtailredirects_redirect_site_id_780a0e1e;
DROP INDEX public.wagtailredirects_redirect_redirect_page_id_b5728a8f;
DROP INDEX public.wagtailredirects_redirect_old_path_bb35247b_like;
DROP INDEX public.wagtailredirects_redirect_old_path_bb35247b;
DROP INDEX public.wagtailmenus_mainmenuitem_menu_id_6505d4c4;
DROP INDEX public.wagtailmenus_mainmenuitem_link_page_id_208a4a4d;
DROP INDEX public.wagtailmenus_flatmenuitem_menu_id_757c39da;
DROP INDEX public.wagtailmenus_flatmenuitem_link_page_id_36779c0f;
DROP INDEX public.wagtailmenus_flatmenu_site_id_516a598d;
DROP INDEX public.wagtailmenus_flatmenu_handle_fd420cad_like;
DROP INDEX public.wagtailmenus_flatmenu_handle_fd420cad;
DROP INDEX public.wagtailimages_rendition_image_id_3e1fd774;
DROP INDEX public.wagtailimages_rendition_filter_spec_1cba3201_like;
DROP INDEX public.wagtailimages_rendition_filter_spec_1cba3201;
DROP INDEX public.wagtailimages_image_uploaded_by_user_id_5d73dc75;
DROP INDEX public.wagtailimages_image_created_at_86fa6cd4;
DROP INDEX public.wagtailimages_image_collection_id_c2f8af7e;
DROP INDEX public.wagtailforms_formsubmission_page_id_e48e93e7;
DROP INDEX public.wagtaildocs_document_uploaded_by_user_id_17258b41;
DROP INDEX public.wagtaildocs_document_collection_id_23881625;
DROP INDEX public.wagtailcore_site_root_page_id_e02fb95c;
DROP INDEX public.wagtailcore_site_hostname_96b20b46_like;
DROP INDEX public.wagtailcore_site_hostname_96b20b46;
DROP INDEX public.wagtailcore_pageviewrestriction_page_id_15a8bea6;
DROP INDEX public.wagtailcore_pageviewrestriction_groups_group_id_6460f223;
DROP INDEX public.wagtailcore_pageviewrestri_pageviewrestriction_id_f147a99a;
DROP INDEX public.wagtailcore_pagerevision_user_id_2409d2f4;
DROP INDEX public.wagtailcore_pagerevision_submitted_for_moderation_c682e44c;
DROP INDEX public.wagtailcore_pagerevision_page_id_d421cc1d;
DROP INDEX public.wagtailcore_pagerevision_created_at_66954e3b;
DROP INDEX public.wagtailcore_page_slug_e7c11b8f_like;
DROP INDEX public.wagtailcore_page_slug_e7c11b8f;
DROP INDEX public.wagtailcore_page_path_98eba2c8_like;
DROP INDEX public.wagtailcore_page_owner_id_fbf7c332;
DROP INDEX public.wagtailcore_page_live_revision_id_930bd822;
DROP INDEX public.wagtailcore_page_first_published_at_2b5dd637;
DROP INDEX public.wagtailcore_page_content_type_id_c28424df;
DROP INDEX public.wagtailcore_grouppagepermission_page_id_710b114a;
DROP INDEX public.wagtailcore_grouppagepermission_group_id_fc07e671;
DROP INDEX public.wagtailcore_groupcollectionpermission_permission_id_1b626275;
DROP INDEX public.wagtailcore_groupcollectionpermission_group_id_05d61460;
DROP INDEX public.wagtailcore_groupcollectionpermission_collection_id_5423575a;
DROP INDEX public.wagtailcore_collectionviewrestriction_groups_group_id_1823f2a3;
DROP INDEX public.wagtailcore_collectionviewrestriction_collection_id_761908ec;
DROP INDEX public.wagtailcore_collectionview_collectionviewrestriction__47320efd;
DROP INDEX public.wagtailcore_collection_path_d848dc19_like;
DROP INDEX public.taggit_taggeditem_tag_id_f4f5b767;
DROP INDEX public.taggit_taggeditem_object_id_e2d7d1df;
DROP INDEX public.taggit_taggeditem_content_type_id_object_id_196cc965_idx;
DROP INDEX public.taggit_taggeditem_content_type_id_9957a03c;
DROP INDEX public.taggit_tag_slug_6be58b2c_like;
DROP INDEX public.taggit_tag_name_58eb2ed9_like;
DROP INDEX public.puput_tagentrypage_tag_id_eac01467;
DROP INDEX public.puput_tagentrypage_content_object_id_ba928a7d;
DROP INDEX public.puput_entrypagerelated_entrypage_to_id_8e606029;
DROP INDEX public.puput_entrypagerelated_entrypage_from_id_0a315375;
DROP INDEX public.puput_entrypage_header_image_id_0b1f03cc;
DROP INDEX public.puput_categoryentrypage_page_id_cd5c1ea8;
DROP INDEX public.puput_categoryentrypage_category_id_c72ee26b;
DROP INDEX public.puput_category_slug_2d6b57e9_like;
DROP INDEX public.puput_category_parent_id_1178e53c;
DROP INDEX public.puput_category_name_dda73b16_like;
DROP INDEX public.puput_blogpage_header_image_id_26328fc5;
DROP INDEX public.django_session_session_key_c0390e0f_like;
DROP INDEX public.django_session_expire_date_a5c62663;
DROP INDEX public.django_admin_log_user_id_c564eba6;
DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX public.auth_user_username_6821ab7c_like;
DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
DROP INDEX public.auth_user_groups_group_id_97559544;
DROP INDEX public.auth_permission_content_type_id_2f476e4b;
DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX public.auth_group_name_a6ea08ec_like;
ALTER TABLE ONLY public.wagtailusers_userprofile DROP CONSTRAINT wagtailusers_userprofile_user_id_key;
ALTER TABLE ONLY public.wagtailusers_userprofile DROP CONSTRAINT wagtailusers_userprofile_pkey;
ALTER TABLE ONLY public.wagtailsearch_querydailyhits DROP CONSTRAINT wagtailsearch_querydailyhits_query_id_date_1dd232e6_uniq;
ALTER TABLE ONLY public.wagtailsearch_querydailyhits DROP CONSTRAINT wagtailsearch_querydailyhits_pkey;
ALTER TABLE ONLY public.wagtailsearch_query DROP CONSTRAINT wagtailsearch_query_query_string_key;
ALTER TABLE ONLY public.wagtailsearch_query DROP CONSTRAINT wagtailsearch_query_pkey;
ALTER TABLE ONLY public.wagtailsearch_editorspick DROP CONSTRAINT wagtailsearch_editorspick_pkey;
ALTER TABLE ONLY public.wagtailredirects_redirect DROP CONSTRAINT wagtailredirects_redirect_pkey;
ALTER TABLE ONLY public.wagtailredirects_redirect DROP CONSTRAINT wagtailredirects_redirect_old_path_site_id_783622d7_uniq;
ALTER TABLE ONLY public.wagtailmenus_mainmenuitem DROP CONSTRAINT wagtailmenus_mainmenuitem_pkey;
ALTER TABLE ONLY public.wagtailmenus_mainmenu DROP CONSTRAINT wagtailmenus_mainmenu_site_id_key;
ALTER TABLE ONLY public.wagtailmenus_mainmenu DROP CONSTRAINT wagtailmenus_mainmenu_pkey;
ALTER TABLE ONLY public.wagtailmenus_flatmenuitem DROP CONSTRAINT wagtailmenus_flatmenuitem_pkey;
ALTER TABLE ONLY public.wagtailmenus_flatmenu DROP CONSTRAINT wagtailmenus_flatmenu_site_id_handle_7b0cab3a_uniq;
ALTER TABLE ONLY public.wagtailmenus_flatmenu DROP CONSTRAINT wagtailmenus_flatmenu_pkey;
ALTER TABLE ONLY public.wagtailimages_rendition DROP CONSTRAINT wagtailimages_rendition_pkey;
ALTER TABLE ONLY public.wagtailimages_rendition DROP CONSTRAINT wagtailimages_rendition_image_id_filter_spec_foc_323c8fe0_uniq;
ALTER TABLE ONLY public.wagtailimages_image DROP CONSTRAINT wagtailimages_image_pkey;
ALTER TABLE ONLY public.wagtailforms_formsubmission DROP CONSTRAINT wagtailforms_formsubmission_pkey;
ALTER TABLE ONLY public.wagtailembeds_embed DROP CONSTRAINT wagtailembeds_embed_url_max_width_8a2922d8_uniq;
ALTER TABLE ONLY public.wagtailembeds_embed DROP CONSTRAINT wagtailembeds_embed_pkey;
ALTER TABLE ONLY public.wagtaildocs_document DROP CONSTRAINT wagtaildocs_document_pkey;
ALTER TABLE ONLY public.wagtailcore_site DROP CONSTRAINT wagtailcore_site_pkey;
ALTER TABLE ONLY public.wagtailcore_site DROP CONSTRAINT wagtailcore_site_hostname_port_2c626d70_uniq;
ALTER TABLE ONLY public.wagtailcore_pageviewrestriction DROP CONSTRAINT wagtailcore_pageviewrestriction_pkey;
ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups DROP CONSTRAINT wagtailcore_pageviewrestriction_groups_pkey;
ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups DROP CONSTRAINT wagtailcore_pageviewrest_pageviewrestriction_id_g_d23f80bb_uniq;
ALTER TABLE ONLY public.wagtailcore_pagerevision DROP CONSTRAINT wagtailcore_pagerevision_pkey;
ALTER TABLE ONLY public.wagtailcore_page DROP CONSTRAINT wagtailcore_page_pkey;
ALTER TABLE ONLY public.wagtailcore_page DROP CONSTRAINT wagtailcore_page_path_key;
ALTER TABLE ONLY public.wagtailcore_grouppagepermission DROP CONSTRAINT wagtailcore_grouppagepermission_pkey;
ALTER TABLE ONLY public.wagtailcore_grouppagepermission DROP CONSTRAINT wagtailcore_grouppageper_group_id_page_id_permiss_0898bdf8_uniq;
ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission DROP CONSTRAINT wagtailcore_groupcollectionpermission_pkey;
ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission DROP CONSTRAINT wagtailcore_groupcollect_group_id_collection_id_p_a21cefe9_uniq;
ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction DROP CONSTRAINT wagtailcore_collectionviewrestriction_pkey;
ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups DROP CONSTRAINT wagtailcore_collectionviewrestriction_groups_pkey;
ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups DROP CONSTRAINT wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq;
ALTER TABLE ONLY public.wagtailcore_collection DROP CONSTRAINT wagtailcore_collection_pkey;
ALTER TABLE ONLY public.wagtailcore_collection DROP CONSTRAINT wagtailcore_collection_path_key;
ALTER TABLE ONLY public.taggit_taggeditem DROP CONSTRAINT taggit_taggeditem_pkey;
ALTER TABLE ONLY public.taggit_tag DROP CONSTRAINT taggit_tag_slug_key;
ALTER TABLE ONLY public.taggit_tag DROP CONSTRAINT taggit_tag_pkey;
ALTER TABLE ONLY public.taggit_tag DROP CONSTRAINT taggit_tag_name_key;
ALTER TABLE ONLY public.t1 DROP CONSTRAINT t1_pkey;
ALTER TABLE ONLY public.puput_tagentrypage DROP CONSTRAINT puput_tagentrypage_pkey;
ALTER TABLE ONLY public.puput_entrypagerelated DROP CONSTRAINT puput_entrypagerelated_pkey;
ALTER TABLE ONLY public.puput_entrypage DROP CONSTRAINT puput_entrypage_pkey;
ALTER TABLE ONLY public.puput_categoryentrypage DROP CONSTRAINT puput_categoryentrypage_pkey;
ALTER TABLE ONLY public.puput_category DROP CONSTRAINT puput_category_slug_key;
ALTER TABLE ONLY public.puput_category DROP CONSTRAINT puput_category_pkey;
ALTER TABLE ONLY public.puput_category DROP CONSTRAINT puput_category_name_key;
ALTER TABLE ONLY public.puput_blogpage DROP CONSTRAINT puput_blogpage_pkey;
ALTER TABLE ONLY public.kdl_wagtail_page_richpage DROP CONSTRAINT kdl_wagtail_page_richpage_pkey;
ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
ALTER TABLE public.wagtailusers_userprofile ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailsearch_querydailyhits ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailsearch_query ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailsearch_editorspick ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailredirects_redirect ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailmenus_mainmenuitem ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailmenus_mainmenu ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailmenus_flatmenuitem ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailmenus_flatmenu ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailimages_rendition ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailimages_image ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailforms_formsubmission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailembeds_embed ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtaildocs_document ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailcore_site ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailcore_pageviewrestriction_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailcore_pageviewrestriction ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailcore_pagerevision ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailcore_page ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailcore_grouppagepermission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailcore_groupcollectionpermission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailcore_collectionviewrestriction_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailcore_collectionviewrestriction ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.wagtailcore_collection ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.taggit_taggeditem ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.taggit_tag ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.puput_tagentrypage ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.puput_entrypagerelated ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.puput_categoryentrypage ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.puput_category ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.wagtailusers_userprofile_id_seq;
DROP TABLE public.wagtailusers_userprofile;
DROP SEQUENCE public.wagtailsearch_querydailyhits_id_seq;
DROP TABLE public.wagtailsearch_querydailyhits;
DROP SEQUENCE public.wagtailsearch_query_id_seq;
DROP TABLE public.wagtailsearch_query;
DROP SEQUENCE public.wagtailsearch_editorspick_id_seq;
DROP TABLE public.wagtailsearch_editorspick;
DROP SEQUENCE public.wagtailredirects_redirect_id_seq;
DROP TABLE public.wagtailredirects_redirect;
DROP SEQUENCE public.wagtailmenus_mainmenuitem_id_seq;
DROP TABLE public.wagtailmenus_mainmenuitem;
DROP SEQUENCE public.wagtailmenus_mainmenu_id_seq;
DROP TABLE public.wagtailmenus_mainmenu;
DROP SEQUENCE public.wagtailmenus_flatmenuitem_id_seq;
DROP TABLE public.wagtailmenus_flatmenuitem;
DROP SEQUENCE public.wagtailmenus_flatmenu_id_seq;
DROP TABLE public.wagtailmenus_flatmenu;
DROP SEQUENCE public.wagtailimages_rendition_id_seq;
DROP TABLE public.wagtailimages_rendition;
DROP SEQUENCE public.wagtailimages_image_id_seq;
DROP TABLE public.wagtailimages_image;
DROP SEQUENCE public.wagtailforms_formsubmission_id_seq;
DROP TABLE public.wagtailforms_formsubmission;
DROP SEQUENCE public.wagtailembeds_embed_id_seq;
DROP TABLE public.wagtailembeds_embed;
DROP SEQUENCE public.wagtaildocs_document_id_seq;
DROP TABLE public.wagtaildocs_document;
DROP SEQUENCE public.wagtailcore_site_id_seq;
DROP TABLE public.wagtailcore_site;
DROP SEQUENCE public.wagtailcore_pageviewrestriction_id_seq;
DROP SEQUENCE public.wagtailcore_pageviewrestriction_groups_id_seq;
DROP TABLE public.wagtailcore_pageviewrestriction_groups;
DROP TABLE public.wagtailcore_pageviewrestriction;
DROP SEQUENCE public.wagtailcore_pagerevision_id_seq;
DROP TABLE public.wagtailcore_pagerevision;
DROP SEQUENCE public.wagtailcore_page_id_seq;
DROP TABLE public.wagtailcore_page;
DROP SEQUENCE public.wagtailcore_grouppagepermission_id_seq;
DROP TABLE public.wagtailcore_grouppagepermission;
DROP SEQUENCE public.wagtailcore_groupcollectionpermission_id_seq;
DROP TABLE public.wagtailcore_groupcollectionpermission;
DROP SEQUENCE public.wagtailcore_collectionviewrestriction_id_seq;
DROP SEQUENCE public.wagtailcore_collectionviewrestriction_groups_id_seq;
DROP TABLE public.wagtailcore_collectionviewrestriction_groups;
DROP TABLE public.wagtailcore_collectionviewrestriction;
DROP SEQUENCE public.wagtailcore_collection_id_seq;
DROP TABLE public.wagtailcore_collection;
DROP SEQUENCE public.taggit_taggeditem_id_seq;
DROP TABLE public.taggit_taggeditem;
DROP SEQUENCE public.taggit_tag_id_seq;
DROP TABLE public.taggit_tag;
DROP TABLE public.t1;
DROP SEQUENCE public.puput_tagentrypage_id_seq;
DROP TABLE public.puput_tagentrypage;
DROP SEQUENCE public.puput_entrypagerelated_id_seq;
DROP TABLE public.puput_entrypagerelated;
DROP TABLE public.puput_entrypage;
DROP SEQUENCE public.puput_categoryentrypage_id_seq;
DROP TABLE public.puput_categoryentrypage;
DROP SEQUENCE public.puput_category_id_seq;
DROP TABLE public.puput_category;
DROP TABLE public.puput_blogpage;
DROP TABLE public.kdl_wagtail_page_richpage;
DROP TABLE public.django_session;
DROP SEQUENCE public.django_migrations_id_seq;
DROP TABLE public.django_migrations;
DROP SEQUENCE public.django_content_type_id_seq;
DROP TABLE public.django_content_type;
DROP SEQUENCE public.django_admin_log_id_seq;
DROP TABLE public.django_admin_log;
DROP SEQUENCE public.auth_user_user_permissions_id_seq;
DROP TABLE public.auth_user_user_permissions;
DROP SEQUENCE public.auth_user_id_seq;
DROP SEQUENCE public.auth_user_groups_id_seq;
DROP TABLE public.auth_user_groups;
DROP TABLE public.auth_user;
DROP SEQUENCE public.auth_permission_id_seq;
DROP TABLE public.auth_permission;
DROP SEQUENCE public.auth_group_permissions_id_seq;
DROP TABLE public.auth_group_permissions;
DROP SEQUENCE public.auth_group_id_seq;
DROP TABLE public.auth_group;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO app_field;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO app_field;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO app_field;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO app_field;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO app_field;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO app_field;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO app_field;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO app_field;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO app_field;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO app_field;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO app_field;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO app_field;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO app_field;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO app_field;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO app_field;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO app_field;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO app_field;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO app_field;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO app_field;

--
-- Name: kdl_wagtail_page_richpage; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.kdl_wagtail_page_richpage (
    page_ptr_id integer NOT NULL,
    body text NOT NULL
);


ALTER TABLE public.kdl_wagtail_page_richpage OWNER TO app_field;

--
-- Name: puput_blogpage; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.puput_blogpage (
    page_ptr_id integer NOT NULL,
    description character varying(255) NOT NULL,
    display_comments boolean NOT NULL,
    display_categories boolean NOT NULL,
    display_tags boolean NOT NULL,
    display_popular_entries boolean NOT NULL,
    display_last_entries boolean NOT NULL,
    display_archive boolean NOT NULL,
    disqus_api_secret text NOT NULL,
    disqus_shortname character varying(128) NOT NULL,
    num_entries_page integer NOT NULL,
    num_last_entries integer NOT NULL,
    num_popular_entries integer NOT NULL,
    num_tags_entry_header integer NOT NULL,
    header_image_id integer,
    short_feed_description boolean NOT NULL,
    main_color character varying(7) NOT NULL
);


ALTER TABLE public.puput_blogpage OWNER TO app_field;

--
-- Name: puput_category; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.puput_category (
    id integer NOT NULL,
    name character varying(80) NOT NULL,
    slug character varying(80) NOT NULL,
    description character varying(500) NOT NULL,
    parent_id integer
);


ALTER TABLE public.puput_category OWNER TO app_field;

--
-- Name: puput_category_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.puput_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.puput_category_id_seq OWNER TO app_field;

--
-- Name: puput_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.puput_category_id_seq OWNED BY public.puput_category.id;


--
-- Name: puput_categoryentrypage; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.puput_categoryentrypage (
    id integer NOT NULL,
    category_id integer NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE public.puput_categoryentrypage OWNER TO app_field;

--
-- Name: puput_categoryentrypage_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.puput_categoryentrypage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.puput_categoryentrypage_id_seq OWNER TO app_field;

--
-- Name: puput_categoryentrypage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.puput_categoryentrypage_id_seq OWNED BY public.puput_categoryentrypage.id;


--
-- Name: puput_entrypage; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.puput_entrypage (
    page_ptr_id integer NOT NULL,
    body text NOT NULL,
    date timestamp with time zone NOT NULL,
    excerpt text NOT NULL,
    num_comments integer NOT NULL,
    header_image_id integer
);


ALTER TABLE public.puput_entrypage OWNER TO app_field;

--
-- Name: puput_entrypagerelated; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.puput_entrypagerelated (
    id integer NOT NULL,
    entrypage_from_id integer NOT NULL,
    entrypage_to_id integer NOT NULL
);


ALTER TABLE public.puput_entrypagerelated OWNER TO app_field;

--
-- Name: puput_entrypagerelated_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.puput_entrypagerelated_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.puput_entrypagerelated_id_seq OWNER TO app_field;

--
-- Name: puput_entrypagerelated_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.puput_entrypagerelated_id_seq OWNED BY public.puput_entrypagerelated.id;


--
-- Name: puput_tagentrypage; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.puput_tagentrypage (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.puput_tagentrypage OWNER TO app_field;

--
-- Name: puput_tagentrypage_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.puput_tagentrypage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.puput_tagentrypage_id_seq OWNER TO app_field;

--
-- Name: puput_tagentrypage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.puput_tagentrypage_id_seq OWNED BY public.puput_tagentrypage.id;


--
-- Name: t1; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.t1 (
    id integer NOT NULL,
    d jsonb
);


ALTER TABLE public.t1 OWNER TO app_field;

--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO app_field;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO app_field;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO app_field;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO app_field;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: wagtailcore_collection; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailcore_collection (
    id integer NOT NULL,
    path character varying(255) COLLATE pg_catalog."C" NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    name character varying(255) NOT NULL,
    CONSTRAINT wagtailcore_collection_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_collection_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE public.wagtailcore_collection OWNER TO app_field;

--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailcore_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_collection_id_seq OWNER TO app_field;

--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailcore_collection_id_seq OWNED BY public.wagtailcore_collection.id;


--
-- Name: wagtailcore_collectionviewrestriction; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailcore_collectionviewrestriction (
    id integer NOT NULL,
    restriction_type character varying(20) NOT NULL,
    password character varying(255) NOT NULL,
    collection_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_collectionviewrestriction OWNER TO app_field;

--
-- Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailcore_collectionviewrestriction_groups (
    id integer NOT NULL,
    collectionviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_collectionviewrestriction_groups OWNER TO app_field;

--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailcore_collectionviewrestriction_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_collectionviewrestriction_groups_id_seq OWNER TO app_field;

--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailcore_collectionviewrestriction_groups_id_seq OWNED BY public.wagtailcore_collectionviewrestriction_groups.id;


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailcore_collectionviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_collectionviewrestriction_id_seq OWNER TO app_field;

--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailcore_collectionviewrestriction_id_seq OWNED BY public.wagtailcore_collectionviewrestriction.id;


--
-- Name: wagtailcore_groupcollectionpermission; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailcore_groupcollectionpermission (
    id integer NOT NULL,
    collection_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_groupcollectionpermission OWNER TO app_field;

--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailcore_groupcollectionpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_groupcollectionpermission_id_seq OWNER TO app_field;

--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailcore_groupcollectionpermission_id_seq OWNED BY public.wagtailcore_groupcollectionpermission.id;


--
-- Name: wagtailcore_grouppagepermission; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailcore_grouppagepermission (
    id integer NOT NULL,
    permission_type character varying(20) NOT NULL,
    group_id integer NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_grouppagepermission OWNER TO app_field;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailcore_grouppagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_grouppagepermission_id_seq OWNER TO app_field;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailcore_grouppagepermission_id_seq OWNED BY public.wagtailcore_grouppagepermission.id;


--
-- Name: wagtailcore_page; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailcore_page (
    id integer NOT NULL,
    path character varying(255) COLLATE pg_catalog."C" NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    live boolean NOT NULL,
    has_unpublished_changes boolean NOT NULL,
    url_path text NOT NULL,
    seo_title character varying(255) NOT NULL,
    show_in_menus boolean NOT NULL,
    search_description text NOT NULL,
    go_live_at timestamp with time zone,
    expire_at timestamp with time zone,
    expired boolean NOT NULL,
    content_type_id integer NOT NULL,
    owner_id integer,
    locked boolean NOT NULL,
    latest_revision_created_at timestamp with time zone,
    first_published_at timestamp with time zone,
    live_revision_id integer,
    last_published_at timestamp with time zone,
    draft_title character varying(255) NOT NULL,
    CONSTRAINT wagtailcore_page_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_page_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE public.wagtailcore_page OWNER TO app_field;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailcore_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_page_id_seq OWNER TO app_field;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailcore_page_id_seq OWNED BY public.wagtailcore_page.id;


--
-- Name: wagtailcore_pagerevision; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailcore_pagerevision (
    id integer NOT NULL,
    submitted_for_moderation boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    content_json text NOT NULL,
    approved_go_live_at timestamp with time zone,
    page_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.wagtailcore_pagerevision OWNER TO app_field;

--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailcore_pagerevision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_pagerevision_id_seq OWNER TO app_field;

--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailcore_pagerevision_id_seq OWNED BY public.wagtailcore_pagerevision.id;


--
-- Name: wagtailcore_pageviewrestriction; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailcore_pageviewrestriction (
    id integer NOT NULL,
    password character varying(255) NOT NULL,
    page_id integer NOT NULL,
    restriction_type character varying(20) NOT NULL
);


ALTER TABLE public.wagtailcore_pageviewrestriction OWNER TO app_field;

--
-- Name: wagtailcore_pageviewrestriction_groups; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailcore_pageviewrestriction_groups (
    id integer NOT NULL,
    pageviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_pageviewrestriction_groups OWNER TO app_field;

--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailcore_pageviewrestriction_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_pageviewrestriction_groups_id_seq OWNER TO app_field;

--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailcore_pageviewrestriction_groups_id_seq OWNED BY public.wagtailcore_pageviewrestriction_groups.id;


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailcore_pageviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_pageviewrestriction_id_seq OWNER TO app_field;

--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailcore_pageviewrestriction_id_seq OWNED BY public.wagtailcore_pageviewrestriction.id;


--
-- Name: wagtailcore_site; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailcore_site (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    port integer NOT NULL,
    is_default_site boolean NOT NULL,
    root_page_id integer NOT NULL,
    site_name character varying(255)
);


ALTER TABLE public.wagtailcore_site OWNER TO app_field;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailcore_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_site_id_seq OWNER TO app_field;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailcore_site_id_seq OWNED BY public.wagtailcore_site.id;


--
-- Name: wagtaildocs_document; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtaildocs_document (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    uploaded_by_user_id integer,
    collection_id integer NOT NULL,
    file_size integer,
    CONSTRAINT wagtaildocs_document_file_size_check CHECK ((file_size >= 0))
);


ALTER TABLE public.wagtaildocs_document OWNER TO app_field;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtaildocs_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtaildocs_document_id_seq OWNER TO app_field;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtaildocs_document_id_seq OWNED BY public.wagtaildocs_document.id;


--
-- Name: wagtailembeds_embed; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailembeds_embed (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    max_width smallint,
    type character varying(10) NOT NULL,
    html text NOT NULL,
    title text NOT NULL,
    author_name text NOT NULL,
    provider_name text NOT NULL,
    thumbnail_url character varying(200),
    width integer,
    height integer,
    last_updated timestamp with time zone NOT NULL
);


ALTER TABLE public.wagtailembeds_embed OWNER TO app_field;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailembeds_embed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailembeds_embed_id_seq OWNER TO app_field;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailembeds_embed_id_seq OWNED BY public.wagtailembeds_embed.id;


--
-- Name: wagtailforms_formsubmission; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailforms_formsubmission (
    id integer NOT NULL,
    form_data text NOT NULL,
    submit_time timestamp with time zone NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE public.wagtailforms_formsubmission OWNER TO app_field;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailforms_formsubmission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailforms_formsubmission_id_seq OWNER TO app_field;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailforms_formsubmission_id_seq OWNED BY public.wagtailforms_formsubmission.id;


--
-- Name: wagtailimages_image; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailimages_image (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    focal_point_x integer,
    focal_point_y integer,
    focal_point_width integer,
    focal_point_height integer,
    uploaded_by_user_id integer,
    file_size integer,
    collection_id integer NOT NULL,
    file_hash character varying(40) NOT NULL,
    CONSTRAINT wagtailimages_image_file_size_check CHECK ((file_size >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_height_check CHECK ((focal_point_height >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_width_check CHECK ((focal_point_width >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_x_check CHECK ((focal_point_x >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_y_check CHECK ((focal_point_y >= 0))
);


ALTER TABLE public.wagtailimages_image OWNER TO app_field;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailimages_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailimages_image_id_seq OWNER TO app_field;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailimages_image_id_seq OWNED BY public.wagtailimages_image.id;


--
-- Name: wagtailimages_rendition; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailimages_rendition (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    focal_point_key character varying(16) NOT NULL,
    image_id integer NOT NULL,
    filter_spec character varying(255) NOT NULL
);


ALTER TABLE public.wagtailimages_rendition OWNER TO app_field;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailimages_rendition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailimages_rendition_id_seq OWNER TO app_field;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailimages_rendition_id_seq OWNED BY public.wagtailimages_rendition.id;


--
-- Name: wagtailmenus_flatmenu; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailmenus_flatmenu (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    handle character varying(100) NOT NULL,
    heading character varying(255) NOT NULL,
    site_id integer NOT NULL,
    max_levels smallint NOT NULL,
    use_specific smallint NOT NULL,
    CONSTRAINT wagtailmenus_flatmenu_max_levels_check CHECK ((max_levels >= 0)),
    CONSTRAINT wagtailmenus_flatmenu_use_specific_check CHECK ((use_specific >= 0))
);


ALTER TABLE public.wagtailmenus_flatmenu OWNER TO app_field;

--
-- Name: wagtailmenus_flatmenu_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailmenus_flatmenu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailmenus_flatmenu_id_seq OWNER TO app_field;

--
-- Name: wagtailmenus_flatmenu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailmenus_flatmenu_id_seq OWNED BY public.wagtailmenus_flatmenu.id;


--
-- Name: wagtailmenus_flatmenuitem; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailmenus_flatmenuitem (
    id integer NOT NULL,
    sort_order integer,
    link_text character varying(255) NOT NULL,
    link_url character varying(255),
    link_page_id integer,
    menu_id integer NOT NULL,
    url_append character varying(255) NOT NULL,
    allow_subnav boolean NOT NULL,
    handle character varying(100) NOT NULL
);


ALTER TABLE public.wagtailmenus_flatmenuitem OWNER TO app_field;

--
-- Name: wagtailmenus_flatmenuitem_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailmenus_flatmenuitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailmenus_flatmenuitem_id_seq OWNER TO app_field;

--
-- Name: wagtailmenus_flatmenuitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailmenus_flatmenuitem_id_seq OWNED BY public.wagtailmenus_flatmenuitem.id;


--
-- Name: wagtailmenus_mainmenu; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailmenus_mainmenu (
    id integer NOT NULL,
    site_id integer NOT NULL,
    max_levels smallint NOT NULL,
    use_specific smallint NOT NULL,
    CONSTRAINT wagtailmenus_mainmenu_max_levels_check CHECK ((max_levels >= 0)),
    CONSTRAINT wagtailmenus_mainmenu_use_specific_check CHECK ((use_specific >= 0))
);


ALTER TABLE public.wagtailmenus_mainmenu OWNER TO app_field;

--
-- Name: wagtailmenus_mainmenu_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailmenus_mainmenu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailmenus_mainmenu_id_seq OWNER TO app_field;

--
-- Name: wagtailmenus_mainmenu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailmenus_mainmenu_id_seq OWNED BY public.wagtailmenus_mainmenu.id;


--
-- Name: wagtailmenus_mainmenuitem; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailmenus_mainmenuitem (
    id integer NOT NULL,
    sort_order integer,
    link_text character varying(255) NOT NULL,
    link_url character varying(255),
    link_page_id integer,
    menu_id integer NOT NULL,
    allow_subnav boolean NOT NULL,
    url_append character varying(255) NOT NULL,
    handle character varying(100) NOT NULL
);


ALTER TABLE public.wagtailmenus_mainmenuitem OWNER TO app_field;

--
-- Name: wagtailmenus_mainmenuitem_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailmenus_mainmenuitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailmenus_mainmenuitem_id_seq OWNER TO app_field;

--
-- Name: wagtailmenus_mainmenuitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailmenus_mainmenuitem_id_seq OWNED BY public.wagtailmenus_mainmenuitem.id;


--
-- Name: wagtailredirects_redirect; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailredirects_redirect (
    id integer NOT NULL,
    old_path character varying(255) NOT NULL,
    is_permanent boolean NOT NULL,
    redirect_link character varying(255) NOT NULL,
    redirect_page_id integer,
    site_id integer
);


ALTER TABLE public.wagtailredirects_redirect OWNER TO app_field;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailredirects_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailredirects_redirect_id_seq OWNER TO app_field;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailredirects_redirect_id_seq OWNED BY public.wagtailredirects_redirect.id;


--
-- Name: wagtailsearch_editorspick; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailsearch_editorspick (
    id integer NOT NULL,
    sort_order integer,
    description text NOT NULL,
    page_id integer NOT NULL,
    query_id integer NOT NULL
);


ALTER TABLE public.wagtailsearch_editorspick OWNER TO app_field;

--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailsearch_editorspick_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailsearch_editorspick_id_seq OWNER TO app_field;

--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailsearch_editorspick_id_seq OWNED BY public.wagtailsearch_editorspick.id;


--
-- Name: wagtailsearch_query; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailsearch_query (
    id integer NOT NULL,
    query_string character varying(255) NOT NULL
);


ALTER TABLE public.wagtailsearch_query OWNER TO app_field;

--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailsearch_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailsearch_query_id_seq OWNER TO app_field;

--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailsearch_query_id_seq OWNED BY public.wagtailsearch_query.id;


--
-- Name: wagtailsearch_querydailyhits; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailsearch_querydailyhits (
    id integer NOT NULL,
    date date NOT NULL,
    hits integer NOT NULL,
    query_id integer NOT NULL
);


ALTER TABLE public.wagtailsearch_querydailyhits OWNER TO app_field;

--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailsearch_querydailyhits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailsearch_querydailyhits_id_seq OWNER TO app_field;

--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailsearch_querydailyhits_id_seq OWNED BY public.wagtailsearch_querydailyhits.id;


--
-- Name: wagtailusers_userprofile; Type: TABLE; Schema: public; Owner: app_field
--

CREATE TABLE public.wagtailusers_userprofile (
    id integer NOT NULL,
    submitted_notifications boolean NOT NULL,
    approved_notifications boolean NOT NULL,
    rejected_notifications boolean NOT NULL,
    user_id integer NOT NULL,
    preferred_language character varying(10) NOT NULL,
    current_time_zone character varying(40) NOT NULL,
    avatar character varying(100) NOT NULL
);


ALTER TABLE public.wagtailusers_userprofile OWNER TO app_field;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: app_field
--

CREATE SEQUENCE public.wagtailusers_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailusers_userprofile_id_seq OWNER TO app_field;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app_field
--

ALTER SEQUENCE public.wagtailusers_userprofile_id_seq OWNED BY public.wagtailusers_userprofile.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_category ALTER COLUMN id SET DEFAULT nextval('public.puput_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_categoryentrypage ALTER COLUMN id SET DEFAULT nextval('public.puput_categoryentrypage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_entrypagerelated ALTER COLUMN id SET DEFAULT nextval('public.puput_entrypagerelated_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_tagentrypage ALTER COLUMN id SET DEFAULT nextval('public.puput_tagentrypage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_collection ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_collection_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_collectionviewrestriction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_collectionviewrestriction_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_groupcollectionpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_grouppagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_page ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_pagerevision ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pagerevision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pageviewrestriction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pageviewrestriction_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_site ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtaildocs_document ALTER COLUMN id SET DEFAULT nextval('public.wagtaildocs_document_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailembeds_embed ALTER COLUMN id SET DEFAULT nextval('public.wagtailembeds_embed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailforms_formsubmission ALTER COLUMN id SET DEFAULT nextval('public.wagtailforms_formsubmission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailimages_image ALTER COLUMN id SET DEFAULT nextval('public.wagtailimages_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailimages_rendition ALTER COLUMN id SET DEFAULT nextval('public.wagtailimages_rendition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailmenus_flatmenu ALTER COLUMN id SET DEFAULT nextval('public.wagtailmenus_flatmenu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailmenus_flatmenuitem ALTER COLUMN id SET DEFAULT nextval('public.wagtailmenus_flatmenuitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailmenus_mainmenu ALTER COLUMN id SET DEFAULT nextval('public.wagtailmenus_mainmenu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailmenus_mainmenuitem ALTER COLUMN id SET DEFAULT nextval('public.wagtailmenus_mainmenuitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailredirects_redirect ALTER COLUMN id SET DEFAULT nextval('public.wagtailredirects_redirect_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailsearch_editorspick ALTER COLUMN id SET DEFAULT nextval('public.wagtailsearch_editorspick_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailsearch_query ALTER COLUMN id SET DEFAULT nextval('public.wagtailsearch_query_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits ALTER COLUMN id SET DEFAULT nextval('public.wagtailsearch_querydailyhits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailusers_userprofile ALTER COLUMN id SET DEFAULT nextval('public.wagtailusers_userprofile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.auth_group (id, name) FROM stdin;
1	Moderators
2	Editors
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	1
5	2	2
6	2	3
7	1	4
8	2	4
9	1	5
10	1	6
11	1	7
12	2	5
13	2	6
14	2	7
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 14, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add image	2	add_image
2	Can change image	2	change_image
3	Can delete image	2	delete_image
4	Can access Wagtail admin	3	access_admin
5	Can add document	4	add_document
6	Can change document	4	change_document
7	Can delete document	4	delete_document
8	Can add log entry	5	add_logentry
9	Can change log entry	5	change_logentry
10	Can delete log entry	5	delete_logentry
11	Can view log entry	5	view_logentry
12	Can add permission	6	add_permission
13	Can change permission	6	change_permission
14	Can delete permission	6	delete_permission
15	Can view permission	6	view_permission
16	Can add user	7	add_user
17	Can change user	7	change_user
18	Can delete user	7	delete_user
19	Can view user	7	view_user
20	Can add group	8	add_group
21	Can change group	8	change_group
22	Can delete group	8	delete_group
23	Can view group	8	view_group
24	Can add content type	9	add_contenttype
25	Can change content type	9	change_contenttype
26	Can delete content type	9	delete_contenttype
27	Can view content type	9	view_contenttype
28	Can add session	10	add_session
29	Can change session	10	change_session
30	Can delete session	10	delete_session
31	Can view session	10	view_session
32	Can add page	1	add_page
33	Can change page	1	change_page
34	Can delete page	1	delete_page
35	Can view page	1	view_page
36	Can add collection view restriction	11	add_collectionviewrestriction
37	Can change collection view restriction	11	change_collectionviewrestriction
38	Can delete collection view restriction	11	delete_collectionviewrestriction
39	Can view collection view restriction	11	view_collectionviewrestriction
40	Can add group page permission	12	add_grouppagepermission
41	Can change group page permission	12	change_grouppagepermission
42	Can delete group page permission	12	delete_grouppagepermission
43	Can view group page permission	12	view_grouppagepermission
44	Can add page view restriction	13	add_pageviewrestriction
45	Can change page view restriction	13	change_pageviewrestriction
46	Can delete page view restriction	13	delete_pageviewrestriction
47	Can view page view restriction	13	view_pageviewrestriction
48	Can add collection	14	add_collection
49	Can change collection	14	change_collection
50	Can delete collection	14	delete_collection
51	Can view collection	14	view_collection
52	Can add site	15	add_site
53	Can change site	15	change_site
54	Can delete site	15	delete_site
55	Can view site	15	view_site
56	Can add page revision	16	add_pagerevision
57	Can change page revision	16	change_pagerevision
58	Can delete page revision	16	delete_pagerevision
59	Can view page revision	16	view_pagerevision
60	Can add group collection permission	17	add_groupcollectionpermission
61	Can change group collection permission	17	change_groupcollectionpermission
62	Can delete group collection permission	17	delete_groupcollectionpermission
63	Can view group collection permission	17	view_groupcollectionpermission
64	Can view document	4	view_document
65	Can add user profile	18	add_userprofile
66	Can change user profile	18	change_userprofile
67	Can delete user profile	18	delete_userprofile
68	Can view user profile	18	view_userprofile
69	Can add rendition	19	add_rendition
70	Can change rendition	19	change_rendition
71	Can delete rendition	19	delete_rendition
72	Can view rendition	19	view_rendition
73	Can view image	2	view_image
74	Can add embed	20	add_embed
75	Can change embed	20	change_embed
76	Can delete embed	20	delete_embed
77	Can view embed	20	view_embed
78	Can add redirect	21	add_redirect
79	Can change redirect	21	change_redirect
80	Can delete redirect	21	delete_redirect
81	Can view redirect	21	view_redirect
82	Can add form submission	22	add_formsubmission
83	Can change form submission	22	change_formsubmission
84	Can delete form submission	22	delete_formsubmission
85	Can view form submission	22	view_formsubmission
86	Can add Tag	23	add_tag
87	Can change Tag	23	change_tag
88	Can delete Tag	23	delete_tag
89	Can view Tag	23	view_tag
90	Can add Tagged Item	24	add_taggeditem
91	Can change Tagged Item	24	change_taggeditem
92	Can delete Tagged Item	24	delete_taggeditem
93	Can view Tagged Item	24	view_taggeditem
94	Can add query	25	add_query
95	Can change query	25	change_query
96	Can delete query	25	delete_query
97	Can view query	25	view_query
98	Can add Query Daily Hits	26	add_querydailyhits
99	Can change Query Daily Hits	26	change_querydailyhits
100	Can delete Query Daily Hits	26	delete_querydailyhits
101	Can view Query Daily Hits	26	view_querydailyhits
102	Can add flat menu	27	add_flatmenu
103	Can change flat menu	27	change_flatmenu
104	Can delete flat menu	27	delete_flatmenu
105	Can view flat menu	27	view_flatmenu
106	Can add menu item	28	add_mainmenuitem
107	Can change menu item	28	change_mainmenuitem
108	Can delete menu item	28	delete_mainmenuitem
109	Can view menu item	28	view_mainmenuitem
110	Can add menu item	29	add_flatmenuitem
111	Can change menu item	29	change_flatmenuitem
112	Can delete menu item	29	delete_flatmenuitem
113	Can view menu item	29	view_flatmenuitem
114	Can add main menu	30	add_mainmenu
115	Can change main menu	30	change_mainmenu
116	Can delete main menu	30	delete_mainmenu
117	Can view main menu	30	view_mainmenu
118	Can add rich page	31	add_richpage
119	Can change rich page	31	change_richpage
120	Can delete rich page	31	delete_richpage
121	Can view rich page	31	view_richpage
122	Can add category entry page	32	add_categoryentrypage
123	Can change category entry page	32	change_categoryentrypage
124	Can delete category entry page	32	delete_categoryentrypage
125	Can view category entry page	32	view_categoryentrypage
126	Can add Blog	33	add_blogpage
127	Can change Blog	33	change_blogpage
128	Can delete Blog	33	delete_blogpage
129	Can view Blog	33	view_blogpage
130	Can add tag entry page	34	add_tagentrypage
131	Can change tag entry page	34	change_tagentrypage
132	Can delete tag entry page	34	delete_tagentrypage
133	Can view tag entry page	34	view_tagentrypage
134	Can add Category	35	add_category
135	Can change Category	35	change_category
136	Can delete Category	35	delete_category
137	Can view Category	35	view_category
138	Can add entry page related	36	add_entrypagerelated
139	Can change entry page related	36	change_entrypagerelated
140	Can delete entry page related	36	delete_entrypagerelated
141	Can view entry page related	36	view_entrypagerelated
142	Can add Entry	37	add_entrypage
143	Can change Entry	37	change_entrypage
144	Can delete Entry	37	delete_entrypage
145	Can view Entry	37	view_entrypage
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 145, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
7	!tNH5uhubQbBuZLwLsN7ENF38cI5Uppmx101k4Ve5	2019-01-30 15:07:36.035346+00	t	jvieira	Miguel	Vieira	jose.m.vieira@kcl.ac.uk	t	t	2019-01-30 15:07:36.017431+00
3	!zNb6lLuWdI85HjuNqIQELGndAEtPtpUuVJnOY2DX	2019-02-13 18:56:39.412206+00	t	tong	Tiffany	Ong	tiffany.ong@kcl.ac.uk	t	t	2019-01-11 08:42:26.387207+00
6	!bhKnvbvegtlR7nWYBLYKJxbkrExFKGgY0rRgAiLM	2019-02-20 11:46:35.108575+00	t	mcoles	Maddie	Coles	madeleine.coles@kcl.ac.uk	f	t	2019-01-11 14:11:13.32753+00
2	!X41yUSRyd0CvQD6XwCMHK75UZ0ifEmqVTwneRYW7	2019-02-21 10:42:57.159043+00	t	njakeman	Neil	Jakeman	neil.jakeman@kcl.ac.uk	t	t	2019-01-09 16:13:06.938879+00
4	!63odDIvqfWcvXd1vrmiw9BQCDd36AbREGAqeLiOD	2019-03-05 10:25:04.329297+00	t	bclark	Beth	Clark	beth.clark@newcastle.ac.uk	f	t	2019-01-11 14:08:31.008484+00
1	!cxA7FvQUJyhnKNzBoEZ2RCODXP9D6jmhWwp4EmXu	2019-03-07 17:45:37.722102+00	t	gnoel	Geoffroy	Noel	geoffroy.noel@kcl.ac.uk	t	t	2019-01-09 02:24:11.856592+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	4	2
2	6	1
3	6	2
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 3, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 7, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	wagtailcore	page
2	wagtailimages	image
3	wagtailadmin	admin
4	wagtaildocs	document
5	admin	logentry
6	auth	permission
7	auth	user
8	auth	group
9	contenttypes	contenttype
10	sessions	session
11	wagtailcore	collectionviewrestriction
12	wagtailcore	grouppagepermission
13	wagtailcore	pageviewrestriction
14	wagtailcore	collection
15	wagtailcore	site
16	wagtailcore	pagerevision
17	wagtailcore	groupcollectionpermission
18	wagtailusers	userprofile
19	wagtailimages	rendition
20	wagtailembeds	embed
21	wagtailredirects	redirect
22	wagtailforms	formsubmission
23	taggit	tag
24	taggit	taggeditem
25	wagtailsearch	query
26	wagtailsearch	querydailyhits
27	wagtailmenus	flatmenu
28	wagtailmenus	mainmenuitem
29	wagtailmenus	flatmenuitem
30	wagtailmenus	mainmenu
31	kdl_wagtail_page	richpage
32	puput	categoryentrypage
33	puput	blogpage
34	puput	tagentrypage
35	puput	category
36	puput	entrypagerelated
37	puput	entrypage
38	puput	tag
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 38, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-01-09 02:19:49.036039+00
2	auth	0001_initial	2019-01-09 02:19:49.163525+00
3	admin	0001_initial	2019-01-09 02:19:49.205578+00
4	admin	0002_logentry_remove_auto_add	2019-01-09 02:19:49.218324+00
5	admin	0003_logentry_add_action_flag_choices	2019-01-09 02:19:49.228794+00
6	contenttypes	0002_remove_content_type_name	2019-01-09 02:19:49.251546+00
7	auth	0002_alter_permission_name_max_length	2019-01-09 02:19:49.259874+00
8	auth	0003_alter_user_email_max_length	2019-01-09 02:19:49.270729+00
9	auth	0004_alter_user_username_opts	2019-01-09 02:19:49.278655+00
10	auth	0005_alter_user_last_login_null	2019-01-09 02:19:49.289003+00
11	auth	0006_require_contenttypes_0002	2019-01-09 02:19:49.291232+00
12	auth	0007_alter_validators_add_error_messages	2019-01-09 02:19:49.299078+00
13	auth	0008_alter_user_username_max_length	2019-01-09 02:19:49.321066+00
14	auth	0009_alter_user_last_name_max_length	2019-01-09 02:19:49.33305+00
15	wagtailcore	0001_initial	2019-01-09 02:19:49.581584+00
16	wagtailcore	0002_initial_data	2019-01-09 02:19:49.585035+00
17	wagtailcore	0003_add_uniqueness_constraint_on_group_page_permission	2019-01-09 02:19:49.588218+00
18	wagtailcore	0004_page_locked	2019-01-09 02:19:49.591102+00
19	wagtailcore	0005_add_page_lock_permission_to_moderators	2019-01-09 02:19:49.593817+00
20	wagtailcore	0006_add_lock_page_permission	2019-01-09 02:19:49.597221+00
21	wagtailcore	0007_page_latest_revision_created_at	2019-01-09 02:19:49.600231+00
22	wagtailcore	0008_populate_latest_revision_created_at	2019-01-09 02:19:49.603243+00
23	wagtailcore	0009_remove_auto_now_add_from_pagerevision_created_at	2019-01-09 02:19:49.606276+00
24	wagtailcore	0010_change_page_owner_to_null_on_delete	2019-01-09 02:19:49.609492+00
25	wagtailcore	0011_page_first_published_at	2019-01-09 02:19:49.612564+00
26	wagtailcore	0012_extend_page_slug_field	2019-01-09 02:19:49.615496+00
27	wagtailcore	0013_update_golive_expire_help_text	2019-01-09 02:19:49.618481+00
28	wagtailcore	0014_add_verbose_name	2019-01-09 02:19:49.621303+00
29	wagtailcore	0015_add_more_verbose_names	2019-01-09 02:19:49.62402+00
30	wagtailcore	0016_change_page_url_path_to_text_field	2019-01-09 02:19:49.627044+00
31	wagtailcore	0017_change_edit_page_permission_description	2019-01-09 02:19:49.645052+00
32	wagtailcore	0018_pagerevision_submitted_for_moderation_index	2019-01-09 02:19:49.665393+00
33	wagtailcore	0019_verbose_names_cleanup	2019-01-09 02:19:49.705281+00
34	wagtailcore	0020_add_index_on_page_first_published_at	2019-01-09 02:19:49.725812+00
35	wagtailcore	0021_capitalizeverbose	2019-01-09 02:19:50.13705+00
36	wagtailcore	0022_add_site_name	2019-01-09 02:19:50.154077+00
37	wagtailcore	0023_alter_page_revision_on_delete_behaviour	2019-01-09 02:19:50.179203+00
38	wagtailcore	0024_collection	2019-01-09 02:19:50.202667+00
39	wagtailcore	0025_collection_initial_data	2019-01-09 02:19:50.225349+00
40	wagtailcore	0026_group_collection_permission	2019-01-09 02:19:50.27815+00
41	wagtailcore	0027_fix_collection_path_collation	2019-01-09 02:19:50.310196+00
42	wagtailcore	0024_alter_page_content_type_on_delete_behaviour	2019-01-09 02:19:50.335382+00
43	wagtailcore	0028_merge	2019-01-09 02:19:50.33758+00
44	wagtailcore	0029_unicode_slugfield_dj19	2019-01-09 02:19:50.350364+00
45	wagtailcore	0030_index_on_pagerevision_created_at	2019-01-09 02:19:50.367029+00
46	wagtailcore	0031_add_page_view_restriction_types	2019-01-09 02:19:50.430117+00
47	wagtailcore	0032_add_bulk_delete_page_permission	2019-01-09 02:19:50.45171+00
48	wagtailcore	0033_remove_golive_expiry_help_text	2019-01-09 02:19:50.473475+00
49	wagtailcore	0034_page_live_revision	2019-01-09 02:19:50.498959+00
50	wagtailcore	0035_page_last_published_at	2019-01-09 02:19:50.516146+00
51	wagtailcore	0036_populate_page_last_published_at	2019-01-09 02:19:50.533611+00
52	wagtailcore	0037_set_page_owner_editable	2019-01-09 02:19:50.558601+00
53	wagtailcore	0038_make_first_published_at_editable	2019-01-09 02:19:50.576498+00
54	wagtailcore	0039_collectionviewrestriction	2019-01-09 02:19:50.660973+00
55	wagtailcore	0040_page_draft_title	2019-01-09 02:19:50.74489+00
56	kdl_wagtail_page	0001_initial	2019-01-09 02:19:50.77875+00
57	taggit	0001_initial	2019-01-09 02:19:50.869006+00
58	wagtailimages	0001_initial	2019-01-09 02:19:50.975104+00
59	wagtailimages	0002_initial_data	2019-01-09 02:19:51.020719+00
60	wagtailimages	0003_fix_focal_point_fields	2019-01-09 02:19:51.057446+00
61	wagtailimages	0004_make_focal_point_key_not_nullable	2019-01-09 02:19:51.090324+00
62	wagtailimages	0005_make_filter_spec_unique	2019-01-09 02:19:51.115905+00
63	wagtailimages	0006_add_verbose_names	2019-01-09 02:19:51.242196+00
64	puput	0001_initial	2019-01-09 02:19:51.464074+00
65	puput	0002_auto_20150919_0925	2019-01-09 02:19:51.529933+00
66	puput	0003_add_short_feed_description_to_blog_page	2019-01-09 02:19:51.568618+00
67	puput	0004_auto_20170912_0928	2019-01-09 02:19:51.589688+00
68	puput	0005_blogpage_main_color	2019-01-09 02:19:51.623363+00
69	sessions	0001_initial	2019-01-09 02:19:51.647903+00
70	taggit	0002_auto_20150616_2121	2019-01-09 02:19:51.671689+00
71	wagtailadmin	0001_create_admin_access_permissions	2019-01-09 02:19:51.710691+00
72	wagtaildocs	0001_initial	2019-01-09 02:19:51.741892+00
73	wagtaildocs	0002_initial_data	2019-01-09 02:19:51.787036+00
74	wagtaildocs	0003_add_verbose_names	2019-01-09 02:19:51.835571+00
75	wagtaildocs	0004_capitalizeverbose	2019-01-09 02:19:51.92066+00
76	wagtaildocs	0005_document_collection	2019-01-09 02:19:51.975845+00
77	wagtaildocs	0006_copy_document_permissions_to_collections	2019-01-09 02:19:52.01593+00
78	wagtaildocs	0005_alter_uploaded_by_user_on_delete_action	2019-01-09 02:19:52.050033+00
79	wagtaildocs	0007_merge	2019-01-09 02:19:52.053673+00
80	wagtaildocs	0008_document_file_size	2019-01-09 02:19:52.079876+00
81	wagtailembeds	0001_initial	2019-01-09 02:19:52.109425+00
82	wagtailembeds	0002_add_verbose_names	2019-01-09 02:19:52.117514+00
83	wagtailembeds	0003_capitalizeverbose	2019-01-09 02:19:52.123581+00
84	wagtailforms	0001_initial	2019-01-09 02:19:52.160289+00
85	wagtailforms	0002_add_verbose_names	2019-01-09 02:19:52.248867+00
86	wagtailforms	0003_capitalizeverbose	2019-01-09 02:19:52.267446+00
87	wagtailimages	0007_image_file_size	2019-01-09 02:19:52.284486+00
88	wagtailimages	0008_image_created_at_index	2019-01-09 02:19:52.306909+00
89	wagtailimages	0009_capitalizeverbose	2019-01-09 02:19:52.411253+00
90	wagtailimages	0010_change_on_delete_behaviour	2019-01-09 02:19:52.441006+00
91	wagtailimages	0011_image_collection	2019-01-09 02:19:52.488847+00
92	wagtailimages	0012_copy_image_permissions_to_collections	2019-01-09 02:19:52.532805+00
93	wagtailimages	0013_make_rendition_upload_callable	2019-01-09 02:19:52.544243+00
94	wagtailimages	0014_add_filter_spec_field	2019-01-09 02:19:52.614642+00
95	wagtailimages	0015_fill_filter_spec_field	2019-01-09 02:19:52.658703+00
96	wagtailimages	0016_deprecate_rendition_filter_relation	2019-01-09 02:19:52.738938+00
97	wagtailimages	0017_reduce_focal_point_key_max_length	2019-01-09 02:19:52.784383+00
98	wagtailimages	0018_remove_rendition_filter	2019-01-09 02:19:52.822247+00
99	wagtailimages	0019_delete_filter	2019-01-09 02:19:52.833348+00
100	wagtailimages	0020_add-verbose-name	2019-01-09 02:19:52.855222+00
101	wagtailimages	0021_image_file_hash	2019-01-09 02:19:52.894323+00
102	wagtailmenus	0001_initial	2019-01-09 02:19:53.099905+00
103	wagtailmenus	0002_auto_20160129_0901	2019-01-09 02:19:53.130231+00
104	wagtailmenus	0003_auto_20160129_2339	2019-01-09 02:19:53.29446+00
105	wagtailmenus	0004_auto_20160130_0024	2019-01-09 02:19:53.316279+00
106	wagtailmenus	0005_auto_20160130_2209	2019-01-09 02:19:53.405717+00
107	wagtailmenus	0006_auto_20160131_1347	2019-01-09 02:19:53.437427+00
108	wagtailmenus	0007_auto_20160131_2000	2019-01-09 02:19:53.532291+00
109	wagtailmenus	0008_auto_20160131_2327	2019-01-09 02:19:53.720548+00
110	wagtailmenus	0009_auto_20160201_0859	2019-01-09 02:19:53.735497+00
111	wagtailmenus	0010_auto_20160201_1558	2019-01-09 02:19:53.760932+00
112	wagtailmenus	0011_auto_20160415_1519	2019-01-09 02:19:53.792396+00
113	wagtailmenus	0012_auto_20160419_0039	2019-01-09 02:19:53.978101+00
114	wagtailmenus	0013_auto_20160423_1124	2019-01-09 02:19:54.036191+00
115	wagtailmenus	0014_auto_20160423_1339	2019-01-09 02:19:54.149763+00
116	wagtailmenus	0015_auto_20160423_1348	2019-01-09 02:19:54.176627+00
117	wagtailmenus	0016_auto_20160930_0645	2019-01-09 02:19:54.246324+00
118	wagtailmenus	0017_auto_20161013_1658	2019-01-09 02:19:54.39962+00
119	wagtailmenus	0018_auto_20161204_2043	2019-01-09 02:19:54.429139+00
120	wagtailmenus	0019_auto_20161204_2143	2019-01-09 02:19:54.445815+00
121	wagtailmenus	0020_auto_20161210_0004	2019-01-09 02:19:54.559598+00
122	wagtailmenus	0021_auto_20170106_2352	2019-01-09 02:19:54.585187+00
123	wagtailmenus	0022_auto_20170913_2125	2019-01-09 02:19:54.611718+00
124	wagtailredirects	0001_initial	2019-01-09 02:19:54.66433+00
125	wagtailredirects	0002_add_verbose_names	2019-01-09 02:19:54.716227+00
126	wagtailredirects	0003_make_site_field_editable	2019-01-09 02:19:54.754084+00
127	wagtailredirects	0004_set_unique_on_path_and_site	2019-01-09 02:19:54.816762+00
128	wagtailredirects	0005_capitalizeverbose	2019-01-09 02:19:55.024905+00
129	wagtailredirects	0006_redirect_increase_max_length	2019-01-09 02:19:55.054929+00
130	wagtailsearch	0001_initial	2019-01-09 02:19:55.168845+00
131	wagtailsearch	0002_add_verbose_names	2019-01-09 02:19:55.245443+00
132	wagtailsearch	0003_remove_editors_pick	2019-01-09 02:19:55.280858+00
133	wagtailusers	0001_initial	2019-01-09 02:19:55.319889+00
134	wagtailusers	0002_add_verbose_name_on_userprofile	2019-01-09 02:19:55.360197+00
135	wagtailusers	0003_add_verbose_names	2019-01-09 02:19:55.376325+00
136	wagtailusers	0004_capitalizeverbose	2019-01-09 02:19:55.419422+00
137	wagtailusers	0005_make_related_name_wagtail_specific	2019-01-09 02:19:55.458085+00
138	wagtailusers	0006_userprofile_prefered_language	2019-01-09 02:19:55.494932+00
139	wagtailusers	0007_userprofile_current_time_zone	2019-01-09 02:19:55.52714+00
140	wagtailusers	0008_userprofile_avatar	2019-01-09 02:19:55.564739+00
141	wagtailcore	0001_squashed_0016_change_page_url_path_to_text_field	2019-01-09 02:19:55.571335+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 141, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
fyikkaqlf7bdskznggt6q9o9mv48nbea	NzIxZmRkNzYwOTNmNjZjODFiNmM1YmMxN2JhNjhjZmIyMGVjODJlNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvX2F1dGhfbGRhcC5iYWNrZW5kLkxEQVBCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTY2MWZlNmMzMThmNWEyMzBjYjlmZDgxMmNlNGU3OWIxNTY2ODJkMyJ9	2019-01-23 02:24:11.872269+00
2djf0n796aqfsk0imonxagppy78jwds6	NGI5ODhhYTQ4NmY3MGRhMzY5NGE4ZjQyOWRiNzU2N2VkZjliZWRiZjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzA4MDg0NTZiZDAxNGJkN2Y0ZGE0NTUxMzJkZDA4ZDVmMDVmMjI0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCJ9	2019-01-25 08:42:26.404466+00
a3pn7k2suebtn2fo7v8jdrtpjfa4fxfd	ZDIyNjc4ZjdiM2RlMzdhMzdhMDM1N2QwZjE4YWE0Njc4MGUxMTJlOTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvX2F1dGhfbGRhcC5iYWNrZW5kLkxEQVBCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTBiOTc2M2UxZjExOWVlZThlM2FmM2ZmYmQ1NDdjYmYwNjY0Njk5YyJ9	2019-01-25 14:09:45.432111+00
unbzdhub1s9xoidcaap0c1reye50q51m	ODUwYzZjM2I2N2MyNjI0YzhmM2FkZDNlMDVjNzYyNjA0ODI4NDNmNzp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9oYXNoIjoiYjExYmY5NDY5NmIwYjI4OWI2MzgwNDY3MzdiNjEwODY2ZjM4YzZlMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCJ9	2019-01-25 14:11:54.505569+00
m8xiywjhqi8srbpoiafkp5jtune9gq52	MzcyZmI3NDI1YjUwYTFmMmI4OTMwZDM3YmY5NWNlYjc3Yjc1NTc1ODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwid2FndGFpbC1wcmV2aWV3LTEzIjpbInNsdWc9YXBwcm9hY2hlcyZzZWFyY2hfZGVzY3JpcHRpb249JnRpdGxlPUFwcHJvYWNoZXMmbmV4dD0mZXhwaXJlX2F0PSZzZW9fdGl0bGU9JmNzcmZtaWRkbGV3YXJldG9rZW49TTQwdlhIQ1N4Um1qRW4zNlEzYTJHa2pkbnlZeldSU1VwYU9sbWRudjFHd3haNWl0ZEN0R0xkN0F0U0FTZnQ5SyZib2R5PSU3QiUyMmJsb2NrcyUyMiUzQSU1QiU3QiUyMmtleSUyMiUzQSUyMmh3eWE5JTIyJTJDJTIydGV4dCUyMiUzQSUyMmhlcmUrYmUrY29kZSUyMiUyQyUyMnR5cGUlMjIlM0ElMjJ1bnN0eWxlZCUyMiUyQyUyMmRlcHRoJTIyJTNBMCUyQyUyMmlubGluZVN0eWxlUmFuZ2VzJTIyJTNBJTVCJTdCJTIyb2Zmc2V0JTIyJTNBMCUyQyUyMmxlbmd0aCUyMiUzQTEyJTJDJTIyc3R5bGUlMjIlM0ElMjJDT0RFJTIyJTdEJTVEJTJDJTIyZW50aXR5UmFuZ2VzJTIyJTNBJTVCJTVEJTJDJTIyZGF0YSUyMiUzQSU3QiU3RCU3RCUyQyU3QiUyMmtleSUyMiUzQSUyMmFvNXB1JTIyJTJDJTIydGV4dCUyMiUzQSUyMiUyMiUyQyUyMnR5cGUlMjIlM0ElMjJ1bnN0eWxlZCUyMiUyQyUyMmRlcHRoJTIyJTNBMCUyQyUyMmlubGluZVN0eWxlUmFuZ2VzJTIyJTNBJTVCJTVEJTJDJTIyZW50aXR5UmFuZ2VzJTIyJTNBJTVCJTVEJTJDJTIyZGF0YSUyMiUzQSU3QiU3RCU3RCU1RCUyQyUyMmVudGl0eU1hcCUyMiUzQSU3QiU3RCU3RCZnb19saXZlX2F0PSIsMTU0NzIwNzYyNS43MjAxNjM4XSwid2FndGFpbC1wcmV2aWV3LTI1IjpbInNsdWc9ZmFxJnNlYXJjaF9kZXNjcmlwdGlvbj0mdGl0bGU9RkFRJm5leHQ9JmV4cGlyZV9hdD0mc2VvX3RpdGxlPSZjc3JmbWlkZGxld2FyZXRva2VuPWFndjUzMkdyQlpKbXNFamF4MG9KbG1DRGNidTl5emlBTm1qVnN5cjQ1T1RBTm15eFV6SG5xZnEwaXY2c1JienEmYm9keT0lN0IlMEQlMEErKysrJTIyZW50aXR5TWFwJTIyJTNBKyU3QiU3RCUyQyUwRCUwQSsrKyslMjJibG9ja3MlMjIlM0ErJTVCJTBEJTBBKysrKysrKyslN0IlMEQlMEErKysrKysrKysrKyslMjJpbmxpbmVTdHlsZVJhbmdlcyUyMiUzQSslNUIlNUQlMkMlMEQlMEErKysrKysrKysrKyslMjJ0eXBlJTIyJTNBKyUyMnVuc3R5bGVkJTIyJTJDJTBEJTBBKysrKysrKysrKysrJTIyZGVwdGglMjIlM0ErMCUyQyUwRCUwQSsrKysrKysrKysrKyUyMmtleSUyMiUzQSslMjJzbmthOCUyMiUyQyUwRCUwQSsrKysrKysrKysrKyUyMnRleHQlMjIlM0ErJTIyUGxhY2Vob2xkZXIrdGV4dCtoZXJlJTIyJTJDJTBEJTBBKysrKysrKysrKysrJTIyZW50aXR5UmFuZ2VzJTIyJTNBKyU1QiU1RCUwRCUwQSsrKysrKysrJTdEJTJDJTBEJTBBKysrKysrKyslN0IlMEQlMEErKysrKysrKysrKyslMjJpbmxpbmVTdHlsZVJhbmdlcyUyMiUzQSslNUIlNUQlMkMlMEQlMEErKysrKysrKysrKyslMjJ0eXBlJTIyJTNBKyUyMm9yZGVyZWQtbGlzdC1pdGVtJTIyJTJDJTBEJTBBKysrKysrKysrKysrJTIyZGVwdGglMjIlM0ErMCUyQyUwRCUwQSsrKysrKysrKysrKyUyMmtleSUyMiUzQSslMjJ6ZG9xYSUyMiUyQyUwRCUwQSsrKysrKysrKysrKyUyMnRleHQlMjIlM0ErJTIyV2hhdCtpcytGSUVMRCUzRiUyMiUyQyUwRCUwQSsrKysrKysrKysrKyUyMmVudGl0eVJhbmdlcyUyMiUzQSslNUIlNUQlMEQlMEErKysrKysrKyU3RCUyQyUwRCUwQSsrKysrKysrJTdCJTBEJTBBKysrKysrKysrKysrJTIyaW5saW5lU3R5bGVSYW5nZXMlMjIlM0ErJTVCJTVEJTJDJTBEJTBBKysrKysrKysrKysrJTIydHlwZSUyMiUzQSslMjJ1bnN0eWxlZCUyMiUyQyUwRCUwQSsrKysrKysrKysrKyUyMmRlcHRoJTIyJTNBKzAlMkMlMEQlMEErKysrKysrKysrKyslMjJrZXklMjIlM0ErJTIydXhjdDUlMjIlMkMlMEQlMEErKysrKysrKysrKyslMjJ0ZXh0JTIyJTNBKyUyMiUyMiUyQyUwRCUwQSsrKysrKysrKysrKyUyMmVudGl0eVJhbmdlcyUyMiUzQSslNUIlNUQlMEQlMEErKysrKysrKyU3RCUyQyUwRCUwQSsrKysrKysrJTdCJTBEJTBBKysrKysrKysrKysrJTIyaW5saW5lU3R5bGVSYW5nZXMlMjIlM0ErJTVCJTVEJTJDJTBEJTBBKysrKysrKysrKysrJTIydHlwZSUyMiUzQSslMjJ1bnN0eWxlZCUyMiUyQyUwRCUwQSsrKysrKysrKysrKyUyMmRlcHRoJTIyJTNBKzAlMkMlMEQlMEErKysrKysrKysrKyslMjJrZXklMjIlM0ErJTIyanBvNzMlMjIlMkMlMEQlMEErKysrKysrKysrKyslMjJ0ZXh0JTIyJTNBKyUyMiUyMiUyQyUwRCUwQSsrKysrKysrKysrKyUyMmVudGl0eVJhbmdlcyUyMiUzQSslNUIlNUQlMEQlMEErKysrKysrKyU3RCUwRCUwQSsrKyslNUQlMEQlMEElN0QmZ29fbGl2ZV9hdD0iLDE1NDcyMTY3NDIuNTQzOTU3XSwiX2F1dGhfdXNlcl9oYXNoIjoiNTBkNWQ4MWM5NWM4NmEyOWY3NjJlMjVhY2RlOTY3YWIzZmI0NzJiZSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCJ9	2019-01-25 14:25:42.561302+00
e0eyrdp8mjz44g8d8xghbf0fnje0rhsv	NmNkNmFmNDY5MGVkODY1MGIwNGE5ZWJlODFkOWM2NjA0Y2YyYzI0MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImEwYjk3NjNlMWYxMTllZWU4ZTNhZjNmZmJkNTQ3Y2JmMDY2NDY5OWMiLCJfYXV0aF91c2VyX2lkIjoiNCJ9	2019-02-12 11:54:57.705632+00
vb9tal0zd01wrnjt7e75v77jqsjp8q0w	ZmQ1MDNhODMwOGRlZDFmNzE0ZDA2ZTgyNWM3YjkwMTNkOTcyOWRhMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9oYXNoIjoiYTBiOTc2M2UxZjExOWVlZThlM2FmM2ZmYmQ1NDdjYmYwNjY0Njk5YyJ9	2019-02-13 09:50:56.880417+00
25x30mx7pnd5voal6g9q0p3poqdxe0ct	NmQ1YjMyMGY3Mjg2OTA3ZWMzODU0NTVjODdhOTY2OTAxZGQyMzk4YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImMwYTI0ZWRjZTMyNzBiMTU1MTcwYWNhMzM2YzhlYjczZDVjNWExM2QiLCJfYXV0aF91c2VyX2lkIjoiNyJ9	2019-02-13 15:07:36.040023+00
mdc0xbkz8iaxktb68c0zf62mhf2v5tvb	MGFlNDAyZjZkZWNkMTFmOTc1MDA0NjU3NWNiN2IyMzA5OWM4YzBlMzp7IndhZ3RhaWwtcHJldmlldy0zMyI6WyJzZWFyY2hfZGVzY3JpcHRpb249JmJvZHk9JTdCJTIyYmxvY2tzJTIyJTNBJTVCJTdCJTIya2V5JTIyJTNBJTIycmtibXolMjIlMkMlMjJ0ZXh0JTIyJTNBJTIyR2V0K2FjY2Vzcyt0byt0aGUrbGF0ZXN0K3Jlc2VhcmNoK3B1YmxpY2F0aW9ucytmcm9tK3RoZStGSUVMRCt0ZWFtK2hlcmUuK1ByZXNzZWQrZm9yK3RpbWUlM0YrRWFjaCtwYXBlcitpcythY2NvbXBhbmllZCt3aXRoK2Erc2ltcGxlK3N1bW1hcnkrYW5kK2tleStwb2ludHMrc28reW91K2NhbityZWFkK2F0K3NwZWVkJTIxJTIyJTJDJTIydHlwZSUyMiUzQSUyMnVuc3R5bGVkJTIyJTJDJTIyZGVwdGglMjIlM0EwJTJDJTIyaW5saW5lU3R5bGVSYW5nZXMlMjIlM0ElNUIlNUQlMkMlMjJlbnRpdHlSYW5nZXMlMjIlM0ElNUIlNUQlMkMlMjJkYXRhJTIyJTNBJTdCJTdEJTdEJTJDJTdCJTIya2V5JTIyJTNBJTIyeHZkMWQlMjIlMkMlMjJ0ZXh0JTIyJTNBJTIySGF2ZSthbnkrcXVlc3Rpb25zK2Fib3V0K3RoZXNlJTNGK1RoZW4rY29udGFjdCt1cy4lMjIlMkMlMjJ0eXBlJTIyJTNBJTIydW5zdHlsZWQlMjIlMkMlMjJkZXB0aCUyMiUzQTAlMkMlMjJpbmxpbmVTdHlsZVJhbmdlcyUyMiUzQSU1QiU1RCUyQyUyMmVudGl0eVJhbmdlcyUyMiUzQSU1QiU3QiUyMm9mZnNldCUyMiUzQTM3JTJDJTIybGVuZ3RoJTIyJTNBMTAlMkMlMjJrZXklMjIlM0EwJTdEJTVEJTJDJTIyZGF0YSUyMiUzQSU3QiU3RCU3RCUyQyU3QiUyMmtleSUyMiUzQSUyMjZjZHQ2JTIyJTJDJTIydGV4dCUyMiUzQSUyMiUyMiUyQyUyMnR5cGUlMjIlM0ElMjJ1bnN0eWxlZCUyMiUyQyUyMmRlcHRoJTIyJTNBMCUyQyUyMmlubGluZVN0eWxlUmFuZ2VzJTIyJTNBJTVCJTVEJTJDJTIyZW50aXR5UmFuZ2VzJTIyJTNBJTVCJTVEJTJDJTIyZGF0YSUyMiUzQSU3QiU3RCU3RCUyQyU3QiUyMmtleSUyMiUzQSUyMnNwcjRmJTIyJTJDJTIydGV4dCUyMiUzQSUyMiUyMiUyQyUyMnR5cGUlMjIlM0ElMjJ1bnN0eWxlZCUyMiUyQyUyMmRlcHRoJTIyJTNBMCUyQyUyMmlubGluZVN0eWxlUmFuZ2VzJTIyJTNBJTVCJTVEJTJDJTIyZW50aXR5UmFuZ2VzJTIyJTNBJTVCJTVEJTJDJTIyZGF0YSUyMiUzQSU3QiU3RCU3RCUyQyU3QiUyMmtleSUyMiUzQSUyMjg0dW41JTIyJTJDJTIydGV4dCUyMiUzQSUyMiUyMiUyQyUyMnR5cGUlMjIlM0ElMjJ1bnN0eWxlZCUyMiUyQyUyMmRlcHRoJTIyJTNBMCUyQyUyMmlubGluZVN0eWxlUmFuZ2VzJTIyJTNBJTVCJTVEJTJDJTIyZW50aXR5UmFuZ2VzJTIyJTNBJTVCJTVEJTJDJTIyZGF0YSUyMiUzQSU3QiU3RCU3RCUyQyU3QiUyMmtleSUyMiUzQSUyMnIydW1zJTIyJTJDJTIydGV4dCUyMiUzQSUyMislMjIlMkMlMjJ0eXBlJTIyJTNBJTIyYXRvbWljJTIyJTJDJTIyZGVwdGglMjIlM0EwJTJDJTIyaW5saW5lU3R5bGVSYW5nZXMlMjIlM0ElNUIlNUQlMkMlMjJlbnRpdHlSYW5nZXMlMjIlM0ElNUIlN0IlMjJvZmZzZXQlMjIlM0EwJTJDJTIybGVuZ3RoJTIyJTNBMSUyQyUyMmtleSUyMiUzQTElN0QlNUQlMkMlMjJkYXRhJTIyJTNBJTdCJTdEJTdEJTJDJTdCJTIya2V5JTIyJTNBJTIyMWJ1c2slMjIlMkMlMjJ0ZXh0JTIyJTNBJTIyVGhlK3B1YmxpYythbmQrZmFybSthbmltYWwrd2VsZmFyZSUyMiUyQyUyMnR5cGUlMjIlM0ElMjJoZWFkZXItdHdvJTIyJTJDJTIyZGVwdGglMjIlM0EwJTJDJTIyaW5saW5lU3R5bGVSYW5nZXMlMjIlM0ElNUIlNUQlMkMlMjJlbnRpdHlSYW5nZXMlMjIlM0ElNUIlNUQlMkMlMjJkYXRhJTIyJTNBJTdCJTdEJTdEJTJDJTdCJTIya2V5JTIyJTNBJTIyeTV5MHElMjIlMkMlMjJ0ZXh0JTIyJTNBJTIyKyUyMiUyQyUyMnR5cGUlMjIlM0ElMjJhdG9taWMlMjIlMkMlMjJkZXB0aCUyMiUzQTAlMkMlMjJpbmxpbmVTdHlsZVJhbmdlcyUyMiUzQSU1QiU1RCUyQyUyMmVudGl0eVJhbmdlcyUyMiUzQSU1QiU3QiUyMm9mZnNldCUyMiUzQTAlMkMlMjJsZW5ndGglMjIlM0ExJTJDJTIya2V5JTIyJTNBMiU3RCU1RCUyQyUyMmRhdGElMjIlM0ElN0IlN0QlN0QlMkMlN0IlMjJrZXklMjIlM0ElMjJqcGFkZSUyMiUyQyUyMnRleHQlMjIlM0ElMjJQdWJsaWMrcGVyY2VwdGlvbnMrb2YrZmFybSthbmltYWwrd2VsZmFyZSUyMiUyQyUyMnR5cGUlMjIlM0ElMjJoZWFkZXItdGhyZWUlMjIlMkMlMjJkZXB0aCUyMiUzQTAlMkMlMjJpbmxpbmVTdHlsZVJhbmdlcyUyMiUzQSU1QiU1RCUyQyUyMmVudGl0eVJhbmdlcyUyMiUzQSU1QiU1RCUyQyUyMmRhdGElMjIlM0ElN0IlN0QlN0QlMkMlN0IlMjJrZXklMjIlM0ElMjIxbTV4bSUyMiUyQyUyMnRleHQlMjIlM0ElMjJUaGlzK3BhcGVyK3JlcG9ydHMrb24rdGhlK3Jlc3VsdHMrb2YrYStzeXN0ZW1hdGljK3NlYXJjaCtvZit0aGUrbGl0ZXJhdHVyZSt0bytlc3RhYmxpc2grd2hhdCt0aGUrcHVibGljK3RoaW5rK2Fib3V0K2Zhcm0rYW5pbWFsK3dlbGZhcmUuK1RoZStyZXN1bHRzK2luZGljYXRlK3RoYXQrdGhlK3B1YmxpYytoYXZlK2NvbmNlcm5zK292ZXIrbW9yZSttb2Rlcm4rYW5kK2ludGVuc2l2ZSthbmltYWwrcHJvZHVjdGlvbitzeXN0ZW1zJTJDK3doaWNoK3dlcmUrdGhvdWdodCt0byticmVhY2grdG8rdHdvK2NvcmUrY29tcG9uZW50cytvZitnb29kK3dlbGZhcmUlM0EraHVtYW5lK3RyZWF0bWVudCthbmQrbmF0dXJhbG5lc3MuJTIyJTJDJTIydHlwZSUyMiUzQSUyMnVuc3R5bGVkJTIyJTJDJTIyZGVwdGglMjIlM0EwJTJDJTIyaW5saW5lU3R5bGVSYW5nZXMlMjIlM0ElNUIlNUQlMkMlMjJlbnRpdHlSYW5nZXMlMjIlM0ElNUIlNUQlMkMlMjJkYXRhJTIyJTNBJTdCJTdEJTdEJTJDJTdCJTIya2V5JTIyJTNBJTIya3VqcG4lMjIlMkMlMjJ0ZXh0JTIyJTNBJTIyJTIyJTJDJTIydHlwZSUyMiUzQSUyMnVuc3R5bGVkJTIyJTJDJTIyZGVwdGglMjIlM0EwJTJDJTIyaW5saW5lU3R5bGVSYW5nZXMlMjIlM0ElNUIlNUQlMkMlMjJlbnRpdHlSYW5nZXMlMjIlM0ElNUIlNUQlMkMlMjJkYXRhJTIyJTNBJTdCJTdEJTdEJTJDJTdCJTIya2V5JTIyJTNBJTIyZjZ2YzMlMjIlMkMlMjJ0ZXh0JTIyJTNBJTIyUmVhZCttb3JlK2hlcmUlM0ErUHVibGljK2F0dGl0dWRlcyt0bytmYXJtK2FuaW1hbCt3ZWxmYXJlJTIyJTJDJTIydHlwZSUyMiUzQSUyMnVuc3R5bGVkJTIyJTJDJTIyZGVwdGglMjIlM0EwJTJDJTIyaW5saW5lU3R5bGVSYW5nZXMlMjIlM0ElNUIlNUQlMkMlMjJlbnRpdHlSYW5nZXMlMjIlM0ElNUIlN0IlMjJvZmZzZXQlMjIlM0ExNiUyQyUyMmxlbmd0aCUyMiUzQTM5JTJDJTIya2V5JTIyJTNBMyU3RCU1RCUyQyUyMmRhdGElMjIlM0ElN0IlN0QlN0QlMkMlN0IlMjJrZXklMjIlM0ElMjJza2Q1ZiUyMiUyQyUyMnRleHQlMjIlM0ElMjIlMjIlMkMlMjJ0eXBlJTIyJTNBJTIydW5zdHlsZWQlMjIlMkMlMjJkZXB0aCUyMiUzQTAlMkMlMjJpbmxpbmVTdHlsZVJhbmdlcyUyMiUzQSU1QiU1RCUyQyUyMmVudGl0eVJhbmdlcyUyMiUzQSU1QiU1RCUyQyUyMmRhdGElMjIlM0ElN0IlN0QlN0QlMkMlN0IlMjJrZXklMjIlM0ElMjJvNWFzeiUyMiUyQyUyMnRleHQlMjIlM0ElMjJBcmUrdGhlK3B1YmxpYyt3aWxsaW5nK3RvK3BheStmb3IraGlnaGVyK3dlbGZhcmUlM0YlMjIlMkMlMjJ0eXBlJTIyJTNBJTIyaGVhZGVyLXRocmVlJTIyJTJDJTIyZGVwdGglMjIlM0EwJTJDJTIyaW5saW5lU3R5bGVSYW5nZXMlMjIlM0ElNUIlNUQlMkMlMjJlbnRpdHlSYW5nZXMlMjIlM0ElNUIlNUQlMkMlMjJkYXRhJTIyJTNBJTdCJTdEJTdEJTJDJTdCJTIya2V5JTIyJTNBJTIyaWFkYnglMjIlMkMlMjJ0ZXh0JTIyJTNBJTIyVGhpcytwYXBlcit1c2VzK2Erc3lzdGVtYXRpYytzZWFyY2grb2YrdGhlK2xpdGVyYXR1cmUrdG8rZmluZCtvdXQrd2hhdCttZW1iZXJzK29mK3RoZStwdWJsaWMrYXJlK3dpbGxpbmcrdG8rcGF5K2ZvcitoaWdoZXIrd2VsZmFyZSthbmltYWwrcHJvZHVjdHMuK1RoZStmaW5kaW5ncytzaG93K3RoYXQrdGhlK3B1YmxpYyt3b3VsZCtwYXkrYStzbWFsbCtwcmVtaXVtK2ZvcitoaWdoZXIrd2VsZmFyZStwcm9kdWN0cyUyQythbHRob3VnaCt0aGlzK3ZhcmllZCtieSthbmltYWwrdHlwZSthbmQrYWNyb3NzK2RpZmZlcmVudCtwb3B1bGF0aW9uK2dyb3Vwcy4lMjIlMkMlMjJ0eXBlJTIyJTNBJTIydW5zdHlsZWQlMjIlMkMlMjJkZXB0aCUyMiUzQTAlMkMlMjJpbmxpbmVTdHlsZVJhbmdlcyUyMiUzQSU1QiU1RCUyQyUyMmVudGl0eVJhbmdlcyUyMiUzQSU1QiU1RCUyQyUyMmRhdGElMjIlM0ElN0IlN0QlN0QlMkMlN0IlMjJrZXklMjIlM0ElMjJ1bWphZyUyMiUyQyUyMnRleHQlMjIlM0ElMjIlMjIlMkMlMjJ0eXBlJTIyJTNBJTIydW5zdHlsZWQlMjIlMkMlMjJkZXB0aCUyMiUzQTAlMkMlMjJpbmxpbmVTdHlsZVJhbmdlcyUyMiUzQSU1QiU1RCUyQyUyMmVudGl0eVJhbmdlcyUyMiUzQSU1QiU1RCUyQyUyMmRhdGElMjIlM0ElN0IlN0QlN0QlMkMlN0IlMjJrZXklMjIlM0ElMjJ2YXFjciUyMiUyQyUyMnRleHQlMjIlM0ElMjJSZWFkK21vcmUraGVyZSUzQStXaWxsaW5nbmVzcy10by1wYXkrZmFybSthbmltYWwrd2VsZmFyZSUyMiUyQyUyMnR5cGUlMjIlM0ElMjJ1bnN0eWxlZCUyMiUyQyUyMmRlcHRoJTIyJTNBMCUyQyUyMmlubGluZVN0eWxlUmFuZ2VzJTIyJTNBJTVCJTVEJTJDJTIyZW50aXR5UmFuZ2VzJTIyJTNBJTVCJTdCJTIyb2Zmc2V0JTIyJTNBMTYlMkMlMjJsZW5ndGglMjIlM0EzOCUyQyUyMmtleSUyMiUzQTQlN0QlNUQlMkMlMjJkYXRhJTIyJTNBJTdCJTdEJTdEJTVEJTJDJTIyZW50aXR5TWFwJTIyJTNBJTdCJTIyMCUyMiUzQSU3QiUyMnR5cGUlMjIlM0ElMjJMSU5LJTIyJTJDJTIybXV0YWJpbGl0eSUyMiUzQSUyMk1VVEFCTEUlMjIlMkMlMjJkYXRhJTIyJTNBJTdCJTIycGFyZW50SWQlMjIlM0ExOCUyQyUyMnVybCUyMiUzQSUyMiUyRmNvbnRhY3QtdXMlMkYlMjIlMkMlMjJpZCUyMiUzQTglN0QlN0QlMkMlMjIxJTIyJTNBJTdCJTIydHlwZSUyMiUzQSUyMkhPUklaT05UQUxfUlVMRSUyMiUyQyUyMm11dGFiaWxpdHklMjIlM0ElMjJJTU1VVEFCTEUlMjIlMkMlMjJkYXRhJTIyJTNBJTdCJTdEJTdEJTJDJTIyMiUyMiUzQSU3QiUyMnR5cGUlMjIlM0ElMjJIT1JJWk9OVEFMX1JVTEUlMjIlMkMlMjJtdXRhYmlsaXR5JTIyJTNBJTIySU1NVVRBQkxFJTIyJTJDJTIyZGF0YSUyMiUzQSU3QiU3RCU3RCUyQyUyMjMlMjIlM0ElN0IlMjJ0eXBlJTIyJTNBJTIyRE9DVU1FTlQlMjIlMkMlMjJtdXRhYmlsaXR5JTIyJTNBJTIyTVVUQUJMRSUyMiUyQyUyMmRhdGElMjIlM0ElN0IlMjJmaWxlbmFtZSUyMiUzQSUyMkNsYXJrX2V0X2FsXzIwMTYucGRmJTIyJTJDJTIydXJsJTIyJTNBJTIyJTJGZG9jdW1lbnRzJTJGNCUyRkNsYXJrX2V0X2FsXzIwMTYucGRmJTIyJTJDJTIyaWQlMjIlM0E0JTdEJTdEJTJDJTIyNCUyMiUzQSU3QiUyMnR5cGUlMjIlM0ElMjJET0NVTUVOVCUyMiUyQyUyMm11dGFiaWxpdHklMjIlM0ElMjJNVVRBQkxFJTIyJTJDJTIyZGF0YSUyMiUzQSU3QiUyMmZpbGVuYW1lJTIyJTNBJTIyQ2xhcmtfZXRfYWxfMjAxNy5wZGYlMjIlMkMlMjJ1cmwlMjIlM0ElMjIlMkZkb2N1bWVudHMlMkYzJTJGQ2xhcmtfZXRfYWxfMjAxNy5wZGYlMjIlMkMlMjJpZCUyMiUzQTMlN0QlN0QlN0QlN0QmZ29fbGl2ZV9hdD0mc2VvX3RpdGxlPSZjc3JmbWlkZGxld2FyZXRva2VuPUNaTWhBYmVzRUVaYVkxWDFvYTNEMjZkY2lubHRWRkJtWWhQQ3JyVVlpelJOcmtlWHhmUFdFbGNJR2ZmU0Q2enImc2x1Zz1wYXBlcnMmbmV4dD0mZXhwaXJlX2F0PSZ0aXRsZT1QYXBlcnMiLDE1NDkyNzUzNjEuMzczOTA2MV0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImIxMWJmOTQ2OTZiMGIyODliNjM4MDQ2NzM3YjYxMDg2NmYzOGM2ZTMiLCJfYXV0aF91c2VyX2lkIjoiNiJ9	2019-02-18 10:16:01.392602+00
g7iijlqjldew69t28ai82znq6ddtdsxh	ZDg4YTc5MWIyNTdlZTgxOThkNWRlMWUyMzFmNjE1Mzg0MzQ4YzMyYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjUwZDVkODFjOTVjODZhMjlmNzYyZTI1YWNkZTk2N2FiM2ZiNDcyYmUiLCJfYXV0aF91c2VyX2lkIjoiMiJ9	2019-02-19 10:03:06.369707+00
jf0j4utnb1qit9lnv56m0qxprhp2k0lu	NmNkNmFmNDY5MGVkODY1MGIwNGE5ZWJlODFkOWM2NjA0Y2YyYzI0MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImEwYjk3NjNlMWYxMTllZWU4ZTNhZjNmZmJkNTQ3Y2JmMDY2NDY5OWMiLCJfYXV0aF91c2VyX2lkIjoiNCJ9	2019-02-19 17:26:24.996567+00
mr1agtc9icr6lwdjg9uiyzwfs3hnf4w4	ZWMzYzM5OWMzMzM4NWEwN2VhNjAyNGVhYjA4Nzg4YmFhZGU0Mzk2ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImU2NjFmZTZjMzE4ZjVhMjMwY2I5ZmQ4MTJjZTRlNzliMTU2NjgyZDMiLCJfYXV0aF91c2VyX2lkIjoiMSJ9	2019-02-22 19:45:01.083495+00
x5ua4jxj331k8oxb0ibll3839urpo9qf	NmNkNmFmNDY5MGVkODY1MGIwNGE5ZWJlODFkOWM2NjA0Y2YyYzI0MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImEwYjk3NjNlMWYxMTllZWU4ZTNhZjNmZmJkNTQ3Y2JmMDY2NDY5OWMiLCJfYXV0aF91c2VyX2lkIjoiNCJ9	2019-02-26 12:10:03.537647+00
gwp469bqiq4j1qjlefiz2pwoc9uw9kw5	ZGU5ZTcyZWE5YzUzOThjZjBlMjc1MzUwNTRiZjA5NjgxYzYzOTU1NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjcwODA4NDU2YmQwMTRiZDdmNGRhNDU1MTMyZGQwOGQ1ZjA1ZjIyNDkiLCJfYXV0aF91c2VyX2lkIjoiMyJ9	2019-02-27 18:56:39.417138+00
fj2e33kgjdfk2s9yn6bibk3140icxjxa	NzRkZTk2ZGE3ZTc3OTczNzQwNjgzNTQ1OTIxY2FlODcyMTdjOGNmNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImIxMWJmOTQ2OTZiMGIyODliNjM4MDQ2NzM3YjYxMDg2NmYzOGM2ZTMiLCJfYXV0aF91c2VyX2lkIjoiNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCJ9	2019-03-06 11:46:35.113377+00
xvjblo14umfv73cyhly0nzmhm2buxfel	YTdmYTFmODdlNDM5YmJjNTA4NzRmZDE2ODU3ZDg5ODg5YmM4ODUyZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUwZDVkODFjOTVjODZhMjlmNzYyZTI1YWNkZTk2N2FiM2ZiNDcyYmUiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCJ9	2019-03-07 10:42:57.164233+00
5dccky2x1oy2470fc94b1tx6bdqndk40	ZmQ1MDNhODMwOGRlZDFmNzE0ZDA2ZTgyNWM3YjkwMTNkOTcyOWRhMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9oYXNoIjoiYTBiOTc2M2UxZjExOWVlZThlM2FmM2ZmYmQ1NDdjYmYwNjY0Njk5YyJ9	2019-03-19 10:25:04.334544+00
5wi149j6ntqixffbub2fpm8b9564d9i6	YjgzYmQ2NjY4NmE0Zjc1MGYzMWI0MmFiMjE2YTc1OTkwMWViMjdiYzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nb19hdXRoX2xkYXAuYmFja2VuZC5MREFQQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTY2MWZlNmMzMThmNWEyMzBjYjlmZDgxMmNlNGU3OWIxNTY2ODJkMyJ9	2019-03-21 17:45:37.727242+00
\.


--
-- Data for Name: kdl_wagtail_page_richpage; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.kdl_wagtail_page_richpage (page_ptr_id, body) FROM stdin;
24	<p>The FIELD project strives to deliver a new approach to studying livestock disease, which not only wil help shed new light on this topic but will also be co-produced with key stakeholders throughout the research process to ensure the relevance of the project recommendations to the two case study diseases being explored. Find out more about the approaches the FIELD project is using below.</p><p></p><p></p><hr/><p></p><h3>Interdisciplinary nature</h3><p>Previous research for solutions to livestock disease has been hampered by traditional research discipline silos. The FIELD project seeks to examine the social and biological identities of livestock disease, and cut across the realms of nature, culture, science, society, human and animal. This will enable us to study livestock disease as a co-evolutionary process: as both a biological and social phenomenon that shapes and is shaped by farming systems and communities, as emphasised in the diagram below.</p><p></p><embed alt="Conceptual approach white" embedtype="image" format="fullwidth" id="15"/><p></p><p>Given how interconnected these aspects are, it is unsuprising that FIELD has an interdisciplinary approach at its core. Working both within and across the three main research disciplines involved in the project will help to encourage new ways of thinking about the relationships between livestock diseases, farming systems and communities, which in turn will help us to develop better predictions of disease in the future, and to advise on its management.</p><p></p><p>Explore interconnections identified in the different disciplines. More connections between the three will emerge as the project develops, leading to a project which is truly interdisciplinary in nature.</p><p></p><p>The team of early career researchers will be central to this.</p><p></p><hr/><p></p><h3>Stakeholder input</h3><p>Our network of <a id="35" linktype="page">collaborators</a> will also develop and foster mutual understandings by involving stakeholders as co-producers of knowledge, both in terms of shaping the research focus and providing feedback on findings.</p><p>Innovative knowledge-exchange will help to facilitate the creation of these understandings.</p><p></p><p></p><p></p><embed alt="Expertise.png" embedtype="image" format="fullwidth" id="16"/><p></p><p></p><hr/><p></p><h3>Project case studies</h3><p>Look to explore the past and present of two example diseases, and how they relate to changes in farming systems, communities and the wider world.</p><p>Look at different types of production systems across farms in the North East and Cumbria</p><p></p><p></p><p></p><p></p><p></p>
7	<p>Want to explore how farming has changed over the past few decades and the key events that have shaped this, or explore in-depth the findings of the FIELD research and what this means for policy and practice? Then our resources section is the right place for you!</p><p>Visit our <a id="28" linktype="page">timeline</a> which is perfect for exploring the past 60 years of agricultural change. Head over to our <a id="29" linktype="page">media</a> gallery to see and hear how farming has changed since the Second World War. Check out our latest research<a id="33" linktype="page"> papers</a> to get more in-depth information about our methods and findings, or take a look at our <a id="32" linktype="page">policy and practice notes</a> to see what the implications of the research are.</p>
29	<p>FIELD is fortunate enough to have access to a range of different media to showcase, from historical images of livestock farming to audio recordings of interviews.</p>
4	<p>The FIELD project breaks new ground in its truly interdisciplinary approach to exploring livestock disease. Find out more about the project, the methods being used, and the team who will be behind the research being conducted.</p>
20	<p></p><p>[Timeline]</p><p></p><h2><a id="29" linktype="page">Media</a></h2>
9	<p>Want to find something specific on livestock health or farming, past or present? We’ve tagged all our posts and images to make them as easy for you to explore and find as possible. Use the search box below with keywords of interest to discover more</p>
30	<p>We have the <a href="https://merl.reading.ac.uk/">Museum of English Rural Life</a> to thank for digitising these fabulous photos of British agriculture from 1947 onwards. Scroll through our gallery to see how livestock production has changed over the decades, or use our <a id="9" linktype="page">search</a> function to look for something more specific.</p>
32	<p>Our policy and practice notes have been designed to provide short and insightful summaries into key findings from the project and what these could mean in terms of farming policy and practice. Click on each note below to read more.</p><p>Have any questions about these? Then <a id="8" linktype="page">contact us.</a></p>
10	<p></p><h2><a id="24" linktype="page">Approaches</a></h2>
31	<p>Our oral historian <a id="15" linktype="page">Sue</a> has been working hard to bring you some snippets from the interviews she has been conducting for FIELD with farmers. Listen to first-hand accounts of farming in the clips below.</p>
15	<p>The research on the FIELD research project will be conducted by a team of 12 individuals from 6 different UK universities, and from 3 different scientific disciplines.</p><p>Find out more about the different team members below.</p><p></p><hr/><h2>Prof Abigail Woods</h2><h3>King&#x27;s College London</h3><h4>History</h4><p>Abigail Woods is Head of the Department of History, and <a href="https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3">Professor in the History of Human and</a> <a href="https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3">Animal Health at King&#x27;s College London.</a> Reflecting her earlier career as a veterinary surgeon, her research focuses on the history of animal health in 19th and 20th century Britain, and its intersections with the histories of human health and livestock production. Her recent research has explored the history of veterinary expertise, policy and practice; the changing concepts of animal health, welfare and productivity; and how patterns and perceptions of livestock disease have changed over time. As principle investigator of the FIELD project, she is developing the first social histories of BVD and cattle lameness, and bringing them into dialogue with contemporary scientific and social scientific perspectives.</p><p></p><hr/><h2>Nicole Gosling</h2><h3>King&#x27;s College London</h3><h4>History</h4><p>Nicole Gosling is a PhD student at King’s College in London and will be writing her dissertation as a contribution to the FIELD project. She studied her BSc in Ecology at the University of Victoria, and recently completed an MA in Environmental History at Uppsala University. Broadly speaking, Nicole’s interests include how humans interact with nature, with a focus on human-animal relationships. She explored these relationships in her master’s thesis ‘Making Sense of Cattle: A story from farm to food’ where she looked at how different actors experience cattle bodies during the production of beef. Building on this line of thinking, Nicole’s role in the FIELD project will be focused on the history of lameness in sheep.</p><p></p><hr/><h2>Prof Karen Sayer</h2><h3>Leeds Trinity University</h3><h4>History</h4><p><a href="http://research.leedstrinity.ac.uk/en/persons/karen-sayer(5c5fb33f-b15c-497f-870a-ad1d04f03454).html">Professor of Social and Cultural History at Leeds Trinity University,</a> Leeds, UK, Karen Sayer specialises in the study of British agriculture, landscape and environment in the 19th and 20th centuries. Her first monograph, <i>Women of the Fields: Representations of Femininity in Nineteenth Century Rural Society</i> (MUP 1995) used a discursive and interdisciplinary approach to assess the representation of women’s work in agriculture in Parliamentary Reports alongside art, literature and the press, to explain legislative intervention and control of their employment. She built on this work with her second monograph <i>Country Cottages: A Cultural History</i> (MUP, 2000). Drawing on the work of the social sciences, architecture and geography to scrutinise the values attached historically to the idea and material culture of the cottage, and the experiences of those who inhabited it, the book encompassed a spatial reading of the political and material effects of the rural idyll that impact at the level of national identity and ‘race’, class and sex. She has continued to address the shape of, values attaching to and understandings of the British landscape and environment, and experiences of those living in the countryside. Today she works on energy landscapes – e.g. with P. Brassley &amp; J. Burchardt <i>Transforming the countryside?</i> <i>The Electrification of Rural England 1890-1970</i> (Routledge, 2016) – the managed spaces of the farm, history of livestock agriculture and animal history.</p><p>Within the FIELD project, she addresses the tensions that beset the ‘modernisation’ of UK livestock farming after 1947 and the different, competing messages attaching to animal welfare and consumption, as seen in the use of the British countryside as site of amenity and site of production. This work incorporates ideas of animals as active agents of history, and is framed by notions of interconnectivity of farm, the farm animal, disease organisms, farmers, labourers, marketeers, sales reps, government officials, journalists and the non-farming public over time.</p><p></p><hr/><h2>Dr James Bowen</h2><h3>Leeds Trinity University</h3><h4>History</h4><p>James P. Bowen is a Post-Doctoral Research Associate in History based at Leeds Trinity University with research interests in agricultural and rural history. He was formerly a Research Associate (Victoria County History-Cumbria Project) in the Department of History, Lancaster University and was the Contributing Editor for The Herefordshire Victoria County History Trust Short on the parish of Colwall. He was formerly a Post-Doctoral Research Associate based at the Department of Geography and Planning, University of Liverpool employed on ‘Spaces of experience and horizons of expectation: the implications of extreme weather events, past, present and future’, a three-year project, funded as part of the Care for the Future programme of the Arts and Humanities Research Council. He completed a PhD at Lancaster University supervised by Professor A.J.L. Winchester and held the Economic History Society’s Tawney Junior Research Fellowship in 2012-13 at the Institute of Historical Research, London.</p><p></p><hr/><h2>Dr Amy Proctor</h2><h3>Newcastle University</h3><h4>Social Science</h4><p><a href="https://www.ncl.ac.uk/cre/about/staff/profile/amyproctornclacuk.html#background">Amy Proctor</a> is based at the <a href="https://www.ncl.ac.uk/cre/">Centre for Rural Economy</a> at Newcastle University. She is interested in agricultural extension and processes of expertise exchange within rural land management and has published widely on this. Her research has focused on the knowledge-practices of farmers and their advisors and the performance and practice of the advisory encounter. Amy is also interested in developing innovative and interactive ways of engaging with stakeholders and has co-led <a href="http://www.relu.ac.uk/landbridge/">Landbridge</a>, a national knowledge exchange network for rural professionals which provides a platform for inter-professional learning and debate among farm advisers and opportunities for exchange with research communities. In FIELD, Amy will develop and conduct the social science aspects of the project including in-depth interviews and ethnographic research with farmers and advisers and focus groups with farmers and consumers.</p><p></p><hr/><h2>Sue Bradley</h2><h3>Newcastle University</h3><h4>History</h4><p>Sue Bradley is an oral historian in the <a href="https://www.ncl.ac.uk/cre/">Centre for Rural Economy</a>, Newcastle University, where her research has ranged from flood risk to honey bee health and veterinary practice. She is interested in how oral history can help to address current concerns, and in using audio testimonies from older practitioners as a basis for discussions with their counterparts today. Her work for FIELD includes recording a collection of life-story interviews that will contribute insights from first-hand accounts of working with cattle and sheep in the north of England since the 1940&#x27;s. This collection will be archived at the <a href="https://merl.reading.ac.uk/">Museum for English Rural Life</a> to serve beyond the project as a permanent public research resource. Sue also works part-time in <a href="https://research.ncl.ac.uk/oralhistory/">Newcastle University’s Oral History Unit</a>. Before coming to Newcastle she was responsible for creating the British Library’s Book Trade Lives collection of recordings with booksellers and publishers.</p><p></p><hr/><h2>Dr Beth Clark</h2><h3>Newcastle University</h3><h4>Social Science</h4><p><a href="https://www.ncl.ac.uk/cre/about/staff/profile/bethclark.html#background">Beth’s</a> research background in sports, exercise and nutrition and food marketing reflects her research interests in food and communication. She is particularly interested in exploring how people relate to animal products and different food production practices, such as motivations for food choice, innovation and technology in production, knowledge of food production practices, and food cultures. Through this she works with a range of stakeholders from across the food supply chain, which has fuelled an interest in communication, including how individuals and groups share information and trust different information sources.She has two roles on the FIELD project. The first is part of the social science research team, involving interviews, focus groups and observations with farmers, farming advisors and the public, to explore their different experiences and perceptions of endemic livestock disease. The second role focuses on public engagement, including the online communications and website for FIELD, as well as identifying and organising opportunities for greater interaction with the projects many stakeholders, including members of the farming community and the public.</p><hr/><h2>Dr Ewan Coleman</h2><h3>University of Edinburgh</h3><h4>Epidemiology &amp; Economics</h4><p>Ewan Colman is a post-doctoral research associate at the <a href="https://www.ed.ac.uk/roslin">Roslin Institute</a> at the University of Edinburgh. He has a background in mathematics, particularly in applied probability, data science, and network science. His research uses computational modelling to explore the relationship between behaviour and the spread of infectious disease. Ewan&#x27;s past interests include the dynamics of conversations on social media, the social and spatial organisation of ant colonies, and the how the ever-increasing amount of public health data can be exploited to detect and mitigate epidemic diseases. As a member of the FIELD project, he will focus on the spread of BVD through cattle trade, and how changing attitudes towards biosecurity can reduce the prevalence of BVD on a national scale.</p><p></p><hr/><h2>Prof Rowland Kao</h2><h3>University of Edinburgh</h3><h4>Epidemiology &amp; Economics</h4><p>Awaiting text</p><p></p><hr/><h2>Maria Suella Rodrigues</h2><h3>University of Glasgow</h3><h4>Epidemiology &amp; Economics</h4><p>Maria Suella Rodrigues is a doctoral candidate at the University of Glasgow, supervised under Professor Nicholas Hanley (MVLS), Dr. Souvik Datta (ASBS) at the University of Glasgow and Professor Rowland Kao from the University of Edinburgh. Maria holds a BSc degree in Economics from Lancaster University. Following that she moved to the University of Glasgow where she pursued the MRes in Economics, graduating in 2018. She is interested in investigating research questions in the areas of agricultural and environmental economics as well as applied micro-econometrics and choice-modelling theory. During her MRes dissertation she modelled consumer preferences for forest disease management with use of Choice modelling data. Additionally, she has received extensive training in choice-modelling from the Choice Modelling Centre, University of Leeds. As part of the FIELD project, Maria will design field experiments and model both farmer and consumer preferences in relation to farm animal welfare.</p><p></p><hr/><h2>Dr Lewis Holloway</h2><h3>University of Hull</h3><h4>Social Science</h4><p><a href="https://www.hull.ac.uk/faculties/staff-profiles/lewis-holloway.aspx">Lewis Holloway</a> is a Reader in Human Geography at the University of Hull. He has research interests in food, farming and the countryside, and has a particular interest in farm animals and agricultural technologies. Recent research has focused on the ways in which genetic, information and robotic technologies have affected livestock farming, and has involved in-depth research with farmers and technology developers to understand how new technologies are engaged with, adopted and contested by farmers. Lewis is interested in the situated ethics associated with animal agriculture, and in how technologies can transform farming ethics and knowledge-practices. Lewis will be involved in developing and conducting the social scientific elements of the FIELD project. This will include on-farm interview and observational work with farmers, farm animals and expert advisors, and focus groups with farmers and public groups.</p><p></p><hr/><h2>Dr Niamh Mahon</h2><h3>University of Hull</h3><h4>Social Science</h4><p><a href="https://www.researchgate.net/profile/Niamh_Mahon">Niamh</a> is a Post-Doctoral Research Associate at the University of Hull. In this role she is involved in the social science components of the FIELD project. This includes in-depth interviews and observational work with farmers and expert advisors, and focus groups with farmers and the public, conducted to explore their different experiences and perceptions of endemic livestock disease. Prior to this Niamh under took a PhD at Nottingham Trent University developing stakeholder-sensitive indicators of the Sustainable Intensification of UK agriculture and a Master’s degree from the University of East Anglia in Sustainable Agriculture and Food Security. She has also worked as a research assistant in socio-economics and policy for the Organic Research Centre. Niamh is a member of the Food and Climate Research Network and the Sustainable Intensification Research Network.</p><p></p><hr/><h2>Prof Nick Hanley</h2><h3>University of Glasgow</h3><h4>Epidemiology &amp; Economics</h4><p>Nick Hanley is a <a href="https://www.gla.ac.uk/researchinstitutes/bahcm/staff/nicholashanley/">Professor of Environmental and One Health Economics</a> at the University of Glasgow. His PhD was in Agricultural Economics. His current main research interests include behavioural economics, the design of Payment for Ecosystem Service schemes, environmental valuation, one health economics, the economics of sustainable development, markets for biodiversity offsets, and the economics of invasive species. He is an honorary professor at the universities of St Andrews and Stirling. Nick is co-author of a textbook in environmental cost-benefit analysis with Edward Barbier; and two textbooks on environmental economics (with Jason Shogren and Ben White).</p><p></p><hr/><p></p>
18	<p>Better ways of understanding livestock disease are urgently required to ensure animal health and welfare, as well as farming sustainability. The Farm-level Interdisciplinary approaches to Endemic Livestock Diseases (FIELD) project looks to bring together experts from industry, governance and academia to explore the realms of nature and culture, science and society and human and animal, and their impact on disease. Insights from the project will be used to develop better predictions around disease and further insights into disease management.</p><p></p><p>[Timeline]</p><p>[Twitter]</p><p></p><p>[will the &quot;Join us&quot; link up to something like MailChimp?]</p><p></p><h2><a id="3" linktype="page">News</a></h2>
8	<p>Have a question about endemic livestock disease, want to find out more about the project or become involved in the research? We would love to hear from you!</p><p>A core part of the FIELD project is involving as many stakeholders as possible, and that means you! Complete the form below and one of the team will contact you as soon as possible.</p><p></p><p>[Could this be a form template or will it introduce an email pop out?]</p>
25	<p>Endemic livestock disease is not something all of us have to think about on a daily basis. We&#x27;ve therefore put together a list of questions to give you some more information about these, and the project more generally.</p><p>Have a question which is not answered in the FAQs below? Please <a id="8" linktype="page">contact us</a> and we will answer it!</p><p></p><p></p><p></p><hr/><p></p><hr/><p></p><h4>What are endemic diseases?</h4><p>Endemic diseases exist permanently in a population or region, such as the cold virus in humans. They differ from more exotic invasive diseases, such as avian influenza, which typically occur from infections brought in from off the farm and are not usually present. Eradication of some of these disease is possible, although this can be very resource and time consuming.</p><p></p><hr/><p></p><h4>Why are endemic livestock diseases important?</h4><p>Endemic livestock diseases are important from a number of perspectives. If an animal is sick, then it has implications for the animal&#x27;s well-being and welfare. When an animal is ill, they also become less productive, such as by having slower growth or reduced milk yields, which can affect producer profits. Sick animals also need medical treatment, including from antibiotics to fight bacterial infections. Reducing the amount of endemic diseases present will result in animals needing less treatment, resulting in the reduced use of antibiotics and other medicines.</p><p></p><hr/><p></p><h4>Why do animals get these diseases?</h4><p>Like for humans, there are many diseases that animals can catch (think of colds, stomach bugs and viruses) that are easily spread, and almost impossible to get rid of. For animals, we describe these as endemic diseases. Endemic diseases are described as multifactorial, meaning that they occur due to a number of different factors. Livestock can pick up these diseases from other animals on the farm (both farm and wild animals), off neighbouring farms, or from people and equipment that come onto the farm which may be carrying germs. Weather conditions can also affect disease spread, as can an animal’s genetics.</p><p></p><hr/><p></p><h4>What impact do they have?</h4><p>As well as making animals ill (so affecting their health and welfare), they can impact on their productivity, and this can have severe economic implications.</p><p></p><hr/><p></p><h4>Why BVD and lameness?</h4><p>Bovine viral diarrhoea (BVD) and lameness are two of the most prevalent diseases in cattle and sheep in the UK today. They also have different management practices and different symptoms and can be spread in different ways. This allows us to compare and contrast across two very different diseases, which will give us more learning&#x27;s for endemic diseases in general.</p><p></p><hr/><h4></h4><h4>What is lameness?</h4><p></p><hr/><p></p><h4>What is BVD?</h4><p></p><hr/><p></p><h4>Will these diseases affect the animal products that I eat?</h4><p>No, they won’t. These diseases are not zoonotic, i.e. cannot be transferred to humans, and so do not have implications for food safety or human health. In addition, any sick animals treated with medicines have to follow strict regulations in relation to how long they must be free of medicines before they can enter the human food chain, to ensure that no residues are present in the food we eat.</p><p>Any concerns related to human health are to do with antimicrobial resistance (AMR). As for humans, AMR is a growing concern for animals, and so a reduction in antibiotic use is encouraged. Farmers and veterinarians both follow <a href="https://www.ruma.org.uk/">RUMA</a> guidelines, which encourage the more responsible use of antibiotics, which are used only as and when an animal has a disease. If we can reduce the number of animals having a disease, we can reduce the amount of antibiotics used, which has benefits for humans and animals.</p><p></p><hr/><p></p><h4>Are these diseases specific to different types of animal production system?</h4><p>Given the range of different factors linked to endemic diseases, they can occur in any type of animal production system e.g. indoor, free range, organic etc. Some diseases are more common in intensive systems, whereas others are more common in outdoor systems due to greater exposure to the environment and wild animals and micro-organisms which may transmit disease.</p><p></p><hr/><p></p><h4>Why do we still have these diseases?</h4><p>Although the practices and treatments for these diseases exist, there can be barriers to using these in farming practice for a number of different reasons, including various factors known to cause these diseases. Also, given that a number of these diseases are influenced by the environmental factors, including the weather, they can be very difficult to control.</p><p>FIELD looks to explore why these diseases are still present and what can further be done to enable better control and a reduction in these.</p><p></p><hr/><p></p><h4>What do these diseases mean for animal welfare?</h4><p>As for humans, when an animal is sick it affects their well-being, either through feeling generally unwell or being in pain from the infection that they have. Animals who are sick are treated according to the illness they have, which may include antibiotics to treat bacterial infections, pain killers and anti-inflammatory medicines.</p><p></p><hr/><p></p><h4>Does Brexit affect this at all?</h4><p>It is not known how Brexit may affect these diseases, but any implications are likely to be due to regulation and trade. The UK is world-renowned for its high standards of welfare, which are currently higher than EU minimum regulations. This is likely to continue post-Brexit and so animals&#x27; well-being (including fast and effective treatment of diseases should they arise) is likely to continue to be protected.</p><p></p><hr/><p></p><h4>How is FIELD different to other projects?</h4><p>The influence of people is an often overlooked element in livestock disease management and research. The FIELD team is bringing together a range of different expertise to counteract this. Find out more <a id="14" linktype="page">about the project</a> to get further details of how we plan to do this.</p><p></p><hr/><p></p><h4>What is FIELD going to do?</h4><p>The FIELD project will work to develop better predictive models, as well as to provide recommendations for policy and practice based on the interactions we have with our research participants and stakeholders involved in the project.</p><p></p><hr/><p></p><h4>Can I get involved in the FIELD project?</h4><p>The FIELD team would love to hear from you! We look forward to hearing your questions, opinions, perspectives and experiences, be that as a member of the public, farmer or farm adviser. Visit our<a id="8" linktype="page"> contact us</a> page to find out how to reach the team.</p><p></p>
12	<p></p>
11	<p></p>
14	<p></p><p></p><p>Livestock disease is a complex problem that threatens the development of more sustainable, ethical and efficient farming methods. While traditional, discipline-specific approaches have helped to address the problem of livestock disease, many of farming’s current challenges cut across disciplines, affecting animal welfare, the environment, and future food security. A new approach is therefore required to reflect the interdisciplinary nature of the challenges facing farmers today. FIELD aims to provide this by integrating scientific, social scientific and humanities perspectives on two case study health problems in Britain; BVD and lameness.</p><p>Through embedding these problems in time, space and society, and enrolling farmers and other publics in their investigation, FIELD will interrogate the changing biological, ontological and social identities of livestock diseases, their relationships with livestock systems and farming communities, and how animal behaviours have shaped their expression, interpretation and management by humans. The project explores how responses to disease in the past have informed its effects in the present; how studying disease in the present can enhance understandings of its past, and how these investigations can inform and be informed by future predictions of disease. FIELD will thereby generate new ways of thinking about, predicting, and intervening in the effects of disease on individual farms and in farming communities, for the benefit of animals, farmers, consumers and the environment.</p><p></p><p></p><h2><a id="24" linktype="page">Approaches</a></h2><p></p><h2><a id="27" linktype="page">Methodology</a></h2>
38	<p></p>
37	<p></p>
28	<p></p><p>Our timeline has been put together by the FIELD historians to provide key dates and events in British farming since 1947. It includes aspects in relation to policy, production, veterinary science and medicine. Scroll through the timeline to explore these, and click on key dates to discover these in more depth.</p><p>Do any of these dates resonate with you? Do you have a story to tell about a particular decade, an image or film that gives us a snapshot of what livestock farming was like, or have we missed anything you think is important? We would love to hear your stories and experiences of farming and veterinary medicine since 1947. <a id="8" linktype="page">Contact us</a> to tell us more!</p>
35	<p>The FIELD project is fortunate to work with an engaged network of individuals and organisations. From our steering committe, to our external collaborators and knowledge exchange partners, we have a range of stakeholders who are actively involved in helping to shape the project. Together, they will help to ensure FIELD&#x27;s real world relevance, technical accuracy and ultimately ensure the success of the FIELD project. Find out more about each of our collaborators below.</p><p></p><p></p><p></p><hr/><p></p><hr/><h2>Steering Committee</h2><p>This group of individuals will provide the FIELD project with strategic insight, including reviewing the project&#x27;s progress, providing critical insight, offering advice on future activities, and advising on the research topics being studied throughout the project.</p><p></p><hr/><h3>Professor Henry Buller</h3><h4>Professor of Geography, Exeter University</h4><p>An internationally renowned expert on animal welfare and the biopolitics of human-animal relations, and social science adviser to Defra. He will provide support for the social science work, and will bring expertise on livestock welfare, consumer perspectives and animals as shapers of human society.</p><hr/><h3>Dr Ollie Douglas</h3><h4>Assistant Curator, Museum of English Rural Life</h4><p>An experienced museum professional who will provide expert input to help the history cluster navigate the <a href="https://merl.reading.ac.uk/">MERL</a> archives. He will also oversee the digitisation of its films and images for the purposes of project research and public engagement, and support the knowledge exchange activities.</p><hr/><h3>Professor Rob Fraser</h3><h4>Emeritus Professor of Agricultural Economics, University of Kent</h4><p>An expert in agricultural economics and member of Defra&#x27;s Economic Advisory Panel. He will provide support for the economists in the project through his expertise in the economics of livestock disease, its social and moral dimensions, and commercial and political contexts.</p><hr/><h3>Professor Laura Green</h3><h4>Veterinary Epidemiologist, University of Warwick</h4><p>A leading expert on endemic livestock disease, in particular lameness in sheep, who has worked with industry stakeholders to translate her research into practice, which has resulted in a significant reduction in lameness prevalence. She will advise on the epidemiological aspects of the project, inter-disciplinary working and animal welfare.</p><hr/><h3>John McFarlane</h3><h4>Vet, Alnorthumbria Veterinary Group</h4><p>A practising farm vet who is active in veterinary politics and a key member of the <a href="http://www.relu.ac.uk/landbridge/">Landbridge</a> knowledge exchange network. As well as providing his veterinary expertise, he will assist the project in expanding its network to ensure its success, through facilitating connections with farmers, vets and other rural professionals.</p><hr/><p></p><p></p><p></p><hr/><p></p><hr/><h2>External Collaborators</h2><p>These individuals possess knowledge, skills and networks crucial to the FIELD project activities, including being a source of expert advice.</p><p></p><hr/><h3>Susannah Bolton</h3><h4>Agriculture and Horticulture Development Board</h4><p>The <a href="https://ahdb.org.uk/">AHDB</a> undertakes research and development across the food supply chain, as well as acting as a key knowledge broker at the farm level, providing advice and expertise on a wide range of farming related topics. Susannah will help the project engage with a wide variety of stakeholders in the co-production of knowledge and dissemination of research findings.</p><hr/><h3>Tim Brigstoke</h3><h4>Policy Director, Royal Association of British Dairy Farmers</h4><p>The <a href="http://www.rabdf.co.uk/">RABDF</a> focuses on the needs of milk producers, and influences and lobbies government and policymakers about the key issues of its members. Tim will bring the experiences and perspectives of the dairy industry to the project.</p><hr/><h3>Charlotte Carne</h3><h4>Animal Welfare and Exotic Disease Control Team, DEFRA</h4><p>Defra will provide expertise through their Animal Welfare and Exotic Disease Control team, who have years of experience in understanding farmer decision making in relation to animal health. Charlotte will provide a means of disseminating the research findings to policy makers.</p><hr/><h3>Bill Mellor</h3><h4>Chair BVDfree England</h4><p><a href="https://bvdfree.org.uk/">BVDfree England</a> is a voluntary industry-led scheme working to eliminate BVD in all cattle in the UK by 2022. Bill will provide input on the project design and interpretation of the results, given his expertise from the BVDfree programme.</p><hr/><h3>Jenny Purcell</h3><h4>BVD Policy Manager, Scottish Government</h4><p>The Scottish government recently introduced a <a href="https://www2.gov.scot/Topics/farmingrural/Agriculture/animal-welfare/Diseases/disease/bvd/eradication">BVD eradication scheme</a>. Understanding this further will be vital for the FIELD project, and Jenny will be a crucial facilitator in this process of knowledge exchange.</p><hr/><h3>Paul Roger</h3><h4>Veterinary Consultant</h4><p>An independent consultant in sheep health and welfare, and a RCVS Recognised Specialist in Sheep Health and Production. He will provide expert veterinary perspectives on lameness in sheep.</p><hr/><h3>Jon Statham</h3><h4>Vet, Bishopton Veterinary Group</h4><p>A practising farm vet and RCVS Recognised Specialist in Cattle Health and Production, who will provide expert veterinary input on BVD and lameness in cattle.</p><hr/><h3>Nicola Smith</h3><h4>Livestock Researcher, National Sheep Association</h4><p>The <a href="https://www.nationalsheep.org.uk/">NSA</a> represents the views and interests of sheep producers throughout the UK, and will be essential for providing sheep farmer perspectives throughout the project. Nicola will bring a sheep industry perspective to the project, and will assist in bringing sheep farmers into the research as co-producers.</p><hr/><p></p><p></p><p></p><hr/><p></p><hr/><h2>Knowledge Exchange Partners</h2><p>These organisations will support the project&#x27;s knowledge exchange activities for all of our interested audiences.</p><p></p><hr/><h3>Flavour Sense Nation</h3><p><a href="http://flavoursense.com/">Flavour Sense Nation</a> are a company that creates interactive events to explore the perceptions of food. They will be providing their expertise in relation to FIELD&#x27;s Food Busk, which will provide an opportunity to explore public perceptions of animal health and welfare.</p><hr/><h3>Landbridge</h3><p><a href="http://www.relu.ac.uk/landbridge/">Landbridge</a> is a national knowledge exchange network for rural professionals, which provides a platform for inter-professional learning and debate with the aim of improving the advice given to farmers and other businesses. As well as providing advice on the project, Landbridge will help facilitate a knowledge-exchange workshop with rural professionals during the project.</p><hr/><h3>Museum of English Rural Life</h3><p>The <a href="https://merl.reading.ac.uk/">MERL</a> aims to challenge perceptions about rural England by revealing the historical and contemporary relevance of country life. The MERL has expertise in public engagement activities, as well as having a number of collections key to assisting the FIELD research. It will help the project to develop its public-facing work through the use of its venues, networks and expertise in this area.</p><hr/><p></p><hr/><p></p>
36	<p>The FIELD team is composed of a number of different research disciplines. The team will be supported throughout the project by a range of different industry and professional stakeholders who will provide their expertise and input to help shape the project and ensure its relevance.</p><p>Find out more about the different <a id="15" linktype="page">team members</a> and <a id="35" linktype="page">stakeholders.</a></p>
6	<p></p><p>We think FIELD is of interest to a range of different communities, incorporating a range of different stakeholders, given how integral livestock production is to our daily lives; be that as a source of income, an important portion of the food we eat, not to mention being part of the landscapes we know and love in the UK. Each community will have different interests in FIELD, which is why we’ve broken them out below to signpost you to the website content we think will be most relevant. This doesn’t stop you from exploring more than one, though!</p><p>Visit the communities below to find out more about the <a id="10" linktype="page">research</a> the FIELD team are doing, what it means in <a id="21" linktype="page">policy</a> and on <a id="19" linktype="page">farms</a>, and finally what it means for the ultimate end users of food chains, <a id="20" linktype="page">consumers</a>, in relation to how the food we eat is produced.</p><p></p><p></p>
39	<p></p>
27	<p>The research team is formed of three disciplinary clusters. Although the three clusters have their own research they will each will draw upon and feed into the others. Each cluster will therefore not be working in isolation, reflecting the interdisciplinary approach at the core of the project. Find out more about the methods being used in the three clusters below.</p><p></p><hr/><p></p><hr/><h3></h3><h3>Economics and Epidemiology</h3><p>Better understanding of the spatial interactions amongst farmers</p><p>Simulation models to enable prediction of responses to a range of factors including disease parameters, costs, support measures and new information</p><p>Examine how farmer decision making is affected by past experience of disease, health and welfare priorities, perceptions and evaluations of disease management methods</p><p>Variation in consumer preferences</p><p>Look to establish trade-offs</p><p>WTP animal welfare in relation to other product attributes</p><p>Models that incorporate aspects from the other disciplines, such as social pressures, economic incentives and past disease experiences may improve disease predictions</p><p></p><p>Greater understanding of human-animal relationships and how these relate to animal health and welfare</p><ul><li>Farmer survey of farm animal health</li><li>&#x27;Food busk&#x27; to establish public perceptions of animal health</li><li>Consumer survey of willingness-to-pay for farm animal welfare</li></ul><hr/><h3></h3><h3>History</h3><p>Changes over time</p><p>Experience, understanding and management of BVD and lameness</p><p>How the different farming systems have evolved over time and also what are understandings of ‘food farming’ for different stakeholders</p><p>Texts, images and existing oral history recordings, including journal articles, advertising material, popular press, government material and grey literature and films</p><p>Also give an indication of who is giving what advice</p><p>Understanding the influence of historical forces can also help us to better understand the present, in relation to farming practices, sources of information and consumer behaviour</p><ul><li>Digitisation of historical agricultural images and videos</li><li>Creation of a timeline to display</li><li>Oral history to promote discussion and reflection<br/></li></ul><hr/><h3></h3><h3>Social Science</h3><p>The social science cluster is tasked with exploring how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other.</p><p>This will be achieved through a number of different methods including;</p><ul><li>Survey of farmers to establish farm management practices</li><li>Interviews</li><li>Focus groups</li><li>Farm walks to understand the real world context of disease</li></ul><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p>Farm walks to understand the real world context of disease</p><p>Explore how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other</p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p></p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p>
40	<p></p>
19	<p></p><p>Livestock disease is a complex problem with important implications for farm productivity as well as animal health and welfare. The FIELD project seeks to adopt a novel approach to exploring livestock disease combining a range of different expertise, and using BVD and lameness as two case study diseases. Involvement of our collaborator network throughout the research process will help to ensure the projects real world relevance, and we will be gaining first hand perspectives of BVD and lameness experiences through our research with farmers.</p><p>Our findings will provide a greater understanding of the complexities of livestock disease, including the social and cultural factors that have shaped, and continue to shape, their management today. Explore our timeline for an overview of key dates and events to British farming since the Second World War, and see how these relate to your own farming experiences over the years. Explore our <a id="29" linktype="page">media</a> gallery to see just how livestock farming has changed over the years.</p><p>We would love for you to <a id="8" linktype="page">get in touch</a> to let us know your experiences and views on livestock disease and farming as well. Fancy taking part in the project? If you farm sheep and/or cattle and live in the North of England and would like to talk more in-depth about BVD and lameness, then drop us an email!</p><h2><a id="8" linktype="page">Contact Us</a></h2>
21	<p></p><p>Better ways of understanding and managing endemic livestock diseases are urgently required. The management of endemic livestock disease is an important policy consideration, with reductions in disease incidence having important implications for animal health and welfare as well as farm productivity and the reduced use of antimicrobials.</p><p>The FIELD project involves a number of different research elements, interconnected together across the different methods used to provide a truly interdisciplinary project that will provide more in-depth insights and understandings as to how we think about and manage endemic livestock disease, and how we can better predict this in the future.</p><p>By looking to the past we can explore what has influenced farming practice today, as explored in our timeline. Through talking to farmers, advisors and consumers we can understand what factors have shaped perceptions of livestock disease, and with our network of <a id="35" linktype="page">collaborators</a> we can ensure the real world relevance of the work we do.</p><p>Find out more about the research we are up to on our <a id="4" linktype="page">about</a> pages, and explore the latest research findings and recommendations in our <a id="33" linktype="page">papers</a> and <a id="32" linktype="page">policy and practice notes</a> for succinct overviews and recommendations.</p>
33	<p>Get access to the latest research publications from the FIELD team here. Pressed for time? Each paper is accompanied with a simple summary and key points so you can read at speed!</p><p>Have any questions about these? Then <a id="8" linktype="page">contact us</a>.</p><p></p><p></p><p></p><hr/><h2>The public and farm animal welfare</h2><hr/><h3>Public perceptions of farm animal welfare</h3><p>This paper reports on the results of a systematic search of the literature to establish what the public think about farm animal welfare. The results indicate that the public have concerns over more modern and intensive animal production systems, which were thought to breach to two core components of good welfare: humane treatment and naturalness.</p><p></p><p>Read more here: <a id="4" linktype="document">Public attitudes to farm animal welfare</a></p><p></p><h3>Are the public willing to pay for higher welfare?</h3><p>This paper uses a systematic search of the literature to find out what members of the public are willing to pay for higher welfare animal products. The findings show that the public would pay a small premium for higher welfare products, although this varied by animal type and across different population groups.</p><p></p><p>Read more here: <a id="3" linktype="document">Willingness-to-pay farm animal welfare</a></p>
\.


--
-- Data for Name: puput_blogpage; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.puput_blogpage (page_ptr_id, description, display_comments, display_categories, display_tags, display_popular_entries, display_last_entries, display_archive, disqus_api_secret, disqus_shortname, num_entries_page, num_last_entries, num_popular_entries, num_tags_entry_header, header_image_id, short_feed_description, main_color) FROM stdin;
3	Description here	f	t	t	t	t	t			5	3	3	5	5	t	#4d6ae0
\.


--
-- Data for Name: puput_category; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.puput_category (id, name, slug, description, parent_id) FROM stdin;
1	News	news		\N
2	Blog	blog		\N
\.


--
-- Name: puput_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.puput_category_id_seq', 2, true);


--
-- Data for Name: puput_categoryentrypage; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.puput_categoryentrypage (id, category_id, page_id) FROM stdin;
1	2	5
2	1	16
\.


--
-- Name: puput_categoryentrypage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.puput_categoryentrypage_id_seq', 2, true);


--
-- Data for Name: puput_entrypage; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.puput_entrypage (page_ptr_id, body, date, excerpt, num_comments, header_image_id) FROM stdin;
5	<p>The content of my first blog post</p>	2019-01-09 16:04:00+00	<p></p>	0	4
16	<p>Body text here</p>	2019-01-10 13:12:00+00	<p>Excerpt text here</p>	0	5
26	<p>With a user centred design, we allow the site visitor to decide how detailed they want their investigation to be and how they want to interact with the data. The tool is responsive to their demands, regardless of whether they want to experiment with top level data scenarios or perform a precise interrogation of the full dataset all using the same simple graphical interface.</p>	2019-01-11 14:28:00+00	<p></p>	0	\N
\.


--
-- Data for Name: puput_entrypagerelated; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.puput_entrypagerelated (id, entrypage_from_id, entrypage_to_id) FROM stdin;
\.


--
-- Name: puput_entrypagerelated_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.puput_entrypagerelated_id_seq', 1, false);


--
-- Data for Name: puput_tagentrypage; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.puput_tagentrypage (id, content_object_id, tag_id) FROM stdin;
5	26	2
6	26	3
\.


--
-- Name: puput_tagentrypage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.puput_tagentrypage_id_seq', 6, true);


--
-- Data for Name: t1; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.t1 (id, d) FROM stdin;
1	{"k1": ["v11", "v12"]}
2	{"k1": ["v11", "v12"]}
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
2	cows	cows
3	dairy	dairy
4	Advisor; Advisors	advisor-advisors
5	Vet	vet
6	cow	cow
7	Landscape; field	landscape-field
8	Advisors	advisors
9	Advisor	advisor
10	Landscape	landscape
11	Field	field
12	Hay	hay
13	Hay bales	hay-bales
14	Blue sky	blue-sky
15	Paper	paper
16	Attitudes	attitudes
17	Public	public
18	Disease	disease
19	farm animal welfare	farm-animal-welfare
20	willingness-to-pay	willingness-to-pay
21	Policy note	policy-note
22	farm	farm
23	child	child
24	farmer	farmer
25	sheep	sheep
26	animal welfare	animal-welfare
27	lamb	lamb
28	bull	bull
\.


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 28, true);


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
2	9	2	5
3	10	2	6
5	8	2	8
6	8	2	9
7	12	2	8
8	12	2	9
9	11	2	10
10	11	2	11
11	13	2	12
12	13	2	13
13	13	2	14
14	2	4	16
15	2	4	17
16	2	4	18
17	2	4	15
18	3	4	17
19	3	4	19
20	3	4	20
21	3	4	15
22	4	4	16
23	4	4	17
24	4	4	19
25	4	4	15
26	5	4	17
27	5	4	18
28	5	4	21
29	18	2	2
30	18	2	6
31	20	2	6
32	22	2	6
33	115	2	24
34	115	2	22
35	115	2	23
36	113	2	10
37	113	2	11
38	113	2	22
39	111	2	24
40	111	2	25
41	111	2	10
42	111	2	11
43	111	2	22
44	109	2	25
45	109	2	10
46	107	2	25
47	107	2	26
48	105	2	25
49	105	2	26
50	105	2	27
51	103	2	25
52	103	2	10
53	103	2	11
54	101	2	24
55	101	2	25
56	101	2	26
57	101	2	22
58	99	2	24
59	99	2	25
60	99	2	22
61	97	2	25
62	95	2	24
63	95	2	25
64	93	2	24
65	93	2	25
66	90	2	24
67	90	2	25
68	90	2	22
69	88	2	24
70	88	2	25
71	88	2	26
72	88	2	22
73	86	2	24
74	86	2	25
75	86	2	26
76	84	2	11
77	84	2	22
78	82	2	24
79	82	2	25
80	82	2	11
81	80	2	24
82	80	2	25
83	78	2	25
84	76	2	25
85	76	2	27
86	74	2	25
87	74	2	10
88	74	2	22
89	72	2	24
90	72	2	25
91	72	2	22
92	70	2	24
93	70	2	25
94	70	2	22
95	68	2	24
96	68	2	25
97	66	2	24
98	66	2	25
99	64	2	25
100	62	2	24
101	62	2	25
102	60	2	24
103	60	2	25
104	58	2	26
105	56	2	26
106	56	2	6
107	54	2	24
108	50	2	25
109	48	2	24
110	48	2	2
111	48	2	28
112	46	2	24
113	46	2	2
114	46	2	28
115	44	2	2
116	44	2	22
117	42	2	2
118	42	2	22
119	40	2	2
120	40	2	22
121	38	2	26
122	38	2	6
123	36	2	24
124	36	2	2
125	34	2	26
126	34	2	22
127	32	2	2
128	32	2	11
129	30	2	24
130	30	2	2
131	30	2	22
132	28	2	2
133	28	2	22
134	26	2	2
135	26	2	22
136	20	2	24
137	20	2	22
138	18	2	22
\.


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 138, true);


--
-- Data for Name: wagtailcore_collection; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailcore_collection (id, path, depth, numchild, name) FROM stdin;
1	0001	1	0	Root
\.


--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailcore_collection_id_seq', 1, true);


--
-- Data for Name: wagtailcore_collectionviewrestriction; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailcore_collectionviewrestriction (id, restriction_type, password, collection_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailcore_collectionviewrestriction_groups (id, collectionviewrestriction_id, group_id) FROM stdin;
\.


--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailcore_collectionviewrestriction_groups_id_seq', 1, false);


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailcore_collectionviewrestriction_id_seq', 1, false);


--
-- Data for Name: wagtailcore_groupcollectionpermission; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailcore_groupcollectionpermission (id, collection_id, group_id, permission_id) FROM stdin;
1	1	1	5
2	1	2	5
3	1	1	6
4	1	2	6
5	1	1	1
6	1	2	1
7	1	1	2
8	1	2	2
\.


--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailcore_groupcollectionpermission_id_seq', 8, true);


--
-- Data for Name: wagtailcore_grouppagepermission; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailcore_grouppagepermission (id, permission_type, group_id, page_id) FROM stdin;
1	add	1	1
2	edit	1	1
3	publish	1	1
4	add	2	1
5	edit	2	1
6	lock	1	1
\.


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailcore_grouppagepermission_id_seq', 6, true);


--
-- Data for Name: wagtailcore_page; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailcore_page (id, path, depth, numchild, title, slug, live, has_unpublished_changes, url_path, seo_title, show_in_menus, search_description, go_live_at, expire_at, expired, content_type_id, owner_id, locked, latest_revision_created_at, first_published_at, live_revision_id, last_published_at, draft_title) FROM stdin;
7	000100020005	3	4	Resources	resources	t	f	/home2/resources/		t		\N	\N	f	31	2	f	2019-02-04 10:12:50.255719+00	2019-01-10 13:05:00.666392+00	165	2019-02-04 10:12:50.284083+00	Resources
24	00010002000200010001	5	0	Approaches	approaches	t	t	/home2/about/project/approaches/		t		\N	\N	f	31	2	f	2019-02-18 14:03:05.486682+00	2019-01-11 12:11:25.341908+00	158	2019-02-01 14:37:22.218566+00	Approaches
9	000100020008	3	0	Search	search	t	f	/home2/search/		f		\N	\N	f	31	2	f	2019-02-05 10:05:55.104598+00	2019-01-10 13:06:21.120816+00	169	2019-02-05 10:05:55.13172+00	Search
5	0001000200060001	4	0	Test Post	test-post	t	f	/home2/blog-news/test-post/		f		\N	\N	f	37	1	f	2019-01-11 05:03:16.133399+00	2019-01-09 16:05:05.748348+00	33	2019-01-11 05:03:16.158671+00	Test Post
1	0001	1	1	Root	root	t	f	/		f		\N	\N	f	1	\N	f	\N	\N	\N	\N	Root
16	0001000200060002	4	0	Test post 2	test-post-2	t	t	/home2/blog-news/test-post-2/		f		\N	\N	f	37	2	f	2019-01-11 11:37:51.277523+00	2019-01-10 13:16:11.634683+00	34	2019-01-11 05:03:26.642685+00	Test post 2
40	00010002000300030001	5	0	Test page	test-page	t	f	/home2/groups/focus-consumers/test-page/		f		\N	\N	f	31	2	f	2019-02-21 10:43:41.767621+00	2019-02-21 10:43:41.791448+00	189	2019-02-21 10:43:41.791448+00	Test page
37	00010002000300020001	5	0	Policy & Practice Notes	policy-practice-notes	t	f	/home2/groups/focus-farming/policy-practice-notes/		t		\N	\N	f	31	6	f	2019-02-07 14:52:05.733152+00	2019-01-23 10:29:14.148919+00	172	2019-02-07 14:52:05.754922+00	Policy & Practice Notes
6	000100020003	3	4	Communities	groups	t	t	/home2/groups/		t		\N	\N	f	31	2	f	2019-02-15 12:36:47.191065+00	2019-01-10 12:55:28.84775+00	162	2019-02-01 15:41:52.398116+00	Communities
18	00010002	2	6	Home	home2	t	f	/home2/		t		\N	\N	f	31	1	f	2019-02-01 09:17:56.308972+00	2019-01-11 01:18:30.245044+00	148	2019-02-01 09:17:56.329123+00	Home
11	00010002000300010001	5	0	Papers	papers	t	f	/home2/groups/focus-research/papers/		t		\N	\N	f	31	2	f	2019-01-11 12:08:03.703235+00	2019-01-10 13:07:07.388895+00	47	2019-01-11 12:08:03.728173+00	Papers
8	000100020007	3	0	Contact us	contact-us	t	f	/home2/contact-us/		t		\N	\N	f	31	2	f	2019-02-01 09:19:10.366418+00	2019-01-10 13:06:00.324026+00	149	2019-02-01 09:19:10.386133+00	Contact us
19	0001000200030002	4	1	Focus on Farming	focus-farming	t	f	/home2/groups/focus-farming/		t		\N	\N	f	31	2	f	2019-02-21 10:44:20.503852+00	2019-01-11 11:59:31.921432+00	191	2019-02-21 10:44:20.532314+00	Focus on Farming
3	000100020006	3	3	News	blog-news	t	f	/home2/blog-news/		t		\N	\N	f	33	1	f	2019-01-21 15:44:17.367767+00	2019-01-09 02:25:07.941592+00	94	2019-01-21 15:44:17.393334+00	News
36	0001000200020003	4	2	Meet the team	meetteam	t	f	/home2/about/meetteam/		f		\N	\N	f	31	4	f	2019-02-01 14:25:19.443405+00	2019-01-25 13:14:41.558419+00	156	2019-02-01 14:25:19.465183+00	Meet the team
21	0001000200030004	4	1	Focus on Advisors and Policy-Makers	focus-advisors-and-policy-makers	t	f	/home2/groups/focus-advisors-and-policy-makers/		t		\N	\N	f	31	2	f	2019-02-21 10:44:37.567038+00	2019-01-11 12:00:08.374926+00	192	2019-02-21 10:44:37.584693+00	Focus on Advisors and Policy-Makers
32	0001000200050003	4	0	Policy and practice notes	policy-and-practice-notes	t	f	/home2/resources/policy-and-practice-notes/		t		\N	\N	f	31	4	f	2019-02-21 10:45:22.29659+00	2019-01-21 15:20:16.962317+00	193	2019-02-21 10:45:22.318977+00	Policy and practice notes
31	00010002000500020002	5	0	Audio	audio	t	f	/home2/resources/media/audio/		t		\N	\N	f	31	4	f	2019-02-21 10:46:19.823122+00	2019-02-04 10:17:02.278004+00	198	2019-02-21 10:46:19.848738+00	Audio
39	00010002000500020003	5	0	Videos	videos	t	f	/home2/resources/media/videos/		t		\N	\N	f	31	6	f	2019-02-21 10:46:26.725274+00	2019-01-25 12:52:07.664363+00	199	2019-02-21 10:46:26.748014+00	Videos
25	0001000200020004	4	0	Frequently Asked Questions	faq	t	t	/home2/about/faq/		t		\N	\N	f	31	2	f	2019-02-15 12:44:11.313244+00	2019-01-11 14:26:12.271761+00	150	2019-02-01 09:58:12.586979+00	Frequently Asked Questions
15	00010002000200030001	5	0	Research team	research-team	t	t	/home2/about/meetteam/research-team/		t		\N	\N	f	31	2	f	2019-02-14 10:03:30.792227+00	2019-01-10 13:08:57.025513+00	119	2019-01-25 13:02:50.116468+00	Research team
35	00010002000200030002	5	0	Collaborator Networks	collaborator-networks	t	f	/home2/about/meetteam/collaborator-networks/		f		\N	\N	f	31	4	f	2019-02-01 14:24:46.665555+00	2019-02-01 14:24:46.689402+00	155	2019-02-01 14:24:46.689402+00	Collaborator Networks
14	0001000200020001	4	2	The Project	project	t	t	/home2/about/project/		t		\N	\N	f	31	2	f	2019-02-18 14:08:15.172528+00	2019-01-10 13:08:41.922213+00	82	2019-01-21 15:19:19.231931+00	The Project
4	000100020002	3	3	About	about	t	t	/home2/about/		t		\N	\N	f	31	1	f	2019-02-18 14:09:04.495071+00	2019-01-09 02:25:46.296158+00	85	2019-01-21 15:19:40.823077+00	About
20	0001000200030003	4	1	Focus on Consumers	focus-consumers	t	t	/home2/groups/focus-consumers/		t		\N	\N	f	31	2	f	2019-02-15 12:41:05.715382+00	2019-01-11 11:59:50.233644+00	170	2019-02-07 10:44:19.824118+00	Focus on Consumers
10	0001000200030001	4	2	Focus on Research	focus-research	t	t	/home2/groups/focus-research/		t		\N	\N	f	31	2	f	2019-02-15 12:43:26.270147+00	2019-01-10 13:06:51.901851+00	113	2019-01-25 12:46:29.967786+00	Focus on Research
33	0001000200050004	4	0	Papers	papers	t	f	/home2/resources/papers/		t		\N	\N	f	31	4	f	2019-02-21 10:45:45.212938+00	2019-01-21 15:20:11.67415+00	194	2019-02-21 10:45:45.236528+00	Papers
26	0001000200060003	4	0	News Item test	news-item-test	t	t	/home2/blog-news/news-item-test/		f		2019-01-11 14:32:00+00	2019-01-31 14:32:00+00	f	37	4	f	2019-01-22 17:05:46.004294+00	2019-01-11 14:33:17.886655+00	54	2019-01-11 14:33:17.886655+00	Main text
28	0001000200050001	4	0	Timeline	timeline	t	f	/home2/resources/timeline/		t		\N	\N	f	31	4	f	2019-02-21 10:45:51.837706+00	2019-01-21 15:20:27.053048+00	195	2019-02-21 10:45:51.868265+00	Timeline
38	00010002000300040001	5	0	Policy & Practice Notes	policy-practice-notes	t	f	/home2/groups/focus-advisors-and-policy-makers/policy-practice-notes/		f		\N	\N	f	31	6	f	2019-01-23 10:31:26.613141+00	2019-01-23 10:31:26.640574+00	111	2019-01-23 10:31:26.640574+00	Policy & Practice Notes
27	00010002000200010002	5	0	Methodology	methodology	t	t	/home2/about/project/methodology/		f		\N	\N	f	31	6	f	2019-02-18 13:54:30.518065+00	2019-01-18 10:05:05.56616+00	157	2019-02-01 14:33:17.101925+00	Methodology
12	00010002000300010002	5	0	Timeline	timeline	t	f	/home2/groups/focus-research/timeline/		t		\N	\N	f	31	2	f	2019-01-11 12:07:56.81771+00	2019-01-10 13:07:42.697036+00	46	2019-01-11 12:07:56.83894+00	Timeline
29	0001000200050002	4	3	Media	media	t	f	/home2/resources/media/		t		\N	\N	f	31	4	f	2019-02-21 10:45:59.578467+00	2019-01-21 15:20:21.59106+00	196	2019-02-21 10:45:59.600381+00	Media
30	00010002000500020001	5	0	Photos	photos	t	f	/home2/resources/media/photos/		t		\N	\N	f	31	4	f	2019-02-21 10:46:12.451748+00	2019-02-04 10:17:18.539734+00	197	2019-02-21 10:46:12.479374+00	Photos
\.


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailcore_page_id_seq', 40, true);


--
-- Data for Name: wagtailcore_pagerevision; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailcore_pagerevision (id, submitted_for_moderation, created_at, content_json, approved_go_live_at, page_id, user_id) FROM stdin;
82	f	2019-01-21 15:19:19.201854+00	{"locked": false, "title": "The Project", "draft_title": "The Project", "has_unpublished_changes": false, "first_published_at": "2019-01-10T13:08:41.922Z", "depth": 4, "expired": false, "last_published_at": "2019-01-21T12:51:55.396Z", "live": true, "content_type": 31, "slug": "project", "latest_revision_created_at": "2019-01-21T12:51:55.374Z", "show_in_menus": true, "numchild": 2, "expire_at": null, "path": "0001000200020001", "seo_title": "", "live_revision": 81, "url_path": "/home2/about/project/", "owner": 2, "search_description": "", "pk": 14, "body": "<p></p><p></p><p>Livestock disease is a complex problem that threatens the development of more sustainable, ethical and efficient farming methods. While traditional, discipline-specific approaches have helped to address the problem of livestock disease, many of farming\\u2019s current challenges cut across disciplines, affecting animal welfare, the environment, and future food security. A new approach is therefore required to reflect the interdisciplinary nature of the challenges facing farmers today. FIELD aims to provide this by integrating scientific, social scientific and humanities perspectives on two case study health problems in Britain; BVD and lameness.</p><p>Through embedding these problems in time, space and society, and enrolling farmers and other publics in their investigation, FIELD will interrogate the changing biological, ontological and social identities of livestock diseases, their relationships with livestock systems and farming communities, and how animal behaviours have shaped their expression, interpretation and management by humans. The project explores how responses to disease in the past have informed its effects in the present; how studying disease in the present can enhance understandings of its past, and how these investigations can inform and be informed by future predictions of disease. FIELD will thereby generate new ways of thinking about, predicting, and intervening in the effects of disease on individual farms and in farming communities, for the benefit of animals, farmers, consumers and the environment.</p><p></p><p></p><h2><a id=\\"24\\" linktype=\\"page\\">Approaches</a></h2><p></p><h2><a id=\\"27\\" linktype=\\"page\\">Methodology</a></h2>", "go_live_at": null}	\N	14	2
111	f	2019-01-23 10:31:26.613141+00	{"go_live_at": null, "search_description": "", "slug": "policy-practice-notes", "depth": 5, "show_in_menus": false, "expired": false, "url_path": "/home2/groups/focus-advisors-and-policy-makers/policy-practice-notes/", "numchild": 0, "first_published_at": null, "has_unpublished_changes": false, "last_published_at": null, "title": "Policy & Practice Notes", "expire_at": null, "draft_title": "Policy & Practice Notes", "path": "00010002000300040001", "live_revision": null, "content_type": 31, "owner": 6, "pk": 38, "seo_title": "", "locked": false, "live": true, "body": "<p></p>", "latest_revision_created_at": null}	\N	38	6
113	f	2019-01-25 12:46:29.945003+00	{"go_live_at": null, "search_description": "", "slug": "focus-research", "depth": 4, "show_in_menus": true, "expired": false, "url_path": "/home2/groups/focus-research/", "numchild": 2, "first_published_at": "2019-01-10T13:06:51.901Z", "has_unpublished_changes": false, "last_published_at": "2019-01-11T02:32:06.066Z", "title": "Focus on Research", "expire_at": null, "draft_title": "Focus on Research", "path": "0001000200030001", "live_revision": 28, "content_type": 31, "owner": 2, "pk": 10, "seo_title": "", "locked": false, "live": true, "body": "<p></p><h2><a id=\\"24\\" linktype=\\"page\\">Approaches</a></h2>", "latest_revision_created_at": "2019-01-11T02:32:06.041Z"}	\N	10	6
5	f	2019-01-09 16:05:05.728482+00	{"draft_title": "Test Post", "last_published_at": null, "url_path": "/home/blog-news/test-post/", "numchild": 0, "seo_title": "", "related_entrypage_from": [], "date": "2019-01-09T16:04:00Z", "related_entrypage_to": [], "first_published_at": null, "go_live_at": null, "header_image": 1, "slug": "test-post", "expired": false, "excerpt": "<p></p>", "depth": 4, "locked": false, "expire_at": null, "body": "<p>The content of my first blog post</p>", "live": true, "latest_revision_created_at": null, "path": "0001000100010001", "has_unpublished_changes": false, "show_in_menus": true, "num_comments": 0, "pk": 5, "content_type": 37, "entry_tags": [], "live_revision": null, "entry_categories": [], "title": "Test Post", "owner": 1, "search_description": ""}	\N	5	1
6	f	2019-01-10 12:55:28.827728+00	{"draft_title": "Groups", "last_published_at": null, "url_path": "/home/groups/", "numchild": 0, "seo_title": "", "first_published_at": null, "go_live_at": null, "slug": "groups", "expired": false, "depth": 3, "locked": false, "expire_at": null, "body": "<h2>Placeholder Header 2</h2><h3>Placeholder Header 3</h3><h4>Placeholder Header 4</h4><p>Placeholder normal text</p>", "live": true, "latest_revision_created_at": null, "path": "000100010003", "has_unpublished_changes": false, "show_in_menus": false, "pk": 6, "content_type": 31, "live_revision": null, "title": "Groups", "owner": 2, "search_description": ""}	\N	6	2
189	f	2019-02-21 10:43:41.767621+00	{"go_live_at": null, "seo_title": "", "title": "Test page", "last_published_at": null, "expire_at": null, "path": "00010002000300030001", "expired": false, "slug": "test-page", "locked": false, "first_published_at": null, "depth": 5, "owner": 2, "body": "<p></p>", "pk": 40, "content_type": 31, "live_revision": null, "latest_revision_created_at": null, "search_description": "", "live": true, "url_path": "/home2/groups/focus-consumers/test-page/", "draft_title": "Test page", "has_unpublished_changes": false, "numchild": 0, "show_in_menus": false}	\N	40	2
101	f	2019-01-22 12:51:05.679838+00	{"go_live_at": null, "search_description": "", "slug": "collaborator-networks", "depth": 4, "show_in_menus": false, "expired": false, "url_path": "/home2/about/collaborator-networks/", "numchild": 0, "first_published_at": null, "has_unpublished_changes": true, "last_published_at": null, "title": "Collaborator networks", "expire_at": null, "draft_title": "Collaborator networks", "path": "0001000200020004", "live_revision": null, "content_type": 31, "owner": 4, "pk": 35, "seo_title": "", "locked": false, "live": false, "body": "<p>The FIELD project is fortunate to have an engaged network of external stakeholders, or collaborators, who are actively involved in helping to shape the project, to ensure both its real world relevance, technical accuracy and ultimately ensure the success of the FIELD project. Find out more about each of our collaborators below.</p><p></p><hr/><h2>Agriculture and Horticulture Development Board</h2><p>The <a href=\\"https://ahdb.org.uk/\\">AHDB</a> </p><hr/><p></p><h2>Tim Brigstoke</h2><h3>Policy Director</h3><h4>Royal Association of British Dairy Farmers</h4><p>In his work for <a href=\\"http://www.rabdf.co.uk/\\">RABDF</a> he ........</p><hr/><h2>Professor Henry Buller</h2><h3>Professor of Geography</h3><h4>Exeter University</h4><p>An internationally renowned expert on animal welfare and the biopolitics of human-animal relations, and social science adviser to Defra.</p><p></p><hr/><h2>DEFRA</h2><p></p><hr/><h2>Dr Ollie Douglas</h2><h3>Assistant Curator</h3><h4>Museum of English Rural Life</h4><p>An experienced museum professional who will provide expert input to help the history cluster navigate the <a href=\\"https://merl.reading.ac.uk/\\">MERL</a> archives.</p><p></p><hr/><h2>Flavour Sense Nation</h2><p></p><hr/><h2>Professor Rob Fraser</h2><h3>Emeritus Professor of Agricultural Economics</h3><h4>University of Kent</h4><p>An expert in agricultural economics and member of Defra&#x27;s Economic Advisory Panel.</p><p></p><hr/><h2>Professor Laura Green</h2><h3>Veterinary Epidemiologist</h3><h4>University of Warwick</h4><p>A leading expert on endemic livestock disease, in particular lameness in sheep, who has worked with industry stakeholders to translate her research into practice, which has resulted in a significant reduction in lameness prevalence.</p><p></p><hr/><h2>Landbridge</h2><hr/><h2>John McFarlane</h2><h3>Vet</h3><h4>Alnorthumbria Veterinary Group</h4><p>A practising farm vet who is active in veterinary politics and a key member of the <a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a> knowledge exchange network.</p><p></p><hr/><h2>Bill Mellor</h2><h3>Chair BVDfree England</h3><hr/><h2>Museum of English Rural Life</h2><hr/><h2>Paul Roger</h2><h3>Veterinary Consultant</h3><p>An independent consultant in sheep health and welfare, and a RCVS Recognised Specialist in Sheep Health and Production.</p><p></p><hr/><h2>Nicola Smith</h2><h3>Livestock Researcher</h3><h4>National Sheep Association</h4><p>The <a href=\\"https://www.nationalsheep.org.uk/\\">NSA</a> </p><hr/><h2>Jon Statham</h2><h3>Vet</h3><h4>Bishopton Veterinary Group</h4><p>A practising farm vet and RCVS Recognised Specialist in Cattle Health and Production.</p><hr/><h2>Scottish Government</h2><p>The Scottish government</p><h2></h2>", "latest_revision_created_at": "2019-01-22T12:39:01.310Z"}	\N	35	4
122	f	2019-01-29 12:59:31.87671+00	{"go_live_at": null, "search_description": "", "slug": "collaborator-networks", "depth": 5, "show_in_menus": false, "expired": false, "url_path": "/home2/about/meetteam/collaborator-networks/", "numchild": 0, "first_published_at": null, "has_unpublished_changes": true, "last_published_at": null, "title": "Collaborator Networks", "expire_at": null, "draft_title": "Collaborator networks", "path": "00010002000200050002", "live_revision": null, "content_type": 31, "owner": 4, "pk": 35, "seo_title": "", "locked": false, "live": false, "body": "<p>The FIELD project is fortunate to have an engaged network of external stakeholders, or collaborators, who are actively involved in helping to shape the project, to ensure both its real world relevance, technical accuracy and ultimately ensure the success of the FIELD project. Find out more about each of our collaborators below.</p><p></p><hr/><h2>Steering Committe</h2><h2>External Collaborators</h2><h2>Knowledge Exchange Partners</h2><h4>Agriculture and Horticulture Development Board</h4><p>The <a href=\\"https://ahdb.org.uk/\\">AHDB</a> undertakes research and development across the food supply chain, as well as acting as a key knowledge broker at the farm level, providing advice and expertise on a wide range of farming related topics.</p><hr/><p></p><h3>Tim Brigstoke</h3><h4>Policy Director, Royal Association of British Dairy Farmers</h4><p>The <a href=\\"http://www.rabdf.co.uk/\\">RABDF</a> focuses on the needs of milk producers, and influences and lobbies government and policymakers about the key issues of its members.</p><hr/><h3>Professor Henry Buller</h3><h4>Professor of Geography, Exeter University</h4><p>An internationally renowned expert on animal welfare and the biopolitics of human-animal relations, and social science adviser to Defra.</p><p></p><hr/><h3>DEFRA</h3><p>Defra will provide expertise through their Animal Welfare and Exotic Disease Control team, who have years of experience in understanding farmer decision making in in relation to animal health.</p><hr/><h3>Dr Ollie Douglas</h3><h4>Assistant Curator, Museum of English Rural Life</h4><p>An experienced museum professional who will provide expert input to help the history cluster navigate the <a href=\\"https://merl.reading.ac.uk/\\">MERL</a> archives.</p><p></p><hr/><h3>Flavour Sense Nation</h3><p><a href=\\"http://flavoursense.com/\\">Flavour Sense Nation</a> are a company that creates interactive events to explore the perceptions of food. They will be providing their expertise in relation to FIELD&#x27;s Food Busk.</p><hr/><h3>Professor Rob Fraser</h3><h4>Emeritus Professor of Agricultural Economics, University of Kent</h4><p>An expert in agricultural economics and member of Defra&#x27;s Economic Advisory Panel.</p><p></p><hr/><h3>Professor Laura Green</h3><h4>Veterinary Epidemiologist, University of Warwick</h4><p>A leading expert on endemic livestock disease, in particular lameness in sheep, who has worked with industry stakeholders to translate her research into practice, which has resulted in a significant reduction in lameness prevalence.</p><p></p><hr/><h3>Landbridge</h3><p><a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a> is a national knowledge exchange network for rural professionals, which provides a platform for inter-professional learning and debate with the aim of improving the advice given to farmers and other businesses.</p><hr/><h3>John McFarlane</h3><h4>Vet, Alnorthumbria Veterinary Group</h4><p>A practising farm vet who is active in veterinary politics and a key member of the <a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a> knowledge exchange network.</p><p></p><hr/><h3>Bill Mellor</h3><h4>Chair BVDfree England</h4><p><a href=\\"https://bvdfree.org.uk/\\">BVDfree England</a> is a voluntary industry-led scheme working to eliminate BVD in all cattle in the UK by 2022.</p><hr/><h3>Museum of English Rural Life</h3><p>The <a href=\\"https://merl.reading.ac.uk/\\">MERL</a> aims to challenge perceptions about rural England by revealing the historical and contemporary relevance of country life. The MERL has expertise in public engagement activities, as well as having a number of collections key to assisting the FIELD research.</p><hr/><h3>Paul Roger</h3><h4>Veterinary Consultant</h4><p>An independent consultant in sheep health and welfare, and a RCVS Recognised Specialist in Sheep Health and Production.</p><p></p><hr/><h3>Nicola Smith</h3><h4>Livestock Researcher, National Sheep Association</h4><p>The <a href=\\"https://www.nationalsheep.org.uk/\\">NSA</a> represents the views and interests of sheep producers throughout the UK, and will be essential for providing sheep farmer perspectives throughout the project.</p><hr/><h3>Jon Statham</h3><h4>Vet, Bishopton Veterinary Group</h4><p>A practising farm vet and RCVS Recognised Specialist in Cattle Health and Production.</p><hr/><h3>Scottish Government</h3><p>The Scottish government recently introduced a <a href=\\"https://www2.gov.scot/Topics/farmingrural/Agriculture/animal-welfare/Diseases/disease/bvd/eradication\\">BVD eradication scheme</a>. Understanding this further will be vital for the FIELD project.</p><p></p><hr/><p></p><h2></h2>", "latest_revision_created_at": "2019-01-22T16:54:29.734Z"}	\N	35	4
123	f	2019-01-29 15:58:33.491753+00	{"live_revision": null, "body": "<p>The FIELD project is fortunate to work with an engaged network of individuals and organisations. From our steering committe, to our external collaborators and knowledge exchange partners, we have a range of stakeholders who are actively involved in helping to shape the project. Together, they will help to ensure FIELD&#x27;s real world relevance, technical accuracy and ultimately ensure the success of the FIELD project. Find out more about each of our collaborators below.</p><p></p><hr/><h2>Steering Committe</h2><p>This group of individuals will provide the FIELD project with strategic insight based, including reviewing the projects progress, providing critical insight, offering advice on future activities, and providing advice on the research topics being studied throughout the project.</p><h2>External Collaborators</h2><p>These individuals possess knowledge, skills and netweks crucial to the FIELD project activities, including being a source of expert advice.</p><h2>Knowledge Exchange Partners</h2><p>These organisations will support the projects knowledge exchange activities for all of our interested audiences.</p><h4>Agriculture and Horticulture Development Board</h4><p>The <a href=\\"https://ahdb.org.uk/\\">AHDB</a> undertakes research and development across the food supply chain, as well as acting as a key knowledge broker at the farm level, providing advice and expertise on a wide range of farming related topics.</p><hr/><p></p><h3>Tim Brigstoke</h3><h4>Policy Director, Royal Association of British Dairy Farmers</h4><p>The <a href=\\"http://www.rabdf.co.uk/\\">RABDF</a> focuses on the needs of milk producers, and influences and lobbies government and policymakers about the key issues of its members.</p><hr/><h3>Professor Henry Buller</h3><h4>Professor of Geography, Exeter University</h4><p>An internationally renowned expert on animal welfare and the biopolitics of human-animal relations, and social science adviser to Defra.</p><p></p><hr/><h3>DEFRA</h3><p>Defra will provide expertise through their Animal Welfare and Exotic Disease Control team, who have years of experience in understanding farmer decision making in in relation to animal health.</p><hr/><h3>Dr Ollie Douglas</h3><h4>Assistant Curator, Museum of English Rural Life</h4><p>An experienced museum professional who will provide expert input to help the history cluster navigate the <a href=\\"https://merl.reading.ac.uk/\\">MERL</a> archives.</p><p></p><hr/><h3>Flavour Sense Nation</h3><p><a href=\\"http://flavoursense.com/\\">Flavour Sense Nation</a> are a company that creates interactive events to explore the perceptions of food. They will be providing their expertise in relation to FIELD&#x27;s Food Busk.</p><hr/><h3>Professor Rob Fraser</h3><h4>Emeritus Professor of Agricultural Economics, University of Kent</h4><p>An expert in agricultural economics and member of Defra&#x27;s Economic Advisory Panel.</p><p></p><hr/><h3>Professor Laura Green</h3><h4>Veterinary Epidemiologist, University of Warwick</h4><p>A leading expert on endemic livestock disease, in particular lameness in sheep, who has worked with industry stakeholders to translate her research into practice, which has resulted in a significant reduction in lameness prevalence.</p><p></p><hr/><h3>Landbridge</h3><p><a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a> is a national knowledge exchange network for rural professionals, which provides a platform for inter-professional learning and debate with the aim of improving the advice given to farmers and other businesses.</p><hr/><h3>John McFarlane</h3><h4>Vet, Alnorthumbria Veterinary Group</h4><p>A practising farm vet who is active in veterinary politics and a key member of the <a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a> knowledge exchange network.</p><p></p><hr/><h3>Bill Mellor</h3><h4>Chair BVDfree England</h4><p><a href=\\"https://bvdfree.org.uk/\\">BVDfree England</a> is a voluntary industry-led scheme working to eliminate BVD in all cattle in the UK by 2022.</p><hr/><h3>Museum of English Rural Life</h3><p>The <a href=\\"https://merl.reading.ac.uk/\\">MERL</a> aims to challenge perceptions about rural England by revealing the historical and contemporary relevance of country life. The MERL has expertise in public engagement activities, as well as having a number of collections key to assisting the FIELD research.</p><hr/><h3>Paul Roger</h3><h4>Veterinary Consultant</h4><p>An independent consultant in sheep health and welfare, and a RCVS Recognised Specialist in Sheep Health and Production.</p><p></p><hr/><h3>Nicola Smith</h3><h4>Livestock Researcher, National Sheep Association</h4><p>The <a href=\\"https://www.nationalsheep.org.uk/\\">NSA</a> represents the views and interests of sheep producers throughout the UK, and will be essential for providing sheep farmer perspectives throughout the project.</p><hr/><h3>Jon Statham</h3><h4>Vet, Bishopton Veterinary Group</h4><p>A practising farm vet and RCVS Recognised Specialist in Cattle Health and Production.</p><hr/><h3>Scottish Government</h3><p>The Scottish government recently introduced a <a href=\\"https://www2.gov.scot/Topics/farmingrural/Agriculture/animal-welfare/Diseases/disease/bvd/eradication\\">BVD eradication scheme</a>. Understanding this further will be vital for the FIELD project.</p><p></p><hr/><p></p><h2></h2>", "slug": "collaborator-networks", "has_unpublished_changes": true, "search_description": "", "path": "00010002000200050002", "owner": 4, "expired": false, "draft_title": "Collaborator Networks", "live": false, "latest_revision_created_at": "2019-01-29T12:59:31.876Z", "depth": 5, "pk": 35, "first_published_at": null, "url_path": "/home2/about/meetteam/collaborator-networks/", "last_published_at": null, "seo_title": "", "content_type": 31, "locked": false, "title": "Collaborator Networks", "expire_at": null, "go_live_at": null, "show_in_menus": false, "numchild": 0}	\N	35	4
124	f	2019-01-29 16:07:33.363923+00	{"live_revision": null, "body": "<p>The FIELD project is fortunate to work with an engaged network of individuals and organisations. From our steering committe, to our external collaborators and knowledge exchange partners, we have a range of stakeholders who are actively involved in helping to shape the project. Together, they will help to ensure FIELD&#x27;s real world relevance, technical accuracy and ultimately ensure the success of the FIELD project. Find out more about each of our collaborators below.</p><p></p><hr/><p></p><hr/><h2>Steering Committe</h2><p>This group of individuals will provide the FIELD project with strategic insight based, including reviewing the projects progress, providing critical insight, offering advice on future activities, and providing advice on the research topics being studied throughout the project.</p><p></p><hr/><h3>Professor Henry Buller</h3><h4>Professor of Geography, Exeter University</h4><p>An internationally renowned expert on animal welfare and the biopolitics of human-animal relations, and social science adviser to Defra.</p><hr/><h3>Dr Ollie Douglas</h3><h4>Assistant Curator, Museum of English Rural Life</h4><p>An experienced museum professional who will provide expert input to help the history cluster navigate the <a href=\\"https://merl.reading.ac.uk/\\">MERL</a> archives.</p><hr/><h3>Professor Rob Fraser</h3><h4>Emeritus Professor of Agricultural Economics, University of Kent</h4><p>An expert in agricultural economics and member of Defra&#x27;s Economic Advisory Panel.</p><hr/><h3>Professor Laura Green</h3><h4>Veterinary Epidemiologist, University of Warwick</h4><p>A leading expert on endemic livestock disease, in particular lameness in sheep, who has worked with industry stakeholders to translate her research into practice, which has resulted in a significant reduction in lameness prevalence.</p><hr/><h3>John McFarlane</h3><h4>Vet, Alnorthumbria Veterinary Group</h4><p>A practising farm vet who is active in veterinary politics and a key member of the <a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a> knowledge exchange network.</p><hr/><p></p><hr/><h2>External Collaborators</h2><p>These individuals possess knowledge, skills and netweks crucial to the FIELD project activities, including being a source of expert advice.</p><p></p><hr/><h4>Agriculture and Horticulture Development Board</h4><p>The <a href=\\"https://ahdb.org.uk/\\">AHDB</a> undertakes research and development across the food supply chain, as well as acting as a key knowledge broker at the farm level, providing advice and expertise on a wide range of farming related topics.</p><hr/><h3>Tim Brigstoke</h3><h4>Policy Director, Royal Association of British Dairy Farmers</h4><p>The <a href=\\"http://www.rabdf.co.uk/\\">RABDF</a> focuses on the needs of milk producers, and influences and lobbies government and policymakers about the key issues of its members.</p><hr/><h3>DEFRA</h3><p>Defra will provide expertise through their Animal Welfare and Exotic Disease Control team, who have years of experience in understanding farmer decision making in in relation to animal health.</p><hr/><h3>Bill Mellor</h3><h4>Chair BVDfree England</h4><p><a href=\\"https://bvdfree.org.uk/\\">BVDfree England</a> is a voluntary industry-led scheme working to eliminate BVD in all cattle in the UK by 2022.</p><hr/><h3>Scottish Government</h3><p>The Scottish government recently introduced a <a href=\\"https://www2.gov.scot/Topics/farmingrural/Agriculture/animal-welfare/Diseases/disease/bvd/eradication\\">BVD eradication scheme</a>. Understanding this further will be vital for the FIELD project.</p><hr/><h3>Paul Roger</h3><h4>Veterinary Consultant</h4><p>An independent consultant in sheep health and welfare, and a RCVS Recognised Specialist in Sheep Health and Production.</p><hr/><h3>Jon Statham</h3><h4>Vet, Bishopton Veterinary Group</h4><p>A practising farm vet and RCVS Recognised Specialist in Cattle Health and Production.</p><hr/><h3>Nicola Smith</h3><h4>Livestock Researcher, National Sheep Association</h4><p>The <a href=\\"https://www.nationalsheep.org.uk/\\">NSA</a> represents the views and interests of sheep producers throughout the UK, and will be essential for providing sheep farmer perspectives throughout the project.</p><hr/><p></p><hr/><h2>Knowledge Exchange Partners</h2><p>These organisations will support the projects knowledge exchange activities for all of our interested audiences.</p><p></p><hr/><h3>Flavour Sense Nation</h3><p><a href=\\"http://flavoursense.com/\\">Flavour Sense Nation</a> are a company that creates interactive events to explore the perceptions of food. They will be providing their expertise in relation to FIELD&#x27;s Food Busk.</p><hr/><h3>Landbridge</h3><p><a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a> is a national knowledge exchange network for rural professionals, which provides a platform for inter-professional learning and debate with the aim of improving the advice given to farmers and other businesses.</p><hr/><h3>Museum of English Rural Life</h3><p>The <a href=\\"https://merl.reading.ac.uk/\\">MERL</a> aims to challenge perceptions about rural England by revealing the historical and contemporary relevance of country life. The MERL has expertise in public engagement activities, as well as having a number of collections key to assisting the FIELD research.</p><hr/><p></p><hr/><p></p>", "slug": "collaborator-networks", "has_unpublished_changes": true, "search_description": "", "path": "00010002000200050002", "owner": 4, "expired": false, "draft_title": "Collaborator Networks", "live": false, "latest_revision_created_at": "2019-01-29T15:58:33.491Z", "depth": 5, "pk": 35, "first_published_at": null, "url_path": "/home2/about/meetteam/collaborator-networks/", "last_published_at": null, "seo_title": "", "content_type": 31, "locked": false, "title": "Collaborator Networks", "expire_at": null, "go_live_at": null, "show_in_menus": false, "numchild": 0}	\N	35	4
125	f	2019-01-29 16:13:32.701688+00	{"live_revision": null, "body": "<p>The FIELD project is fortunate to work with an engaged network of individuals and organisations. From our steering committe, to our external collaborators and knowledge exchange partners, we have a range of stakeholders who are actively involved in helping to shape the project. Together, they will help to ensure FIELD&#x27;s real world relevance, technical accuracy and ultimately ensure the success of the FIELD project. Find out more about each of our collaborators below.</p><p></p><hr/><p></p><hr/><h2>Steering Committe</h2><p>This group of individuals will provide the FIELD project with strategic insight based, including reviewing the projects progress, providing critical insight, offering advice on future activities, and providing advice on the research topics being studied throughout the project.</p><p></p><hr/><h3>Professor Henry Buller</h3><h4>Professor of Geography, Exeter University</h4><p>An internationally renowned expert on animal welfare and the biopolitics of human-animal relations, and social science adviser to Defra. He will provide support for the social science work, and will bring expertise on livestock welfare, consumer perspectives and animals as shapers of human society.</p><hr/><h3>Dr Ollie Douglas</h3><h4>Assistant Curator, Museum of English Rural Life</h4><p>An experienced museum professional who will provide expert input to help the history cluster navigate the <a href=\\"https://merl.reading.ac.uk/\\">MERL</a> archives. He will also oversee the digitisation of its films and images for the purposes of project research and public engagment, and support the knowledge exchange activities.</p><hr/><h3>Professor Rob Fraser</h3><h4>Emeritus Professor of Agricultural Economics, University of Kent</h4><p>An expert in agricultural economics and member of Defra&#x27;s Economic Advisory Panel.</p><hr/><h3>Professor Laura Green</h3><h4>Veterinary Epidemiologist, University of Warwick</h4><p>A leading expert on endemic livestock disease, in particular lameness in sheep, who has worked with industry stakeholders to translate her research into practice, which has resulted in a significant reduction in lameness prevalence.</p><hr/><h3>John McFarlane</h3><h4>Vet, Alnorthumbria Veterinary Group</h4><p>A practising farm vet who is active in veterinary politics and a key member of the <a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a> knowledge exchange network.</p><hr/><p></p><hr/><h2>External Collaborators</h2><p>These individuals possess knowledge, skills and netweks crucial to the FIELD project activities, including being a source of expert advice.</p><p></p><hr/><h4>Agriculture and Horticulture Development Board</h4><p>The <a href=\\"https://ahdb.org.uk/\\">AHDB</a> undertakes research and development across the food supply chain, as well as acting as a key knowledge broker at the farm level, providing advice and expertise on a wide range of farming related topics.</p><hr/><h3>Tim Brigstoke</h3><h4>Policy Director, Royal Association of British Dairy Farmers</h4><p>The <a href=\\"http://www.rabdf.co.uk/\\">RABDF</a> focuses on the needs of milk producers, and influences and lobbies government and policymakers about the key issues of its members.</p><hr/><h3>DEFRA</h3><p>Defra will provide expertise through their Animal Welfare and Exotic Disease Control team, who have years of experience in understanding farmer decision making in in relation to animal health.</p><hr/><h3>Bill Mellor</h3><h4>Chair BVDfree England</h4><p><a href=\\"https://bvdfree.org.uk/\\">BVDfree England</a> is a voluntary industry-led scheme working to eliminate BVD in all cattle in the UK by 2022.</p><hr/><h3>Scottish Government</h3><p>The Scottish government recently introduced a <a href=\\"https://www2.gov.scot/Topics/farmingrural/Agriculture/animal-welfare/Diseases/disease/bvd/eradication\\">BVD eradication scheme</a>. Understanding this further will be vital for the FIELD project.</p><hr/><h3>Paul Roger</h3><h4>Veterinary Consultant</h4><p>An independent consultant in sheep health and welfare, and a RCVS Recognised Specialist in Sheep Health and Production.</p><hr/><h3>Jon Statham</h3><h4>Vet, Bishopton Veterinary Group</h4><p>A practising farm vet and RCVS Recognised Specialist in Cattle Health and Production.</p><hr/><h3>Nicola Smith</h3><h4>Livestock Researcher, National Sheep Association</h4><p>The <a href=\\"https://www.nationalsheep.org.uk/\\">NSA</a> represents the views and interests of sheep producers throughout the UK, and will be essential for providing sheep farmer perspectives throughout the project.</p><hr/><p></p><hr/><h2>Knowledge Exchange Partners</h2><p>These organisations will support the projects knowledge exchange activities for all of our interested audiences.</p><p></p><hr/><h3>Flavour Sense Nation</h3><p><a href=\\"http://flavoursense.com/\\">Flavour Sense Nation</a> are a company that creates interactive events to explore the perceptions of food. They will be providing their expertise in relation to FIELD&#x27;s Food Busk.</p><hr/><h3>Landbridge</h3><p><a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a> is a national knowledge exchange network for rural professionals, which provides a platform for inter-professional learning and debate with the aim of improving the advice given to farmers and other businesses.</p><hr/><h3>Museum of English Rural Life</h3><p>The <a href=\\"https://merl.reading.ac.uk/\\">MERL</a> aims to challenge perceptions about rural England by revealing the historical and contemporary relevance of country life. The MERL has expertise in public engagement activities, as well as having a number of collections key to assisting the FIELD research.</p><hr/><p></p><hr/><p></p>", "slug": "collaborator-networks", "has_unpublished_changes": true, "search_description": "", "path": "00010002000200050002", "owner": 4, "expired": false, "draft_title": "Collaborator Networks", "live": false, "latest_revision_created_at": "2019-01-29T16:07:33.363Z", "depth": 5, "pk": 35, "first_published_at": null, "url_path": "/home2/about/meetteam/collaborator-networks/", "last_published_at": null, "seo_title": "", "content_type": 31, "locked": false, "title": "Collaborator Networks", "expire_at": null, "go_live_at": null, "show_in_menus": false, "numchild": 0}	\N	35	4
126	f	2019-01-29 16:33:54.563566+00	{"depth": 5, "seo_title": "", "live": false, "title": "Collaborator Networks", "body": "<p>The FIELD project is fortunate to work with an engaged network of individuals and organisations. From our steering committe, to our external collaborators and knowledge exchange partners, we have a range of stakeholders who are actively involved in helping to shape the project. Together, they will help to ensure FIELD&#x27;s real world relevance, technical accuracy and ultimately ensure the success of the FIELD project. Find out more about each of our collaborators below.</p><p></p><p></p><p></p><hr/><p></p><hr/><h2>Steering Committe</h2><p>This group of individuals will provide the FIELD project with strategic insight based, including reviewing the projects progress, providing critical insight, offering advice on future activities, and providing advice on the research topics being studied throughout the project.</p><p></p><hr/><h3>Professor Henry Buller</h3><h4>Professor of Geography, Exeter University</h4><p>An internationally renowned expert on animal welfare and the biopolitics of human-animal relations, and social science adviser to Defra. He will provide support for the social science work, and will bring expertise on livestock welfare, consumer perspectives and animals as shapers of human society.</p><hr/><h3>Dr Ollie Douglas</h3><h4>Assistant Curator, Museum of English Rural Life</h4><p>An experienced museum professional who will provide expert input to help the history cluster navigate the <a href=\\"https://merl.reading.ac.uk/\\">MERL</a> archives. He will also oversee the digitisation of its films and images for the purposes of project research and public engagment, and support the knowledge exchange activities.</p><hr/><h3>Professor Rob Fraser</h3><h4>Emeritus Professor of Agricultural Economics, University of Kent</h4><p>An expert in agricultural economics and member of Defra&#x27;s Economic Advisory Panel. He will provide support for the economists in the project through his expertise in the economics of livestock disease, its social and moral dimensions, and commercial and political contexts.</p><hr/><h3>Professor Laura Green</h3><h4>Veterinary Epidemiologist, University of Warwick</h4><p>A leading expert on endemic livestock disease, in particular lameness in sheep, who has worked with industry stakeholders to translate her research into practice, which has resulted in a significant reduction in lameness prevalence. She will adcise on the epidemiological aspects of the project, inter-disciplinary working and animal welfare.</p><hr/><h3>John McFarlane</h3><h4>Vet, Alnorthumbria Veterinary Group</h4><p>A practising farm vet who is active in veterinary politics and a key member of the <a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a> knowledge exchange network. As well as providing his veterinary expertise, he will assist the project in expanding its network to ensure its success, through facilitating connections with farmers, vets and other rural professionals.</p><hr/><p></p><p></p><p></p><hr/><p></p><hr/><h2>External Collaborators</h2><p>These individuals possess knowledge, skills and netweks crucial to the FIELD project activities, including being a source of expert advice.</p><p></p><hr/><h3>Susannah Bolton</h3><h4>Agriculture and Horticulture Development Board</h4><p>The <a href=\\"https://ahdb.org.uk/\\">AHDB</a> undertakes research and development across the food supply chain, as well as acting as a key knowledge broker at the farm level, providing advice and expertise on a wide range of farming related topics. Susannah will help the project engage with a wide variety of stakeholders in the co-production of knowledge and dissemination of research findings.</p><hr/><h3> Tim Brigstoke</h3><h4>Policy Director, Royal Association of British Dairy Farmers</h4><p>The <a href=\\"http://www.rabdf.co.uk/\\">RABDF</a> focuses on the needs of milk producers, and influences and lobbies government and policymakers about the key issues of its members. Tim will bring the experiences and perspectives of the dairy industry to the project.</p><hr/><h3>Charlotte Carne</h3><h4>Animal Welfare and Exotic Disease Control Team, DEFRA</h4><p>Defra will provide expertise through their Animal Welfare and Exotic Disease Control team, who have years of experience in understanding farmer decision making in in relation to animal health. Charlotte will provide a means of disseminating the research findings to policy makers.</p><hr/><h3>Bill Mellor</h3><h4>Chair BVDfree England</h4><p><a href=\\"https://bvdfree.org.uk/\\">BVDfree England</a> is a voluntary industry-led scheme working to eliminate BVD in all cattle in the UK by 2022. Bill will provide input on the project design and interpretation of the results, given his experise from the BVDfree programme.</p><hr/><h3>Jenny Purcell</h3><h4>BVD Policy Manager, Scottish Government</h4><p>The Scottish government recently introduced a <a href=\\"https://www2.gov.scot/Topics/farmingrural/Agriculture/animal-welfare/Diseases/disease/bvd/eradication\\">BVD eradication scheme</a>. Understanding this further will be vital for the FIELD project, and Jenny will be a crucial facilitator in this process of knowledge exchange.</p><hr/><h3>Paul Roger</h3><h4>Veterinary Consultant</h4><p>An independent consultant in sheep health and welfare, and a RCVS Recognised Specialist in Sheep Health and Production. He will pvode expert veterinary perspectives on lameness in sheep.</p><hr/><h3>Jon Statham</h3><h4>Vet, Bishopton Veterinary Group</h4><p>A practising farm vet and RCVS Recognised Specialist in Cattle Health and Production, who will provide expert veterinary input on BVD and lameness in cattle.</p><hr/><h3>Nicola Smith</h3><h4>Livestock Researcher, National Sheep Association</h4><p>The <a href=\\"https://www.nationalsheep.org.uk/\\">NSA</a> represents the views and interests of sheep producers throughout the UK, and will be essential for providing sheep farmer perspectives throughout the project. Nicola will bring a sheep industry perspective to the project, and will assist in bringing sheep farmers into the research as co-producers.</p><hr/><p></p><p></p><p></p><hr/><p></p><hr/><h2>Knowledge Exchange Partners</h2><p>These organisations will support the projects knowledge exchange activities for all of our interested audiences.</p><p></p><hr/><h3>Flavour Sense Nation</h3><p><a href=\\"http://flavoursense.com/\\">Flavour Sense Nation</a> are a company that creates interactive events to explore the perceptions of food. They will be providing their expertise in relation to FIELD&#x27;s Food Busk, which will provide an opportunity to explore public perceptions of animal health and welfare.</p><hr/><h3>Landbridge</h3><p><a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a> is a national knowledge exchange network for rural professionals, which provides a platform for inter-professional learning and debate with the aim of improving the advice given to farmers and other businesses. As well as providing advice on the project, Landbridge will help facilitate a knowledge-exchange workshop with rural professionals during the project.</p><hr/><h3>Museum of English Rural Life</h3><p>The <a href=\\"https://merl.reading.ac.uk/\\">MERL</a> aims to challenge perceptions about rural England by revealing the historical and contemporary relevance of country life. The MERL has expertise in public engagement activities, as well as having a number of collections key to assisting the FIELD research. It will help the project to develop its public-facing work through the use of its venues, networks and expertise in this area.</p><hr/><p></p><hr/><p></p>", "draft_title": "Collaborator Networks", "owner": 4, "expired": false, "live_revision": null, "url_path": "/home2/about/meetteam/collaborator-networks/", "content_type": 31, "locked": false, "go_live_at": null, "first_published_at": null, "path": "00010002000200050002", "slug": "collaborator-networks", "last_published_at": null, "has_unpublished_changes": true, "expire_at": null, "pk": 35, "latest_revision_created_at": "2019-01-29T16:13:32.701Z", "search_description": "", "numchild": 0, "show_in_menus": false}	\N	35	4
127	f	2019-01-29 16:34:19.150426+00	{"depth": 5, "seo_title": "", "live": true, "title": "Research team", "body": "<p>The research on the FIELD research project will be conducted by a team of 12 individuals from 6 different UK universities, and from 3 different scientific disciplines. Find out more about the different team members below.</p><p></p><hr/><h2>Prof Abigail Woods</h2><h3>King&#x27;s College London</h3><h4>History</h4><p>Abigail Woods is Head of the Department of History, and <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Professor in the History of Human and</a> <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Animal Health at King&#x27;s College London.</a> Reflecting her earlier career as a veterinary surgeon, her research focuses on the history of animal health in 19th and 20th century Britain, and its intersections with the histories of human health and livestock production. Her recent research has explored the history of veterinary expertise, policy and practice; the changing concepts of animal health, welfare and productivity; and how patterns and perceptions of livestock disease have changed over time. As principle investigator of the FIELD project, she is developing the first social histories of BVD and cattle lameness, and bringing them into dialogue with contemporary scientific and social scientific perspectives.</p><p></p><hr/><h2>Nicole Gosling</h2><h3>King&#x27;s College London</h3><h4>History</h4><p>Nicole Gosling is a PhD student at King\\u2019s College in London and will be writing her dissertation as a contribution to the FIELD project. She studied her BSc in Ecology at the University of Victoria, and recently completed an MA in Environmental History at Uppsala University. Broadly speaking, Nicole\\u2019s interests include how humans interact with nature, with a focus on human-animal relationships. She explored these relationships in her master\\u2019s thesis \\u2018Making Sense of Cattle: A story from farm to food\\u2019 where she looked at how different actors experience cattle bodies during the production of beef. Building on this line of thinking, Nicole\\u2019s role in the FIELD project will be focused on the history of lameness in sheep.</p><p></p><hr/><h2>Prof Karen Sayer</h2><h3>Leeds Trinity University</h3><h4>History</h4><p><a href=\\"http://research.leedstrinity.ac.uk/en/persons/karen-sayer(5c5fb33f-b15c-497f-870a-ad1d04f03454).html\\">Professor of Social and Cultural History at Leeds Trinity University,</a> Leeds, UK, Karen Sayer specialises in the study of British agriculture, landscape and environment in the 19th and 20th centuries. Her first monograph, <i>Women of the Fields: Representations of Femininity in Nineteenth Century Rural Society</i> (MUP 1995) used a discursive and interdisciplinary approach to assess the representation of women\\u2019s work in agriculture in Parliamentary Reports alongside art, literature and the press, to explain legislative intervention and control of their employment. She built on this work with her second monograph <i>Country Cottages: A Cultural History</i> (MUP, 2000). Drawing on the work of the social sciences, architecture and geography to scrutinise the values attached historically to the idea and material culture of the cottage, and the experiences of those who inhabited it, the book encompassed a spatial reading of the political and material effects of the rural idyll that impact at the level of national identity and \\u2018race\\u2019, class and sex. She has continued to address the shape of, values attaching to and understandings of the British landscape and environment, and experiences of those living in the countryside. Today she works on energy landscapes \\u2013 e.g. with P. Brassley &amp; J. Burchardt <i>Transforming the countryside?</i> <i>The Electrification of Rural England 1890-1970</i> (Routledge, 2016) \\u2013 the managed spaces of the farm, history of livestock agriculture and animal history.</p><p>Within the FIELD project, she addresses the tensions that beset the \\u2018modernisation\\u2019 of UK livestock farming after 1947 and the different, competing messages attaching to animal welfare and consumption, as seen in the use of the British countryside as site of amenity and site of production. This work incorporates ideas of animals as active agents of history, and is framed by notions of interconnectivity of farm, the farm animal, disease organisms, farmers, labourers, marketeers, sales reps, government officials, journalists and the non-farming public over time.</p><p></p><hr/><h2>Dr James Bowen</h2><h3>Leeds Trinity University</h3><h4>History</h4><p>James P. Bowen is a Post-Doctoral Research Associate in History based at Leeds Trinity University with research interests in agricultural and rural history. He was formerly a Research Associate (Victoria County History-Cumbria Project) in the Department of History, Lancaster University and was the Contributing Editor for The Herefordshire Victoria County History Trust Short on the parish of Colwall. He was formerly a Post-Doctoral Research Associate based at the Department of Geography and Planning, University of Liverpool employed on \\u2018Spaces of experience and horizons of expectation: the implications of extreme weather events, past, present and future\\u2019, a three-year project, funded as part of the Care for the Future programme of the Arts and Humanities Research Council. He completed a PhD at Lancaster University supervised by Professor A.J.L. Winchester and held the Economic History Society\\u2019s Tawney Junior Research Fellowship in 2012-13 at the Institute of Historical Research, London.</p><p></p><hr/><h2>Dr Amy Proctor</h2><h3>Newcastle University</h3><h4>Social Science</h4><p><a href=\\"https://www.ncl.ac.uk/cre/about/staff/profile/amyproctornclacuk.html#background\\">Amy Proctor</a> is based at the <a href=\\"https://www.ncl.ac.uk/cre/\\">Centre for Rural Economy</a> at Newcastle University. She is interested in agricultural extension and processes of expertise exchange within rural land management and has published widely on this. Her research has focused on the knowledge-practices of farmers and their advisors and the performance and practice of the advisory encounter. Amy is also interested in developing innovative and interactive ways of engaging with stakeholders and has co-led <a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a>, a national knowledge exchange network for rural professionals which provides a platform for inter-professional learning and debate among farm advisers and opportunities for exchange with research communities. In FIELD, Amy will develop and conduct the social science aspects of the project including in-depth interviews and ethnographic research with farmers and advisers and focus groups with farmers and consumers.</p><p></p><hr/><h2>Sue Bradley</h2><h3>Newcastle University</h3><h4>History</h4><p>Sue Bradley is an oral historian in the <a href=\\"https://www.ncl.ac.uk/cre/\\">Centre for Rural Economy</a>, Newcastle University, where her research has ranged from flood risk to honey bee health and veterinary practice. She is interested in how oral history can help to address current concerns, and in using audio testimonies from older practitioners as a basis for discussions with their counterparts today. Her work for FIELD includes recording a collection of life-story interviews that will contribute insights from first-hand accounts of working with cattle and sheep in the north of England since the 1940&#x27;s. This collection will be archived at the <a href=\\"https://merl.reading.ac.uk/\\">Museum for English Rural Life</a> to serve beyond the project as a permanent public research resource. Sue also works part-time in <a href=\\"https://research.ncl.ac.uk/oralhistory/\\">Newcastle University\\u2019s Oral History Unit</a>. Before coming to Newcastle she was responsible for creating the British Library\\u2019s Book Trade Lives collection of recordings with booksellers and publishers.</p><p></p><hr/><h2>Dr Beth Clark</h2><h3>Newcastle University</h3><h4>Social Science</h4><p><a href=\\"https://www.ncl.ac.uk/cre/about/staff/profile/bethclark.html#background\\">Beth\\u2019s</a> research background in sports, exercise and nutrition and food marketing reflects her research interests in food and communication. She is particularly interested in exploring how people relate to animal products and different food production practices, such as motivations for food choice, innovation and technology in production, knowledge of food production practices, and food cultures. Through this she works with a range of stakeholders from across the food supply chain, which has fuelled an interest in communication, including how individuals and groups share information and trust different information sources.She has two roles on the FIELD project. The first is part of the social science research team, involving interviews, focus groups and observations with farmers, farming advisors and the public, to explore their different experiences and perceptions of endemic livestock disease. The second role focuses on public engagement, including the online communications and website for FIELD, as well as identifying and organising opportunities for greater interaction with the projects many stakeholders, including members of the farming community and the public.</p><hr/><h2>Dr Ewan Coleman</h2><h3>University of Edinburgh</h3><h4>Epidemiology &amp; Economics</h4><p>Ewan Colman is a post-doctoral research associate at the <a href=\\"https://www.ed.ac.uk/roslin\\">Roslin Institute</a> at the University of Edinburgh. He has a background in mathematics, particularly in applied probability, data science, and network science. His research uses computational modelling to explore the relationship between behaviour and the spread of infectious disease. Ewan&#x27;s past interests include the dynamics of conversations on social media, the social and spatial organisation of ant colonies, and the how the ever-increasing amount of public health data can be exploited to detect and mitigate epidemic diseases. As a member of the FIELD project, he will focus on the spread of BVD through cattle trade, and how changing attitudes towards biosecurity can reduce the prevalence of BVD on a national scale.</p><p></p><hr/><h2>Prof Rowland Kao</h2><h3>University of Edinburgh</h3><h4>Epidemiology &amp; Economics</h4><p>Awaiting text</p><p></p><hr/><h2>Maria Suella Rodrigues</h2><h3>University of Glasgow</h3><h4>Epidemiology &amp; Economics</h4><p>Maria Suella Rodrigues is a doctoral candidate at the University of Glasgow, supervised under Professor Nicholas Hanley (MVLS), Dr. Souvik Datta (ASBS) at the University of Glasgow and Professor Rowland Kao from the University of Edinburgh. Maria holds a BSc degree in Economics from Lancaster University. Following that she moved to the University of Glasgow where she pursued the MRes in Economics, graduating in 2018. She is interested in investigating research questions in the areas of agricultural and environmental economics as well as applied micro-econometrics and choice-modelling theory. During her MRes dissertation she modelled consumer preferences for forest disease management with use of Choice modelling data. Additionally, she has received extensive training in choice-modelling from the Choice Modelling Centre, University of Leeds. As part of the FIELD project, Maria will design field experiments and model both farmer and consumer preferences in relation to farm animal welfare.</p><p></p><hr/><h2>Dr Lewis Holloway</h2><h3>University of Hull</h3><h4>Social Science</h4><p><a href=\\"https://www.hull.ac.uk/faculties/staff-profiles/lewis-holloway.aspx\\">Lewis Holloway</a> is a Reader in Human Geography at the University of Hull. He has research interests in food, farming and the countryside, and has a particular interest in farm animals and agricultural technologies. Recent research has focused on the ways in which genetic, information and robotic technologies have affected livestock farming, and has involved in-depth research with farmers and technology developers to understand how new technologies are engaged with, adopted and contested by farmers. Lewis is interested in the situated ethics associated with animal agriculture, and in how technologies can transform farming ethics and knowledge-practices. Lewis will be involved in developing and conducting the social scientific elements of the FIELD project. This will include on-farm interview and observational work with farmers, farm animals and expert advisors, and focus groups with farmers and public groups.</p><p></p><hr/><h2>Dr Niamh Mahon</h2><h3>University of Hull</h3><h4>Social Science</h4><p><a href=\\"https://www.researchgate.net/profile/Niamh_Mahon\\">Niamh</a> is a Post-Doctoral Research Associate at the University of Hull. In this role she is involved in the social science components of the FIELD project. This includes in-depth interviews and observational work with farmers and expert advisors, and focus groups with farmers and the public, conducted to explore their different experiences and perceptions of endemic livestock disease. Prior to this Niamh under took a PhD at Nottingham Trent University developing stakeholder-sensitive indicators of the Sustainable Intensification of UK agriculture and a Master\\u2019s degree from the University of East Anglia in Sustainable Agriculture and Food Security. She has also worked as a research assistant in socio-economics and policy for the Organic Research Centre. Niamh is a member of the Food and Climate Research Network and the Sustainable Intensification Research Network.</p><p></p><hr/><h2>Prof Nick Hanley</h2><h3>University of Glasgow</h3><h4>Epidemiology &amp; Economics</h4><p>Nick Hanley is a <a href=\\"https://www.gla.ac.uk/researchinstitutes/bahcm/staff/nicholashanley/\\">Professor of Environmental and One Health Economics</a> at the University of Glasgow. His PhD was in Agricultural Economics. His current main research interests include behavioural economics, the design of Payment for Ecosystem Service schemes, environmental valuation, one health economics, the economics of sustainable development, markets for biodiversity offsets, and the economics of invasive species. He is an honorary professor at the universities of St Andrews and Stirling. Nick is co-author of a textbook in environmental cost-benefit analysis with Edward Barbier; and two textbooks on environmental economics (with Jason Shogren and Ben White).</p><p></p><hr/><p></p>", "draft_title": "Research team", "owner": 2, "expired": false, "live_revision": 119, "url_path": "/home2/about/meetteam/research-team/", "content_type": 31, "locked": false, "go_live_at": null, "first_published_at": "2019-01-10T13:08:57.025Z", "path": "00010002000200050001", "slug": "research-team", "last_published_at": "2019-01-25T13:02:50.116Z", "has_unpublished_changes": false, "expire_at": null, "pk": 15, "latest_revision_created_at": "2019-01-25T13:02:50.088Z", "search_description": "", "numchild": 0, "show_in_menus": true}	\N	15	4
28	f	2019-01-11 02:32:06.041387+00	{"show_in_menus": true, "live": true, "numchild": 3, "title": "Focus on Research", "expire_at": null, "slug": "focus-research", "body": "<p></p>", "expired": false, "locked": false, "first_published_at": "2019-01-10T13:06:51.901Z", "go_live_at": null, "depth": 4, "draft_title": "Focus on Research", "content_type": 31, "has_unpublished_changes": false, "latest_revision_created_at": "2019-01-10T13:06:51.885Z", "search_description": "", "last_published_at": "2019-01-10T13:06:51.901Z", "url_path": "/home2/groups/focus-research/", "seo_title": "", "live_revision": 11, "path": "0001000200020001", "pk": 10, "owner": 2}	\N	10	1
80	f	2019-01-21 12:51:52.194544+00	{"locked": false, "title": "The Project", "draft_title": "The Project", "has_unpublished_changes": false, "first_published_at": "2019-01-10T13:08:41.922Z", "depth": 4, "expired": false, "last_published_at": "2019-01-21T12:25:11.839Z", "live": true, "content_type": 31, "slug": "project", "latest_revision_created_at": "2019-01-21T12:25:11.814Z", "show_in_menus": true, "numchild": 2, "expire_at": null, "path": "0001000200020001", "seo_title": "", "live_revision": 79, "url_path": "/home2/about/project/", "owner": 2, "search_description": "", "pk": 14, "body": "<p></p><p></p><p>Livestock disease is a complex problem that threatens the development of more sustainable, ethical and efficient farming methods. While traditional, discipline-specific approaches have helped to address the problem of livestock disease, many of farming\\u2019s current challenges cut across disciplines, affecting animal welfare, the environment, and future food security. A new approach is therefore required to reflect the interdisciplinary nature of the challenges facing farmers today. FIELD aims to provide this by integrating scientific, social scientific and humanities perspectives on two case study health problems in  Britain; BVD and lameness. </p><p>Through embedding these problems in time, space and society, and enrolling farmers and other publics in their investigation, FIELD will interrogate the changing biological, ontological and social identities of livestock diseases, their relationships with livestock systems and farming communities, and how animal behaviours have shaped their expression, interpretation and management by humans. The project explores how responses to disease in the past have informed its effects in the present; how studying disease in the present can enhance understandings of its past, and how these investigations can inform and be informed by future predictions of disease. FIELD will thereby generate new ways of thinking about, predicting, and intervening in the effects of disease on individual farms and in farming communities, for the benefit of animals, farmers, consumers and the environment.</p><p></p><p></p><h2><a id=\\"24\\" linktype=\\"page\\">Approaches</a></h2><p></p><h2><a id=\\"27\\" linktype=\\"page\\">Methodology</a></h2>", "go_live_at": null}	\N	14	6
129	f	2019-01-29 16:39:44.483101+00	{"depth": 3, "seo_title": "", "live": true, "title": "Contact us", "body": "<p>Have a question about endemic livestock disease, want to find out more about the project or want to become involved in the research? We would love to hear from you!</p><p>A core part of the FIELD project is involving as many stakeholders as possible and that means you! Complete the form below and one of the team will contact you as soon as possible.</p><p></p><p>[Could this be a form template or will it introduce an email pop out?]</p>", "draft_title": "Contact us", "owner": 2, "expired": false, "live_revision": 25, "url_path": "/home2/contact-us/", "content_type": 31, "locked": false, "go_live_at": null, "first_published_at": "2019-01-10T13:06:00.324Z", "path": "000100020007", "slug": "contact-us", "last_published_at": "2019-01-11T02:30:45.614Z", "has_unpublished_changes": true, "expire_at": null, "pk": 8, "latest_revision_created_at": "2019-01-18T13:18:51.820Z", "search_description": "", "numchild": 0, "show_in_menus": true}	\N	8	4
9	f	2019-01-10 13:06:00.303108+00	{"draft_title": "Contact us", "last_published_at": null, "url_path": "/home/contact-us/", "numchild": 0, "seo_title": "", "first_published_at": null, "go_live_at": null, "slug": "contact-us", "expired": false, "depth": 3, "locked": false, "expire_at": null, "body": "<p></p>", "live": true, "latest_revision_created_at": null, "path": "000100010005", "has_unpublished_changes": false, "show_in_menus": false, "pk": 8, "content_type": 31, "live_revision": null, "title": "Contact us", "owner": 2, "search_description": ""}	\N	8	2
128	f	2019-01-29 16:37:49.648729+00	{"depth": 4, "seo_title": "", "live": true, "title": "Meet the team", "body": "<p>The FIELD team is composed of a number of different research disciplines. The team will be supported throughout the project by a range of different industry and professional stakeholders who will provide their expertise and input to help shape the project and ensure its relevance. </p><p>Find out more about the different team members and stakeholders.</p>", "draft_title": "Meet the team", "owner": 4, "expired": false, "live_revision": 121, "url_path": "/home2/about/meetteam/", "content_type": 31, "locked": false, "go_live_at": null, "first_published_at": "2019-01-25T13:14:41.558Z", "path": "0001000200020005", "slug": "meetteam", "last_published_at": "2019-01-25T13:14:41.558Z", "has_unpublished_changes": false, "expire_at": null, "pk": 36, "latest_revision_created_at": "2019-01-25T13:14:41.532Z", "search_description": "", "numchild": 2, "show_in_menus": false}	\N	36	4
10	f	2019-01-10 13:06:21.103668+00	{"draft_title": "Search", "last_published_at": null, "url_path": "/home/search/", "numchild": 0, "seo_title": "", "first_published_at": null, "go_live_at": null, "slug": "search", "expired": false, "depth": 3, "locked": false, "expire_at": null, "body": "<p></p>", "live": true, "latest_revision_created_at": null, "path": "000100010006", "has_unpublished_changes": false, "show_in_menus": false, "pk": 9, "content_type": 31, "live_revision": null, "title": "Search", "owner": 2, "search_description": ""}	\N	9	2
15	f	2019-01-10 13:08:41.89777+00	{"draft_title": "The Project", "last_published_at": null, "url_path": "/home/about/project/", "numchild": 0, "seo_title": "", "first_published_at": null, "go_live_at": null, "slug": "project", "expired": false, "depth": 4, "locked": false, "expire_at": null, "body": "<p></p>", "live": true, "latest_revision_created_at": null, "path": "0001000100020001", "has_unpublished_changes": false, "show_in_menus": false, "pk": 14, "content_type": 31, "live_revision": null, "title": "The Project", "owner": 2, "search_description": ""}	\N	14	2
12	f	2019-01-10 13:07:07.370063+00	{"draft_title": "Papers", "last_published_at": null, "url_path": "/home/groups/papers/", "numchild": 0, "seo_title": "", "first_published_at": null, "go_live_at": null, "slug": "papers", "expired": false, "depth": 4, "locked": false, "expire_at": null, "body": "<p></p>", "live": true, "latest_revision_created_at": null, "path": "0001000100010002", "has_unpublished_changes": false, "show_in_menus": false, "pk": 11, "content_type": 31, "live_revision": null, "title": "Papers", "owner": 2, "search_description": ""}	\N	11	2
83	f	2019-01-21 15:19:25.290395+00	{"locked": false, "title": "Frequently Asked Questions", "draft_title": "Frequently Asked Questions", "has_unpublished_changes": true, "first_published_at": "2019-01-11T14:26:12.271Z", "depth": 4, "expired": false, "last_published_at": "2019-01-11T14:26:54.974Z", "live": true, "content_type": 31, "slug": "faq", "latest_revision_created_at": "2019-01-18T12:32:30.291Z", "show_in_menus": true, "numchild": 0, "expire_at": null, "path": "0001000200020003", "seo_title": "", "live_revision": 51, "url_path": "/home2/about/faq/", "owner": 2, "search_description": "", "pk": 25, "body": "<p>Endemic livestock disease is not something all of us have to think about on a daily basis. We&#x27;ve therefore put together a list of questions to give you some more information about these, and the project more generally.</p><p>Have a question which is not answered in the FAQs below? Please <a id=\\"8\\" linktype=\\"page\\">contact us</a> and we will answer it!</p><p></p><hr/><p></p><h4>What are endemic diseases?</h4><p>Endemic diseases exist permanently in a population or region, such as the cold virus in humans. They differ from more exotic invasive diseases, such as avian influenza, which typically occur from infections brought in from off the farm and are not usually present. Eradication of some of these disease is possible, although this can be very resource and time consuming.</p><p></p><hr/><p></p><h4>Why are endemic livestock diseases important?</h4><p>Endemic livestock diseases are important from a number of perspectives. If an animal is sick, then it has implications for the animals\\u2019 wellbeing and welfare. When an animal is ill, they also become less productive, such as by having slower growth or reduced milk yields, which can affect producer profits. Sick animals also need medical treatment, including from antibiotics to fight bacterial infections. Reducing the amount of endemic diseases present will result in animals needing less treatment, resulting in the reduced use of antibiotics and other medicines.</p><p></p><hr/><p></p><h4>Why do animals get these diseases?</h4><p>Like for humans, there are many diseases that animals can catch (think of colds, stomach bugs and viruses) that are easily spread, and almost impossible to get rid of. Endemic diseases are described as multifactorial, meaning that they occur due to a number of different factors. Livestock can pick up these diseases from other animals on the farm (both farm and wild animals), off neighbouring farms, or from people and equipment that come onto the farm which may be contaminated. Weather conditions can also affect disease spread, as can an animal\\u2019s genetics.</p><p></p><hr/><p></p><h4>What impact do they have?</h4><p>As well as making animals ill (so affecting their health and welfare), they can impact on their productivity, and so can have severe economic implications.</p><p></p><hr/><p></p><h4>Why BVD and lameness?</h4><p>Bovine viral diarrhoea (BVD) and lameness are two of the most prevalent diseases in cattle and sheep in the UK today. They also have different management practices and different symptoms and can be spread in different ways. This allows us to compare and contrast across two very different diseases, which will give us more learning&#x27;s for endemic diseases in general.</p><p></p><hr/><p></p><h4>Will these diseases affect the animal products that I eat?</h4><p>No, they won\\u2019t. These diseases are not zoonotic, i.e. cannot be transferred to humans, and so do not have implications for food safety. In addition, any animals treated with medicines have to follow strict regulations in relation to how long they must be free of medicines before they can enter the human food chain, to ensure that no residues are present in the food we eat.</p><p>Any concerns related to human health are to do with antimicrobial resistance (AMR). As for humans, AMR is a growing concern for animals, and so a reduction in antibiotic use is encouraged. Farmers and veterinarians both follow <a href=\\"https://www.ruma.org.uk/\\">RUMA</a> guidelines, which encourages the more responsible use of antibiotics, which are only used as and when an animal has a disease. If we can reduce the number of animals having a disease, we can reduce the amount of antibiotics used, which has benefits for humans and animals.</p><p></p><hr/><p></p><h4>Are these diseases specific to different types of animal production system?</h4><p>Given the range of different factors linked to endemic diseases, they can occur in any type of animal production system e.g. indoor, free range, organic etc. Some diseases are more common in intensive systems, whereas others are more common in outdoor systems due to greater exposure to the environment and wild animals and micro-organisms which may transmit disease.</p><p></p><hr/><p></p><h4>Why do we still have these diseases?</h4><p>Although the practices and treatments for these diseases exist, there can be barriers to using these in farming practice for a number of different reasons, including the number of different factors known to cause these diseases. Also, given that a number of these diseases are influenced by the environmental factors, including the weather, they can be very difficult to control</p><p>FIELD looks to explore why these diseases are still present and what can further be done to enable better control and a reduction in these.</p><p></p><hr/><p></p><h4>What do these diseases mean for animal welfare?</h4><p>As for humans, when an animal is sick it affects their well-being, either through feeling generally unwell or being in pain from the infection that they have. Animals who are sick are treated according to the illness they have, which may include antibiotics to treat bacterial infections, pain killers and anti-inflammatory medicines.</p><p></p><hr/><p></p><h4>Does Brexit affect this at all?</h4><p>It is not known how Brexit may affect these diseases, but any implications are likely to be due to regulation and trade. The UK is world renowned for its high standards of welfare, which are currently higher than EU minimum regulations. This is likely to continue post-Brexit and so animals well-being (including fast and effective treatment of diseases should they arise) is likely to continue.</p><p></p><hr/><p></p><h4>How is FIELD different to other projects?</h4><p>People is an often overlooked element in livestock disease management and research. The FIELD team is bringing together a range of different expertise to counteract this. Find out more <a id=\\"14\\" linktype=\\"page\\">about the project</a> to get further details of how we plan to do this.</p><p></p><hr/><p></p><h4>What is FIELD going to do?</h4><p>The FIELD project Work to develop better predictive models, as well as provide recommendations for policy and practice based on the interactions we have we our research participants and stakeholders involved in the project.</p><p></p><hr/><p></p><h4>Can I get involved in the FIELD project?</h4><p>The FIELD team would love to hear from you! We would love to hear your questions, opinions, perspectives and experiences, be that as a member of the public, farmer or farm adviser. Visit our<a id=\\"8\\" linktype=\\"page\\"> contact us</a> page to find out how to reach the team.</p><p></p>", "go_live_at": null}	\N	25	2
114	f	2019-01-25 12:46:59.384321+00	{"go_live_at": null, "search_description": "", "slug": "focus-farming", "depth": 4, "show_in_menus": false, "expired": false, "url_path": "/home2/groups/focus-farming/", "numchild": 1, "first_published_at": "2019-01-11T11:59:31.921Z", "has_unpublished_changes": false, "last_published_at": "2019-01-23T10:29:48.986Z", "title": "Focus on Farming", "expire_at": null, "draft_title": "Focus on Farming", "path": "0001000200030002", "live_revision": 110, "content_type": 31, "owner": 2, "pk": 19, "seo_title": "", "locked": false, "live": true, "body": "<p></p><p>[Timeline]</p><h2><a id=\\"8\\" linktype=\\"page\\">Contact Us</a></h2>", "latest_revision_created_at": "2019-01-23T10:29:48.966Z"}	\N	19	6
13	f	2019-01-10 13:07:42.676534+00	{"draft_title": "Timeline", "last_published_at": null, "url_path": "/home/groups/focus-research/timeline/", "numchild": 0, "seo_title": "", "first_published_at": null, "go_live_at": null, "slug": "timeline", "expired": false, "depth": 5, "locked": false, "expire_at": null, "body": "<p></p>", "live": true, "latest_revision_created_at": null, "path": "00010001000100010002", "has_unpublished_changes": false, "show_in_menus": false, "pk": 12, "content_type": 31, "live_revision": null, "title": "Timeline", "owner": 2, "search_description": ""}	\N	12	2
11	f	2019-01-10 13:06:51.885438+00	{"draft_title": "Focus on Research", "last_published_at": null, "url_path": "/home/groups/focus-research/", "numchild": 0, "seo_title": "", "first_published_at": null, "go_live_at": null, "slug": "focus-research", "expired": false, "depth": 4, "locked": false, "expire_at": null, "body": "<p></p>", "live": true, "latest_revision_created_at": null, "path": "0001000100010001", "has_unpublished_changes": false, "show_in_menus": false, "pk": 10, "content_type": 31, "live_revision": null, "title": "Focus on Research", "owner": 2, "search_description": ""}	\N	10	2
156	f	2019-02-01 14:25:19.443405+00	{"first_published_at": "2019-01-25T13:14:41.558Z", "url_path": "/home2/about/meetteam/", "expire_at": null, "path": "0001000200020005", "numchild": 2, "show_in_menus": false, "pk": 36, "has_unpublished_changes": false, "live_revision": 151, "expired": false, "locked": false, "body": "<p>The FIELD team is composed of a number of different research disciplines. The team will be supported throughout the project by a range of different industry and professional stakeholders who will provide their expertise and input to help shape the project and ensure its relevance.</p><p>Find out more about the different <a id=\\"15\\" linktype=\\"page\\">team members</a> and <a id=\\"35\\" linktype=\\"page\\">stakeholders.</a></p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-02-01T09:59:38.379Z", "depth": 4, "draft_title": "Meet the team", "live": true, "latest_revision_created_at": "2019-02-01T09:59:38.355Z", "owner": 4, "slug": "meetteam", "search_description": "", "content_type": 31, "title": "Meet the team"}	\N	36	6
17	f	2019-01-10 13:16:11.615322+00	{"draft_title": "Test post 2", "last_published_at": null, "url_path": "/home/blog-news/test-post-2/", "numchild": 0, "seo_title": "", "related_entrypage_from": [], "date": "2019-01-10T13:12:00Z", "related_entrypage_to": [], "first_published_at": null, "go_live_at": null, "header_image": 1, "slug": "test-post-2", "expired": false, "excerpt": "<p>Excerpt text here</p>", "depth": 4, "locked": false, "expire_at": null, "body": "<p>Body text here</p>", "live": true, "latest_revision_created_at": null, "path": "0001000100040002", "has_unpublished_changes": false, "show_in_menus": false, "num_comments": 0, "pk": 16, "content_type": 37, "entry_tags": [], "live_revision": null, "entry_categories": [], "title": "Test post 2", "owner": 2, "search_description": ""}	\N	16	2
27	f	2019-01-11 02:31:39.125133+00	{"date": "2019-01-09T16:04:00Z", "show_in_menus": false, "related_entrypage_from": [], "related_entrypage_to": [], "live": true, "numchild": 0, "title": "Test Post", "expire_at": null, "slug": "test-post", "entry_categories": [], "header_image": 1, "body": "<p>The content of my first blog post</p>", "expired": false, "locked": false, "first_published_at": "2019-01-09T16:05:05.748Z", "go_live_at": null, "depth": 4, "draft_title": "Test Post", "content_type": 37, "num_comments": 0, "has_unpublished_changes": false, "latest_revision_created_at": "2019-01-09T16:05:05.728Z", "entry_tags": [], "search_description": "", "last_published_at": "2019-01-09T16:05:05.748Z", "url_path": "/home2/blog-news/test-post/", "seo_title": "", "excerpt": "<p></p>", "live_revision": 5, "path": "0001000200040001", "pk": 5, "owner": 1}	\N	5	1
16	f	2019-01-10 13:08:57.00655+00	{"draft_title": "Meet the team", "last_published_at": null, "url_path": "/home/about/meet-team/", "numchild": 0, "seo_title": "", "first_published_at": null, "go_live_at": null, "slug": "meet-team", "expired": false, "depth": 4, "locked": false, "expire_at": null, "body": "<p></p>", "live": true, "latest_revision_created_at": null, "path": "0001000100020002", "has_unpublished_changes": false, "show_in_menus": false, "pk": 15, "content_type": 31, "live_revision": null, "title": "Meet the team", "owner": 2, "search_description": ""}	\N	15	2
84	f	2019-01-21 15:19:31.121615+00	{"locked": false, "title": "Meet the team", "draft_title": "Meet the team", "has_unpublished_changes": true, "first_published_at": "2019-01-10T13:08:57.025Z", "depth": 4, "expired": false, "last_published_at": "2019-01-11T02:32:53.625Z", "live": true, "content_type": 31, "slug": "meet-team", "latest_revision_created_at": "2019-01-17T12:16:28.940Z", "show_in_menus": true, "numchild": 0, "expire_at": null, "path": "0001000200020002", "seo_title": "", "live_revision": 30, "url_path": "/home2/about/meet-team/", "owner": 2, "search_description": "", "pk": 15, "body": "<h3>Prof Abigail Woods</h3><h4>King&#x27;s College London<br/>History</h4><p>Abigail Woods is Head of the Department of History, and <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Professor in the History of Human and</a> <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Animal Health at King&#x27;s College London.</a> Reflecting her earlier career as a veterinary surgeon, her research focuses on the history of animal health in 19th and 20th century Britain, and its intersections with the histories of human health and<br/> livestock production. Recent research has explored the history of veterinary expertise, policy and practice; the changing concepts of animal health, welfare and productivity; and how patterns and perceptions of livestock disease have changed over time. As leader of the FIELD project, she is developing the first social histories of BVD and cattle lameness, and bringing them into dialogue with contemporary scientific and social scientific perspectives.</p><p></p><hr/><p></p><h3>Nicole Gosling</h3><h4>King&#x27;s College London<br/>History</h4><p>Nicole Gosling is a PhD student at King\\u2019s College in London and will be writing her dissertation as a contribution to the FIELD project. She studied her BSc in Ecology at the University of Victoria, and recently completed an MA in Environmental History at Uppsala University. Broadly speaking, Nicole\\u2019s interests include how humans interact with nature, with a focus on human-animal relationships. She explored these relationships in her master\\u2019s thesis \\u2018Making Sense of Cattle: A story from farm to food\\u2019 whereshe looked at how different actors experience cattle bodies during the production of beef. Building on this line of thinking, Nicole\\u2019s role in the FIELD project will be focused on the history of lameness in sheep.</p><p></p><hr/><p></p><h3>Prof Karen Sayer</h3><h4>Leeds Trinity University<br/>Social Science</h4><p>Awaiting text.</p><p></p><hr/><p></p><h3>Dr James Bowen</h3><h4>Leeds Trinity University<br/>History</h4><p>James P. Bowen is a Post-Doctoral Research Associate in History based at Leeds Trinity University with research interests in agricultural and rural history. He was formerly a Research Associate (Victoria County History-Cumbria Project)in the Department of History, Lancaster University and was the Contributing Editor for The Herefordshire Victoria County History Trust Short on the parish of Colwall. He was formerly a Post-Doctoral Research Associate based at the Department of Geography and Planning, University of Liverpool employed on \\u2018Spaces of experience and horizons of expectation: the implications of extreme weather events, past, present and future\\u2019, a three-year project, funded as part of the Care for the Future programme of the Arts and Humanities Research Council.He completed a PhD at Lancaster University supervised by Professor A.J.L. Winchester and held the Economic History Society\\u2019s Tawney Junior Research Fellowship in 2012-13 at the Institute of Historical Research, London.</p><p></p><hr/><p></p><h3>Dr Amy Proctor</h3><h4>Newcastle University<br/>History</h4><p>Amy Proctor is based at the Centre for Rural Economy at Newcastle University. She is interested in agricultural extension and processes of expertise exchange within rural land management and has published widely on this. Her research has focused on the knowledge-practices of farmers and their advisers and the performance and practice of the advisory encounter. Amy is also interested in developing innovative and interactive ways of engaging with stakeholders and has co-led landbridge, a national knowledge exchange network for rural professionals which provides a platform for inter-professional learning and debate among farm advisors and opportunities for exchange with research communities. In FIELD, Amy will develop and conduct the social science aspects of the project including in-depth interviews and ethnographic research with farmers and advisers and focus groups with farmers and consumers.</p><p></p><hr/><p></p><h3>Sue Bradley</h3><h4>Newcastle University<br/>History</h4><p>Sue Bradley is an oral historian in the Centre for Rural Economy, Newcastle University, where her research has ranged from flood risk to honey bee health and veterinary practice. She is interested in how oral history can help to address current concerns, and in using audio testimonies from older practitioners as a basis for discussions with their counterparts today. Her work for FIELD includes recording a collection of life-story interviews that will contribute insights from first-hand accounts of working with cattle and sheep in the north of England since the 1940s. This collection will be archived at the Museum for English Rural Life to serve beyond the project as a permanent public research resource. Sue also works part-time in <a href=\\"https://research.ncl.ac.uk/oralhistory/\\">Newcastle University\\u2019s Oral History Unit</a>. Before coming to Newcastle she was responsible for creating the British Library\\u2019s Book Trade Lives collection of recordings with booksellers and publishers.</p><p></p><hr/><p></p><h3>Dr Beth Clark</h3><h4>Newcastle University<br/>History</h4><p>Beth\\u2019s research background in sports, exercise and nutrition and food marketing reflects her research interests in food and communication. She is particularly interested in exploring how people relate to animal products and different food production practices, such as motivations for food choice, innovation and technology in production, knowledge of food production practices, and food cultures. Through this she works with a range of stakeholders from across the food supply chain, which has fueled an interest in communication, including how individuals and groups share information and trust different information sources.She has two roles on the FIELD project. The first is part of the social science research team, involving interviews, focus groups and observations with farmers, farming advisors and the public, to explore their different experiences and perceptions of endemic livestock disease. The second role focuses on public engagement, including the online communications and website for FIELD, as well as identifying and organising opportunities for greater interaction with the projects many stakeholders, including members of the farming community and the public. Beth&#x27;s homepage can be found <a href=\\"https://www.ncl.ac.uk/nes/staff/profile/bethclark.html#background\\">here</a>, and her Twitter handle is @bethy_clark</p><p></p><hr/><p></p><h3>Dr Ewan Coleman</h3><h4>University of Edinburgh<br/>Epidemiology &amp; Economics</h4><p>Ewan Colman is a post-doctoral research associate at the Roslin Institute at the University of Edinburgh. He has a background in mathematics, particularly in applied probability, data science, and network science. His research uses computational modelling to explore the relationship between behaviour and the spread of infectious disease. Ewan&#x27;s past interests include the dynamics of conversations on social media, the social and spatial organization of ant colonies, and the how the ever-increasing amount of public health data can be exploited to detect and mitigate epidemic diseases. As a member of the FIELD project, he will focus on the spread of BVD through cattle trade, and how changing attitudes towards biosecurity can reduce the prevalence of BVD on a national scale.</p><p></p><hr/><p></p><h3>Prof Rowland Kao</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Awaiting text</p><p></p><hr/><p></p><h3>Maria Suella Rodrigues</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Maria Suella Rodrigues is a doctoral candidate at the University of Glasgow, supervised under Professor Nicholas Hanley (MVLS), Dr. Souvik Datta (ASBS) at the University of Glasgow and Professor Rowland Kao from the University of Edinburgh. Maria holds a BSc degree in Economics from Lancaster University. Following that she moved to the University of Glasgow where she pursued the MRes in Economics, graduating in 2018. She is interested in investigating research questions in the areas of agricultural and environmental economics as well as applied micro-econometrics and choice-modelling theory. During her MRes dissertation she modelled consumer preferences for forest disease management with use of Choice modelling data. Additionally, she has received extensive training in choice-modelling from the Choice Modelling Centre, University of Leeds. As part of the FIELD project, Maria will design field experiments and model both farmer and consumer preferences in relation to farm animal welfare. Maria&#x27;s LinkedIn can be found <a href=\\"https://www.linkedin.com/in/mariasuellarodrigues-a2765311/\\">here</a>, and her Twitter handle is @jammar90</p><p></p><hr/><p></p><h3>Dr Lewis Holloway</h3><h4>University of Hull<br/>Social Science</h4><p><a href=\\"https://www.hull.ac.uk/faculties/staff-profiles/lewis-holloway.aspx\\">Lewis Holloway</a> is a Reader in Human Geography at the University of Hull. He has research interests in food, farming and the countryside, and has a particular interest in farm animals and agricultural technologies. Recent research has focused on the ways in which genetic, information and robotic technologies have affected livestock farming, and has involved in-depth research with farmers and technology developers to understand how new technologies are engaged with, adopted and contested by farmers. Lewis is interested in the situated ethics associated with animal agriculture, and in how technologies can transform farming ethics and knowledge-practices. Lewis will be involved in developing and conducting the social scientific elements of the FIELD project. This will include on-farm interview and observational work with farmers, farm animals and expert advisors, and focus groups with farmers and public groups.</p><p></p><hr/><p></p><h3>Dr Niamh Mahon</h3><h4>University of Hull<br/>Social Science</h4><p><a href=\\"https://www.researchgate.net/profile/Niamh_Mahon\\">Niamh</a> is a Post-Doctoral Research Associate at the University of Hull. In this role she is involved in the social science components of the FIELD project. This includes in-depth interviews and observational work with farmers and expert advisors, and focus groups with farmers and the public, conducted to explore their different experiences and perceptions of endemic livestock disease.Prior to this Niamh under took a PhD at Nottingham Trent University developing stakeholder-sensitive indicators of the Sustainable Intensification of UK agriculture and a Master\\u2019s degree from the University of East Anglia in Sustainable Agriculture and Food Security. She has also worked as a research assistant in socio-economics and policy for the Organic Research Centre. Niamh is a member of the Food and Climate Research Network and the Sustainable Intensification Research Network.</p><p></p><hr/><p></p><h3>Prof Nick Hanley</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Nick Hanley is a Professor of Environmental and One Health Economics at the University of Glasgow. His PhD was in Agricultural Economics. His current main research interests include behavioural economics, the design of Payment for Ecosystem Service schemes, environmental valuation,one health economics, the economics of sustainable development, markets for biodiversity offsets,and the economics of invasive species.He is an honorary professor at the universities of St Andrews and Stirling. Nick is co-author of a textbook in environmental cost-benefit analysis with Edward Barbier; and two textbooks on environmental economics (with Jason Shogren and Ben White).</p><p></p>", "go_live_at": null}	\N	15	2
135	f	2019-01-29 17:04:40.901267+00	{"depth": 4, "seo_title": "", "live": true, "title": "Frequently Asked Questions", "body": "<p>Endemic livestock disease is not something all of us have to think about on a daily basis. We&#x27;ve therefore put together a list of questions to give you some more information about these, and the project more generally.</p><p>Have a question which is not answered in the FAQs below? Please <a id=\\"8\\" linktype=\\"page\\">contact us</a> and we will answer it!</p><p></p><p></p><p></p><hr/><p></p><hr/><p></p><h4>What are endemic diseases?</h4><p>Endemic diseases exist permanently in a population or region, such as the cold virus in humans. They differ from more exotic invasive diseases, such as avian influenza, which typically occur from infections brought in from off the farm and are not usually present. Eradication of some of these disease is possible, although this can be very resource and time consuming.</p><p></p><hr/><p></p><h4>Why are endemic livestock diseases important?</h4><p>Endemic livestock diseases are important from a number of perspectives. If an animal is sick, then it has implications for the animals\\u2019 wellbeing and welfare. When an animal is ill, they also become less productive, such as by having slower growth or reduced milk yields, which can affect producer profits. Sick animals also need medical treatment, including from antibiotics to fight bacterial infections. Reducing the amount of endemic diseases present will result in animals needing less treatment, resulting in the reduced use of antibiotics and other medicines.</p><p></p><hr/><p></p><h4>Why do animals get these diseases?</h4><p>Like for humans, there are many diseases that animals can catch (think of colds, stomach bugs and viruses) that are easily spread, and almost impossible to get rid of. For animals, we describe these as endemic diseases. Endemic diseases are described as multifactorial, meaning that they occur due to a number of different factors. Livestock can pick up these diseases from other animals on the farm (both farm and wild animals), off neighbouring farms, or from people and equipment that come onto the farm which may be carrying germs. Weather conditions can also affect disease spread, as can an animal\\u2019s genetics.</p><p></p><hr/><p></p><h4>What impact do they have?</h4><p>As well as making animals ill (so affecting their health and welfare), they can impact on their productivity, and so can have severe economic implications.</p><p></p><hr/><p></p><h4>Why BVD and lameness?</h4><p>Bovine viral diarrhoea (BVD) and lameness are two of the most prevalent diseases in cattle and sheep in the UK today. They also have different management practices and different symptoms and can be spread in different ways. This allows us to compare and contrast across two very different diseases, which will give us more learning&#x27;s for endemic diseases in general.</p><p></p><hr/><h4></h4><h4>What is lameness? </h4><p></p><hr/><p></p><h4>What is BVD?</h4><p></p><hr/><p></p><h4>Will these diseases affect the animal products that I eat?</h4><p>No, they won\\u2019t. These diseases are not zoonotic, i.e. cannot be transferred to humans, and so do not have implications for food safety or human health. In addition, any sick animals treated with medicines have to follow strict regulations in relation to how long they must be free of medicines before they can enter the human food chain, to ensure that no residues are present in the food we eat.</p><p>Any concerns related to human health are to do with antimicrobial resistance (AMR). As for humans, AMR is a growing concern for animals, and so a reduction in antibiotic use is encouraged. Farmers and veterinarians both follow <a href=\\"https://www.ruma.org.uk/\\">RUMA</a> guidelines, which encourage the more responsible use of antibiotics, which are used only as and when an animal has a disease. If we can reduce the number of animals having a disease, we can reduce the amount of antibiotics used, which has benefits for humans and animals.</p><p></p><hr/><p></p><h4>Are these diseases specific to different types of animal production system?</h4><p>Given the range of different factors linked to endemic diseases, they can occur in any type of animal production system e.g. indoor, free range, organic etc. Some diseases are more common in intensive systems, whereas others are more common in outdoor systems due to greater exposure to the environment and wild animals and micro-organisms which may transmit disease.</p><p></p><hr/><p></p><h4>Why do we still have these diseases?</h4><p>Although the practices and treatments for these diseases exist, there can be barriers to using these in farming practice for a number of different reasons, including various factors known to cause these diseases. Also, given that a number of these diseases are influenced by the environmental factors, including the weather, they can be very difficult to control.</p><p>FIELD looks to explore why these diseases are still present and what can further be done to enable better control and a reduction in these.</p><p></p><hr/><p></p><h4>What do these diseases mean for animal welfare?</h4><p>As for humans, when an animal is sick it affects their well-being, either through feeling generally unwell or being in pain from the infection that they have. Animals who are sick are treated according to the illness they have, which may include antibiotics to treat bacterial infections, pain killers and anti-inflammatory medicines.</p><p></p><hr/><p></p><h4>Does Brexit affect this at all?</h4><p>It is not known how Brexit may affect these diseases, but any implications are likely to be due to regulation and trade. The UK is world-renowned for its high standards of welfare, which are currently higher than EU minimum regulations. This is likely to continue post-Brexit and so animals&#x27; well-being (including fast and effective treatment of diseases should they arise) is likely to continue to be protected.</p><p></p><hr/><p></p><h4>How is FIELD different to other projects?</h4><p>The influence of people is an often overlooked element in livestock disease management and research. The FIELD team is bringing together a range of different expertise to counteract this. Find out more <a id=\\"14\\" linktype=\\"page\\">about the project</a> to get further details of how we plan to do this.</p><p></p><hr/><p></p><h4>What is FIELD going to do?</h4><p>The FIELD project will work to develop better predictive models, as well as to provide recommendations for policy and practice based on the interactions we have with our research participants and stakeholders involved in the project.</p><p></p><hr/><p></p><h4>Can I get involved in the FIELD project?</h4><p>The FIELD team would love to hear from you! We look forward to hearing your questions, opinions, perspectives and experiences, be that as a member of the public, farmer or farm adviser. Visit our<a id=\\"8\\" linktype=\\"page\\"> contact us</a> page to find out how to reach the team.</p><p></p>", "draft_title": "Frequently Asked Questions", "owner": 2, "expired": false, "live_revision": 120, "url_path": "/home2/about/faq/", "content_type": 31, "locked": false, "go_live_at": null, "first_published_at": "2019-01-11T14:26:12.271Z", "path": "0001000200020003", "slug": "faq", "last_published_at": "2019-01-25T13:14:34.579Z", "has_unpublished_changes": true, "expire_at": null, "pk": 25, "latest_revision_created_at": "2019-01-29T17:00:38.082Z", "search_description": "", "numchild": 0, "show_in_menus": true}	\N	25	4
4	f	2019-01-09 02:25:46.279273+00	{"show_in_menus": true, "path": "000100010002", "last_published_at": null, "go_live_at": null, "depth": 3, "expire_at": null, "live": true, "title": "About", "url_path": "/home/about/", "search_description": "", "locked": false, "latest_revision_created_at": null, "has_unpublished_changes": false, "expired": false, "slug": "about", "draft_title": "About", "content_type": 31, "pk": 4, "numchild": 0, "owner": 1, "first_published_at": null, "seo_title": "", "body": "<p>About page...</p>", "live_revision": null}	\N	4	1
85	f	2019-01-21 15:19:40.802244+00	{"locked": false, "title": "About", "draft_title": "About", "has_unpublished_changes": true, "first_published_at": "2019-01-09T02:25:46.296Z", "depth": 3, "expired": false, "last_published_at": "2019-01-09T02:25:46.296Z", "live": true, "content_type": 31, "slug": "about", "latest_revision_created_at": "2019-01-18T13:22:04.322Z", "show_in_menus": true, "numchild": 3, "expire_at": null, "path": "000100020002", "seo_title": "", "live_revision": 4, "url_path": "/home2/about/", "owner": 1, "search_description": "", "pk": 4, "body": "<p>The FIELD project breaks new ground in its truly interdisciplinary approach to exploring livestock disease. Find out more about the project, the methods being used, and the team who will be behind the research being conducted.</p>", "go_live_at": null}	\N	4	2
78	f	2019-01-18 13:22:04.32221+00	{"locked": false, "title": "About", "draft_title": "About", "has_unpublished_changes": true, "first_published_at": "2019-01-09T02:25:46.296Z", "depth": 3, "expired": false, "last_published_at": "2019-01-09T02:25:46.296Z", "live": true, "content_type": 31, "slug": "about", "latest_revision_created_at": "2019-01-18T13:20:28.909Z", "show_in_menus": true, "numchild": 3, "expire_at": null, "path": "000100020002", "seo_title": "", "live_revision": 4, "url_path": "/home2/about/", "owner": 1, "search_description": "", "pk": 4, "body": "<p>The FIELD project breaks new ground in its truly interdisciplinary approach to exploring livestock disease. Find out more about the project, the methods being used, and the team who will be behind the research being conducted.</p>", "go_live_at": null}	\N	4	4
77	f	2019-01-18 13:20:28.909061+00	{"locked": false, "title": "About", "draft_title": "About", "has_unpublished_changes": false, "first_published_at": "2019-01-09T02:25:46.296Z", "depth": 3, "expired": false, "last_published_at": "2019-01-09T02:25:46.296Z", "live": true, "content_type": 31, "slug": "about", "latest_revision_created_at": "2019-01-09T02:25:46.279Z", "show_in_menus": true, "numchild": 3, "expire_at": null, "path": "000100020002", "seo_title": "", "live_revision": 4, "url_path": "/home2/about/", "owner": 1, "search_description": "", "pk": 4, "body": "<p>The FIELD project breaks new ground in its truly interdisciplinary approach to exploring livestock disease. Find out more about the project, the methods being used, and the team who will be behind the research being conducted.</p>", "go_live_at": null}	\N	4	4
133	f	2019-01-29 16:59:39.258329+00	{"depth": 4, "seo_title": "", "live": true, "title": "Frequently Asked Questions", "body": "<p>Endemic livestock disease is not something all of us have to think about on a daily basis. We&#x27;ve therefore put together a list of questions to give you some more information about these, and the project more generally.</p><p>Have a question which is not answered in the FAQs below? Please <a id=\\"8\\" linktype=\\"page\\">contact us</a> and we will answer it!</p><p></p><p></p><p></p><hr/><p></p><hr/><p></p><h4>What are endemic diseases?</h4><p>Endemic diseases exist permanently in a population or region, such as the cold virus in humans. They differ from more exotic invasive diseases, such as avian influenza, which typically occur from infections brought in from off the farm and are not usually present. Eradication of some of these disease is possible, although this can be very resource and time consuming.</p><p></p><hr/><p></p><h4>Why are endemic livestock diseases important?</h4><p>Endemic livestock diseases are important from a number of perspectives. If an animal is sick, then it has implications for the animals\\u2019 wellbeing and welfare. When an animal is ill, they also become less productive, such as by having slower growth or reduced milk yields, which can affect producer profits. Sick animals also need medical treatment, including from antibiotics to fight bacterial infections. Reducing the amount of endemic diseases present will result in animals needing less treatment, resulting in the reduced use of antibiotics and other medicines.</p><p></p><hr/><p></p><h4>Why do animals get these diseases?</h4><p>Like for humans, there are many diseases that animals can catch (think of colds, stomach bugs and viruses) that are easily spread, and almost impossible to get rid of. Endemic diseases are described as multifactorial, meaning that they occur due to a number of different factors. Livestock can pick up these diseases from other animals on the farm (both farm and wild animals), off neighbouring farms, or from people and equipment that come onto the farm which may be contaminated. Weather conditions can also affect disease spread, as can an animal\\u2019s genetics.</p><p></p><hr/><p></p><h4>What impact do they have?</h4><p>As well as making animals ill (so affecting their health and welfare), they can impact on their productivity, and so can have severe economic implications.</p><p></p><hr/><p></p><h4>Why BVD and lameness?</h4><p>Bovine viral diarrhoea (BVD) and lameness are two of the most prevalent diseases in cattle and sheep in the UK today. They also have different management practices and different symptoms and can be spread in different ways. This allows us to compare and contrast across two very different diseases, which will give us more learning&#x27;s for endemic diseases in general.</p><p></p><hr/><p></p><h4>Will these diseases affect the animal products that I eat?</h4><p>No, they won\\u2019t. These diseases are not zoonotic, i.e. cannot be transferred to humans, and so do not have implications for food safety. In addition, any animals treated with medicines have to follow strict regulations in relation to how long they must be free of medicines before they can enter the human food chain, to ensure that no residues are present in the food we eat.</p><p>Any concerns related to human health are to do with antimicrobial resistance (AMR). As for humans, AMR is a growing concern for animals, and so a reduction in antibiotic use is encouraged. Farmers and veterinarians both follow <a href=\\"https://www.ruma.org.uk/\\">RUMA</a> guidelines, which encourage the more responsible use of antibiotics, used only as and when an animal has a disease. If we can reduce the number of animals having a disease, we can reduce the amount of antibiotics used, which has benefits for humans and animals.</p><p></p><hr/><p></p><h4>Are these diseases specific to different types of animal production system?</h4><p>Given the range of different factors linked to endemic diseases, they can occur in any type of animal production system e.g. indoor, free range, organic etc. Some diseases are more common in intensive systems, whereas others are more common in outdoor systems due to greater exposure to the environment and wild animals and micro-organisms which may transmit disease.</p><p></p><hr/><p></p><h4>Why do we still have these diseases?</h4><p>Although the practices and treatments for these diseases exist, there can be barriers to using these in farming practice for a number of different reasons, including various factors known to cause these diseases. Also, given that a number of these diseases are influenced by the environmental factors, including the weather, they can be very difficult to control.</p><p>FIELD looks to explore why these diseases are still present and what can further be done to enable better control and a reduction in these.</p><p></p><hr/><p></p><h4>What do these diseases mean for animal welfare?</h4><p>As for humans, when an animal is sick it affects their well-being, either through feeling generally unwell or being in pain from the infection that they have. Animals who are sick are treated according to the illness they have, which may include antibiotics to treat bacterial infections, pain killers and anti-inflammatory medicines.</p><p></p><hr/><p></p><h4>Does Brexit affect this at all?</h4><p>It is not known how Brexit may affect these diseases, but any implications are likely to be due to regulation and trade. The UK is world-renowned for its high standards of welfare, which are currently higher than EU minimum regulations. This is likely to continue post-Brexit and so animals&#x27; well-being (including fast and effective treatment of diseases should they arise) is likely to continue to be protected.</p><p></p><hr/><p></p><h4>How is FIELD different to other projects?</h4><p>The influence of people is an often overlooked element in livestock disease management and research. The FIELD team is bringing together a range of different expertise to counteract this. Find out more <a id=\\"14\\" linktype=\\"page\\">about the project</a> to get further details of how we plan to do this.</p><p></p><hr/><p></p><h4>What is FIELD going to do?</h4><p>The FIELD project will work to develop better predictive models, as well as to provide recommendations for policy and practice based on the interactions we have with our research participants and stakeholders involved in the project.</p><p></p><hr/><p></p><h4>Can I get involved in the FIELD project?</h4><p>The FIELD team would love to hear from you! We look forward to hearing your questions, opinions, perspectives and experiences, be that as a member of the public, farmer or farm adviser. Visit our<a id=\\"8\\" linktype=\\"page\\"> contact us</a> page to find out how to reach the team.</p><p></p>", "draft_title": "Frequently Asked Questions", "owner": 2, "expired": false, "live_revision": 120, "url_path": "/home2/about/faq/", "content_type": 31, "locked": false, "go_live_at": null, "first_published_at": "2019-01-11T14:26:12.271Z", "path": "0001000200020003", "slug": "faq", "last_published_at": "2019-01-25T13:14:34.579Z", "has_unpublished_changes": false, "expire_at": null, "pk": 25, "latest_revision_created_at": "2019-01-25T13:14:34.559Z", "search_description": "", "numchild": 0, "show_in_menus": true}	\N	25	4
167	f	2019-02-04 10:17:02.257776+00	{"first_published_at": null, "url_path": "/home2/resources/media/audio/", "expire_at": null, "path": "00010002000500020002", "numchild": 0, "show_in_menus": false, "pk": 31, "has_unpublished_changes": true, "live_revision": null, "expired": false, "locked": false, "body": "<p>Our oral historian <a id=\\"15\\" linktype=\\"page\\">Sue</a> has been working hard to bring you some snippets from the interviews she has been conducting for FIELD with farmers. Listen to first-hand accounts of farming in the clips below.</p>", "seo_title": "", "go_live_at": null, "last_published_at": null, "depth": 5, "draft_title": "Audio", "live": false, "latest_revision_created_at": "2019-01-18T13:09:15.992Z", "owner": 4, "slug": "audio", "search_description": "", "content_type": 31, "title": "Audio"}	\N	31	6
188	f	2019-02-18 14:09:04.495071+00	{"go_live_at": null, "seo_title": "", "title": "About", "last_published_at": "2019-01-21T15:19:40.823Z", "expire_at": null, "path": "000100020002", "expired": false, "slug": "about", "locked": false, "first_published_at": "2019-01-09T02:25:46.296Z", "depth": 3, "owner": 1, "body": "<p>The FIELD project breaks new ground in its truly interdisciplinary approach to exploring livestock disease. Find out more about <a id=\\"14\\" linktype=\\"page\\">the project,</a> the <a id=\\"24\\" linktype=\\"page\\">approach</a> and <a id=\\"27\\" linktype=\\"page\\">methods</a> being used, or <a id=\\"15\\" linktype=\\"page\\">the team</a> who will be behind the research being conducted.</p><p></p>", "pk": 4, "content_type": 31, "live_revision": 85, "latest_revision_created_at": "2019-01-22T12:18:40.232Z", "search_description": "", "live": true, "url_path": "/home2/about/", "draft_title": "About", "has_unpublished_changes": true, "numchild": 3, "show_in_menus": true}	\N	4	4
193	f	2019-02-21 10:45:22.29659+00	{"go_live_at": null, "seo_title": "", "title": "Policy and practice notes", "last_published_at": "2019-01-21T15:20:16.962Z", "expire_at": null, "path": "0001000200050003", "expired": false, "slug": "policy-and-practice-notes", "locked": false, "first_published_at": "2019-01-21T15:20:16.962Z", "depth": 4, "owner": 4, "body": "<p>Our policy and practice notes have been designed to provide short and insightful summaries into key findings from the project and what these could mean in terms of farming policy and practice. Click on each note below to read more.</p><p>Have any questions about these? Then <a id=\\"8\\" linktype=\\"page\\">contact us.</a></p>", "pk": 32, "content_type": 31, "live_revision": 89, "latest_revision_created_at": "2019-01-21T15:20:16.945Z", "search_description": "", "live": true, "url_path": "/home2/resources/policy-and-practice-notes/", "draft_title": "Policy and practice notes", "has_unpublished_changes": false, "numchild": 0, "show_in_menus": true}	\N	32	2
86	f	2019-01-21 15:19:48.455276+00	{"locked": false, "title": "Search", "draft_title": "Search", "has_unpublished_changes": true, "first_published_at": "2019-01-10T13:06:21.120Z", "depth": 3, "expired": false, "last_published_at": "2019-01-11T02:30:12.281Z", "live": true, "content_type": 31, "slug": "search", "latest_revision_created_at": "2019-01-18T13:19:22.737Z", "show_in_menus": true, "numchild": 0, "expire_at": null, "path": "000100020008", "seo_title": "", "live_revision": 23, "url_path": "/home2/search/", "owner": 2, "search_description": "", "pk": 9, "body": "<p>Want to find something specific on livestock health or farming, past or present? We\\u2019ve tagged all our posts and images to make them as easy for you to explore and find as possible. Use the search box below with keywords of interest to discover more</p>", "go_live_at": null}	\N	9	2
21	f	2019-01-11 01:18:30.226442+00	{"draft_title": "Home2", "last_published_at": null, "url_path": "/home2/", "numchild": 0, "seo_title": "", "first_published_at": null, "go_live_at": null, "slug": "home2", "expired": false, "depth": 2, "locked": false, "expire_at": null, "body": "", "live": true, "latest_revision_created_at": null, "path": "00010002", "has_unpublished_changes": false, "show_in_menus": true, "pk": 18, "content_type": 31, "live_revision": null, "title": "Home2", "owner": 1, "search_description": ""}	\N	18	1
76	f	2019-01-18 13:19:22.737117+00	{"locked": false, "title": "Search", "draft_title": "Search", "has_unpublished_changes": false, "first_published_at": "2019-01-10T13:06:21.120Z", "depth": 3, "expired": false, "last_published_at": "2019-01-11T02:30:12.281Z", "live": true, "content_type": 31, "slug": "search", "latest_revision_created_at": "2019-01-11T02:30:12.248Z", "show_in_menus": true, "numchild": 0, "expire_at": null, "path": "000100020008", "seo_title": "", "live_revision": 23, "url_path": "/home2/search/", "owner": 2, "search_description": "", "pk": 9, "body": "<p>Want to find something specific on livestock health or farming, past or present? We\\u2019ve tagged all our posts and images to make them as easy for you to explore and find as possible. Use the search box below with keywords of interest to discover more </p>", "go_live_at": null}	\N	9	4
134	f	2019-01-29 17:00:38.082318+00	{"depth": 4, "seo_title": "", "live": true, "title": "Frequently Asked Questions", "body": "<p>Endemic livestock disease is not something all of us have to think about on a daily basis. We&#x27;ve therefore put together a list of questions to give you some more information about these, and the project more generally.</p><p>Have a question which is not answered in the FAQs below? Please <a id=\\"8\\" linktype=\\"page\\">contact us</a> and we will answer it!</p><p></p><p></p><p></p><hr/><p></p><hr/><p></p><h4>What are endemic diseases?</h4><p>Endemic diseases exist permanently in a population or region, such as the cold virus in humans. They differ from more exotic invasive diseases, such as avian influenza, which typically occur from infections brought in from off the farm and are not usually present. Eradication of some of these disease is possible, although this can be very resource and time consuming.</p><p></p><hr/><p></p><h4>Why are endemic livestock diseases important?</h4><p>Endemic livestock diseases are important from a number of perspectives. If an animal is sick, then it has implications for the animals\\u2019 wellbeing and welfare. When an animal is ill, they also become less productive, such as by having slower growth or reduced milk yields, which can affect producer profits. Sick animals also need medical treatment, including from antibiotics to fight bacterial infections. Reducing the amount of endemic diseases present will result in animals needing less treatment, resulting in the reduced use of antibiotics and other medicines.</p><p></p><hr/><p></p><h4>Why do animals get these diseases?</h4><p>Like for humans, there are many diseases that animals can catch (think of colds, stomach bugs and viruses) that are easily spread, and almost impossible to get rid of. For animals, we describe these as endemic diseases. Endemic diseases are described as multifactorial, meaning that they occur due to a number of different factors. Livestock can pick up these diseases from other animals on the farm (both farm and wild animals), off neighbouring farms, or from people and equipment that come onto the farm which may be contaminated. Weather conditions can also affect disease spread, as can an animal\\u2019s genetics.</p><p></p><hr/><p></p><h4>What impact do they have?</h4><p>As well as making animals ill (so affecting their health and welfare), they can impact on their productivity, and so can have severe economic implications.</p><p></p><hr/><p></p><h4>Why BVD and lameness?</h4><p>Bovine viral diarrhoea (BVD) and lameness are two of the most prevalent diseases in cattle and sheep in the UK today. They also have different management practices and different symptoms and can be spread in different ways. This allows us to compare and contrast across two very different diseases, which will give us more learning&#x27;s for endemic diseases in general.</p><p></p><hr/><p></p><h4>Will these diseases affect the animal products that I eat?</h4><p>No, they won\\u2019t. These diseases are not zoonotic, i.e. cannot be transferred to humans, and so do not have implications for food safety. In addition, any animals treated with medicines have to follow strict regulations in relation to how long they must be free of medicines before they can enter the human food chain, to ensure that no residues are present in the food we eat.</p><p>Any concerns related to human health are to do with antimicrobial resistance (AMR). As for humans, AMR is a growing concern for animals, and so a reduction in antibiotic use is encouraged. Farmers and veterinarians both follow <a href=\\"https://www.ruma.org.uk/\\">RUMA</a> guidelines, which encourage the more responsible use of antibiotics, used only as and when an animal has a disease. If we can reduce the number of animals having a disease, we can reduce the amount of antibiotics used, which has benefits for humans and animals.</p><p></p><hr/><p></p><h4>Are these diseases specific to different types of animal production system?</h4><p>Given the range of different factors linked to endemic diseases, they can occur in any type of animal production system e.g. indoor, free range, organic etc. Some diseases are more common in intensive systems, whereas others are more common in outdoor systems due to greater exposure to the environment and wild animals and micro-organisms which may transmit disease.</p><p></p><hr/><p></p><h4>Why do we still have these diseases?</h4><p>Although the practices and treatments for these diseases exist, there can be barriers to using these in farming practice for a number of different reasons, including various factors known to cause these diseases. Also, given that a number of these diseases are influenced by the environmental factors, including the weather, they can be very difficult to control.</p><p>FIELD looks to explore why these diseases are still present and what can further be done to enable better control and a reduction in these.</p><p></p><hr/><p></p><h4>What do these diseases mean for animal welfare?</h4><p>As for humans, when an animal is sick it affects their well-being, either through feeling generally unwell or being in pain from the infection that they have. Animals who are sick are treated according to the illness they have, which may include antibiotics to treat bacterial infections, pain killers and anti-inflammatory medicines.</p><p></p><hr/><p></p><h4>Does Brexit affect this at all?</h4><p>It is not known how Brexit may affect these diseases, but any implications are likely to be due to regulation and trade. The UK is world-renowned for its high standards of welfare, which are currently higher than EU minimum regulations. This is likely to continue post-Brexit and so animals&#x27; well-being (including fast and effective treatment of diseases should they arise) is likely to continue to be protected.</p><p></p><hr/><p></p><h4>How is FIELD different to other projects?</h4><p>The influence of people is an often overlooked element in livestock disease management and research. The FIELD team is bringing together a range of different expertise to counteract this. Find out more <a id=\\"14\\" linktype=\\"page\\">about the project</a> to get further details of how we plan to do this.</p><p></p><hr/><p></p><h4>What is FIELD going to do?</h4><p>The FIELD project will work to develop better predictive models, as well as to provide recommendations for policy and practice based on the interactions we have with our research participants and stakeholders involved in the project.</p><p></p><hr/><p></p><h4>Can I get involved in the FIELD project?</h4><p>The FIELD team would love to hear from you! We look forward to hearing your questions, opinions, perspectives and experiences, be that as a member of the public, farmer or farm adviser. Visit our<a id=\\"8\\" linktype=\\"page\\"> contact us</a> page to find out how to reach the team.</p><p></p>", "draft_title": "Frequently Asked Questions", "owner": 2, "expired": false, "live_revision": 120, "url_path": "/home2/about/faq/", "content_type": 31, "locked": false, "go_live_at": null, "first_published_at": "2019-01-11T14:26:12.271Z", "path": "0001000200020003", "slug": "faq", "last_published_at": "2019-01-25T13:14:34.579Z", "has_unpublished_changes": true, "expire_at": null, "pk": 25, "latest_revision_created_at": "2019-01-29T16:59:39.258Z", "search_description": "", "numchild": 0, "show_in_menus": true}	\N	25	4
40	f	2019-01-11 12:02:14.048177+00	{"locked": false, "title": "Groups", "draft_title": "Groups", "has_unpublished_changes": false, "first_published_at": "2019-01-10T12:55:28.847Z", "depth": 3, "expired": false, "last_published_at": "2019-01-11T12:01:20.650Z", "live": true, "content_type": 31, "slug": "groups", "latest_revision_created_at": "2019-01-11T12:01:20.623Z", "show_in_menus": true, "numchild": 4, "expire_at": null, "path": "000100020002", "seo_title": "", "live_revision": 39, "url_path": "/home2/groups/", "owner": 2, "search_description": "", "pk": 6, "body": "<h2>Placeholder Header 2</h2><h3>Placeholder Header 3</h3><h4>Placeholder Header 4</h4><p>Placeholder normal text</p><ol><li>Numbered list 1</li><li>Numbered list 2</li></ol><ul><li>Bullet list 1</li><li>Bullet list 2</li></ul><blockquote>A quotation</blockquote><hr/><p>Horizontal line divider ^^^</p><p></p><p></p><p></p>", "go_live_at": null}	\N	6	2
168	f	2019-02-04 10:17:18.521871+00	{"first_published_at": null, "url_path": "/home2/resources/media/photos/", "expire_at": null, "path": "00010002000500020001", "numchild": 0, "show_in_menus": false, "pk": 30, "has_unpublished_changes": true, "live_revision": null, "expired": false, "locked": false, "body": "<p>We have the <a href=\\"https://merl.reading.ac.uk/\\">Museum of English Rural Life</a> to thank for digitising these fabulous photos of British agriculture from 1947 onwards. Scroll through our gallery to see how livestock production has changed over the decades, or use our <a id=\\"9\\" linktype=\\"page\\">search</a> function to look for something more specific.</p>", "seo_title": "", "go_live_at": null, "last_published_at": null, "depth": 5, "draft_title": "Photos", "live": false, "latest_revision_created_at": "2019-01-18T13:08:29.614Z", "owner": 4, "slug": "photos", "search_description": "", "content_type": 31, "title": "Photos"}	\N	30	6
89	f	2019-01-21 15:20:16.945441+00	{"locked": false, "title": "Policy and practice notes", "draft_title": "Policy and practice notes", "has_unpublished_changes": true, "first_published_at": null, "depth": 4, "expired": false, "last_published_at": null, "live": false, "content_type": 31, "slug": "policy-and-practice-notes", "latest_revision_created_at": "2019-01-18T13:10:11.509Z", "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "0001000200050003", "seo_title": "", "live_revision": null, "url_path": "/home2/resources/policy-and-practice-notes/", "owner": 4, "search_description": "", "pk": 32, "body": "<p>Our policy and practice notes have been designed to provide short and insightful summaries into key findings from the project and what these could mean in terms of farming policy and practice. Click on each note below to read more.</p><p>Have any questions about these? Then <a id=\\"8\\" linktype=\\"page\\">contact us.</a></p>", "go_live_at": null}	\N	32	2
25	f	2019-01-11 02:30:45.594848+00	{"show_in_menus": true, "live": true, "numchild": 0, "title": "Contact us", "expire_at": null, "slug": "contact-us", "body": "<p></p>", "expired": false, "locked": false, "first_published_at": "2019-01-10T13:06:00.324Z", "go_live_at": null, "depth": 3, "draft_title": "Contact us", "content_type": 31, "has_unpublished_changes": false, "latest_revision_created_at": "2019-01-10T13:06:00.303Z", "search_description": "", "last_published_at": "2019-01-10T13:06:00.324Z", "url_path": "/home2/contact-us/", "seo_title": "", "live_revision": 9, "path": "000100020008", "pk": 8, "owner": 2}	\N	8	1
29	f	2019-01-11 02:32:31.67322+00	{"show_in_menus": true, "live": true, "numchild": 0, "title": "The Project", "expire_at": null, "slug": "project", "body": "<p></p>", "expired": false, "locked": false, "first_published_at": "2019-01-10T13:08:41.922Z", "go_live_at": null, "depth": 4, "draft_title": "The Project", "content_type": 31, "has_unpublished_changes": false, "latest_revision_created_at": "2019-01-10T13:08:41.897Z", "search_description": "", "last_published_at": "2019-01-10T13:08:41.922Z", "url_path": "/home2/about/project/", "seo_title": "", "live_revision": 15, "path": "0001000200060001", "pk": 14, "owner": 2}	\N	14	1
30	f	2019-01-11 02:32:53.600066+00	{"show_in_menus": true, "live": true, "numchild": 0, "title": "Meet the team", "expire_at": null, "slug": "meet-team", "body": "<p></p>", "expired": false, "locked": false, "first_published_at": "2019-01-10T13:08:57.025Z", "go_live_at": null, "depth": 4, "draft_title": "Meet the team", "content_type": 31, "has_unpublished_changes": false, "latest_revision_created_at": "2019-01-10T13:08:57.006Z", "search_description": "", "last_published_at": "2019-01-10T13:08:57.025Z", "url_path": "/home2/about/meet-team/", "seo_title": "", "live_revision": 16, "path": "0001000200060002", "pk": 15, "owner": 2}	\N	15	1
142	f	2019-01-31 13:40:21.214234+00	{"first_published_at": "2019-01-11T12:11:25.341Z", "url_path": "/home2/about/project/approaches/", "expire_at": null, "path": "00010002000200010001", "numchild": 0, "show_in_menus": true, "pk": 24, "has_unpublished_changes": true, "live_revision": 48, "expired": false, "locked": false, "body": "<p>The FIELD project strives to deliver a new approach to studying livestock disease, which not only wil help shed new light on this topic but will also be co-produced with key stakeholders throughout the research process to ensure the relevance of the project recommendations to the two case study diseases being explored. Find out more about the approaches the FIELD project is using below.</p><p></p><p></p><hr/><p></p><h3>Interdisciplinary nature</h3><p>Previous research for solutions to livestock disease has been hampered by traditional research discipline silos. The FIELD project seeks to examine the social and biological identities of livestock disease, and cut across the realms of nature, culture, science, society, human and animal. This will enable us to study livestock disease as a co-evolutionary process: as both a biological and social phenomenon that shapes and is shaped by farming systems and communities, as emphasised in the diagram below.</p><p></p><embed alt=\\"Conceptual approach white\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"15\\"/><p></p><p>Given how interconnected these aspects are, it is unsuprising that FIELD has an interdisciplinary approach at its core. By working both within and across the three main research disciplines involved in the project.</p><p>This will help to encourage new ways of thinking about the relationships between livestock diseases, farming systems and communities which will help us to develop better predictions of disease in the future, and to advise on its management.</p><p>Models that incorporate aspects from the other disciplines, such as social pressures, economic incentives and past disease experiences may improve disease predictions</p><p></p><p>Greater understanding of human-animal relationships and how these relate to animal health and welfare</p><p>Explore interconnections identified in the different disciplines</p><p>Team of early career researchers will be central to this</p><p></p><hr/><p></p><h3>Stakeholder input</h3><p>Our network of <a id=\\"35\\" linktype=\\"page\\">collaborators</a> will also</p><p>Develop and foster mutual understandings by involving stakeholders as co-producers of knowledge, both in terms of shaping the research focus and providing feedback on findings</p><p>Innovative knowledge-exchange will help to facilitate the creation of these understandings</p><p></p><p></p><p></p><p></p><hr/><p></p><h3>Project case studies</h3><p>Look to explore the past and present of two example diseases, and how they relate to changes in farming systems, communities and the wider world.</p><p>Look at different types of production systems across farms in the North East and Cumbria</p><p></p><p></p><p></p><p></p><p></p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-11T12:11:25.341Z", "depth": 5, "draft_title": "Approaches", "live": true, "latest_revision_created_at": "2019-01-31T13:36:16.523Z", "owner": 2, "slug": "approaches", "search_description": "", "content_type": 31, "title": "Approaches"}	\N	24	4
197	f	2019-02-21 10:46:12.451748+00	{"go_live_at": null, "seo_title": "", "title": "Photos", "last_published_at": "2019-02-04T10:17:18.539Z", "expire_at": null, "path": "00010002000500020001", "expired": false, "slug": "photos", "locked": false, "first_published_at": "2019-02-04T10:17:18.539Z", "depth": 5, "owner": 4, "body": "<p>We have the <a href=\\"https://merl.reading.ac.uk/\\">Museum of English Rural Life</a> to thank for digitising these fabulous photos of British agriculture from 1947 onwards. Scroll through our gallery to see how livestock production has changed over the decades, or use our <a id=\\"9\\" linktype=\\"page\\">search</a> function to look for something more specific.</p>", "pk": 30, "content_type": 31, "live_revision": 168, "latest_revision_created_at": "2019-02-04T10:17:18.521Z", "search_description": "", "live": true, "url_path": "/home2/resources/media/photos/", "draft_title": "Photos", "has_unpublished_changes": false, "numchild": 0, "show_in_menus": true}	\N	30	2
32	f	2019-01-11 02:35:31.759536+00	{"date": "2019-01-10T13:12:00Z", "show_in_menus": false, "related_entrypage_from": [], "related_entrypage_to": [], "live": true, "numchild": 0, "title": "Test post 2", "expire_at": null, "slug": "test-post-2", "entry_categories": [], "header_image": 5, "body": "<p>Body text here</p>", "expired": false, "locked": false, "first_published_at": "2019-01-10T13:16:11.634Z", "go_live_at": null, "depth": 4, "draft_title": "Test post 2", "content_type": 37, "num_comments": 0, "has_unpublished_changes": false, "latest_revision_created_at": "2019-01-10T13:16:11.615Z", "entry_tags": [], "search_description": "", "last_published_at": "2019-01-10T13:16:11.634Z", "url_path": "/home2/blog-news/test-post-2/", "seo_title": "", "excerpt": "<p>Excerpt text here</p>", "live_revision": 17, "path": "0001000200040002", "pk": 16, "owner": 2}	\N	16	1
169	f	2019-02-05 10:05:55.104598+00	{"first_published_at": "2019-01-10T13:06:21.120Z", "url_path": "/home2/search/", "expire_at": null, "path": "000100020008", "numchild": 0, "show_in_menus": false, "pk": 9, "has_unpublished_changes": false, "live_revision": 86, "expired": false, "locked": false, "body": "<p>Want to find something specific on livestock health or farming, past or present? We\\u2019ve tagged all our posts and images to make them as easy for you to explore and find as possible. Use the search box below with keywords of interest to discover more</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-21T15:19:48.474Z", "depth": 3, "draft_title": "Search", "live": true, "latest_revision_created_at": "2019-01-21T15:19:48.455Z", "owner": 2, "slug": "search", "search_description": "", "content_type": 31, "title": "Search"}	\N	9	2
23	f	2019-01-11 02:30:12.248587+00	{"show_in_menus": true, "live": true, "numchild": 0, "title": "Search", "expire_at": null, "slug": "search", "body": "<p></p>", "expired": false, "locked": false, "first_published_at": "2019-01-10T13:06:21.120Z", "go_live_at": null, "depth": 3, "draft_title": "Search", "content_type": 31, "has_unpublished_changes": false, "latest_revision_created_at": "2019-01-10T13:06:21.103Z", "search_description": "", "last_published_at": "2019-01-10T13:06:21.120Z", "url_path": "/home2/search/", "seo_title": "", "live_revision": 10, "path": "000100020005", "pk": 9, "owner": 2}	\N	9	1
170	f	2019-02-07 10:44:19.799009+00	{"first_published_at": "2019-01-11T11:59:50.233Z", "url_path": "/home2/groups/focus-consumers/", "expire_at": null, "path": "0001000200030003", "numchild": 0, "show_in_menus": true, "pk": 20, "has_unpublished_changes": false, "live_revision": 116, "expired": false, "locked": false, "body": "<p></p><p>[Timeline]</p><p></p><h2><a id=\\"29\\" linktype=\\"page\\">Media</a></h2>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-25T12:49:42.298Z", "depth": 4, "draft_title": "Focus on Consumers", "live": true, "latest_revision_created_at": "2019-01-25T12:49:42.273Z", "owner": 2, "slug": "focus-consumers", "search_description": "", "content_type": 31, "title": "Focus on Consumers"}	\N	20	6
33	f	2019-01-11 05:03:16.133399+00	{"locked": false, "title": "Test Post", "num_comments": 0, "draft_title": "Test Post", "has_unpublished_changes": false, "first_published_at": "2019-01-09T16:05:05.748Z", "depth": 4, "expired": false, "last_published_at": "2019-01-11T02:35:11.541Z", "entry_categories": [{"pk": null, "page": 5, "category": 2}], "related_entrypage_to": [], "date": "2019-01-09T16:04:00Z", "live": true, "content_type": 37, "excerpt": "<p></p>", "header_image": 4, "slug": "test-post", "latest_revision_created_at": "2019-01-11T02:35:11.520Z", "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "0001000200040001", "seo_title": "", "live_revision": 31, "url_path": "/home2/blog-news/test-post/", "owner": 1, "search_description": "", "entry_tags": [], "pk": 5, "related_entrypage_from": [], "body": "<p>The content of my first blog post</p>", "go_live_at": null}	\N	5	1
31	f	2019-01-11 02:35:11.520836+00	{"date": "2019-01-09T16:04:00Z", "show_in_menus": false, "related_entrypage_from": [], "related_entrypage_to": [], "live": true, "numchild": 0, "title": "Test Post", "expire_at": null, "slug": "test-post", "entry_categories": [], "header_image": 4, "body": "<p>The content of my first blog post</p>", "expired": false, "locked": false, "first_published_at": "2019-01-09T16:05:05.748Z", "go_live_at": null, "depth": 4, "draft_title": "Test Post", "content_type": 37, "num_comments": 0, "has_unpublished_changes": false, "latest_revision_created_at": "2019-01-11T02:31:39.125Z", "entry_tags": [], "search_description": "", "last_published_at": "2019-01-11T02:31:39.146Z", "url_path": "/home2/blog-news/test-post/", "seo_title": "", "excerpt": "<p></p>", "live_revision": 27, "path": "0001000200040001", "pk": 5, "owner": 1}	\N	5	1
34	f	2019-01-11 05:03:26.617334+00	{"locked": false, "title": "Test post 2", "num_comments": 0, "draft_title": "Test post 2", "has_unpublished_changes": false, "first_published_at": "2019-01-10T13:16:11.634Z", "depth": 4, "expired": false, "last_published_at": "2019-01-11T02:35:31.780Z", "entry_categories": [{"pk": null, "page": 16, "category": 1}], "related_entrypage_to": [], "date": "2019-01-10T13:12:00Z", "live": true, "content_type": 37, "excerpt": "<p>Excerpt text here</p>", "header_image": 5, "slug": "test-post-2", "latest_revision_created_at": "2019-01-11T02:35:31.759Z", "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "0001000200040002", "seo_title": "", "live_revision": 32, "url_path": "/home2/blog-news/test-post-2/", "owner": 2, "search_description": "", "entry_tags": [], "pk": 16, "related_entrypage_from": [], "body": "<p>Body text here</p>", "go_live_at": null}	\N	16	1
35	f	2019-01-11 11:37:51.277523+00	{"locked": false, "title": "Test post 2", "num_comments": 0, "draft_title": "Test post 2", "has_unpublished_changes": false, "first_published_at": "2019-01-10T13:16:11.634Z", "depth": 4, "expired": false, "last_published_at": "2019-01-11T05:03:26.642Z", "entry_categories": [{"pk": 2, "page": 16, "category": 1}], "related_entrypage_to": [], "date": "2019-01-10T13:12:00Z", "live": true, "content_type": 37, "excerpt": "<p>Excerpt text here</p>", "header_image": 5, "slug": "test-post-2", "latest_revision_created_at": "2019-01-11T05:03:26.617Z", "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "0001000200040002", "seo_title": "", "live_revision": 34, "url_path": "/home2/blog-news/test-post-2/", "owner": 2, "search_description": "", "entry_tags": [{"content_object": 16, "pk": null, "tag": 1}], "pk": 16, "related_entrypage_from": [], "body": "<p>Body text here</p>", "go_live_at": null}	\N	16	2
143	f	2019-01-31 13:41:14.797543+00	{"first_published_at": "2019-01-11T12:11:25.341Z", "url_path": "/home2/about/project/approaches/", "expire_at": null, "path": "00010002000200010001", "numchild": 0, "show_in_menus": true, "pk": 24, "has_unpublished_changes": true, "live_revision": 48, "expired": false, "locked": false, "body": "<p>The FIELD project strives to deliver a new approach to studying livestock disease, which not only wil help shed new light on this topic but will also be co-produced with key stakeholders throughout the research process to ensure the relevance of the project recommendations to the two case study diseases being explored. Find out more about the approaches the FIELD project is using below.</p><p></p><p></p><hr/><p></p><h3>Interdisciplinary nature</h3><p>Previous research for solutions to livestock disease has been hampered by traditional research discipline silos. The FIELD project seeks to examine the social and biological identities of livestock disease, and cut across the realms of nature, culture, science, society, human and animal. This will enable us to study livestock disease as a co-evolutionary process: as both a biological and social phenomenon that shapes and is shaped by farming systems and communities, as emphasised in the diagram below.</p><p></p><embed alt=\\"Conceptual approach white\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"15\\"/><p></p><p>Given how interconnected these aspects are, it is unsuprising that FIELD has an interdisciplinary approach at its core. By working both within and across the three main research disciplines involved in the project.</p><p>This will help to encourage new ways of thinking about the relationships between livestock diseases, farming systems and communities which will help us to develop better predictions of disease in the future, and to advise on its management.</p><p>Models that incorporate aspects from the other disciplines, such as social pressures, economic incentives and past disease experiences may improve disease predictions</p><p></p><p>Greater understanding of human-animal relationships and how these relate to animal health and welfare</p><p>Explore interconnections identified in the different disciplines</p><p>Team of early career researchers will be central to this</p><p></p><hr/><p></p><h3>Stakeholder input</h3><p>Our network of <a id=\\"35\\" linktype=\\"page\\">collaborators</a> will also</p><p>Develop and foster mutual understandings by involving stakeholders as co-producers of knowledge, both in terms of shaping the research focus and providing feedback on findings</p><p>Innovative knowledge-exchange will help to facilitate the creation of these understandings</p><p></p><p></p><p></p><embed alt=\\"Expertise.png\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"16\\"/><p></p><p></p><hr/><p></p><h3>Project case studies</h3><p>Look to explore the past and present of two example diseases, and how they relate to changes in farming systems, communities and the wider world.</p><p>Look at different types of production systems across farms in the North East and Cumbria</p><p></p><p></p><p></p><p></p><p></p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-11T12:11:25.341Z", "depth": 5, "draft_title": "Approaches", "live": true, "latest_revision_created_at": "2019-01-31T13:40:21.214Z", "owner": 2, "slug": "approaches", "search_description": "", "content_type": 31, "title": "Approaches"}	\N	24	4
37	f	2019-01-11 11:59:50.217862+00	{"locked": false, "title": "Focus on Consumers", "draft_title": "Focus on Consumers", "has_unpublished_changes": false, "first_published_at": null, "depth": 4, "expired": false, "last_published_at": null, "live": true, "content_type": 31, "slug": "focus-consumers", "latest_revision_created_at": null, "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "0001000200020003", "seo_title": "", "live_revision": null, "url_path": "/home2/groups/focus-consumers/", "owner": 2, "search_description": "", "pk": 20, "body": "<p></p>", "go_live_at": null}	\N	20	2
171	f	2019-02-07 10:44:46.435393+00	{"first_published_at": "2019-01-11T12:00:08.374Z", "url_path": "/home2/groups/focus-advisors-and-policy-makers/", "expire_at": null, "path": "0001000200030004", "numchild": 1, "show_in_menus": false, "pk": 21, "has_unpublished_changes": false, "live_revision": 117, "expired": false, "locked": false, "body": "<p></p><p>[Timeline]</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-25T12:50:13.295Z", "depth": 4, "draft_title": "Focus on Advisors and Policy-Makers", "live": true, "latest_revision_created_at": "2019-01-25T12:50:13.268Z", "owner": 2, "slug": "focus-advisors-and-policy-makers", "search_description": "", "content_type": 31, "title": "Focus on Advisors and Policy-Makers"}	\N	21	6
38	f	2019-01-11 12:00:08.351647+00	{"locked": false, "title": "Focus on Advisors and Policy-Makers", "draft_title": "Focus on Advisors and Policy-Makers", "has_unpublished_changes": false, "first_published_at": null, "depth": 4, "expired": false, "last_published_at": null, "live": true, "content_type": 31, "slug": "focus-advisors-and-policy-makers", "latest_revision_created_at": null, "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "0001000200020004", "seo_title": "", "live_revision": null, "url_path": "/home2/groups/focus-advisors-and-policy-makers/", "owner": 2, "search_description": "", "pk": 21, "body": "<p></p>", "go_live_at": null}	\N	21	2
26	f	2019-01-11 02:30:57.256834+00	{"show_in_menus": true, "live": true, "numchild": 0, "title": "Resources", "expire_at": null, "slug": "resources", "body": "<h2>Placeholder</h2>", "expired": false, "locked": false, "first_published_at": "2019-01-10T13:05:00.666Z", "go_live_at": null, "depth": 3, "draft_title": "Resources", "content_type": 31, "has_unpublished_changes": false, "latest_revision_created_at": "2019-01-10T13:05:00.634Z", "search_description": "", "last_published_at": "2019-01-10T13:05:00.666Z", "url_path": "/home2/resources/", "seo_title": "", "live_revision": 7, "path": "000100020003", "pk": 7, "owner": 2}	\N	7	1
39	f	2019-01-11 12:01:20.62357+00	{"locked": false, "title": "Groups", "draft_title": "Groups", "has_unpublished_changes": false, "first_published_at": "2019-01-10T12:55:28.847Z", "depth": 3, "expired": false, "last_published_at": "2019-01-11T02:30:32.016Z", "live": true, "content_type": 31, "slug": "groups", "latest_revision_created_at": "2019-01-11T02:30:31.996Z", "show_in_menus": true, "numchild": 4, "expire_at": null, "path": "000100020002", "seo_title": "", "live_revision": 24, "url_path": "/home2/groups/", "owner": 2, "search_description": "", "pk": 6, "body": "<h2>Placeholder Header 2</h2><h3>Placeholder Header 3</h3><h4>Placeholder Header 4</h4><p>Placeholder normal text</p><ol><li>Numbered list 1</li><li>Numbered list 2</li></ol><ul><li>Bullet list 1</li><li>Bullet list 2</li></ul><blockquote>A quotation</blockquote><blockquote></blockquote><hr/><p>Horizontal line divider ^^^</p><p></p><p></p><p></p>", "go_live_at": null}	\N	6	2
198	f	2019-02-21 10:46:19.823122+00	{"go_live_at": null, "seo_title": "", "title": "Audio", "last_published_at": "2019-02-04T10:17:02.278Z", "expire_at": null, "path": "00010002000500020002", "expired": false, "slug": "audio", "locked": false, "first_published_at": "2019-02-04T10:17:02.278Z", "depth": 5, "owner": 4, "body": "<p>Our oral historian <a id=\\"15\\" linktype=\\"page\\">Sue</a> has been working hard to bring you some snippets from the interviews she has been conducting for FIELD with farmers. Listen to first-hand accounts of farming in the clips below.</p>", "pk": 31, "content_type": 31, "live_revision": 167, "latest_revision_created_at": "2019-02-04T10:17:02.257Z", "search_description": "", "live": true, "url_path": "/home2/resources/media/audio/", "draft_title": "Audio", "has_unpublished_changes": false, "numchild": 0, "show_in_menus": true}	\N	31	2
115	f	2019-01-25 12:47:02.877995+00	{"go_live_at": null, "search_description": "", "slug": "focus-farming", "depth": 4, "show_in_menus": false, "expired": false, "url_path": "/home2/groups/focus-farming/", "numchild": 1, "first_published_at": "2019-01-11T11:59:31.921Z", "has_unpublished_changes": true, "last_published_at": "2019-01-23T10:29:48.986Z", "title": "Focus on Farming", "expire_at": null, "draft_title": "Focus on Farming", "path": "0001000200030002", "live_revision": 110, "content_type": 31, "owner": 2, "pk": 19, "seo_title": "", "locked": false, "live": true, "body": "<p></p><p>[Timeline]</p><h2><a id=\\"8\\" linktype=\\"page\\">Contact Us</a></h2>", "latest_revision_created_at": "2019-01-25T12:46:59.384Z"}	\N	19	6
36	f	2019-01-11 11:59:31.903119+00	{"locked": false, "title": "Focus on Farming", "draft_title": "Focus on Farming", "has_unpublished_changes": false, "first_published_at": null, "depth": 4, "expired": false, "last_published_at": null, "live": true, "content_type": 31, "slug": "focus-farming", "latest_revision_created_at": null, "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "0001000200020002", "seo_title": "", "live_revision": null, "url_path": "/home2/groups/focus-farming/", "owner": 2, "search_description": "", "pk": 19, "body": "<p></p>", "go_live_at": null}	\N	19	2
174	f	2019-02-14 10:03:30.792227+00	{"first_published_at": "2019-01-10T13:08:57.025Z", "url_path": "/home2/about/meetteam/research-team/", "expire_at": null, "path": "00010002000200050001", "numchild": 0, "show_in_menus": true, "pk": 15, "has_unpublished_changes": true, "live_revision": 119, "expired": false, "locked": false, "body": "<p>The research on the FIELD research project will be conducted by a team of 12 individuals from 6 different UK universities, and from 3 different scientific disciplines. Find out more about the different team members below.</p><p></p><hr/><h2>Prof Abigail Woods</h2><h3>King&#x27;s College London</h3><h4>History</h4><p>Abigail Woods is Head of the Department of History, and <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Professor in the History of Human and</a> <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Animal Health at King&#x27;s College London.</a> Reflecting her earlier career as a veterinary surgeon, her research focuses on the history of animal health in 19th and 20th century Britain, and its intersections with the histories of human health and livestock production. Her recent research has explored the history of veterinary expertise, policy and practice; the changing concepts of animal health, welfare and productivity; and how patterns and perceptions of livestock disease have changed over time. As principle investigator of the FIELD project, she is developing the first social histories of BVD and cattle lameness, and bringing them into dialogue with contemporary scientific and social scientific perspectives.</p><p></p><hr/><h2>Nicole Gosling</h2><h3>King&#x27;s College London</h3><h4>History</h4><p>Nicole Gosling is a PhD student at King\\u2019s College in London and will be writing her dissertation as a contribution to the FIELD project. She studied her BSc in Ecology at the University of Victoria, and recently completed an MA in Environmental History at Uppsala University. Broadly speaking, Nicole\\u2019s interests include how humans interact with nature, with a focus on human-animal relationships. She explored these relationships in her master\\u2019s thesis \\u2018Making Sense of Cattle: A story from farm to food\\u2019 where she looked at how different actors experience cattle bodies during the production of beef. Building on this line of thinking, Nicole\\u2019s role in the FIELD project will be focused on the history of lameness in sheep.</p><p></p><hr/><h2>Prof Karen Sayer</h2><h3>Leeds Trinity University</h3><h4>History</h4><p><a href=\\"http://research.leedstrinity.ac.uk/en/persons/karen-sayer(5c5fb33f-b15c-497f-870a-ad1d04f03454).html\\">Professor of Social and Cultural History at Leeds Trinity University,</a> Leeds, UK, Karen Sayer specialises in the study of British agriculture, landscape and environment in the 19th and 20th centuries. Her first monograph, <i>Women of the Fields: Representations of Femininity in Nineteenth Century Rural Society</i> (MUP 1995) used a discursive and interdisciplinary approach to assess the representation of women\\u2019s work in agriculture in Parliamentary Reports alongside art, literature and the press, to explain legislative intervention and control of their employment. She built on this work with her second monograph <i>Country Cottages: A Cultural History</i> (MUP, 2000). Drawing on the work of the social sciences, architecture and geography to scrutinise the values attached historically to the idea and material culture of the cottage, and the experiences of those who inhabited it, the book encompassed a spatial reading of the political and material effects of the rural idyll that impact at the level of national identity and \\u2018race\\u2019, class and sex. She has continued to address the shape of, values attaching to and understandings of the British landscape and environment, and experiences of those living in the countryside. Today she works on energy landscapes \\u2013 e.g. with P. Brassley &amp; J. Burchardt <i>Transforming the countryside?</i> <i>The Electrification of Rural England 1890-1970</i> (Routledge, 2016) \\u2013 the managed spaces of the farm, history of livestock agriculture and animal history.</p><p>Within the FIELD project, she addresses the tensions that beset the \\u2018modernisation\\u2019 of UK livestock farming after 1947 and the different, competing messages attaching to animal welfare and consumption, as seen in the use of the British countryside as site of amenity and site of production. This work incorporates ideas of animals as active agents of history, and is framed by notions of interconnectivity of farm, the farm animal, disease organisms, farmers, labourers, marketeers, sales reps, government officials, journalists and the non-farming public over time.</p><p></p><hr/><h2>Dr James Bowen</h2><h3>Leeds Trinity University</h3><h4>History</h4><p>James P. Bowen is a Post-Doctoral Research Associate in History based at Leeds Trinity University with research interests in agricultural and rural history. He was formerly a Research Associate (Victoria County History-Cumbria Project) in the Department of History, Lancaster University and was the Contributing Editor for The Herefordshire Victoria County History Trust Short on the parish of Colwall. He was formerly a Post-Doctoral Research Associate based at the Department of Geography and Planning, University of Liverpool employed on \\u2018Spaces of experience and horizons of expectation: the implications of extreme weather events, past, present and future\\u2019, a three-year project, funded as part of the Care for the Future programme of the Arts and Humanities Research Council. He completed a PhD at Lancaster University supervised by Professor A.J.L. Winchester and held the Economic History Society\\u2019s Tawney Junior Research Fellowship in 2012-13 at the Institute of Historical Research, London.</p><p></p><hr/><h2>Dr Amy Proctor</h2><h3>Newcastle University</h3><h4>Social Science</h4><p><a href=\\"https://www.ncl.ac.uk/cre/about/staff/profile/amyproctornclacuk.html#background\\">Amy Proctor</a> is based at the <a href=\\"https://www.ncl.ac.uk/cre/\\">Centre for Rural Economy</a> at Newcastle University. She is interested in agricultural extension and processes of expertise exchange within rural land management and has published widely on this. Her research has focused on the knowledge-practices of farmers and their advisors and the performance and practice of the advisory encounter. Amy is also interested in developing innovative and interactive ways of engaging with stakeholders and has co-led <a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a>, a national knowledge exchange network for rural professionals which provides a platform for inter-professional learning and debate among farm advisers and opportunities for exchange with research communities. In FIELD, Amy will develop and conduct the social science aspects of the project including in-depth interviews and ethnographic research with farmers and advisers and focus groups with farmers and consumers.</p><p></p><hr/><h2>Sue Bradley</h2><h3>Newcastle University</h3><h4>History</h4><p>Sue Bradley is an oral historian in the <a href=\\"https://www.ncl.ac.uk/cre/\\">Centre for Rural Economy</a>, Newcastle University, where her research has ranged from flood risk to honey bee health and veterinary practice. She is interested in how oral history can help to address current concerns, and in using audio testimonies from older practitioners as a basis for discussions with their counterparts today. Her work for FIELD includes recording a collection of life-story interviews that will contribute insights from first-hand accounts of working with cattle and sheep in the north of England since the 1940&#x27;s. This collection will be archived at the <a href=\\"https://merl.reading.ac.uk/\\">Museum for English Rural Life</a> to serve beyond the project as a permanent public research resource. Sue also works part-time in <a href=\\"https://research.ncl.ac.uk/oralhistory/\\">Newcastle University\\u2019s Oral History Unit</a>. Before coming to Newcastle she was responsible for creating the British Library\\u2019s Book Trade Lives collection of recordings with booksellers and publishers.</p><p></p><hr/><h2>Dr Beth Clark</h2><h3>Newcastle University</h3><h4>Social Science</h4><p><a href=\\"https://www.ncl.ac.uk/cre/about/staff/profile/bethclark.html#background\\">Beth\\u2019s</a> research background in sports, exercise and nutrition and food marketing reflects her research interests in food and communication. She is particularly interested in exploring how people relate to animal products and different food production practices, such as motivations for food choice, innovation and technology in production, knowledge of food production practices, and food cultures. Through this she works with a range of stakeholders from across the food supply chain, which has fuelled an interest in communication, including how individuals and groups share information and trust different information sources.She has two roles on the FIELD project. The first is part of the social science research team, involving interviews, focus groups and observations with farmers, farming advisors and the public, to explore their different experiences and perceptions of endemic livestock disease. The second role focuses on public engagement, including the online communications and website for FIELD, as well as identifying and organising opportunities for greater interaction with the projects many stakeholders, including members of the farming community and the public.</p><hr/><h2>Dr Ewan Coleman</h2><h3>University of Edinburgh</h3><h4>Epidemiology &amp; Economics</h4><p>Ewan Colman is a post-doctoral research associate at the <a href=\\"https://www.ed.ac.uk/roslin\\">Roslin Institute</a> at the University of Edinburgh. He has a background in mathematics, particularly in applied probability, data science, and network science. His research uses computational modelling to explore the relationship between behaviour and the spread of infectious disease. Ewan&#x27;s past interests include the dynamics of conversations on social media, the social and spatial organisation of ant colonies, and the how the ever-increasing amount of public health data can be exploited to detect and mitigate epidemic diseases. As a member of the FIELD project, he will focus on the spread of BVD through cattle trade, and how changing attitudes towards biosecurity can reduce the prevalence of BVD on a national scale.</p><p></p><hr/><h2>Prof Rowland Kao</h2><h3>University of Edinburgh</h3><h4>Epidemiology &amp; Economics</h4><p>Rowland Kao is <a href=\\"https://www.ed.ac.uk/roslin/about/contact-us/staff/rowland-kao\\">Chair of Veterinary Epidemiology and Data Science</a> at the Roslin Institute at Edinburgh University. He is interested in studying infectious disease dynamics through the development of theoretical models of disease transmission, to inform disease management and control. To do this he has integrated data on genetics, social neworks and demographic factors to explore a range of different livestock diseases including foot and mouth disease, avian influenza, bovine tuberculosis and monkey malaria.  As part of the FIELD project, Rowland will be developing models of BVD transmission in cattle, including the prediction of individual famer responses to range of different on and off farm factors.</p><p></p><hr/><h2>Maria Suella Rodrigues</h2><h3>University of Glasgow</h3><h4>Epidemiology &amp; Economics</h4><p>Maria Suella Rodrigues is a doctoral candidate at the University of Glasgow, supervised under Professor Nicholas Hanley (MVLS), Dr. Souvik Datta (ASBS) at the University of Glasgow and Professor Rowland Kao from the University of Edinburgh. Maria holds a BSc degree in Economics from Lancaster University. Following that she moved to the University of Glasgow where she pursued the MRes in Economics, graduating in 2018. She is interested in investigating research questions in the areas of agricultural and environmental economics as well as applied micro-econometrics and choice-modelling theory. During her MRes dissertation she modelled consumer preferences for forest disease management with use of Choice modelling data. Additionally, she has received extensive training in choice-modelling from the Choice Modelling Centre, University of Leeds. As part of the FIELD project, Maria will design field experiments and model both farmer and consumer preferences in relation to farm animal welfare.</p><p></p><hr/><h2>Dr Lewis Holloway</h2><h3>University of Hull</h3><h4>Social Science</h4><p><a href=\\"https://www.hull.ac.uk/faculties/staff-profiles/lewis-holloway.aspx\\">Lewis Holloway</a> is a Reader in Human Geography at the University of Hull. He has research interests in food, farming and the countryside, and has a particular interest in farm animals and agricultural technologies. Recent research has focused on the ways in which genetic, information and robotic technologies have affected livestock farming, and has involved in-depth research with farmers and technology developers to understand how new technologies are engaged with, adopted and contested by farmers. Lewis is interested in the situated ethics associated with animal agriculture, and in how technologies can transform farming ethics and knowledge-practices. Lewis will be involved in developing and conducting the social scientific elements of the FIELD project. This will include on-farm interview and observational work with farmers, farm animals and expert advisors, and focus groups with farmers and public groups.</p><p></p><hr/><h2>Dr Niamh Mahon</h2><h3>University of Hull</h3><h4>Social Science</h4><p><a href=\\"https://www.researchgate.net/profile/Niamh_Mahon\\">Niamh</a> is a Post-Doctoral Research Associate at the University of Hull. In this role she is involved in the social science components of the FIELD project. This includes in-depth interviews and observational work with farmers and expert advisors, and focus groups with farmers and the public, conducted to explore their different experiences and perceptions of endemic livestock disease. Prior to this Niamh under took a PhD at Nottingham Trent University developing stakeholder-sensitive indicators of the Sustainable Intensification of UK agriculture and a Master\\u2019s degree from the University of East Anglia in Sustainable Agriculture and Food Security. She has also worked as a research assistant in socio-economics and policy for the Organic Research Centre. Niamh is a member of the Food and Climate Research Network and the Sustainable Intensification Research Network.</p><p></p><hr/><h2>Prof Nick Hanley</h2><h3>University of Glasgow</h3><h4>Epidemiology &amp; Economics</h4><p>Nick Hanley is a <a href=\\"https://www.gla.ac.uk/researchinstitutes/bahcm/staff/nicholashanley/\\">Professor of Environmental and One Health Economics</a> at the University of Glasgow. His PhD was in Agricultural Economics. His current main research interests include behavioural economics, the design of Payment for Ecosystem Service schemes, environmental valuation, one health economics, the economics of sustainable development, markets for biodiversity offsets, and the economics of invasive species. He is an honorary professor at the universities of St Andrews and Stirling. Nick is co-author of a textbook in environmental cost-benefit analysis with Edward Barbier; and two textbooks on environmental economics (with Jason Shogren and Ben White).</p><p></p><hr/><p></p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-25T13:02:50.116Z", "depth": 5, "draft_title": "Research team", "live": true, "latest_revision_created_at": "2019-01-29T16:34:19.150Z", "owner": 2, "slug": "research-team", "search_description": "", "content_type": 31, "title": "Research team"}	\N	15	4
47	f	2019-01-11 12:08:03.703235+00	{"locked": false, "title": "Papers", "draft_title": "Papers", "has_unpublished_changes": false, "first_published_at": "2019-01-10T13:07:07.388Z", "depth": 5, "expired": false, "last_published_at": "2019-01-10T13:07:07.388Z", "live": true, "content_type": 31, "slug": "papers", "latest_revision_created_at": "2019-01-10T13:07:07.370Z", "show_in_menus": true, "numchild": 0, "expire_at": null, "path": "00010002000200010001", "seo_title": "", "live_revision": 12, "url_path": "/home2/groups/focus-research/papers/", "owner": 2, "search_description": "", "pk": 11, "body": "<p></p>", "go_live_at": null}	\N	11	2
74	f	2019-01-18 13:13:16.682281+00	{"locked": false, "title": "Resources", "draft_title": "Resources", "has_unpublished_changes": false, "first_published_at": "2019-01-10T13:05:00.666Z", "depth": 3, "expired": false, "last_published_at": "2019-01-11T02:30:57.276Z", "live": true, "content_type": 31, "slug": "resources", "latest_revision_created_at": "2019-01-11T02:30:57.256Z", "show_in_menus": true, "numchild": 4, "expire_at": null, "path": "000100020005", "seo_title": "", "live_revision": 26, "url_path": "/home2/resources/", "owner": 2, "search_description": "", "pk": 7, "body": "<p>Want to explore how farming has changed over the past few decades and the key events that have shaped this, or explore in-depth the findings of the FIELD research and what this means for policy and practice? Then our resources section is the right place for you!</p><p>Visit our <a id=\\"28\\" linktype=\\"page\\">timeline</a> which is perfect for exploring the past 60 years of agricultural change. Head over to our <a id=\\"29\\" linktype=\\"page\\">media</a> gallery to see and hear how farming has changed since the Second World War? Check out our latest research<a id=\\"33\\" linktype=\\"page\\"> papers</a> to see more in-depth about our methods and findings, or see our <a id=\\"32\\" linktype=\\"page\\">policy and practice notes </a>to see what the implications of the research are.</p>", "go_live_at": null}	\N	7	4
44	f	2019-01-11 12:07:17.862414+00	{"locked": false, "title": "Focus on Consumers", "draft_title": "Focus on Consumers", "has_unpublished_changes": false, "first_published_at": "2019-01-11T11:59:50.233Z", "depth": 4, "expired": false, "last_published_at": "2019-01-11T11:59:50.233Z", "live": true, "content_type": 31, "slug": "focus-consumers", "latest_revision_created_at": "2019-01-11T11:59:50.217Z", "show_in_menus": true, "numchild": 2, "expire_at": null, "path": "0001000200020003", "seo_title": "", "live_revision": 37, "url_path": "/home2/groups/focus-consumers/", "owner": 2, "search_description": "", "pk": 20, "body": "<p></p>", "go_live_at": null}	\N	20	2
46	f	2019-01-11 12:07:56.81771+00	{"locked": false, "title": "Timeline", "draft_title": "Timeline", "has_unpublished_changes": false, "first_published_at": "2019-01-10T13:07:42.697Z", "depth": 5, "expired": false, "last_published_at": "2019-01-10T13:07:42.697Z", "live": true, "content_type": 31, "slug": "timeline", "latest_revision_created_at": "2019-01-10T13:07:42.676Z", "show_in_menus": true, "numchild": 0, "expire_at": null, "path": "00010002000200010002", "seo_title": "", "live_revision": 13, "url_path": "/home2/groups/focus-research/timeline/", "owner": 2, "search_description": "", "pk": 12, "body": "<p></p>", "go_live_at": null}	\N	12	2
130	f	2019-01-29 16:41:09.516478+00	{"depth": 2, "seo_title": "", "live": true, "title": "Home", "body": "<p>Better ways of understanding livestock disease are urgently required to ensure animal health and welfare, as well as farming sustainability. The Farm-level Interdisciplinary approaches to Endemic Livestock Diseases (FIELD) project, looks to bring together experts from industry, governance and academia to explore the realms of nature and culture, science and society and human and animal, and their impact on disease. Insights from the project will be used to develop better predictions ad disease and further insights into disease management.</p><p></p><p>[Timeline]</p><p>[Twitter]</p><p></p><p>[will the &quot;Join us&quot; link up to something like MailChimp?]</p><p></p><h2><a id=\\"3\\" linktype=\\"page\\">News</a></h2>", "draft_title": "Home", "owner": 1, "expired": false, "live_revision": 112, "url_path": "/home2/", "content_type": 31, "locked": false, "go_live_at": null, "first_published_at": "2019-01-11T01:18:30.245Z", "path": "00010002", "slug": "home2", "last_published_at": "2019-01-25T12:43:23.253Z", "has_unpublished_changes": false, "expire_at": null, "pk": 18, "latest_revision_created_at": "2019-01-25T12:43:23.228Z", "search_description": "", "numchild": 6, "show_in_menus": true}	\N	18	4
62	f	2019-01-18 10:05:05.539217+00	{"locked": false, "title": "Methodology", "draft_title": "Methodology", "has_unpublished_changes": true, "first_published_at": null, "depth": 5, "expired": false, "last_published_at": null, "live": false, "content_type": 31, "slug": "methodology", "latest_revision_created_at": "2019-01-17T10:12:18.518Z", "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "00010002000300010002", "seo_title": "", "live_revision": null, "url_path": "/home2/about/project/methodology/", "owner": 6, "search_description": "", "pk": 27, "body": "<p></p>", "go_live_at": null}	\N	27	6
145	f	2019-01-31 13:48:55.280352+00	{"first_published_at": "2019-01-18T10:05:05.566Z", "url_path": "/home2/about/project/methodology/", "expire_at": null, "path": "00010002000200010002", "numchild": 0, "show_in_menus": false, "pk": 27, "has_unpublished_changes": true, "live_revision": 62, "expired": false, "locked": false, "body": "<p>The research team is formed of three disciplinary clusters. Although the three clusters have their own research they will each will draw upon and feed into the others. Each cluster will therefore not be working in isolation, reflecting the interdisciplinary approach at the core of the project.</p><p></p><hr/><p></p><hr/><h3></h3><h3>Economics and Epidemiology</h3><p>Better understanding of the spatial interactions amongst farmers</p><p>Simulation models to enable prediction of responses to a range of factors including disease parameters, costs, support measures and new information</p><p>Examine how farmer decision making is affected by past experience of disease, health and welfare priorities, perceptions and evaluations of disease management methods</p><p>Variation in consumer preferences</p><p>Look to establish trade-offs</p><p>WTP animal welfare in relation to other product attributes</p><p>Models that incorporate aspects from the other disciplines, such as social pressures, economic incentives and past disease experiences may improve disease predictions</p><p></p><p>Greater understanding of human-animal relationships and how these relate to animal health and welfare</p><hr/><h3></h3><h3>History</h3><p>Changes over time</p><p>Experience, understanding and management of BVD and lameness</p><p>How the different farming systems have evolved over time and also what are understandings of \\u2018food farming\\u2019 for different stakeholders</p><p>Texts, images and existing oral history recordings, including journal articles, advertising material, popular press, government material and grey literature and films</p><p>Also give an indication of who is giving what advice</p><p>Creation of a timeline</p><p>Understanding the influence of historical forces can also help us to better understand the present, in relation to farming practices, sources of information and consumer behaviour</p><p>Oral history to promote discussion and reflection<br/></p><hr/><h3></h3><h3>Social Science</h3><p></p><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p>Farm walks to understand the real world context of disease</p><p>Explore how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other</p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p>Farm walks to understand the real world context of disease</p><p>Explore how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other</p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-18T10:05:05.566Z", "depth": 5, "draft_title": "Methodology", "live": true, "latest_revision_created_at": "2019-01-31T11:18:09.198Z", "owner": 6, "slug": "methodology", "search_description": "", "content_type": 31, "title": "Methodology"}	\N	27	4
51	f	2019-01-11 14:26:54.956237+00	{"locked": false, "title": "FAQ", "draft_title": "FAQ", "has_unpublished_changes": false, "first_published_at": "2019-01-11T14:26:12.271Z", "depth": 4, "expired": false, "last_published_at": "2019-01-11T14:26:12.271Z", "live": true, "content_type": 31, "slug": "faq", "latest_revision_created_at": "2019-01-11T14:26:12.252Z", "show_in_menus": true, "numchild": 0, "expire_at": null, "path": "0001000200030003", "seo_title": "", "live_revision": 50, "url_path": "/home2/about/faq/", "owner": 2, "search_description": "", "pk": 25, "body": "<p>Placeholder text here</p><ol><li>What is FIELD?</li></ol><p></p><p></p>", "go_live_at": null}	\N	25	2
22	f	2019-01-11 01:24:33.826155+00	{"draft_title": "Home2", "last_published_at": "2019-01-11T01:18:30.245Z", "url_path": "/home2/", "numchild": 6, "seo_title": "", "first_published_at": "2019-01-11T01:18:30.245Z", "go_live_at": null, "slug": "home2", "expired": false, "depth": 2, "locked": false, "expire_at": null, "body": "<p></p>", "live": true, "latest_revision_created_at": "2019-01-11T01:18:30.226Z", "path": "00010002", "has_unpublished_changes": false, "show_in_menus": true, "pk": 18, "content_type": 31, "live_revision": 21, "title": "Home", "owner": 1, "search_description": ""}	\N	18	1
148	f	2019-02-01 09:17:56.308972+00	{"first_published_at": "2019-01-11T01:18:30.245Z", "url_path": "/home2/", "expire_at": null, "path": "00010002", "numchild": 6, "show_in_menus": true, "pk": 18, "has_unpublished_changes": true, "live_revision": 112, "expired": false, "locked": false, "body": "<p>Better ways of understanding livestock disease are urgently required to ensure animal health and welfare, as well as farming sustainability. The Farm-level Interdisciplinary approaches to Endemic Livestock Diseases (FIELD) project looks to bring together experts from industry, governance and academia to explore the realms of nature and culture, science and society and human and animal, and their impact on disease. Insights from the project will be used to develop better predictions around disease and further insights into disease management.</p><p></p><p>[Timeline]</p><p>[Twitter]</p><p></p><p>[will the &quot;Join us&quot; link up to something like MailChimp?]</p><p></p><h2><a id=\\"3\\" linktype=\\"page\\">News</a></h2>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-25T12:43:23.253Z", "depth": 2, "draft_title": "Home", "live": true, "latest_revision_created_at": "2019-01-29T16:41:09.516Z", "owner": 1, "slug": "home2", "search_description": "", "content_type": 31, "title": "Home"}	\N	18	6
93	f	2019-01-21 15:23:40.244665+00	{"locked": false, "title": "News", "draft_title": "News", "has_unpublished_changes": false, "first_published_at": "2019-01-09T02:25:07.941Z", "depth": 3, "expired": false, "display_tags": true, "last_published_at": "2019-01-10T13:05:37.503Z", "num_entries_page": 5, "description": "Description here", "short_feed_description": true, "num_tags_entry_header": 5, "disqus_api_secret": "", "live": true, "content_type": 33, "disqus_shortname": "", "header_image": null, "slug": "blog-news", "latest_revision_created_at": "2019-01-10T13:05:37.480Z", "show_in_menus": true, "numchild": 3, "expire_at": null, "path": "000100020006", "seo_title": "", "live_revision": 8, "url_path": "/home2/blog-news/", "display_comments": false, "owner": 1, "num_last_entries": 3, "num_popular_entries": 3, "search_description": "", "display_archive": true, "main_color": "#4d6ae0", "display_last_entries": true, "display_popular_entries": true, "pk": 3, "display_categories": true, "go_live_at": null}	\N	3	2
8	f	2019-01-10 13:05:37.480938+00	{"draft_title": "Blog & News", "last_published_at": "2019-01-09T02:25:07.941Z", "num_last_entries": 3, "url_path": "/home/blog-news/", "numchild": 1, "short_feed_description": true, "seo_title": "", "description": "", "num_tags_entry_header": 5, "first_published_at": "2019-01-09T02:25:07.941Z", "display_archive": true, "go_live_at": null, "header_image": null, "slug": "blog-news", "expired": false, "display_popular_entries": true, "num_popular_entries": 3, "disqus_shortname": "", "depth": 3, "locked": false, "expire_at": null, "disqus_api_secret": "", "display_categories": true, "display_last_entries": true, "live": true, "latest_revision_created_at": "2019-01-09T02:25:07.923Z", "path": "000100010004", "has_unpublished_changes": false, "display_tags": true, "show_in_menus": true, "main_color": "#4d6ae0", "display_comments": false, "pk": 3, "content_type": 33, "live_revision": 3, "title": "News", "owner": 1, "search_description": "", "num_entries_page": 5}	\N	3	2
157	f	2019-02-01 14:33:17.079734+00	{"first_published_at": "2019-01-18T10:05:05.566Z", "url_path": "/home2/about/project/methodology/", "expire_at": null, "path": "00010002000200010002", "numchild": 0, "show_in_menus": false, "pk": 27, "has_unpublished_changes": true, "live_revision": 62, "expired": false, "locked": false, "body": "<p>The research team is formed of three disciplinary clusters. Although the three clusters have their own research they will each will draw upon and feed into the others. Each cluster will therefore not be working in isolation, reflecting the interdisciplinary approach at the core of the project. Find out more about the methods being used in the three clusters below.</p><p></p><hr/><p></p><hr/><h3></h3><h3>Economics and Epidemiology</h3><p>Better understanding of the spatial interactions amongst farmers</p><p>Simulation models to enable prediction of responses to a range of factors including disease parameters, costs, support measures and new information</p><p>Examine how farmer decision making is affected by past experience of disease, health and welfare priorities, perceptions and evaluations of disease management methods</p><p>Variation in consumer preferences</p><p>Look to establish trade-offs</p><p>WTP animal welfare in relation to other product attributes</p><p>Models that incorporate aspects from the other disciplines, such as social pressures, economic incentives and past disease experiences may improve disease predictions</p><p></p><p>Greater understanding of human-animal relationships and how these relate to animal health and welfare</p><ul><li>Farmer survey of farm animal health</li><li>&#x27;Food busk&#x27; to establish public perceptions of animal health</li><li>Consumer survey of willingness-to-pay for farm animal welfare</li></ul><hr/><h3></h3><h3>History</h3><p>Changes over time</p><p>Experience, understanding and management of BVD and lameness</p><p>How the different farming systems have evolved over time and also what are understandings of \\u2018food farming\\u2019 for different stakeholders</p><p>Texts, images and existing oral history recordings, including journal articles, advertising material, popular press, government material and grey literature and films</p><p>Also give an indication of who is giving what advice</p><p>Understanding the influence of historical forces can also help us to better understand the present, in relation to farming practices, sources of information and consumer behaviour</p><ul><li>Digitisation of historical agricultural images and videos</li><li>Creation of a timeline to display</li><li>Oral history to promote discussion and reflection<br/></li></ul><hr/><h3></h3><h3>Social Science</h3><p>The social science cluster is tasked with exploring how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other.</p><p>This will be achieved through a number of different methods including;</p><ul><li>Survey of farmers to establish farm management practices</li><li>Interviews</li><li>Focus groups</li><li>Farm walks to understand the real world context of disease</li></ul><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p>Farm walks to understand the real world context of disease</p><p>Explore how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other</p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p></p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-18T10:05:05.566Z", "depth": 5, "draft_title": "Methodology", "live": true, "latest_revision_created_at": "2019-02-01T14:00:34.162Z", "owner": 6, "slug": "methodology", "search_description": "", "content_type": 31, "title": "Methodology"}	\N	27	6
146	f	2019-01-31 13:49:17.769952+00	{"first_published_at": "2019-01-18T10:05:05.566Z", "url_path": "/home2/about/project/methodology/", "expire_at": null, "path": "00010002000200010002", "numchild": 0, "show_in_menus": false, "pk": 27, "has_unpublished_changes": true, "live_revision": 62, "expired": false, "locked": false, "body": "<p>The research team is formed of three disciplinary clusters. Although the three clusters have their own research they will each will draw upon and feed into the others. Each cluster will therefore not be working in isolation, reflecting the interdisciplinary approach at the core of the project. Find out more about the methods being used in the three clusters below.</p><p></p><hr/><p></p><hr/><h3></h3><h3>Economics and Epidemiology</h3><p>Better understanding of the spatial interactions amongst farmers</p><p>Simulation models to enable prediction of responses to a range of factors including disease parameters, costs, support measures and new information</p><p>Examine how farmer decision making is affected by past experience of disease, health and welfare priorities, perceptions and evaluations of disease management methods</p><p>Variation in consumer preferences</p><p>Look to establish trade-offs</p><p>WTP animal welfare in relation to other product attributes</p><p>Models that incorporate aspects from the other disciplines, such as social pressures, economic incentives and past disease experiences may improve disease predictions</p><p></p><p>Greater understanding of human-animal relationships and how these relate to animal health and welfare</p><hr/><h3></h3><h3>History</h3><p>Changes over time</p><p>Experience, understanding and management of BVD and lameness</p><p>How the different farming systems have evolved over time and also what are understandings of \\u2018food farming\\u2019 for different stakeholders</p><p>Texts, images and existing oral history recordings, including journal articles, advertising material, popular press, government material and grey literature and films</p><p>Also give an indication of who is giving what advice</p><p>Creation of a timeline</p><p>Understanding the influence of historical forces can also help us to better understand the present, in relation to farming practices, sources of information and consumer behaviour</p><p>Oral history to promote discussion and reflection<br/></p><hr/><h3></h3><h3>Social Science</h3><p></p><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p>Farm walks to understand the real world context of disease</p><p>Explore how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other</p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p>Farm walks to understand the real world context of disease</p><p>Explore how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other</p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-18T10:05:05.566Z", "depth": 5, "draft_title": "Methodology", "live": true, "latest_revision_created_at": "2019-01-31T13:48:55.280Z", "owner": 6, "slug": "methodology", "search_description": "", "content_type": 31, "title": "Methodology"}	\N	27	4
56	f	2019-01-17 10:12:18.518133+00	{"locked": false, "title": "Methodology", "draft_title": "Methodology", "has_unpublished_changes": false, "first_published_at": null, "depth": 5, "expired": false, "last_published_at": null, "live": false, "content_type": 31, "slug": "methodology", "latest_revision_created_at": null, "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "00010002000300010002", "seo_title": "", "live_revision": null, "url_path": "/home2/about/project/methodology/", "owner": 6, "search_description": "", "pk": 27, "body": "<p></p>", "go_live_at": null}	\N	27	6
172	f	2019-02-07 14:52:05.733152+00	{"first_published_at": "2019-01-23T10:29:14.148Z", "url_path": "/home2/groups/focus-farming/policy-practice-notes/", "expire_at": null, "path": "00010002000300020001", "numchild": 0, "show_in_menus": true, "pk": 37, "has_unpublished_changes": false, "live_revision": 109, "expired": false, "locked": false, "body": "<p></p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-23T10:29:14.148Z", "depth": 5, "draft_title": "Policy & Practice Notes", "live": true, "latest_revision_created_at": "2019-01-23T10:29:14.124Z", "owner": 6, "slug": "policy-practice-notes", "search_description": "", "content_type": 31, "title": "Policy & Practice Notes"}	\N	37	6
88	f	2019-01-21 15:20:11.65765+00	{"locked": false, "title": "Papers", "draft_title": "Papers", "has_unpublished_changes": true, "first_published_at": null, "depth": 4, "expired": false, "last_published_at": null, "live": false, "content_type": 31, "slug": "papers", "latest_revision_created_at": "2019-01-18T13:10:45.454Z", "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "0001000200050004", "seo_title": "", "live_revision": null, "url_path": "/home2/resources/papers/", "owner": 4, "search_description": "", "pk": 33, "body": "<p>Get access to the latest research publications from the FIELD team here. Pressed for time? Each paper is accompanied with a simple summary and key points so you can read at speed!</p><p>Have any questions about these? Then <a id=\\"8\\" linktype=\\"page\\">contact us</a>.</p>", "go_live_at": null}	\N	33	2
53	f	2019-01-11 14:32:54.570667+00	{"locked": false, "title": "News Item test", "num_comments": 0, "draft_title": "News Item test", "has_unpublished_changes": true, "first_published_at": null, "depth": 4, "expired": false, "last_published_at": null, "entry_categories": [], "related_entrypage_to": [], "date": "2019-01-11T14:28:00Z", "live": false, "content_type": 37, "excerpt": "<p></p>", "header_image": 6, "slug": "news-item-test", "latest_revision_created_at": "2019-01-11T14:31:41.310Z", "show_in_menus": false, "numchild": 0, "expire_at": "2019-01-31T14:32:00Z", "path": "0001000200050003", "seo_title": "", "live_revision": null, "url_path": "/home2/blog-news/news-item-test/", "owner": 4, "search_description": "", "entry_tags": [{"content_object": 26, "pk": null, "tag": 2}, {"content_object": 26, "pk": null, "tag": 3}], "pk": 26, "related_entrypage_from": [], "body": "<p>With a user centred design, we allow the site visitor to decide how detailed they want their investigation to be and how they want to interact with the data. The tool is responsive to their demands, regardless of whether they want to experiment with top level data scenarios or perform a precise interrogation of the full dataset all using the same simple graphical interface.</p>", "go_live_at": "2019-01-23T14:32:00Z"}	\N	26	2
52	f	2019-01-11 14:31:41.31097+00	{"locked": false, "title": "News Item test", "num_comments": 0, "draft_title": "News Item test", "has_unpublished_changes": false, "first_published_at": null, "depth": 4, "expired": false, "last_published_at": null, "entry_categories": [], "related_entrypage_to": [], "date": "2019-01-11T14:28:00Z", "live": false, "content_type": 37, "excerpt": "", "header_image": 6, "slug": "news-item-test", "latest_revision_created_at": null, "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "0001000200050003", "seo_title": "", "live_revision": null, "url_path": "/home2/blog-news/news-item-test/", "owner": 2, "search_description": "", "entry_tags": [{"content_object": 26, "pk": 1, "tag": 2}, {"content_object": 26, "pk": 2, "tag": 3}], "pk": 26, "related_entrypage_from": [], "body": "<p>With a user centred design, we allow the site visitor to decide how detailed they want their investigation to be and how they want to interact with the data. The tool is responsive to their demands, regardless of whether they want to experiment with top level data scenarios or perform a precise interrogation of the full dataset all using the same simple graphical interface.</p>", "go_live_at": null}	\N	26	2
54	f	2019-01-11 14:33:17.859665+00	{"locked": false, "title": "News Item test", "num_comments": 0, "draft_title": "News Item test", "has_unpublished_changes": true, "first_published_at": null, "depth": 4, "expired": false, "last_published_at": null, "entry_categories": [], "related_entrypage_to": [], "date": "2019-01-11T14:28:00Z", "live": false, "content_type": 37, "excerpt": "<p></p>", "header_image": 6, "slug": "news-item-test", "latest_revision_created_at": "2019-01-11T14:32:54.570Z", "show_in_menus": false, "numchild": 0, "expire_at": "2019-01-31T14:32:00Z", "path": "0001000200050003", "seo_title": "", "live_revision": null, "url_path": "/home2/blog-news/news-item-test/", "owner": 4, "search_description": "", "entry_tags": [{"content_object": 26, "pk": null, "tag": 2}, {"content_object": 26, "pk": null, "tag": 3}], "pk": 26, "related_entrypage_from": [], "body": "<p>With a user centred design, we allow the site visitor to decide how detailed they want their investigation to be and how they want to interact with the data. The tool is responsive to their demands, regardless of whether they want to experiment with top level data scenarios or perform a precise interrogation of the full dataset all using the same simple graphical interface.</p>", "go_live_at": "2019-01-11T14:32:00Z"}	\N	26	2
3	f	2019-01-09 02:25:07.923524+00	{"display_tags": true, "show_in_menus": true, "num_popular_entries": 3, "num_entries_page": 5, "path": "00010002", "last_published_at": null, "go_live_at": null, "depth": 2, "num_last_entries": 3, "expire_at": null, "live": true, "title": "Blog & News", "display_categories": true, "url_path": "/blog-news/", "search_description": "", "description": "", "display_last_entries": true, "locked": false, "disqus_shortname": "", "display_popular_entries": true, "latest_revision_created_at": null, "has_unpublished_changes": false, "short_feed_description": true, "num_tags_entry_header": 5, "expired": false, "slug": "blog-news", "draft_title": "Blog & News", "header_image": null, "content_type": 33, "pk": 3, "numchild": 0, "display_archive": true, "owner": 1, "first_published_at": null, "seo_title": "", "display_comments": false, "disqus_api_secret": "", "live_revision": null, "main_color": "#4d6ae0"}	\N	3	1
116	f	2019-01-25 12:49:42.273326+00	{"go_live_at": null, "search_description": "", "slug": "focus-consumers", "depth": 4, "show_in_menus": true, "expired": false, "url_path": "/home2/groups/focus-consumers/", "numchild": 0, "first_published_at": "2019-01-11T11:59:50.233Z", "has_unpublished_changes": false, "last_published_at": "2019-01-11T12:07:17.890Z", "title": "Focus on Consumers", "expire_at": null, "draft_title": "Focus on Consumers", "path": "0001000200030003", "live_revision": 44, "content_type": 31, "owner": 2, "pk": 20, "seo_title": "", "locked": false, "live": true, "body": "<p></p><p>[Timeline]</p><p></p><h2><a id=\\"29\\" linktype=\\"page\\">Media</a></h2>", "latest_revision_created_at": "2019-01-11T12:07:17.862Z"}	\N	20	6
58	f	2019-01-17 11:53:53.714123+00	{"locked": false, "title": "Meet the team", "draft_title": "Meet the team", "has_unpublished_changes": false, "first_published_at": "2019-01-10T13:08:57.025Z", "depth": 4, "expired": false, "last_published_at": "2019-01-11T02:32:53.625Z", "live": true, "content_type": 31, "slug": "meet-team", "latest_revision_created_at": "2019-01-11T02:32:53.600Z", "show_in_menus": true, "numchild": 0, "expire_at": null, "path": "0001000200030002", "seo_title": "", "live_revision": 30, "url_path": "/home2/about/meet-team/", "owner": 2, "search_description": "", "pk": 15, "body": "<h3>Prof Abigail Woods</h3><h4>King&#x27;s College London<br/>History </h4><p>Abigail Woods is Head of the Department of History, and <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Professor in the History of Human and </a><a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Animal Health at King&#x27;s College London.</a>  Reflecting her earlier career as a veterinary surgeon, her research focuses on the history of animal health in 19th and 20th century Britain, and its intersections with the histories of human health and <br/>livestock production. Recent research has explored the history of veterinary expertise, policy and practice; the changing concepts of animal health, welfare and productivity; and how patterns and perceptions of livestock disease have changed over time. As leader of the FIELD project, she is developing the first social histories of BVD and cattle lameness, and bringing them into dialogue with contemporary scientific and social scientific perspectives.</p><p></p><h3>Nicole Gosling</h3><h4>King&#x27;s College London<br/>History </h4><p>Nicole Gosling is a PhD student at King\\u2019s College in London and will be writing her dissertation as a contribution to the FIELD project. She studied her BSc in Ecology at the University of Victoria, and recently completed an MA in Environmental History at Uppsala University. Broadly speaking, Nicole\\u2019s interests include how humans interact with nature, with a focus on human-animal relationships. She explored these relationships in her master\\u2019s thesis \\u2018Making Sense of Cattle: A story from farm to food\\u2019 whereshe looked at how different actors experience cattle bodies during the production of beef. Building on this line of thinking, Nicole\\u2019s role in the FIELD project will be focused on the history of lameness in sheep.</p><p></p><h3>Prof Karen Sayer</h3><h4>Leeds Trinity University<br/>Social Science</h4><p>Awaiting text. </p><p></p><h3>Dr James Bowen </h3><h4>Leeds Trinity University<br/>History </h4><p>James P. Bowen is a Post-Doctoral Research Associate in History based at Leeds Trinity University with research interests in agricultural and rural history. He was formerly a Research Associate (Victoria County History-Cumbria Project)in the Department of History, Lancaster University and was the Contributing Editor for The Herefordshire Victoria County History Trust Short on the parish of Colwall. He was formerly a Post-Doctoral Research Associate based at the Department of Geography and Planning, University of Liverpool employed on \\u2018Spaces of experience and horizons of expectation: the implications of extreme weather events, past, present and future\\u2019, a three-year project, funded as part of the Care for the Future programme of the Arts and Humanities Research Council.He completed a PhD at Lancaster University supervised by Professor A.J.L. Winchester and held the Economic History Society\\u2019s Tawney Junior Research Fellowship in 2012-13 at the Institute of Historical Research, London.</p><p></p><h3>Dr Amy Proctor</h3><h4>Newcastle University<br/>History </h4><p>Amy Proctor is based at the Centre for Rural Economy at Newcastle University. She is interested in agricultural extension and processes of expertise exchange within rural land management and has published widely on this. Her research has focused on the knowledge-practices of farmers and their advisers and the performance and practice of the advisory encounter. Amy is also interested in developing innovative and interactive ways of engaging with stakeholders and has co-led landbridge, a national knowledge exchange network for rural professionals which provides a platform for inter-professional learning and debate among farm advisors and opportunities for exchange with research communities. In FIELD, Amy will develop and conduct the social science aspects of the project including in-depth interviews and ethnographic research with farmers and advisers and focus groups with farmers and consumers.   </p><p></p><h3>Sue Bradley</h3><h4>Newcastle University<br/>History</h4><p>Sue Bradley is an oral historian in the Centre for Rural Economy, Newcastle University, where her research has ranged from flood risk to honey bee health and veterinary practice. She is interested in how oral history can help to address current concerns, and in using audio testimonies from older practitioners as a basis for discussions with their counterparts today. Her work for FIELD includes recording a collection of life-story interviews that will contribute insights from first-hand accounts of working with cattle and sheep in the north of England since the 1940s. This collection will be archived at the Museum for English Rural Life to serve beyond the project as a permanent public research resource.  Sue also works part-time in <a href=\\"https://research.ncl.ac.uk/oralhistory/\\">Newcastle University\\u2019s Oral History Unit</a>. Before coming to Newcastle she was responsible for creating the British Library\\u2019s Book Trade Lives collection of recordings with booksellers and publishers.  </p><p></p><h3>Dr Beth Clark</h3><h4>Newcastle University<br/>History</h4><p>Beth\\u2019s research background in sports, exercise and nutrition and food marketing reflects her research interests in food and communication. She is particularly interested in exploring how people relate to animal products and different food production practices, such as motivations for food choice, innovation and technology in production, knowledge of food production practices, and food cultures. Through this she works with a range of stakeholders from across the food supply chain, which has fueled an interest in communication, including how individuals and groups share information and trust different information sources.She has two roles on the FIELD project. The first is part of the social science research team, involving interviews, focus groups and observations with farmers, farming advisors and the public, to explore their different experiences and perceptions of endemic livestock disease. The second role focuses on public engagement, including the online communications and website for FIELD, as well as identifying and organising opportunities for greater interaction with the projects many stakeholders, including members of the farming community and the public. Beth&#x27;s homepage can be found <a href=\\"https://www.ncl.ac.uk/nes/staff/profile/bethclark.html#background\\">here</a>, and her Twitter handle is @bethy_clark</p><p></p><h3>Dr Ewan Coleman</h3><h4>University of Edinburgh<br/>Epidemiology &amp; Economics</h4><p>Ewan Colman is a post-doctoral research associate at the Roslin Institute at the University of Edinburgh. He has a background in mathematics, particularly in applied probability, data science, and network science. His research uses computational modelling to explore the relationship between behaviour and the spread of infectious disease. Ewan&#x27;s past interests include the dynamics of conversations on social media, the social and spatial organization of ant colonies, and the how the ever-increasing amount of public health data can be exploited to detect and mitigate epidemic diseases. As a member of the FIELD project, he will focus on the spread of BVD through cattle trade, and how changing attitudes towards biosecurity can reduce the prevalence of BVD on a national scale.</p><p></p><h3>Prof Rowland Kao</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Awaiting text</p><p></p><h3>Maria Suella Rodrigues</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Maria Suella Rodrigues is a doctoral candidate at the University of Glasgow, supervised under Professor Nicholas Hanley (MVLS), Dr. Souvik Datta (ASBS) at the University of Glasgow and Professor Rowland Kao from the University of Edinburgh. Maria holds a BSc degree in Economics from Lancaster University. Following that she moved to the University of Glasgow where she pursued the MRes in Economics, graduating in 2018. She is interested in investigating research questions in the areas of agricultural and environmental economics as well as applied micro-econometrics and choice-modelling theory. During her MRes dissertation she modelled consumer preferences for forest disease management with use of Choice modelling data. Additionally, she has received extensive training in choice-modelling from the Choice Modelling Centre, University of Leeds. As part of the FIELD project, Maria will design field experiments and model both farmer and consumer preferences in relation to farm animal welfare. Maria&#x27;s LinkedIn can be found <a href=\\"https://www.linkedin.com/in/mariasuellarodrigues-a2765311/\\">here</a>, and her Twitter handle is @jammar90</p><p></p><h3>Dr Lewis Holloway</h3><h4>University of Hull<br/>Social Science</h4><p> <a href=\\"https://www.hull.ac.uk/faculties/staff-profiles/lewis-holloway.aspx\\">Lewis Holloway</a> is a Reader in Human Geography at the University of Hull. He has research interests in food, farming and the countryside, and has a particular interest in farm animals and agricultural technologies. Recent research has focused on the ways in which genetic, information and robotic technologies have affected livestock farming, and has involved in-depth research with farmers and technology developers to understand how new technologies are engaged with, adopted and contested by farmers. Lewis is interested in the situated ethics associated with animal agriculture, and in how technologies can transform farming ethics and knowledge-practices. Lewis will be involved in developing and conducting the social scientific elements of the FIELD project. This will include on-farm interview and observational work with farmers, farm animals and expert advisors, and focus groups with farmers and public groups.</p><p></p><h3>Dr Niamh Mahon</h3><h4>University of Hull<br/>Social Science</h4><p><a href=\\"https://www.researchgate.net/profile/Niamh_Mahon\\">Niamh</a> is a Post-Doctoral Research Associate at the University of Hull. In this role she is involved in the social science components of the FIELD project. This includes in-depth interviews and observational work with farmers and expert advisors, and focus groups with farmers and the public, conducted to explore their different experiences and perceptions of endemic livestock disease.Prior to this Niamh under took a PhD at Nottingham Trent University developing stakeholder-sensitive indicators of the Sustainable Intensification of UK agriculture and a Master\\u2019s degree from the University of East Anglia in Sustainable Agriculture and Food Security. She has also worked as a research assistant in socio-economics and policy for the Organic Research Centre. Niamh is a member of the Food and Climate Research Network and the Sustainable Intensification Research Network.</p><p></p><h3>Prof Nick Hanley</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Nick Hanley is a Professor of Environmental and One Health Economics at the University of Glasgow. His PhD was in Agricultural Economics. His current main research interests include behavioural economics, the design of Payment for Ecosystem Service schemes, environmental valuation,one health economics, the economics of sustainable development, markets for biodiversity offsets,and the economics of invasive species.He is an honorary professor at the universities of St Andrewsand Stirling. Nick is co-author of a textbook in environmental cost-benefit analysis with Edward Barbier; and two textbooks on environmental economics (with Jason Shogren and Ben White).</p><p></p>", "go_live_at": null}	\N	15	6
59	f	2019-01-17 11:54:12.219696+00	{"locked": false, "title": "Meet the team", "draft_title": "Meet the team", "has_unpublished_changes": true, "first_published_at": "2019-01-10T13:08:57.025Z", "depth": 4, "expired": false, "last_published_at": "2019-01-11T02:32:53.625Z", "live": true, "content_type": 31, "slug": "meet-team", "latest_revision_created_at": "2019-01-17T11:53:53.714Z", "show_in_menus": true, "numchild": 0, "expire_at": null, "path": "0001000200030002", "seo_title": "", "live_revision": 30, "url_path": "/home2/about/meet-team/", "owner": 2, "search_description": "", "pk": 15, "body": "<h3>Prof Abigail Woods</h3><h4>King&#x27;s College London<br/>History</h4><p>Abigail Woods is Head of the Department of History, and <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Professor in the History of Human and</a> <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Animal Health at King&#x27;s College London.</a> Reflecting her earlier career as a veterinary surgeon, her research focuses on the history of animal health in 19th and 20th century Britain, and its intersections with the histories of human health and<br/> livestock production. Recent research has explored the history of veterinary expertise, policy and practice; the changing concepts of animal health, welfare and productivity; and how patterns and perceptions of livestock disease have changed over time. As leader of the FIELD project, she is developing the first social histories of BVD and cattle lameness, and bringing them into dialogue with contemporary scientific and social scientific perspectives.</p><p></p><h3>Nicole Gosling</h3><h4>King&#x27;s College London<br/>History</h4><p>Nicole Gosling is a PhD student at King\\u2019s College in London and will be writing her dissertation as a contribution to the FIELD project. She studied her BSc in Ecology at the University of Victoria, and recently completed an MA in Environmental History at Uppsala University. Broadly speaking, Nicole\\u2019s interests include how humans interact with nature, with a focus on human-animal relationships. She explored these relationships in her master\\u2019s thesis \\u2018Making Sense of Cattle: A story from farm to food\\u2019 whereshe looked at how different actors experience cattle bodies during the production of beef. Building on this line of thinking, Nicole\\u2019s role in the FIELD project will be focused on the history of lameness in sheep.</p><p></p><h3>Prof Karen Sayer</h3><h4>Leeds Trinity University<br/>Social Science</h4><p>Awaiting text.</p><p></p><h3>Dr James Bowen</h3><h4>Leeds Trinity University<br/>History</h4><p>James P. Bowen is a Post-Doctoral Research Associate in History based at Leeds Trinity University with research interests in agricultural and rural history. He was formerly a Research Associate (Victoria County History-Cumbria Project)in the Department of History, Lancaster University and was the Contributing Editor for The Herefordshire Victoria County History Trust Short on the parish of Colwall. He was formerly a Post-Doctoral Research Associate based at the Department of Geography and Planning, University of Liverpool employed on \\u2018Spaces of experience and horizons of expectation: the implications of extreme weather events, past, present and future\\u2019, a three-year project, funded as part of the Care for the Future programme of the Arts and Humanities Research Council.He completed a PhD at Lancaster University supervised by Professor A.J.L. Winchester and held the Economic History Society\\u2019s Tawney Junior Research Fellowship in 2012-13 at the Institute of Historical Research, London.</p><p></p><h3>Dr Amy Proctor</h3><h4>Newcastle University<br/>History</h4><p>Amy Proctor is based at the Centre for Rural Economy at Newcastle University. She is interested in agricultural extension and processes of expertise exchange within rural land management and has published widely on this. Her research has focused on the knowledge-practices of farmers and their advisers and the performance and practice of the advisory encounter. Amy is also interested in developing innovative and interactive ways of engaging with stakeholders and has co-led landbridge, a national knowledge exchange network for rural professionals which provides a platform for inter-professional learning and debate among farm advisors and opportunities for exchange with research communities. In FIELD, Amy will develop and conduct the social science aspects of the project including in-depth interviews and ethnographic research with farmers and advisers and focus groups with farmers and consumers.</p><p></p><h3>Sue Bradley</h3><h4>Newcastle University<br/>History</h4><p>Sue Bradley is an oral historian in the Centre for Rural Economy, Newcastle University, where her research has ranged from flood risk to honey bee health and veterinary practice. She is interested in how oral history can help to address current concerns, and in using audio testimonies from older practitioners as a basis for discussions with their counterparts today. Her work for FIELD includes recording a collection of life-story interviews that will contribute insights from first-hand accounts of working with cattle and sheep in the north of England since the 1940s. This collection will be archived at the Museum for English Rural Life to serve beyond the project as a permanent public research resource. Sue also works part-time in <a href=\\"https://research.ncl.ac.uk/oralhistory/\\">Newcastle University\\u2019s Oral History Unit</a>. Before coming to Newcastle she was responsible for creating the British Library\\u2019s Book Trade Lives collection of recordings with booksellers and publishers.</p><p></p><h3>Dr Beth Clark</h3><h4>Newcastle University<br/>History</h4><p>Beth\\u2019s research background in sports, exercise and nutrition and food marketing reflects her research interests in food and communication. She is particularly interested in exploring how people relate to animal products and different food production practices, such as motivations for food choice, innovation and technology in production, knowledge of food production practices, and food cultures. Through this she works with a range of stakeholders from across the food supply chain, which has fueled an interest in communication, including how individuals and groups share information and trust different information sources.She has two roles on the FIELD project. The first is part of the social science research team, involving interviews, focus groups and observations with farmers, farming advisors and the public, to explore their different experiences and perceptions of endemic livestock disease. The second role focuses on public engagement, including the online communications and website for FIELD, as well as identifying and organising opportunities for greater interaction with the projects many stakeholders, including members of the farming community and the public. Beth&#x27;s homepage can be found <a href=\\"https://www.ncl.ac.uk/nes/staff/profile/bethclark.html#background\\">here</a>, and her Twitter handle is @bethy_clark</p><p></p><h3>Dr Ewan Coleman</h3><h4>University of Edinburgh<br/>Epidemiology &amp; Economics</h4><p>Ewan Colman is a post-doctoral research associate at the Roslin Institute at the University of Edinburgh. He has a background in mathematics, particularly in applied probability, data science, and network science. His research uses computational modelling to explore the relationship between behaviour and the spread of infectious disease. Ewan&#x27;s past interests include the dynamics of conversations on social media, the social and spatial organization of ant colonies, and the how the ever-increasing amount of public health data can be exploited to detect and mitigate epidemic diseases. As a member of the FIELD project, he will focus on the spread of BVD through cattle trade, and how changing attitudes towards biosecurity can reduce the prevalence of BVD on a national scale.</p><p></p><h3>Prof Rowland Kao</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Awaiting text</p><p></p><h3>Maria Suella Rodrigues</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Maria Suella Rodrigues is a doctoral candidate at the University of Glasgow, supervised under Professor Nicholas Hanley (MVLS), Dr. Souvik Datta (ASBS) at the University of Glasgow and Professor Rowland Kao from the University of Edinburgh. Maria holds a BSc degree in Economics from Lancaster University. Following that she moved to the University of Glasgow where she pursued the MRes in Economics, graduating in 2018. She is interested in investigating research questions in the areas of agricultural and environmental economics as well as applied micro-econometrics and choice-modelling theory. During her MRes dissertation she modelled consumer preferences for forest disease management with use of Choice modelling data. Additionally, she has received extensive training in choice-modelling from the Choice Modelling Centre, University of Leeds. As part of the FIELD project, Maria will design field experiments and model both farmer and consumer preferences in relation to farm animal welfare. Maria&#x27;s LinkedIn can be found <a href=\\"https://www.linkedin.com/in/mariasuellarodrigues-a2765311/\\">here</a>, and her Twitter handle is @jammar90</p><p></p><h3>Dr Lewis Holloway</h3><h4>University of Hull<br/>Social Science</h4><p><a href=\\"https://www.hull.ac.uk/faculties/staff-profiles/lewis-holloway.aspx\\">Lewis Holloway</a> is a Reader in Human Geography at the University of Hull. He has research interests in food, farming and the countryside, and has a particular interest in farm animals and agricultural technologies. Recent research has focused on the ways in which genetic, information and robotic technologies have affected livestock farming, and has involved in-depth research with farmers and technology developers to understand how new technologies are engaged with, adopted and contested by farmers. Lewis is interested in the situated ethics associated with animal agriculture, and in how technologies can transform farming ethics and knowledge-practices. Lewis will be involved in developing and conducting the social scientific elements of the FIELD project. This will include on-farm interview and observational work with farmers, farm animals and expert advisors, and focus groups with farmers and public groups.</p><p></p><h3>Dr Niamh Mahon</h3><h4>University of Hull<br/>Social Science</h4><p><a href=\\"https://www.researchgate.net/profile/Niamh_Mahon\\">Niamh</a> is a Post-Doctoral Research Associate at the University of Hull. In this role she is involved in the social science components of the FIELD project. This includes in-depth interviews and observational work with farmers and expert advisors, and focus groups with farmers and the public, conducted to explore their different experiences and perceptions of endemic livestock disease.Prior to this Niamh under took a PhD at Nottingham Trent University developing stakeholder-sensitive indicators of the Sustainable Intensification of UK agriculture and a Master\\u2019s degree from the University of East Anglia in Sustainable Agriculture and Food Security. She has also worked as a research assistant in socio-economics and policy for the Organic Research Centre. Niamh is a member of the Food and Climate Research Network and the Sustainable Intensification Research Network.</p><p></p><h3>Prof Nick Hanley</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Nick Hanley is a Professor of Environmental and One Health Economics at the University of Glasgow. His PhD was in Agricultural Economics. His current main research interests include behavioural economics, the design of Payment for Ecosystem Service schemes, environmental valuation,one health economics, the economics of sustainable development, markets for biodiversity offsets,and the economics of invasive species.He is an honorary professor at the universities of St Andrews and Stirling. Nick is co-author of a textbook in environmental cost-benefit analysis with Edward Barbier; and two textbooks on environmental economics (with Jason Shogren and Ben White).</p><p></p>", "go_live_at": null}	\N	15	6
60	f	2019-01-17 12:15:19.48459+00	{"locked": false, "title": "Meet the team", "draft_title": "Meet the team", "has_unpublished_changes": true, "first_published_at": "2019-01-10T13:08:57.025Z", "depth": 4, "expired": false, "last_published_at": "2019-01-11T02:32:53.625Z", "live": true, "content_type": 31, "slug": "meet-team", "latest_revision_created_at": "2019-01-17T11:54:12.219Z", "show_in_menus": true, "numchild": 0, "expire_at": null, "path": "0001000200030002", "seo_title": "", "live_revision": 30, "url_path": "/home2/about/meet-team/", "owner": 2, "search_description": "", "pk": 15, "body": "<h3>Prof Abigail Woods</h3><h4>King&#x27;s College London<br/>History</h4><p>Abigail Woods is Head of the Department of History, and <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Professor in the History of Human and</a> <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Animal Health at King&#x27;s College London.</a> Reflecting her earlier career as a veterinary surgeon, her research focuses on the history of animal health in 19th and 20th century Britain, and its intersections with the histories of human health and<br/> livestock production. Recent research has explored the history of veterinary expertise, policy and practice; the changing concepts of animal health, welfare and productivity; and how patterns and perceptions of livestock disease have changed over time. As leader of the FIELD project, she is developing the first social histories of BVD and cattle lameness, and bringing them into dialogue with contemporary scientific and social scientific perspectives.</p><p></p><h3>Nicole Gosling</h3><h4>King&#x27;s College London<br/>History</h4><p>Nicole Gosling is a PhD student at King\\u2019s College in London and will be writing her dissertation as a contribution to the FIELD project. She studied her BSc in Ecology at the University of Victoria, and recently completed an MA in Environmental History at Uppsala University. Broadly speaking, Nicole\\u2019s interests include how humans interact with nature, with a focus on human-animal relationships. She explored these relationships in her master\\u2019s thesis \\u2018Making Sense of Cattle: A story from farm to food\\u2019 whereshe looked at how different actors experience cattle bodies during the production of beef. Building on this line of thinking, Nicole\\u2019s role in the FIELD project will be focused on the history of lameness in sheep.</p><p></p><h3>Prof Karen Sayer</h3><h4>Leeds Trinity University<br/>Social Science</h4><p>Awaiting text.</p><p></p><h3>Dr James Bowen</h3><h4>Leeds Trinity University<br/>History</h4><p>James P. Bowen is a Post-Doctoral Research Associate in History based at Leeds Trinity University with research interests in agricultural and rural history. He was formerly a Research Associate (Victoria County History-Cumbria Project)in the Department of History, Lancaster University and was the Contributing Editor for The Herefordshire Victoria County History Trust Short on the parish of Colwall. He was formerly a Post-Doctoral Research Associate based at the Department of Geography and Planning, University of Liverpool employed on \\u2018Spaces of experience and horizons of expectation: the implications of extreme weather events, past, present and future\\u2019, a three-year project, funded as part of the Care for the Future programme of the Arts and Humanities Research Council.He completed a PhD at Lancaster University supervised by Professor A.J.L. Winchester and held the Economic History Society\\u2019s Tawney Junior Research Fellowship in 2012-13 at the Institute of Historical Research, London.</p><p></p><h3>Dr Amy Proctor</h3><h4>Newcastle University<br/>History</h4><p>Amy Proctor is based at the Centre for Rural Economy at Newcastle University. She is interested in agricultural extension and processes of expertise exchange within rural land management and has published widely on this. Her research has focused on the knowledge-practices of farmers and their advisers and the performance and practice of the advisory encounter. Amy is also interested in developing innovative and interactive ways of engaging with stakeholders and has co-led landbridge, a national knowledge exchange network for rural professionals which provides a platform for inter-professional learning and debate among farm advisors and opportunities for exchange with research communities. In FIELD, Amy will develop and conduct the social science aspects of the project including in-depth interviews and ethnographic research with farmers and advisers and focus groups with farmers and consumers.</p><p></p><h3>Sue Bradley</h3><h4>Newcastle University<br/>History</h4><p>Sue Bradley is an oral historian in the Centre for Rural Economy, Newcastle University, where her research has ranged from flood risk to honey bee health and veterinary practice. She is interested in how oral history can help to address current concerns, and in using audio testimonies from older practitioners as a basis for discussions with their counterparts today. Her work for FIELD includes recording a collection of life-story interviews that will contribute insights from first-hand accounts of working with cattle and sheep in the north of England since the 1940s. This collection will be archived at the Museum for English Rural Life to serve beyond the project as a permanent public research resource. Sue also works part-time in <a href=\\"https://research.ncl.ac.uk/oralhistory/\\">Newcastle University\\u2019s Oral History Unit</a>. Before coming to Newcastle she was responsible for creating the British Library\\u2019s Book Trade Lives collection of recordings with booksellers and publishers.</p><p></p><h3>Dr Beth Clark</h3><h4>Newcastle University<br/>History</h4><p>Beth\\u2019s research background in sports, exercise and nutrition and food marketing reflects her research interests in food and communication. She is particularly interested in exploring how people relate to animal products and different food production practices, such as motivations for food choice, innovation and technology in production, knowledge of food production practices, and food cultures. Through this she works with a range of stakeholders from across the food supply chain, which has fueled an interest in communication, including how individuals and groups share information and trust different information sources.She has two roles on the FIELD project. The first is part of the social science research team, involving interviews, focus groups and observations with farmers, farming advisors and the public, to explore their different experiences and perceptions of endemic livestock disease. The second role focuses on public engagement, including the online communications and website for FIELD, as well as identifying and organising opportunities for greater interaction with the projects many stakeholders, including members of the farming community and the public. Beth&#x27;s homepage can be found <a href=\\"https://www.ncl.ac.uk/nes/staff/profile/bethclark.html#background\\">here</a>, and her Twitter handle is @bethy_clark</p><p></p><h3>Dr Ewan Coleman</h3><h4>University of Edinburgh<br/>Epidemiology &amp; Economics</h4><p>Ewan Colman is a post-doctoral research associate at the Roslin Institute at the University of Edinburgh. He has a background in mathematics, particularly in applied probability, data science, and network science. His research uses computational modelling to explore the relationship between behaviour and the spread of infectious disease. Ewan&#x27;s past interests include the dynamics of conversations on social media, the social and spatial organization of ant colonies, and the how the ever-increasing amount of public health data can be exploited to detect and mitigate epidemic diseases. As a member of the FIELD project, he will focus on the spread of BVD through cattle trade, and how changing attitudes towards biosecurity can reduce the prevalence of BVD on a national scale.</p><p></p><h3>Prof Rowland Kao</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Awaiting text</p><p></p><h3>Maria Suella Rodrigues</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Maria Suella Rodrigues is a doctoral candidate at the University of Glasgow, supervised under Professor Nicholas Hanley (MVLS), Dr. Souvik Datta (ASBS) at the University of Glasgow and Professor Rowland Kao from the University of Edinburgh. Maria holds a BSc degree in Economics from Lancaster University. Following that she moved to the University of Glasgow where she pursued the MRes in Economics, graduating in 2018. She is interested in investigating research questions in the areas of agricultural and environmental economics as well as applied micro-econometrics and choice-modelling theory. During her MRes dissertation she modelled consumer preferences for forest disease management with use of Choice modelling data. Additionally, she has received extensive training in choice-modelling from the Choice Modelling Centre, University of Leeds. As part of the FIELD project, Maria will design field experiments and model both farmer and consumer preferences in relation to farm animal welfare. Maria&#x27;s LinkedIn can be found <a href=\\"https://www.linkedin.com/in/mariasuellarodrigues-a2765311/\\">here</a>, and her Twitter handle is @jammar90</p><p></p><h3>Dr Lewis Holloway</h3><h4>University of Hull<br/>Social Science</h4><p><a href=\\"https://www.hull.ac.uk/faculties/staff-profiles/lewis-holloway.aspx\\">Lewis Holloway</a> is a Reader in Human Geography at the University of Hull. He has research interests in food, farming and the countryside, and has a particular interest in farm animals and agricultural technologies. Recent research has focused on the ways in which genetic, information and robotic technologies have affected livestock farming, and has involved in-depth research with farmers and technology developers to understand how new technologies are engaged with, adopted and contested by farmers. Lewis is interested in the situated ethics associated with animal agriculture, and in how technologies can transform farming ethics and knowledge-practices. Lewis will be involved in developing and conducting the social scientific elements of the FIELD project. This will include on-farm interview and observational work with farmers, farm animals and expert advisors, and focus groups with farmers and public groups.</p><p></p><h3>Dr Niamh Mahon</h3><h4>University of Hull<br/>Social Science</h4><p><a href=\\"https://www.researchgate.net/profile/Niamh_Mahon\\">Niamh</a> is a Post-Doctoral Research Associate at the University of Hull. In this role she is involved in the social science components of the FIELD project. This includes in-depth interviews and observational work with farmers and expert advisors, and focus groups with farmers and the public, conducted to explore their different experiences and perceptions of endemic livestock disease.Prior to this Niamh under took a PhD at Nottingham Trent University developing stakeholder-sensitive indicators of the Sustainable Intensification of UK agriculture and a Master\\u2019s degree from the University of East Anglia in Sustainable Agriculture and Food Security. She has also worked as a research assistant in socio-economics and policy for the Organic Research Centre. Niamh is a member of the Food and Climate Research Network and the Sustainable Intensification Research Network.</p><p></p><h3>Prof Nick Hanley</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Nick Hanley is a Professor of Environmental and One Health Economics at the University of Glasgow. His PhD was in Agricultural Economics. His current main research interests include behavioural economics, the design of Payment for Ecosystem Service schemes, environmental valuation,one health economics, the economics of sustainable development, markets for biodiversity offsets,and the economics of invasive species.He is an honorary professor at the universities of St Andrews and Stirling. Nick is co-author of a textbook in environmental cost-benefit analysis with Edward Barbier; and two textbooks on environmental economics (with Jason Shogren and Ben White).</p><p></p>", "go_live_at": null}	\N	15	6
61	f	2019-01-17 12:16:28.940008+00	{"locked": false, "title": "Meet the team", "draft_title": "Meet the team", "has_unpublished_changes": true, "first_published_at": "2019-01-10T13:08:57.025Z", "depth": 4, "expired": false, "last_published_at": "2019-01-11T02:32:53.625Z", "live": true, "content_type": 31, "slug": "meet-team", "latest_revision_created_at": "2019-01-17T12:15:19.484Z", "show_in_menus": true, "numchild": 0, "expire_at": null, "path": "0001000200030002", "seo_title": "", "live_revision": 30, "url_path": "/home2/about/meet-team/", "owner": 2, "search_description": "", "pk": 15, "body": "<h3>Prof Abigail Woods</h3><h4>King&#x27;s College London<br/>History</h4><p>Abigail Woods is Head of the Department of History, and <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Professor in the History of Human and</a> <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Animal Health at King&#x27;s College London.</a> Reflecting her earlier career as a veterinary surgeon, her research focuses on the history of animal health in 19th and 20th century Britain, and its intersections with the histories of human health and<br/> livestock production. Recent research has explored the history of veterinary expertise, policy and practice; the changing concepts of animal health, welfare and productivity; and how patterns and perceptions of livestock disease have changed over time. As leader of the FIELD project, she is developing the first social histories of BVD and cattle lameness, and bringing them into dialogue with contemporary scientific and social scientific perspectives.</p><p></p><hr/><p></p><h3>Nicole Gosling</h3><h4>King&#x27;s College London<br/>History</h4><p>Nicole Gosling is a PhD student at King\\u2019s College in London and will be writing her dissertation as a contribution to the FIELD project. She studied her BSc in Ecology at the University of Victoria, and recently completed an MA in Environmental History at Uppsala University. Broadly speaking, Nicole\\u2019s interests include how humans interact with nature, with a focus on human-animal relationships. She explored these relationships in her master\\u2019s thesis \\u2018Making Sense of Cattle: A story from farm to food\\u2019 whereshe looked at how different actors experience cattle bodies during the production of beef. Building on this line of thinking, Nicole\\u2019s role in the FIELD project will be focused on the history of lameness in sheep.</p><p></p><hr/><p></p><h3>Prof Karen Sayer</h3><h4>Leeds Trinity University<br/>Social Science</h4><p>Awaiting text.</p><p></p><hr/><p></p><h3>Dr James Bowen</h3><h4>Leeds Trinity University<br/>History</h4><p>James P. Bowen is a Post-Doctoral Research Associate in History based at Leeds Trinity University with research interests in agricultural and rural history. He was formerly a Research Associate (Victoria County History-Cumbria Project)in the Department of History, Lancaster University and was the Contributing Editor for The Herefordshire Victoria County History Trust Short on the parish of Colwall. He was formerly a Post-Doctoral Research Associate based at the Department of Geography and Planning, University of Liverpool employed on \\u2018Spaces of experience and horizons of expectation: the implications of extreme weather events, past, present and future\\u2019, a three-year project, funded as part of the Care for the Future programme of the Arts and Humanities Research Council.He completed a PhD at Lancaster University supervised by Professor A.J.L. Winchester and held the Economic History Society\\u2019s Tawney Junior Research Fellowship in 2012-13 at the Institute of Historical Research, London.</p><p></p><hr/><p></p><h3>Dr Amy Proctor</h3><h4>Newcastle University<br/>History</h4><p>Amy Proctor is based at the Centre for Rural Economy at Newcastle University. She is interested in agricultural extension and processes of expertise exchange within rural land management and has published widely on this. Her research has focused on the knowledge-practices of farmers and their advisers and the performance and practice of the advisory encounter. Amy is also interested in developing innovative and interactive ways of engaging with stakeholders and has co-led landbridge, a national knowledge exchange network for rural professionals which provides a platform for inter-professional learning and debate among farm advisors and opportunities for exchange with research communities. In FIELD, Amy will develop and conduct the social science aspects of the project including in-depth interviews and ethnographic research with farmers and advisers and focus groups with farmers and consumers.</p><p></p><hr/><p></p><h3>Sue Bradley</h3><h4>Newcastle University<br/>History</h4><p>Sue Bradley is an oral historian in the Centre for Rural Economy, Newcastle University, where her research has ranged from flood risk to honey bee health and veterinary practice. She is interested in how oral history can help to address current concerns, and in using audio testimonies from older practitioners as a basis for discussions with their counterparts today. Her work for FIELD includes recording a collection of life-story interviews that will contribute insights from first-hand accounts of working with cattle and sheep in the north of England since the 1940s. This collection will be archived at the Museum for English Rural Life to serve beyond the project as a permanent public research resource. Sue also works part-time in <a href=\\"https://research.ncl.ac.uk/oralhistory/\\">Newcastle University\\u2019s Oral History Unit</a>. Before coming to Newcastle she was responsible for creating the British Library\\u2019s Book Trade Lives collection of recordings with booksellers and publishers.</p><p></p><hr/><p></p><h3>Dr Beth Clark</h3><h4>Newcastle University<br/>History</h4><p>Beth\\u2019s research background in sports, exercise and nutrition and food marketing reflects her research interests in food and communication. She is particularly interested in exploring how people relate to animal products and different food production practices, such as motivations for food choice, innovation and technology in production, knowledge of food production practices, and food cultures. Through this she works with a range of stakeholders from across the food supply chain, which has fueled an interest in communication, including how individuals and groups share information and trust different information sources.She has two roles on the FIELD project. The first is part of the social science research team, involving interviews, focus groups and observations with farmers, farming advisors and the public, to explore their different experiences and perceptions of endemic livestock disease. The second role focuses on public engagement, including the online communications and website for FIELD, as well as identifying and organising opportunities for greater interaction with the projects many stakeholders, including members of the farming community and the public. Beth&#x27;s homepage can be found <a href=\\"https://www.ncl.ac.uk/nes/staff/profile/bethclark.html#background\\">here</a>, and her Twitter handle is @bethy_clark</p><p></p><hr/><p></p><h3>Dr Ewan Coleman</h3><h4>University of Edinburgh<br/>Epidemiology &amp; Economics</h4><p>Ewan Colman is a post-doctoral research associate at the Roslin Institute at the University of Edinburgh. He has a background in mathematics, particularly in applied probability, data science, and network science. His research uses computational modelling to explore the relationship between behaviour and the spread of infectious disease. Ewan&#x27;s past interests include the dynamics of conversations on social media, the social and spatial organization of ant colonies, and the how the ever-increasing amount of public health data can be exploited to detect and mitigate epidemic diseases. As a member of the FIELD project, he will focus on the spread of BVD through cattle trade, and how changing attitudes towards biosecurity can reduce the prevalence of BVD on a national scale.</p><p></p><hr/><p></p><h3>Prof Rowland Kao</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Awaiting text</p><p></p><hr/><p></p><h3>Maria Suella Rodrigues</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Maria Suella Rodrigues is a doctoral candidate at the University of Glasgow, supervised under Professor Nicholas Hanley (MVLS), Dr. Souvik Datta (ASBS) at the University of Glasgow and Professor Rowland Kao from the University of Edinburgh. Maria holds a BSc degree in Economics from Lancaster University. Following that she moved to the University of Glasgow where she pursued the MRes in Economics, graduating in 2018. She is interested in investigating research questions in the areas of agricultural and environmental economics as well as applied micro-econometrics and choice-modelling theory. During her MRes dissertation she modelled consumer preferences for forest disease management with use of Choice modelling data. Additionally, she has received extensive training in choice-modelling from the Choice Modelling Centre, University of Leeds. As part of the FIELD project, Maria will design field experiments and model both farmer and consumer preferences in relation to farm animal welfare. Maria&#x27;s LinkedIn can be found <a href=\\"https://www.linkedin.com/in/mariasuellarodrigues-a2765311/\\">here</a>, and her Twitter handle is @jammar90</p><p></p><hr/><p></p><h3>Dr Lewis Holloway</h3><h4>University of Hull<br/>Social Science</h4><p><a href=\\"https://www.hull.ac.uk/faculties/staff-profiles/lewis-holloway.aspx\\">Lewis Holloway</a> is a Reader in Human Geography at the University of Hull. He has research interests in food, farming and the countryside, and has a particular interest in farm animals and agricultural technologies. Recent research has focused on the ways in which genetic, information and robotic technologies have affected livestock farming, and has involved in-depth research with farmers and technology developers to understand how new technologies are engaged with, adopted and contested by farmers. Lewis is interested in the situated ethics associated with animal agriculture, and in how technologies can transform farming ethics and knowledge-practices. Lewis will be involved in developing and conducting the social scientific elements of the FIELD project. This will include on-farm interview and observational work with farmers, farm animals and expert advisors, and focus groups with farmers and public groups.</p><p></p><hr/><p></p><h3>Dr Niamh Mahon</h3><h4>University of Hull<br/>Social Science</h4><p><a href=\\"https://www.researchgate.net/profile/Niamh_Mahon\\">Niamh</a> is a Post-Doctoral Research Associate at the University of Hull. In this role she is involved in the social science components of the FIELD project. This includes in-depth interviews and observational work with farmers and expert advisors, and focus groups with farmers and the public, conducted to explore their different experiences and perceptions of endemic livestock disease.Prior to this Niamh under took a PhD at Nottingham Trent University developing stakeholder-sensitive indicators of the Sustainable Intensification of UK agriculture and a Master\\u2019s degree from the University of East Anglia in Sustainable Agriculture and Food Security. She has also worked as a research assistant in socio-economics and policy for the Organic Research Centre. Niamh is a member of the Food and Climate Research Network and the Sustainable Intensification Research Network.</p><p></p><hr/><p></p><h3>Prof Nick Hanley</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Nick Hanley is a Professor of Environmental and One Health Economics at the University of Glasgow. His PhD was in Agricultural Economics. His current main research interests include behavioural economics, the design of Payment for Ecosystem Service schemes, environmental valuation,one health economics, the economics of sustainable development, markets for biodiversity offsets,and the economics of invasive species.He is an honorary professor at the universities of St Andrews and Stirling. Nick is co-author of a textbook in environmental cost-benefit analysis with Edward Barbier; and two textbooks on environmental economics (with Jason Shogren and Ben White).</p><p></p>", "go_live_at": null}	\N	15	6
149	f	2019-02-01 09:19:10.366418+00	{"first_published_at": "2019-01-10T13:06:00.324Z", "url_path": "/home2/contact-us/", "expire_at": null, "path": "000100020007", "numchild": 0, "show_in_menus": true, "pk": 8, "has_unpublished_changes": true, "live_revision": 25, "expired": false, "locked": false, "body": "<p>Have a question about endemic livestock disease, want to find out more about the project or become involved in the research? We would love to hear from you!</p><p>A core part of the FIELD project is involving as many stakeholders as possible, and that means you! Complete the form below and one of the team will contact you as soon as possible.</p><p></p><p>[Could this be a form template or will it introduce an email pop out?]</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-11T02:30:45.614Z", "depth": 3, "draft_title": "Contact us", "live": true, "latest_revision_created_at": "2019-01-29T16:39:44.483Z", "owner": 2, "slug": "contact-us", "search_description": "", "content_type": 31, "title": "Contact us"}	\N	8	6
64	f	2019-01-18 12:06:54.363771+00	{"locked": false, "title": "Home", "draft_title": "Home", "has_unpublished_changes": false, "first_published_at": "2019-01-11T01:18:30.245Z", "depth": 2, "expired": false, "last_published_at": "2019-01-11T01:24:33.846Z", "live": true, "content_type": 31, "slug": "home2", "latest_revision_created_at": "2019-01-11T01:24:33.826Z", "show_in_menus": true, "numchild": 6, "expire_at": null, "path": "00010002", "seo_title": "", "live_revision": 22, "url_path": "/home2/", "owner": 1, "search_description": "", "pk": 18, "body": "<p>Better ways of understanding livestock disease are urgently required to ensure animal health and welfare, as well as farming sustainability. The Farm-level Interdisciplinary approaches to Endemic Livestock Diseases (FIELD) project, looks to bring together experts from industry, governance and academia to explore the realms of nature and culture, science and society and human and animal, and their impact on disease. Insights from the project will be used to develop better predictions ad disease and further insights into disease management.</p>", "go_live_at": null}	\N	18	4
137	f	2019-01-31 11:18:09.198681+00	{"first_published_at": "2019-01-18T10:05:05.566Z", "url_path": "/home2/about/project/methodology/", "expire_at": null, "path": "00010002000200010002", "numchild": 0, "show_in_menus": false, "pk": 27, "has_unpublished_changes": false, "live_revision": 62, "expired": false, "locked": false, "body": "<p> The research team is formed of three disciplinary clusters. Although the three clusters have their own research they will each will draw upon and feed into the others. Each cluster will therefore not be working in isolation</p><p>More connections between the three will emerge as the project develops, leading to a project which is truly interdisciplinary in nature.</p><p></p><hr/><p></p><hr/><h3></h3><h3>Economics and Epidemiology</h3><p>  Better understanding of the spatial interactions amongst farmers</p><p>Simulation models to enable prediction of responses to a range of factors including disease parameters, costs, support measures and new information</p><p>Examine how farmer decision making is affected by past experience of disease, health and welfare priorities, perceptions and evaluations of disease management methods</p><p>Variation in consumer preferences</p><p>Look to establish trade-offs</p><p>WTP animal welfare in relation to other product attributes</p><hr/><h3></h3><h3>History</h3><p>  Changes over time</p><p>Experience, understanding and management of BVD and lameness</p><p>How the different farming systems have evolved over time and also what are understandings of \\u2018food farming\\u2019 for different stakeholders</p><p>Texts, images and existing oral history recordings, including journal articles, advertising material, popular press, government material and grey literature and films</p><p>Also give an indication of who is giving what advice</p><p>Creation of a timeline</p><p>Understanding the influence of historical forces can also help us to better understand the present, in relation to farming practices, sources of information and consumer behaviour</p><p>Oral history to promote discussion and reflection<br/></p><hr/><h3></h3><h3>Social Science</h3><p>  </p><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p>Farm walks to understand the real world context of disease</p><p>Explore how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other</p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters  </p><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p>Farm walks to understand the real world context of disease</p><p>Explore how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other</p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-18T10:05:05.566Z", "depth": 5, "draft_title": "Methodology", "live": true, "latest_revision_created_at": "2019-01-18T10:05:05.539Z", "owner": 6, "slug": "methodology", "search_description": "", "content_type": 31, "title": "Methodology"}	\N	27	4
117	f	2019-01-25 12:50:13.26802+00	{"go_live_at": null, "search_description": "", "slug": "focus-advisors-and-policy-makers", "depth": 4, "show_in_menus": false, "expired": false, "url_path": "/home2/groups/focus-advisors-and-policy-makers/", "numchild": 1, "first_published_at": "2019-01-11T12:00:08.374Z", "has_unpublished_changes": false, "last_published_at": "2019-01-11T12:00:08.374Z", "title": "Focus on Advisors and Policy-Makers", "expire_at": null, "draft_title": "Focus on Advisors and Policy-Makers", "path": "0001000200030004", "live_revision": 38, "content_type": 31, "owner": 2, "pk": 21, "seo_title": "", "locked": false, "live": true, "body": "<p></p><p>[Timeline]</p>", "latest_revision_created_at": "2019-01-11T12:00:08.351Z"}	\N	21	6
65	f	2019-01-18 12:32:30.291079+00	{"locked": false, "title": "Frequently Asked Questions", "draft_title": "FAQ", "has_unpublished_changes": false, "first_published_at": "2019-01-11T14:26:12.271Z", "depth": 4, "expired": false, "last_published_at": "2019-01-11T14:26:54.974Z", "live": true, "content_type": 31, "slug": "faq", "latest_revision_created_at": "2019-01-11T14:26:54.956Z", "show_in_menus": true, "numchild": 0, "expire_at": null, "path": "0001000200020003", "seo_title": "", "live_revision": 51, "url_path": "/home2/about/faq/", "owner": 2, "search_description": "", "pk": 25, "body": "<p>Endemic livestock disease is not something all of us have to think about on a daily basis. We&#x27;ve therefore put together a list of questions to give you some more information about these, and the project more generally.</p><p>Have a question which is not answered in the FAQs below? Please <a id=\\"8\\" linktype=\\"page\\">contact us </a>and we will answer it!</p><p></p><hr/><p></p><h4>What are endemic diseases?</h4><p>Endemic diseases exist permanently in a population or region, such as the cold virus in humans. They differ from more exotic invasive diseases, such as avian influenza, which typically occur from infections brought in from off the farm and are not usually present. Eradication of some of these disease is possible, although this can be very resource and time consuming.</p><p></p><hr/><p></p><h4>Why are endemic livestock diseases important?</h4><p>Endemic livestock diseases are important from a number of perspectives. If an animal is sick, then it has implications for the animals\\u2019 wellbeing and welfare. When an animal is ill, they also become less productive, such as by having slower growth or reduced milk yields, which can affect producer profits. Sick animals also need medical treatment, including from antibiotics to fight bacterial infections. Reducing the amount of endemic diseases present will result in animals needing less treatment, resulting in the reduced use of antibiotics and other medicines.</p><p></p><hr/><p></p><h4>Why do animals get these diseases?</h4><p>Like for humans, there are many diseases that animals can catch (think of colds, stomach bugs and viruses) that are easily spread, and almost impossible to get rid of. Endemic diseases are described as multifactorial, meaning that they occur due to a number of different factors. Livestock can pick up these diseases from other animals on the farm (both farm and wild animals), off neighbouring farms, or from people and equipment that come onto the farm which may be contaminated. Weather conditions can also affect disease spread, as can an animal\\u2019s genetics.</p><p></p><hr/><p></p><h4>What impact do they have?</h4><p>As well as making animals ill (so affecting their health and welfare), they can impact on their productivity, and so can have severe economic implications.</p><p></p><hr/><p></p><h4>Why BVD and lameness?</h4><p>Bovine viral diarrhoea (BVD) and lameness are two of the most prevalent diseases in cattle and sheep in the UK today. They also have different management practices and different symptoms and can be spread in different ways. This allows us to compare and contrast across two very different diseases, which will give us more learning&#x27;s for endemic diseases in general.</p><p></p><hr/><p></p><h4>Will these diseases affect the animal products that I eat?</h4><p>No, they won\\u2019t. These diseases are not zoonotic, i.e. cannot be transferred to humans, and so do not have implications for food safety. In addition, any animals treated with medicines have to follow strict regulations in relation to how long they must be free of medicines before they can enter the human food chain, to ensure that no residues are present in the food we eat.</p><p>Any concerns related to human health are to do with antimicrobial resistance (AMR). As for humans, AMR is a growing concern for animals, and so a reduction in antibiotic use is encouraged. Farmers and veterinarians both follow <a href=\\"https://www.ruma.org.uk/\\">RUMA</a> guidelines, which encourages the more responsible use of antibiotics, which are only used as and when an animal has a disease. If we can reduce the number of animals having a disease, we can reduce the amount of antibiotics used, which has benefits for humans and animals.</p><p></p><hr/><p></p><h4>Are these diseases specific to different types of animal production system?</h4><p>Given the range of different factors linked to endemic diseases, they can occur in any type of animal production system e.g. indoor, free range, organic etc. Some diseases are more common in intensive systems, whereas others are more common in outdoor systems due to greater exposure to the environment and wild animals and micro-organisms which may transmit disease. </p><p></p><hr/><p></p><h4>Why do we still have these diseases?</h4><p>Although the practices and treatments for these diseases exist, there can be barriers to using these in farming practice for a number of different reasons, including the number of different factors known to cause these diseases. Also, given that a number of these diseases are influenced by the environmental factors, including the weather, they can be very difficult to control</p><p>FIELD looks to explore why these diseases are still present and what can further be done to enable better control and a reduction in these.</p><p></p><hr/><p></p><h4>What do these diseases mean for animal welfare?</h4><p>As for humans, when an animal is sick it affects their well-being, either through feeling generally unwell or being in pain from the infection that they have. Animals who are sick are treated according to the illness they have, which may include antibiotics to treat bacterial infections, pain killers and anti-inflammatory medicines.</p><p></p><hr/><p></p><h4>Does Brexit affect this at all?</h4><p>It is not known how Brexit may affect these diseases, but any implications are likely to be due to regulation and trade. The UK is world renowned for its high standards of welfare, which are currently higher than EU minimum regulations. This is likely to continue post-Brexit and so animals well-being (including fast and effective treatment of diseases should they arise) is likely to continue.</p><p></p><hr/><p></p><h4>How is FIELD different to other projects?</h4><p>People is an often overlooked element in livestock disease management and research. The FIELD team is bringing together a range of different expertise to counteract this. Find out more <a id=\\"14\\" linktype=\\"page\\">about the project</a> to get further details of how we plan to do this.</p><p></p><hr/><p></p><h4>What is FIELD going to do?</h4><p>The FIELD project Work to develop better predictive models, as well as provide recommendations for policy and practice based on the interactions we have we our research participants and stakeholders involved in the project.</p><p></p><hr/><p></p><h4>Can I get involved in the FIELD project?</h4><p>The FIELD team would love to hear from you! We would love to hear your questions, opinions, perspectives and experiences, be that as a member of the public, farmer or farm adviser. Visit our<a id=\\"8\\" linktype=\\"page\\"> contact us</a> page to find out how to reach the team.</p><p></p>", "go_live_at": null}	\N	25	4
120	f	2019-01-25 13:14:34.559735+00	{"go_live_at": null, "search_description": "", "slug": "faq", "depth": 4, "show_in_menus": true, "expired": false, "url_path": "/home2/about/faq/", "numchild": 0, "first_published_at": "2019-01-11T14:26:12.271Z", "has_unpublished_changes": false, "last_published_at": "2019-01-21T15:19:25.311Z", "title": "Frequently Asked Questions", "expire_at": null, "draft_title": "Frequently Asked Questions", "path": "0001000200020003", "live_revision": 83, "content_type": 31, "owner": 2, "pk": 25, "seo_title": "", "locked": false, "live": true, "body": "<p>Endemic livestock disease is not something all of us have to think about on a daily basis. We&#x27;ve therefore put together a list of questions to give you some more information about these, and the project more generally.</p><p>Have a question which is not answered in the FAQs below? Please <a id=\\"8\\" linktype=\\"page\\">contact us</a> and we will answer it!</p><p></p><hr/><p></p><h4>What are endemic diseases?</h4><p>Endemic diseases exist permanently in a population or region, such as the cold virus in humans. They differ from more exotic invasive diseases, such as avian influenza, which typically occur from infections brought in from off the farm and are not usually present. Eradication of some of these disease is possible, although this can be very resource and time consuming.</p><p></p><hr/><p></p><h4>Why are endemic livestock diseases important?</h4><p>Endemic livestock diseases are important from a number of perspectives. If an animal is sick, then it has implications for the animals\\u2019 wellbeing and welfare. When an animal is ill, they also become less productive, such as by having slower growth or reduced milk yields, which can affect producer profits. Sick animals also need medical treatment, including from antibiotics to fight bacterial infections. Reducing the amount of endemic diseases present will result in animals needing less treatment, resulting in the reduced use of antibiotics and other medicines.</p><p></p><hr/><p></p><h4>Why do animals get these diseases?</h4><p>Like for humans, there are many diseases that animals can catch (think of colds, stomach bugs and viruses) that are easily spread, and almost impossible to get rid of. Endemic diseases are described as multifactorial, meaning that they occur due to a number of different factors. Livestock can pick up these diseases from other animals on the farm (both farm and wild animals), off neighbouring farms, or from people and equipment that come onto the farm which may be contaminated. Weather conditions can also affect disease spread, as can an animal\\u2019s genetics.</p><p></p><hr/><p></p><h4>What impact do they have?</h4><p>As well as making animals ill (so affecting their health and welfare), they can impact on their productivity, and so can have severe economic implications.</p><p></p><hr/><p></p><h4>Why BVD and lameness?</h4><p>Bovine viral diarrhoea (BVD) and lameness are two of the most prevalent diseases in cattle and sheep in the UK today. They also have different management practices and different symptoms and can be spread in different ways. This allows us to compare and contrast across two very different diseases, which will give us more learning&#x27;s for endemic diseases in general.</p><p></p><hr/><p></p><h4>Will these diseases affect the animal products that I eat?</h4><p>No, they won\\u2019t. These diseases are not zoonotic, i.e. cannot be transferred to humans, and so do not have implications for food safety. In addition, any animals treated with medicines have to follow strict regulations in relation to how long they must be free of medicines before they can enter the human food chain, to ensure that no residues are present in the food we eat.</p><p>Any concerns related to human health are to do with antimicrobial resistance (AMR). As for humans, AMR is a growing concern for animals, and so a reduction in antibiotic use is encouraged. Farmers and veterinarians both follow <a href=\\"https://www.ruma.org.uk/\\">RUMA</a> guidelines, which encourage the more responsible use of antibiotics, used only as and when an animal has a disease. If we can reduce the number of animals having a disease, we can reduce the amount of antibiotics used, which has benefits for humans and animals.</p><p></p><hr/><p></p><h4>Are these diseases specific to different types of animal production system?</h4><p>Given the range of different factors linked to endemic diseases, they can occur in any type of animal production system e.g. indoor, free range, organic etc. Some diseases are more common in intensive systems, whereas others are more common in outdoor systems due to greater exposure to the environment and wild animals and micro-organisms which may transmit disease.</p><p></p><hr/><p></p><h4>Why do we still have these diseases?</h4><p>Although the practices and treatments for these diseases exist, there can be barriers to using these in farming practice for a number of different reasons, including various factors known to cause these diseases. Also, given that a number of these diseases are influenced by the environmental factors, including the weather, they can be very difficult to control.</p><p>FIELD looks to explore why these diseases are still present and what can further be done to enable better control and a reduction in these.</p><p></p><hr/><p></p><h4>What do these diseases mean for animal welfare?</h4><p>As for humans, when an animal is sick it affects their well-being, either through feeling generally unwell or being in pain from the infection that they have. Animals who are sick are treated according to the illness they have, which may include antibiotics to treat bacterial infections, pain killers and anti-inflammatory medicines.</p><p></p><hr/><p></p><h4>Does Brexit affect this at all?</h4><p>It is not known how Brexit may affect these diseases, but any implications are likely to be due to regulation and trade. The UK is world-renowned for its high standards of welfare, which are currently higher than EU minimum regulations. This is likely to continue post-Brexit and so animals&#x27; well-being (including fast and effective treatment of diseases should they arise) is likely to continue to be protected.</p><p></p><hr/><p></p><h4>How is FIELD different to other projects?</h4><p>The influence of people is an often overlooked element in livestock disease management and research. The FIELD team is bringing together a range of different expertise to counteract this. Find out more <a id=\\"14\\" linktype=\\"page\\">about the project</a> to get further details of how we plan to do this.</p><p></p><hr/><p></p><h4>What is FIELD going to do?</h4><p>The FIELD project will work to develop better predictive models, as well as to provide recommendations for policy and practice based on the interactions we have with our research participants and stakeholders involved in the project.</p><p></p><hr/><p></p><h4>Can I get involved in the FIELD project?</h4><p>The FIELD team would love to hear from you! We look forward to hearing your questions, opinions, perspectives and experiences, be that as a member of the public, farmer or farm adviser. Visit our<a id=\\"8\\" linktype=\\"page\\"> contact us</a> page to find out how to reach the team.</p><p></p>", "latest_revision_created_at": "2019-01-21T15:19:25.290Z"}	\N	25	6
95	f	2019-01-22 12:11:53.941304+00	{"go_live_at": null, "search_description": "", "slug": "meet-team", "depth": 4, "show_in_menus": true, "expired": false, "url_path": "/home2/about/meet-team/", "numchild": 0, "first_published_at": "2019-01-10T13:08:57.025Z", "has_unpublished_changes": false, "last_published_at": "2019-01-21T15:19:31.147Z", "title": "Meet the team", "expire_at": null, "draft_title": "Meet the team", "path": "0001000200020002", "live_revision": 84, "content_type": 31, "owner": 2, "pk": 15, "seo_title": "", "locked": false, "live": true, "body": "<h3>Prof Abigail Woods</h3><h4>King&#x27;s College London<br/>History</h4><p>Abigail Woods is Head of the Department of History, and <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Professor in the History of Human and</a> <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Animal Health at King&#x27;s College London.</a> Reflecting her earlier career as a veterinary surgeon, her research focuses on the history of animal health in 19th and 20th century Britain, and its intersections with the histories of human health and livestock production.  Her recent research has explored the history of veterinary expertise, policy and practice; the changing concepts of animal health, welfare and productivity; and how patterns and perceptions of livestock disease have changed over time. As principle investigator of the FIELD project, she is developing the first social histories of BVD and cattle lameness, and bringing them into dialogue with contemporary scientific and social scientific perspectives.</p><p></p><hr/><p></p><h3>Nicole Gosling</h3><h4>King&#x27;s College London<br/>History</h4><p>Nicole Gosling is a PhD student at King\\u2019s College in London and will be writing her dissertation as a contribution to the FIELD project. She studied her BSc in Ecology at the University of Victoria, and recently completed an MA in Environmental History at Uppsala University. Broadly speaking, Nicole\\u2019s interests include how humans interact with nature, with a focus on human-animal relationships. She explored these relationships in her master\\u2019s thesis \\u2018Making Sense of Cattle: A story from farm to food\\u2019 where she looked at how different actors experience cattle bodies during the production of beef. Building on this line of thinking, Nicole\\u2019s role in the FIELD project will be focused on the history of lameness in sheep.</p><p></p><hr/><p></p><h3>Prof Karen Sayer</h3><h4>Leeds Trinity University<br/>History</h4><p><a href=\\"http://research.leedstrinity.ac.uk/en/persons/karen-sayer(5c5fb33f-b15c-497f-870a-ad1d04f03454).html\\">Professor of Social and Cultural History at Leeds Trinity University,</a> Leeds, UK, Karen Sayer specialises in the study of British agriculture, landscape and environment in the 19th and 20th centuries. Her first monograph, <i>Women of the Fields: Representations of Femininity in Nineteenth Century Rural Society</i> (MUP 1995) used a discursive and interdisciplinary approach to assess the representation of women\\u2019s work in agriculture in Parliamentary Reports alongside art, literature and the press, to explain legislative intervention and control of their employment. She built on this work with her second monograph <i>Country Cottages: A Cultural History</i> (MUP, 2000). Drawing on the work of the social sciences, architecture and geography to scrutinise the values attached historically to the idea and material culture of the cottage, and the experiences of those who inhabited it, the book encompassed a spatial reading of the political and material effects of the rural idyll that impact at the level of national identity and \\u2018race\\u2019, class and sex. She has continued to address the shape of, values attaching to and understandings of the British landscape and environment, and experiences of those living in the countryside. Today she works on energy landscapes \\u2013 e.g. with P. Brassley &amp; J. Burchardt <i>Transforming the countryside?</i> <i>The Electrification of Rural England 1890-1970</i> (Routledge, 2016) \\u2013 the managed spaces of the farm, history of livestock agriculture and animal history.\\u00a0 </p><p>Within the FIELD project, she addresses the tensions that beset the \\u2018modernisation\\u2019 of UK livestock farming after 1947 and the different, competing messages attaching to animal welfare and consumption, as seen in the use of the British countryside as site of amenity and site of production. This work incorporates ideas of animals as active agents of history, and is framed by notions of interconnectivity of farm, the farm animal, disease organisms, farmers, labourers, marketeers, sales reps, government officials, journalists and the non-farming public over time.\\u00a0</p><p></p><hr/><p></p><h3>Dr James Bowen</h3><h4>Leeds Trinity University<br/>History</h4><p>James P. Bowen is a Post-Doctoral Research Associate in History based at Leeds Trinity University with research interests in agricultural and rural history. He was formerly a Research Associate (Victoria County History-Cumbria Project) in the Department of History, Lancaster University and was the Contributing Editor for The Herefordshire Victoria County History Trust Short on the parish of Colwall. He was formerly a Post-Doctoral Research Associate based at the Department of Geography and Planning, University of Liverpool employed on \\u2018Spaces of experience and horizons of expectation: the implications of extreme weather events, past, present and future\\u2019, a three-year project, funded as part of the Care for the Future programme of the Arts and Humanities Research Council.He completed a PhD at Lancaster University supervised by Professor A.J.L. Winchester and held the Economic History Society\\u2019s Tawney Junior Research Fellowship in 2012-13 at the Institute of Historical Research, London.</p><p></p><hr/><p></p><h3>Dr Amy Proctor</h3><h4>Newcastle University<br/>Social Science</h4><p><a href=\\"https://www.ncl.ac.uk/cre/about/staff/profile/amyproctornclacuk.html#background\\">Amy Proctor</a> is based at the <a href=\\"https://www.ncl.ac.uk/cre/\\">Centre for Rural Economy</a> at Newcastle University. She is interested in agricultural extension and processes of expertise exchange within rural land management and has published widely on this. Her research has focused on the knowledge-practices of farmers and their advisors and the performance and practice of the advisory encounter. Amy is also interested in developing innovative and interactive ways of engaging with stakeholders and has co-led <a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a>, a national knowledge exchange network for rural professionals which provides a platform for inter-professional learning and debate among farm advisers and opportunities for exchange with research communities. In FIELD, Amy will develop and conduct the social science aspects of the project including in-depth interviews and ethnographic research with farmers and advisers and focus groups with farmers and consumers.</p><p></p><hr/><p></p><h3>Sue Bradley</h3><h4>Newcastle University<br/>History</h4><p>Sue Bradley is an oral historian in the <a href=\\"https://www.ncl.ac.uk/cre/\\">Centre for Rural Economy</a>, Newcastle University, where her research has ranged from flood risk to honey bee health and veterinary practice. She is interested in how oral history can help to address current concerns, and in using audio testimonies from older practitioners as a basis for discussions with their counterparts today. Her work for FIELD includes recording a collection of life-story interviews that will contribute insights from first-hand accounts of working with cattle and sheep in the north of England since the 1940&#x27;s. This collection will be archived at the <a href=\\"https://merl.reading.ac.uk/\\">Museum for English Rural Life</a> to serve beyond the project as a permanent public research resource. Sue also works part-time in <a href=\\"https://research.ncl.ac.uk/oralhistory/\\">Newcastle University\\u2019s Oral History Unit</a>. Before coming to Newcastle she was responsible for creating the British Library\\u2019s Book Trade Lives collection of recordings with booksellers and publishers.</p><p></p><hr/><p></p><h3>Dr Beth Clark</h3><h4>Newcastle University<br/>Social Science</h4><p><a href=\\"https://www.ncl.ac.uk/cre/about/staff/profile/bethclark.html#background\\">Beth\\u2019s</a> research background in sports, exercise and nutrition and food marketing reflects her research interests in food and communication. She is particularly interested in exploring how people relate to animal products and different food production practices, such as motivations for food choice, innovation and technology in production, knowledge of food production practices, and food cultures. Through this she works with a range of stakeholders from across the food supply chain, which has fuelled an interest in communication, including how individuals and groups share information and trust different information sources.She has two roles on the FIELD project. The first is part of the social science research team, involving interviews, focus groups and observations with farmers, farming advisors and the public, to explore their different experiences and perceptions of endemic livestock disease. The second role focuses on public engagement, including the online communications and website for FIELD, as well as identifying and organising opportunities for greater interaction with the projects many stakeholders, including members of the farming community and the public. </p><hr/><p></p><h3>Dr Ewan Coleman</h3><h4>University of Edinburgh<br/>Epidemiology &amp; Economics</h4><p>Ewan Colman is a post-doctoral research associate at the <a href=\\"https://www.ed.ac.uk/roslin\\">Roslin Institute</a> at the University of Edinburgh. He has a background in mathematics, particularly in applied probability, data science, and network science. His research uses computational modelling to explore the relationship between behaviour and the spread of infectious disease. Ewan&#x27;s past interests include the dynamics of conversations on social media, the social and spatial organisation of ant colonies, and the how the ever-increasing amount of public health data can be exploited to detect and mitigate epidemic diseases. As a member of the FIELD project, he will focus on the spread of BVD through cattle trade, and how changing attitudes towards biosecurity can reduce the prevalence of BVD on a national scale.</p><p></p><hr/><p></p><h3>Prof Rowland Kao</h3><h4>University of Edinburgh<br/>Epidemiology &amp; Economics</h4><p>Awaiting text</p><p></p><hr/><p></p><h3>Maria Suella Rodrigues</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Maria Suella Rodrigues is a doctoral candidate at the University of Glasgow, supervised under Professor Nicholas Hanley (MVLS), Dr. Souvik Datta (ASBS) at the University of Glasgow and Professor Rowland Kao from the University of Edinburgh. Maria holds a BSc degree in Economics from Lancaster University. Following that she moved to the University of Glasgow where she pursued the MRes in Economics, graduating in 2018. She is interested in investigating research questions in the areas of agricultural and environmental economics as well as applied micro-econometrics and choice-modelling theory. During her MRes dissertation she modelled consumer preferences for forest disease management with use of Choice modelling data. Additionally, she has received extensive training in choice-modelling from the Choice Modelling Centre, University of Leeds. As part of the FIELD project, Maria will design field experiments and model both farmer and consumer preferences in relation to farm animal welfare. </p><p></p><hr/><p></p><h3>Dr Lewis Holloway</h3><h4>University of Hull<br/>Social Science</h4><p><a href=\\"https://www.hull.ac.uk/faculties/staff-profiles/lewis-holloway.aspx\\">Lewis Holloway</a> is a Reader in Human Geography at the University of Hull. He has research interests in food, farming and the countryside, and has a particular interest in farm animals and agricultural technologies. Recent research has focused on the ways in which genetic, information and robotic technologies have affected livestock farming, and has involved in-depth research with farmers and technology developers to understand how new technologies are engaged with, adopted and contested by farmers. Lewis is interested in the situated ethics associated with animal agriculture, and in how technologies can transform farming ethics and knowledge-practices. Lewis will be involved in developing and conducting the social scientific elements of the FIELD project. This will include on-farm interview and observational work with farmers, farm animals and expert advisors, and focus groups with farmers and public groups.</p><p></p><hr/><p></p><h3>Dr Niamh Mahon</h3><h4>University of Hull<br/>Social Science</h4><p><a href=\\"https://www.researchgate.net/profile/Niamh_Mahon\\">Niamh</a> is a Post-Doctoral Research Associate at the University of Hull. In this role she is involved in the social science components of the FIELD project. This includes in-depth interviews and observational work with farmers and expert advisors, and focus groups with farmers and the public, conducted to explore their different experiences and perceptions of endemic livestock disease. Prior to this Niamh under took a PhD at Nottingham Trent University developing stakeholder-sensitive indicators of the Sustainable Intensification of UK agriculture and a Master\\u2019s degree from the University of East Anglia in Sustainable Agriculture and Food Security. She has also worked as a research assistant in socio-economics and policy for the Organic Research Centre. Niamh is a member of the Food and Climate Research Network and the Sustainable Intensification Research Network.</p><p></p><hr/><p></p><h3>Prof Nick Hanley</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Nick Hanley is a <a href=\\"https://www.gla.ac.uk/researchinstitutes/bahcm/staff/nicholashanley/\\">Professor of Environmental and One Health Economics</a> at the University of Glasgow. His PhD was in Agricultural Economics. His current main research interests include behavioural economics, the design of Payment for Ecosystem Service schemes, environmental valuation,one health economics, the economics of sustainable development, markets for biodiversity offsets,and the economics of invasive species.He is an honorary professor at the universities of St Andrews and Stirling. Nick is co-author of a textbook in environmental cost-benefit analysis with Edward Barbier; and two textbooks on environmental economics (with Jason Shogren and Ben White).</p><p></p>", "latest_revision_created_at": "2019-01-21T15:19:31.121Z"}	\N	15	4
119	f	2019-01-25 13:02:50.088325+00	{"go_live_at": null, "search_description": "", "slug": "research-team", "depth": 5, "show_in_menus": true, "expired": false, "url_path": "/home2/about/meetteam/research-team/", "numchild": 0, "first_published_at": "2019-01-10T13:08:57.025Z", "has_unpublished_changes": true, "last_published_at": "2019-01-21T15:19:31.147Z", "title": "Research team", "expire_at": null, "draft_title": "Research team", "path": "00010002000200050001", "live_revision": 84, "content_type": 31, "owner": 2, "pk": 15, "seo_title": "", "locked": false, "live": true, "body": "<p>The research on the FIELD research project will be conducted by a team of 12 individuals from 6 different UK universities, and from 3 different scientific disciplines.</p><p>Find out more about the different team members below.</p><p></p><hr/><h2>Prof Abigail Woods</h2><h3>King&#x27;s College London</h3><h4>History</h4><p>Abigail Woods is Head of the Department of History, and <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Professor in the History of Human and</a> <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Animal Health at King&#x27;s College London.</a> Reflecting her earlier career as a veterinary surgeon, her research focuses on the history of animal health in 19th and 20th century Britain, and its intersections with the histories of human health and livestock production. Her recent research has explored the history of veterinary expertise, policy and practice; the changing concepts of animal health, welfare and productivity; and how patterns and perceptions of livestock disease have changed over time. As principle investigator of the FIELD project, she is developing the first social histories of BVD and cattle lameness, and bringing them into dialogue with contemporary scientific and social scientific perspectives.</p><p></p><hr/><h2>Nicole Gosling</h2><h3>King&#x27;s College London</h3><h4>History</h4><p>Nicole Gosling is a PhD student at King\\u2019s College in London and will be writing her dissertation as a contribution to the FIELD project. She studied her BSc in Ecology at the University of Victoria, and recently completed an MA in Environmental History at Uppsala University. Broadly speaking, Nicole\\u2019s interests include how humans interact with nature, with a focus on human-animal relationships. She explored these relationships in her master\\u2019s thesis \\u2018Making Sense of Cattle: A story from farm to food\\u2019 where she looked at how different actors experience cattle bodies during the production of beef. Building on this line of thinking, Nicole\\u2019s role in the FIELD project will be focused on the history of lameness in sheep.</p><p></p><hr/><h2>Prof Karen Sayer</h2><h3>Leeds Trinity University</h3><h4>History</h4><p><a href=\\"http://research.leedstrinity.ac.uk/en/persons/karen-sayer(5c5fb33f-b15c-497f-870a-ad1d04f03454).html\\">Professor of Social and Cultural History at Leeds Trinity University,</a> Leeds, UK, Karen Sayer specialises in the study of British agriculture, landscape and environment in the 19th and 20th centuries. Her first monograph, <i>Women of the Fields: Representations of Femininity in Nineteenth Century Rural Society</i> (MUP 1995) used a discursive and interdisciplinary approach to assess the representation of women\\u2019s work in agriculture in Parliamentary Reports alongside art, literature and the press, to explain legislative intervention and control of their employment. She built on this work with her second monograph <i>Country Cottages: A Cultural History</i> (MUP, 2000). Drawing on the work of the social sciences, architecture and geography to scrutinise the values attached historically to the idea and material culture of the cottage, and the experiences of those who inhabited it, the book encompassed a spatial reading of the political and material effects of the rural idyll that impact at the level of national identity and \\u2018race\\u2019, class and sex. She has continued to address the shape of, values attaching to and understandings of the British landscape and environment, and experiences of those living in the countryside. Today she works on energy landscapes \\u2013 e.g. with P. Brassley &amp; J. Burchardt <i>Transforming the countryside?</i> <i>The Electrification of Rural England 1890-1970</i> (Routledge, 2016) \\u2013 the managed spaces of the farm, history of livestock agriculture and animal history.</p><p>Within the FIELD project, she addresses the tensions that beset the \\u2018modernisation\\u2019 of UK livestock farming after 1947 and the different, competing messages attaching to animal welfare and consumption, as seen in the use of the British countryside as site of amenity and site of production. This work incorporates ideas of animals as active agents of history, and is framed by notions of interconnectivity of farm, the farm animal, disease organisms, farmers, labourers, marketeers, sales reps, government officials, journalists and the non-farming public over time.</p><p></p><hr/><h2>Dr James Bowen</h2><h3>Leeds Trinity University</h3><h4>History</h4><p>James P. Bowen is a Post-Doctoral Research Associate in History based at Leeds Trinity University with research interests in agricultural and rural history. He was formerly a Research Associate (Victoria County History-Cumbria Project) in the Department of History, Lancaster University and was the Contributing Editor for The Herefordshire Victoria County History Trust Short on the parish of Colwall. He was formerly a Post-Doctoral Research Associate based at the Department of Geography and Planning, University of Liverpool employed on \\u2018Spaces of experience and horizons of expectation: the implications of extreme weather events, past, present and future\\u2019, a three-year project, funded as part of the Care for the Future programme of the Arts and Humanities Research Council. He completed a PhD at Lancaster University supervised by Professor A.J.L. Winchester and held the Economic History Society\\u2019s Tawney Junior Research Fellowship in 2012-13 at the Institute of Historical Research, London.</p><p></p><hr/><h2>Dr Amy Proctor</h2><h3>Newcastle University</h3><h4>Social Science</h4><p><a href=\\"https://www.ncl.ac.uk/cre/about/staff/profile/amyproctornclacuk.html#background\\">Amy Proctor</a> is based at the <a href=\\"https://www.ncl.ac.uk/cre/\\">Centre for Rural Economy</a> at Newcastle University. She is interested in agricultural extension and processes of expertise exchange within rural land management and has published widely on this. Her research has focused on the knowledge-practices of farmers and their advisors and the performance and practice of the advisory encounter. Amy is also interested in developing innovative and interactive ways of engaging with stakeholders and has co-led <a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a>, a national knowledge exchange network for rural professionals which provides a platform for inter-professional learning and debate among farm advisers and opportunities for exchange with research communities. In FIELD, Amy will develop and conduct the social science aspects of the project including in-depth interviews and ethnographic research with farmers and advisers and focus groups with farmers and consumers.</p><p></p><hr/><h2>Sue Bradley</h2><h3>Newcastle University</h3><h4>History</h4><p>Sue Bradley is an oral historian in the <a href=\\"https://www.ncl.ac.uk/cre/\\">Centre for Rural Economy</a>, Newcastle University, where her research has ranged from flood risk to honey bee health and veterinary practice. She is interested in how oral history can help to address current concerns, and in using audio testimonies from older practitioners as a basis for discussions with their counterparts today. Her work for FIELD includes recording a collection of life-story interviews that will contribute insights from first-hand accounts of working with cattle and sheep in the north of England since the 1940&#x27;s. This collection will be archived at the <a href=\\"https://merl.reading.ac.uk/\\">Museum for English Rural Life</a> to serve beyond the project as a permanent public research resource. Sue also works part-time in <a href=\\"https://research.ncl.ac.uk/oralhistory/\\">Newcastle University\\u2019s Oral History Unit</a>. Before coming to Newcastle she was responsible for creating the British Library\\u2019s Book Trade Lives collection of recordings with booksellers and publishers.</p><p></p><hr/><h2>Dr Beth Clark</h2><h3>Newcastle University</h3><h4>Social Science</h4><p><a href=\\"https://www.ncl.ac.uk/cre/about/staff/profile/bethclark.html#background\\">Beth\\u2019s</a> research background in sports, exercise and nutrition and food marketing reflects her research interests in food and communication. She is particularly interested in exploring how people relate to animal products and different food production practices, such as motivations for food choice, innovation and technology in production, knowledge of food production practices, and food cultures. Through this she works with a range of stakeholders from across the food supply chain, which has fuelled an interest in communication, including how individuals and groups share information and trust different information sources.She has two roles on the FIELD project. The first is part of the social science research team, involving interviews, focus groups and observations with farmers, farming advisors and the public, to explore their different experiences and perceptions of endemic livestock disease. The second role focuses on public engagement, including the online communications and website for FIELD, as well as identifying and organising opportunities for greater interaction with the projects many stakeholders, including members of the farming community and the public.</p><hr/><h2>Dr Ewan Coleman</h2><h3>University of Edinburgh</h3><h4>Epidemiology &amp; Economics</h4><p>Ewan Colman is a post-doctoral research associate at the <a href=\\"https://www.ed.ac.uk/roslin\\">Roslin Institute</a> at the University of Edinburgh. He has a background in mathematics, particularly in applied probability, data science, and network science. His research uses computational modelling to explore the relationship between behaviour and the spread of infectious disease. Ewan&#x27;s past interests include the dynamics of conversations on social media, the social and spatial organisation of ant colonies, and the how the ever-increasing amount of public health data can be exploited to detect and mitigate epidemic diseases. As a member of the FIELD project, he will focus on the spread of BVD through cattle trade, and how changing attitudes towards biosecurity can reduce the prevalence of BVD on a national scale.</p><p></p><hr/><h2>Prof Rowland Kao</h2><h3>University of Edinburgh</h3><h4>Epidemiology &amp; Economics</h4><p>Awaiting text</p><p></p><hr/><h2>Maria Suella Rodrigues</h2><h3>University of Glasgow</h3><h4>Epidemiology &amp; Economics</h4><p>Maria Suella Rodrigues is a doctoral candidate at the University of Glasgow, supervised under Professor Nicholas Hanley (MVLS), Dr. Souvik Datta (ASBS) at the University of Glasgow and Professor Rowland Kao from the University of Edinburgh. Maria holds a BSc degree in Economics from Lancaster University. Following that she moved to the University of Glasgow where she pursued the MRes in Economics, graduating in 2018. She is interested in investigating research questions in the areas of agricultural and environmental economics as well as applied micro-econometrics and choice-modelling theory. During her MRes dissertation she modelled consumer preferences for forest disease management with use of Choice modelling data. Additionally, she has received extensive training in choice-modelling from the Choice Modelling Centre, University of Leeds. As part of the FIELD project, Maria will design field experiments and model both farmer and consumer preferences in relation to farm animal welfare.</p><p></p><hr/><h2>Dr Lewis Holloway</h2><h3>University of Hull</h3><h4>Social Science</h4><p><a href=\\"https://www.hull.ac.uk/faculties/staff-profiles/lewis-holloway.aspx\\">Lewis Holloway</a> is a Reader in Human Geography at the University of Hull. He has research interests in food, farming and the countryside, and has a particular interest in farm animals and agricultural technologies. Recent research has focused on the ways in which genetic, information and robotic technologies have affected livestock farming, and has involved in-depth research with farmers and technology developers to understand how new technologies are engaged with, adopted and contested by farmers. Lewis is interested in the situated ethics associated with animal agriculture, and in how technologies can transform farming ethics and knowledge-practices. Lewis will be involved in developing and conducting the social scientific elements of the FIELD project. This will include on-farm interview and observational work with farmers, farm animals and expert advisors, and focus groups with farmers and public groups.</p><p></p><hr/><h2>Dr Niamh Mahon</h2><h3>University of Hull</h3><h4>Social Science</h4><p><a href=\\"https://www.researchgate.net/profile/Niamh_Mahon\\">Niamh</a> is a Post-Doctoral Research Associate at the University of Hull. In this role she is involved in the social science components of the FIELD project. This includes in-depth interviews and observational work with farmers and expert advisors, and focus groups with farmers and the public, conducted to explore their different experiences and perceptions of endemic livestock disease. Prior to this Niamh under took a PhD at Nottingham Trent University developing stakeholder-sensitive indicators of the Sustainable Intensification of UK agriculture and a Master\\u2019s degree from the University of East Anglia in Sustainable Agriculture and Food Security. She has also worked as a research assistant in socio-economics and policy for the Organic Research Centre. Niamh is a member of the Food and Climate Research Network and the Sustainable Intensification Research Network.</p><p></p><hr/><h2>Prof Nick Hanley</h2><h3>University of Glasgow</h3><h4>Epidemiology &amp; Economics</h4><p>Nick Hanley is a <a href=\\"https://www.gla.ac.uk/researchinstitutes/bahcm/staff/nicholashanley/\\">Professor of Environmental and One Health Economics</a> at the University of Glasgow. His PhD was in Agricultural Economics. His current main research interests include behavioural economics, the design of Payment for Ecosystem Service schemes, environmental valuation, one health economics, the economics of sustainable development, markets for biodiversity offsets, and the economics of invasive species. He is an honorary professor at the universities of St Andrews and Stirling. Nick is co-author of a textbook in environmental cost-benefit analysis with Edward Barbier; and two textbooks on environmental economics (with Jason Shogren and Ben White).</p><p></p><hr/><p></p>", "latest_revision_created_at": "2019-01-22T17:01:53.308Z"}	\N	15	6
49	f	2019-01-11 14:25:31.150583+00	{"locked": false, "title": "FAQ", "draft_title": "FAQ", "has_unpublished_changes": false, "first_published_at": null, "depth": 4, "expired": false, "last_published_at": null, "live": false, "content_type": 31, "slug": "faq", "latest_revision_created_at": null, "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "0001000200030003", "seo_title": "", "live_revision": null, "url_path": "/home2/about/faq/", "owner": 2, "search_description": "", "pk": 25, "body": "<p>Placeholder text here</p><ol><li>What is FIELD?</li></ol><p></p><p></p>", "go_live_at": null}	\N	25	2
94	f	2019-01-21 15:44:17.367767+00	{"locked": false, "title": "News", "draft_title": "News", "has_unpublished_changes": false, "first_published_at": "2019-01-09T02:25:07.941Z", "depth": 3, "expired": false, "display_tags": true, "last_published_at": "2019-01-21T15:23:40.266Z", "num_entries_page": 5, "description": "Description here", "short_feed_description": true, "num_tags_entry_header": 5, "disqus_api_secret": "", "live": true, "content_type": 33, "disqus_shortname": "", "header_image": 5, "slug": "blog-news", "latest_revision_created_at": "2019-01-21T15:23:40.244Z", "show_in_menus": true, "numchild": 3, "expire_at": null, "path": "000100020006", "seo_title": "", "live_revision": 93, "url_path": "/home2/blog-news/", "display_comments": false, "owner": 1, "num_last_entries": 3, "num_popular_entries": 3, "search_description": "", "display_archive": true, "main_color": "#4d6ae0", "display_last_entries": true, "display_popular_entries": true, "pk": 3, "display_categories": true, "go_live_at": null}	\N	3	2
96	f	2019-01-22 12:18:40.232341+00	{"go_live_at": null, "search_description": "", "slug": "about", "depth": 3, "show_in_menus": true, "expired": false, "url_path": "/home2/about/", "numchild": 3, "first_published_at": "2019-01-09T02:25:46.296Z", "has_unpublished_changes": false, "last_published_at": "2019-01-21T15:19:40.823Z", "title": "About", "expire_at": null, "draft_title": "About", "path": "000100020002", "live_revision": 85, "content_type": 31, "owner": 1, "pk": 4, "seo_title": "", "locked": false, "live": true, "body": "<p>The FIELD project breaks new ground in its truly interdisciplinary approach to exploring livestock disease. Find out more about <a id=\\"14\\" linktype=\\"page\\">the project,</a> the <a id=\\"27\\" linktype=\\"page\\">methods </a>being used, and <a id=\\"15\\" linktype=\\"page\\">the team</a> who will be behind the research being conducted.</p><p></p>", "latest_revision_created_at": "2019-01-21T15:19:40.802Z"}	\N	4	4
118	f	2019-01-25 12:52:07.645071+00	{"go_live_at": null, "search_description": "", "slug": "videos", "depth": 5, "show_in_menus": false, "expired": false, "url_path": "/home2/resources/media/videos/", "numchild": 0, "first_published_at": null, "has_unpublished_changes": false, "last_published_at": null, "title": "Videos", "expire_at": null, "draft_title": "Videos", "path": "00010002000500020003", "live_revision": null, "content_type": 31, "owner": 6, "pk": 39, "seo_title": "", "locked": false, "live": true, "body": "<p></p>", "latest_revision_created_at": null}	\N	39	6
75	f	2019-01-18 13:18:51.82014+00	{"locked": false, "title": "Contact us", "draft_title": "Contact us", "has_unpublished_changes": false, "first_published_at": "2019-01-10T13:06:00.324Z", "depth": 3, "expired": false, "last_published_at": "2019-01-11T02:30:45.614Z", "live": true, "content_type": 31, "slug": "contact-us", "latest_revision_created_at": "2019-01-11T02:30:45.594Z", "show_in_menus": true, "numchild": 0, "expire_at": null, "path": "000100020007", "seo_title": "", "live_revision": 25, "url_path": "/home2/contact-us/", "owner": 2, "search_description": "", "pk": 8, "body": "<p>Have a question about endemic livestock disease, want to find out more about the project or want to become involved in the research? We would love to hear from you! </p><p>A core part of the FIELD project is involving as many stakeholders as possible and that means you! Complete the form below and one of the team will contact you as soon as possible.</p>", "go_live_at": null}	\N	8	4
71	f	2019-01-18 13:09:15.992973+00	{"locked": false, "title": "Audio", "draft_title": "Audio", "has_unpublished_changes": false, "first_published_at": null, "depth": 5, "expired": false, "last_published_at": null, "live": false, "content_type": 31, "slug": "audio", "latest_revision_created_at": null, "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "00010002000500020002", "seo_title": "", "live_revision": null, "url_path": "/home2/resources/media/audio/", "owner": 4, "search_description": "", "pk": 31, "body": "<p>Our oral historian <a id=\\"15\\" linktype=\\"page\\">Sue</a> has been working hard to bring you some snippets from the interviews she has been conducting for FIELD with farmers. Listen to first-hand accounts of farming in the clips below.</p>", "go_live_at": null}	\N	31	4
136	f	2019-01-29 17:21:56.499285+00	{"depth": 4, "seo_title": "", "live": true, "title": "Frequently Asked Questions", "body": "<p>Endemic livestock disease is not something all of us have to think about on a daily basis. We&#x27;ve therefore put together a list of questions to give you some more information about these, and the project more generally.</p><p>Have a question which is not answered in the FAQs below? Please <a id=\\"8\\" linktype=\\"page\\">contact us</a> and we will answer it!</p><p></p><p></p><p></p><hr/><p></p><hr/><p></p><h4>What are endemic diseases?</h4><p>Endemic diseases exist permanently in a population or region, such as the cold virus in humans. They differ from more exotic invasive diseases, such as avian influenza, which typically occur from infections brought in from off the farm and are not usually present. Eradication of some of these disease is possible, although this can be very resource and time consuming.</p><p></p><hr/><p></p><h4>Why are endemic livestock diseases important?</h4><p>Endemic livestock diseases are important from a number of perspectives. If an animal is sick, then it has implications for the animals\\u2019 wellbeing and welfare. When an animal is ill, they also become less productive, such as by having slower growth or reduced milk yields, which can affect producer profits. Sick animals also need medical treatment, including from antibiotics to fight bacterial infections. Reducing the amount of endemic diseases present will result in animals needing less treatment, resulting in the reduced use of antibiotics and other medicines.</p><p></p><hr/><p></p><h4>Why do animals get these diseases?</h4><p>Like for humans, there are many diseases that animals can catch (think of colds, stomach bugs and viruses) that are easily spread, and almost impossible to get rid of. For animals, we describe these as endemic diseases. Endemic diseases are described as multifactorial, meaning that they occur due to a number of different factors. Livestock can pick up these diseases from other animals on the farm (both farm and wild animals), off neighbouring farms, or from people and equipment that come onto the farm which may be carrying germs. Weather conditions can also affect disease spread, as can an animal\\u2019s genetics.</p><p></p><hr/><p></p><h4>What impact do they have?</h4><p>As well as making animals ill (so affecting their health and welfare), they can impact on their productivity, and so can have severe economic implications.</p><p></p><hr/><p></p><h4>Why BVD and lameness?</h4><p>Bovine viral diarrhoea (BVD) and lameness are two of the most prevalent diseases in cattle and sheep in the UK today. They also have different management practices and different symptoms and can be spread in different ways. This allows us to compare and contrast across two very different diseases, which will give us more learning&#x27;s for endemic diseases in general.</p><p></p><hr/><h4></h4><h4>What is lameness?</h4><p></p><hr/><p></p><h4>What is BVD?</h4><p></p><hr/><p></p><h4>Will these diseases affect the animal products that I eat?</h4><p>No, they won\\u2019t. These diseases are not zoonotic, i.e. cannot be transferred to humans, and so do not have implications for food safety or human health. In addition, any sick animals treated with medicines have to follow strict regulations in relation to how long they must be free of medicines before they can enter the human food chain, to ensure that no residues are present in the food we eat.</p><p>Any concerns related to human health are to do with antimicrobial resistance (AMR). As for humans, AMR is a growing concern for animals, and so a reduction in antibiotic use is encouraged. Farmers and veterinarians both follow <a href=\\"https://www.ruma.org.uk/\\">RUMA</a> guidelines, which encourage the more responsible use of antibiotics, which are used only as and when an animal has a disease. If we can reduce the number of animals having a disease, we can reduce the amount of antibiotics used, which has benefits for humans and animals.</p><p></p><hr/><p></p><h4>Are these diseases specific to different types of animal production system?</h4><p>Given the range of different factors linked to endemic diseases, they can occur in any type of animal production system e.g. indoor, free range, organic etc. Some diseases are more common in intensive systems, whereas others are more common in outdoor systems due to greater exposure to the environment and wild animals and micro-organisms which may transmit disease.</p><p></p><hr/><p></p><h4>Why do we still have these diseases?</h4><p>Although the practices and treatments for these diseases exist, there can be barriers to using these in farming practice for a number of different reasons, including various factors known to cause these diseases. Also, given that a number of these diseases are influenced by the environmental factors, including the weather, they can be very difficult to control.</p><p>FIELD looks to explore why these diseases are still present and what can further be done to enable better control and a reduction in these.</p><p></p><hr/><p></p><h4>What do these diseases mean for animal welfare?</h4><p>As for humans, when an animal is sick it affects their well-being, either through feeling generally unwell or being in pain from the infection that they have. Animals who are sick are treated according to the illness they have, which may include antibiotics to treat bacterial infections, pain killers and anti-inflammatory medicines.</p><p></p><hr/><p></p><h4>Does Brexit affect this at all?</h4><p>It is not known how Brexit may affect these diseases, but any implications are likely to be due to regulation and trade. The UK is world-renowned for its high standards of welfare, which are currently higher than EU minimum regulations. This is likely to continue post-Brexit and so animals&#x27; well-being (including fast and effective treatment of diseases should they arise) is likely to continue to be protected.</p><p></p><hr/><p></p><h4>How is FIELD different to other projects?</h4><p>The influence of people is an often overlooked element in livestock disease management and research. The FIELD team is bringing together a range of different expertise to counteract this. Find out more <a id=\\"14\\" linktype=\\"page\\">about the project</a> to get further details of how we plan to do this.</p><p></p><hr/><p></p><h4>What is FIELD going to do?</h4><p>The FIELD project will work to develop better predictive models, as well as to provide recommendations for policy and practice based on the interactions we have with our research participants and stakeholders involved in the project.</p><p></p><hr/><p></p><h4>Can I get involved in the FIELD project?</h4><p>The FIELD team would love to hear from you! We look forward to hearing your questions, opinions, perspectives and experiences, be that as a member of the public, farmer or farm adviser. Visit our<a id=\\"8\\" linktype=\\"page\\"> contact us</a> page to find out how to reach the team.</p><p></p>", "draft_title": "Frequently Asked Questions", "owner": 2, "expired": false, "live_revision": 120, "url_path": "/home2/about/faq/", "content_type": 31, "locked": false, "go_live_at": null, "first_published_at": "2019-01-11T14:26:12.271Z", "path": "0001000200020003", "slug": "faq", "last_published_at": "2019-01-25T13:14:34.579Z", "has_unpublished_changes": true, "expire_at": null, "pk": 25, "latest_revision_created_at": "2019-01-29T17:04:40.901Z", "search_description": "", "numchild": 0, "show_in_menus": true}	\N	25	4
50	f	2019-01-11 14:26:12.252225+00	{"locked": false, "title": "FAQ", "draft_title": "FAQ", "has_unpublished_changes": true, "first_published_at": null, "depth": 4, "expired": false, "last_published_at": null, "live": false, "content_type": 31, "slug": "faq", "latest_revision_created_at": "2019-01-11T14:25:31.150Z", "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "0001000200030003", "seo_title": "", "live_revision": null, "url_path": "/home2/about/faq/", "owner": 2, "search_description": "", "pk": 25, "body": "<p>Placeholder text here</p><ol><li>What is FIELD?</li></ol><p></p><p></p>", "go_live_at": null}	\N	25	2
150	f	2019-02-01 09:58:12.560123+00	{"first_published_at": "2019-01-11T14:26:12.271Z", "url_path": "/home2/about/faq/", "expire_at": null, "path": "0001000200020003", "numchild": 0, "show_in_menus": true, "pk": 25, "has_unpublished_changes": true, "live_revision": 120, "expired": false, "locked": false, "body": "<p>Endemic livestock disease is not something all of us have to think about on a daily basis. We&#x27;ve therefore put together a list of questions to give you some more information about these, and the project more generally.</p><p>Have a question which is not answered in the FAQs below? Please <a id=\\"8\\" linktype=\\"page\\">contact us</a> and we will answer it!</p><p></p><p></p><p></p><hr/><p></p><hr/><p></p><h4>What are endemic diseases?</h4><p>Endemic diseases exist permanently in a population or region, such as the cold virus in humans. They differ from more exotic invasive diseases, such as avian influenza, which typically occur from infections brought in from off the farm and are not usually present. Eradication of some of these disease is possible, although this can be very resource and time consuming.</p><p></p><hr/><p></p><h4>Why are endemic livestock diseases important?</h4><p>Endemic livestock diseases are important from a number of perspectives. If an animal is sick, then it has implications for the animal&#x27;s well-being and welfare. When an animal is ill, they also become less productive, such as by having slower growth or reduced milk yields, which can affect producer profits. Sick animals also need medical treatment, including from antibiotics to fight bacterial infections. Reducing the amount of endemic diseases present will result in animals needing less treatment, resulting in the reduced use of antibiotics and other medicines.</p><p></p><hr/><p></p><h4>Why do animals get these diseases?</h4><p>Like for humans, there are many diseases that animals can catch (think of colds, stomach bugs and viruses) that are easily spread, and almost impossible to get rid of. For animals, we describe these as endemic diseases. Endemic diseases are described as multifactorial, meaning that they occur due to a number of different factors. Livestock can pick up these diseases from other animals on the farm (both farm and wild animals), off neighbouring farms, or from people and equipment that come onto the farm which may be carrying germs. Weather conditions can also affect disease spread, as can an animal\\u2019s genetics.</p><p></p><hr/><p></p><h4>What impact do they have?</h4><p>As well as making animals ill (so affecting their health and welfare), they can impact on their productivity, and this can have severe economic implications.</p><p></p><hr/><p></p><h4>Why BVD and lameness?</h4><p>Bovine viral diarrhoea (BVD) and lameness are two of the most prevalent diseases in cattle and sheep in the UK today. They also have different management practices and different symptoms and can be spread in different ways. This allows us to compare and contrast across two very different diseases, which will give us more learning&#x27;s for endemic diseases in general.</p><p></p><hr/><h4></h4><h4>What is lameness?</h4><p></p><hr/><p></p><h4>What is BVD?</h4><p></p><hr/><p></p><h4>Will these diseases affect the animal products that I eat?</h4><p>No, they won\\u2019t. These diseases are not zoonotic, i.e. cannot be transferred to humans, and so do not have implications for food safety or human health. In addition, any sick animals treated with medicines have to follow strict regulations in relation to how long they must be free of medicines before they can enter the human food chain, to ensure that no residues are present in the food we eat.</p><p>Any concerns related to human health are to do with antimicrobial resistance (AMR). As for humans, AMR is a growing concern for animals, and so a reduction in antibiotic use is encouraged. Farmers and veterinarians both follow <a href=\\"https://www.ruma.org.uk/\\">RUMA</a> guidelines, which encourage the more responsible use of antibiotics, which are used only as and when an animal has a disease. If we can reduce the number of animals having a disease, we can reduce the amount of antibiotics used, which has benefits for humans and animals.</p><p></p><hr/><p></p><h4>Are these diseases specific to different types of animal production system?</h4><p>Given the range of different factors linked to endemic diseases, they can occur in any type of animal production system e.g. indoor, free range, organic etc. Some diseases are more common in intensive systems, whereas others are more common in outdoor systems due to greater exposure to the environment and wild animals and micro-organisms which may transmit disease.</p><p></p><hr/><p></p><h4>Why do we still have these diseases?</h4><p>Although the practices and treatments for these diseases exist, there can be barriers to using these in farming practice for a number of different reasons, including various factors known to cause these diseases. Also, given that a number of these diseases are influenced by the environmental factors, including the weather, they can be very difficult to control.</p><p>FIELD looks to explore why these diseases are still present and what can further be done to enable better control and a reduction in these.</p><p></p><hr/><p></p><h4>What do these diseases mean for animal welfare?</h4><p>As for humans, when an animal is sick it affects their well-being, either through feeling generally unwell or being in pain from the infection that they have. Animals who are sick are treated according to the illness they have, which may include antibiotics to treat bacterial infections, pain killers and anti-inflammatory medicines.</p><p></p><hr/><p></p><h4>Does Brexit affect this at all?</h4><p>It is not known how Brexit may affect these diseases, but any implications are likely to be due to regulation and trade. The UK is world-renowned for its high standards of welfare, which are currently higher than EU minimum regulations. This is likely to continue post-Brexit and so animals&#x27; well-being (including fast and effective treatment of diseases should they arise) is likely to continue to be protected.</p><p></p><hr/><p></p><h4>How is FIELD different to other projects?</h4><p>The influence of people is an often overlooked element in livestock disease management and research. The FIELD team is bringing together a range of different expertise to counteract this. Find out more <a id=\\"14\\" linktype=\\"page\\">about the project</a> to get further details of how we plan to do this.</p><p></p><hr/><p></p><h4>What is FIELD going to do?</h4><p>The FIELD project will work to develop better predictive models, as well as to provide recommendations for policy and practice based on the interactions we have with our research participants and stakeholders involved in the project.</p><p></p><hr/><p></p><h4>Can I get involved in the FIELD project?</h4><p>The FIELD team would love to hear from you! We look forward to hearing your questions, opinions, perspectives and experiences, be that as a member of the public, farmer or farm adviser. Visit our<a id=\\"8\\" linktype=\\"page\\"> contact us</a> page to find out how to reach the team.</p><p></p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-25T13:14:34.579Z", "depth": 4, "draft_title": "Frequently Asked Questions", "live": true, "latest_revision_created_at": "2019-01-29T17:21:56.499Z", "owner": 2, "slug": "faq", "search_description": "", "content_type": 31, "title": "Frequently Asked Questions"}	\N	25	6
121	f	2019-01-25 13:14:41.532837+00	{"go_live_at": null, "search_description": "", "slug": "meetteam", "depth": 4, "show_in_menus": false, "expired": false, "url_path": "/home2/about/meetteam/", "numchild": 2, "first_published_at": null, "has_unpublished_changes": true, "last_published_at": null, "title": "Meet the team", "expire_at": null, "draft_title": "Meet the team", "path": "0001000200020005", "live_revision": null, "content_type": 31, "owner": 4, "pk": 36, "seo_title": "", "locked": false, "live": false, "body": "<p></p>", "latest_revision_created_at": "2019-01-22T17:02:22.062Z"}	\N	36	6
159	f	2019-02-01 14:42:19.448043+00	{"first_published_at": "2019-01-18T10:05:05.566Z", "url_path": "/home2/about/project/methodology/", "expire_at": null, "path": "00010002000200010002", "numchild": 0, "show_in_menus": false, "pk": 27, "has_unpublished_changes": false, "live_revision": 157, "expired": false, "locked": false, "body": "<p>The research team is formed of three disciplinary clusters. Although the three clusters have their own research they will each will draw upon and feed into the others. Each cluster will therefore not be working in isolation, reflecting the interdisciplinary approach at the core of the project. Find out more about the methods being used in the three clusters below.</p><p></p><hr/><p></p><hr/><h3></h3><h3>Economics and Epidemiology</h3><p>Better understanding of the spatial interactions amongst farmers</p><p>Simulation models to enable prediction of responses to a range of factors including disease parameters, costs, support measures and new information</p><p>Examine how farmer decision making is affected by past experience of disease, health and welfare priorities, perceptions and evaluations of disease management methods</p><p>Variation in consumer preferences</p><p>Look to establish trade-offs</p><p>WTP animal welfare in relation to other product attributes</p><p>Models that incorporate aspects from the other disciplines, such as social pressures, economic incentives and past disease experiences may improve disease predictions</p><p></p><p>Greater understanding of human-animal relationships and how these relate to animal health and welfare</p><ul><li>Farmer survey of farm animal health</li><li>&#x27;Food busk&#x27; to establish public perceptions of animal health</li><li>Consumer survey of willigness-to-pay for farm animal we</li><li>The creation of farm-level epi-economic models to model various scenarios</li><li>The creation of farm network models to examine the relationships between farmer decision-making and disease control</li></ul><hr/><h3></h3><h3>History</h3><p>Changes over time</p><p>Experience, understanding and management of BVD and lameness</p><p>How the different farming systems have evolved over time and also what are understandings of \\u2018food farming\\u2019 for different stakeholders</p><p>Texts, images and existing oral history recordings, including journal articles, advertising material, popular press, government material and grey literature and films</p><p>Also give an indication of who is giving what advice</p><p>Understanding the influence of historical forces can also help us to better understand the present, in relation to farming practices, sources of information and consumer behaviour</p><ul><li>Digitisation of historical agricultural images and videos</li><li>Creation of a timeline to display</li><li>Oral history to promote discussion and reflection of life stories</li><li>Exploration of the ways in which farmers, expert advisors, scientific researchers and the state experienced, understood, managed and talked about BVD and lameness<br/></li></ul><hr/><h3></h3><h3>Social Science</h3><p>The social science cluster is tasked with exploring how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other.</p><p>This will be achived through a number of different methods including;</p><ul><li>Survey of farmers to establish farm management practices</li><li>Interviews with farmers, farm advisors</li><li>Focus groups with farmers</li><li>Farm walks to understand the real world context of disease</li></ul><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p>Farm walks to understand the real world context of disease</p><p>Explore how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other</p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p></p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-02-01T14:33:17.101Z", "depth": 5, "draft_title": "Methodology", "live": true, "latest_revision_created_at": "2019-02-01T14:33:17.079Z", "owner": 6, "slug": "methodology", "search_description": "", "content_type": 31, "title": "Methodology"}	\N	27	4
70	f	2019-01-18 13:08:29.614826+00	{"locked": false, "title": "Photos", "draft_title": "Photos", "has_unpublished_changes": false, "first_published_at": null, "depth": 5, "expired": false, "last_published_at": null, "live": false, "content_type": 31, "slug": "photos", "latest_revision_created_at": null, "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "00010002000500020001", "seo_title": "", "live_revision": null, "url_path": "/home2/resources/media/photos/", "owner": 4, "search_description": "", "pk": 30, "body": "<p>We have the <a href=\\"https://merl.reading.ac.uk/\\">Museum of English Rural Life</a> to thank for digitising these fabulous photos of British agriculture from 1947 onwards. Scroll through our gallery to see how livestock production has changed over the decades, or use our <a id=\\"9\\" linktype=\\"page\\">search</a> function to look for something more specific.</p>", "go_live_at": null}	\N	30	4
79	f	2019-01-21 12:25:11.814149+00	{"locked": false, "title": "The Project", "draft_title": "The Project", "has_unpublished_changes": true, "first_published_at": "2019-01-10T13:08:41.922Z", "depth": 4, "expired": false, "last_published_at": "2019-01-11T02:32:31.694Z", "live": true, "content_type": 31, "slug": "project", "latest_revision_created_at": "2019-01-17T10:14:01.376Z", "show_in_menus": true, "numchild": 2, "expire_at": null, "path": "0001000200020001", "seo_title": "", "live_revision": 29, "url_path": "/home2/about/project/", "owner": 2, "search_description": "", "pk": 14, "body": "<p>  </p><p>  </p><p>Livestock disease is a complex problem that threatens the development of more sustainable, ethical and efficient farming methods. While traditional, discipline-specific approaches have helped to address the problem of livestock disease, many of farming\\u2019s current challenges cut across disciplines, affecting animal welfare, the environment, and future food security. A new approach is therefore required to reflect the interdisciplinary nature of the challenges facing farmers today. FIELD aims to provide this by integrating scientific, social scientific and humanities perspectives on two case study health problems in Britain.</p><p>Through embedding these problems in time, space and society, and enrolling farmers and other publics in their investigation, FIELD will interrogate the changing biological, ontological and social identities of livestock diseases, their relationships with livestock systems and farming communities, and how animal behaviours have shaped their expression, interpretation and management by humans. The project explores how responses to disease in the past have informed its effects in the present; how studying disease in the present can enhance understandings of its past, and how these investigations can inform and be informed by future predictions of disease. FIELD will thereby generate new ways of thinking about, predicting, and intervening in the effects of disease on individual farms and in farming communities, for the benefit of animals, farmers, consumers and the environment.</p><p></p><p></p><h2><a id=\\"24\\" linktype=\\"page\\">Approaches</a></h2><p></p><h2><a id=\\"27\\" linktype=\\"page\\">Methodology</a></h2>", "go_live_at": null}	\N	14	6
102	f	2019-01-22 16:35:12.200835+00	{"go_live_at": null, "search_description": "", "slug": "project", "depth": 4, "show_in_menus": true, "expired": false, "url_path": "/home2/about/project/", "numchild": 2, "first_published_at": "2019-01-10T13:08:41.922Z", "has_unpublished_changes": false, "last_published_at": "2019-01-21T15:19:19.231Z", "title": "The Project", "expire_at": null, "draft_title": "The Project", "path": "0001000200020001", "live_revision": 82, "content_type": 31, "owner": 2, "pk": 14, "seo_title": "", "locked": false, "live": true, "body": "<p>Livestock disease is a complex problem that threatens the development of more sustainable, ethical and efficient farming methods. While traditional, discipline-specific approaches have helped to address the problem of livestock disease, many of farming\\u2019s current challenges cut across disciplines, affecting animal welfare, the environment, and future food security. A new approach is therefore required to reflect the interdisciplinary nature of the challenges facing farmers today. FIELD aims to provide this by integrating scientific, social scientific and humanities perspectives on two case study health problems in Britain; BVD and lameness.</p><p>Through embedding these problems in time, space and society, and enrolling farmers and other publics in their investigation, FIELD will interrogate the changing biological, ontological and social identities of livestock diseases, their relationships with livestock systems and farming communities, and how animal behaviours have shaped their expression, interpretation and management by humans. The project explores how responses to disease in the past have informed its effects in the present; how studying disease in the present can enhance understandings of its past, and how these investigations can inform and be informed by future predictions of disease. FIELD will thereby generate new ways of thinking about, predicting, and intervening in the effects of disease on individual farms and in farming communities, for the benefit of animals, farmers, consumers and the environment.</p><p></p><p></p><h2><a id=\\"24\\" linktype=\\"page\\">Approaches</a></h2><p></p><h2><a id=\\"27\\" linktype=\\"page\\">Methodology</a></h2>", "latest_revision_created_at": "2019-01-21T15:19:19.201Z"}	\N	14	4
97	f	2019-01-22 12:19:05.518876+00	{"go_live_at": null, "search_description": "", "slug": "meet-team", "depth": 4, "show_in_menus": true, "expired": false, "url_path": "/home2/about/meet-team/", "numchild": 0, "first_published_at": "2019-01-10T13:08:57.025Z", "has_unpublished_changes": true, "last_published_at": "2019-01-21T15:19:31.147Z", "title": "Research team", "expire_at": null, "draft_title": "Meet the team", "path": "0001000200020002", "live_revision": 84, "content_type": 31, "owner": 2, "pk": 15, "seo_title": "", "locked": false, "live": true, "body": "<h3>Prof Abigail Woods</h3><h4>King&#x27;s College London<br/>History</h4><p>Abigail Woods is Head of the Department of History, and <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Professor in the History of Human and</a> <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Animal Health at King&#x27;s College London.</a> Reflecting her earlier career as a veterinary surgeon, her research focuses on the history of animal health in 19th and 20th century Britain, and its intersections with the histories of human health and livestock production. Her recent research has explored the history of veterinary expertise, policy and practice; the changing concepts of animal health, welfare and productivity; and how patterns and perceptions of livestock disease have changed over time. As principle investigator of the FIELD project, she is developing the first social histories of BVD and cattle lameness, and bringing them into dialogue with contemporary scientific and social scientific perspectives.</p><p></p><hr/><p></p><h3>Nicole Gosling</h3><h4>King&#x27;s College London<br/>History</h4><p>Nicole Gosling is a PhD student at King\\u2019s College in London and will be writing her dissertation as a contribution to the FIELD project. She studied her BSc in Ecology at the University of Victoria, and recently completed an MA in Environmental History at Uppsala University. Broadly speaking, Nicole\\u2019s interests include how humans interact with nature, with a focus on human-animal relationships. She explored these relationships in her master\\u2019s thesis \\u2018Making Sense of Cattle: A story from farm to food\\u2019 where she looked at how different actors experience cattle bodies during the production of beef. Building on this line of thinking, Nicole\\u2019s role in the FIELD project will be focused on the history of lameness in sheep.</p><p></p><hr/><p></p><h3>Prof Karen Sayer</h3><h4>Leeds Trinity University<br/>History</h4><p><a href=\\"http://research.leedstrinity.ac.uk/en/persons/karen-sayer(5c5fb33f-b15c-497f-870a-ad1d04f03454).html\\">Professor of Social and Cultural History at Leeds Trinity University,</a> Leeds, UK, Karen Sayer specialises in the study of British agriculture, landscape and environment in the 19th and 20th centuries. Her first monograph, <i>Women of the Fields: Representations of Femininity in Nineteenth Century Rural Society</i> (MUP 1995) used a discursive and interdisciplinary approach to assess the representation of women\\u2019s work in agriculture in Parliamentary Reports alongside art, literature and the press, to explain legislative intervention and control of their employment. She built on this work with her second monograph <i>Country Cottages: A Cultural History</i> (MUP, 2000). Drawing on the work of the social sciences, architecture and geography to scrutinise the values attached historically to the idea and material culture of the cottage, and the experiences of those who inhabited it, the book encompassed a spatial reading of the political and material effects of the rural idyll that impact at the level of national identity and \\u2018race\\u2019, class and sex. She has continued to address the shape of, values attaching to and understandings of the British landscape and environment, and experiences of those living in the countryside. Today she works on energy landscapes \\u2013 e.g. with P. Brassley &amp; J. Burchardt <i>Transforming the countryside?</i> <i>The Electrification of Rural England 1890-1970</i> (Routledge, 2016) \\u2013 the managed spaces of the farm, history of livestock agriculture and animal history.</p><p>Within the FIELD project, she addresses the tensions that beset the \\u2018modernisation\\u2019 of UK livestock farming after 1947 and the different, competing messages attaching to animal welfare and consumption, as seen in the use of the British countryside as site of amenity and site of production. This work incorporates ideas of animals as active agents of history, and is framed by notions of interconnectivity of farm, the farm animal, disease organisms, farmers, labourers, marketeers, sales reps, government officials, journalists and the non-farming public over time.</p><p></p><hr/><p></p><h3>Dr James Bowen</h3><h4>Leeds Trinity University<br/>History</h4><p>James P. Bowen is a Post-Doctoral Research Associate in History based at Leeds Trinity University with research interests in agricultural and rural history. He was formerly a Research Associate (Victoria County History-Cumbria Project) in the Department of History, Lancaster University and was the Contributing Editor for The Herefordshire Victoria County History Trust Short on the parish of Colwall. He was formerly a Post-Doctoral Research Associate based at the Department of Geography and Planning, University of Liverpool employed on \\u2018Spaces of experience and horizons of expectation: the implications of extreme weather events, past, present and future\\u2019, a three-year project, funded as part of the Care for the Future programme of the Arts and Humanities Research Council.He completed a PhD at Lancaster University supervised by Professor A.J.L. Winchester and held the Economic History Society\\u2019s Tawney Junior Research Fellowship in 2012-13 at the Institute of Historical Research, London.</p><p></p><hr/><p></p><h3>Dr Amy Proctor</h3><h4>Newcastle University<br/>Social Science</h4><p><a href=\\"https://www.ncl.ac.uk/cre/about/staff/profile/amyproctornclacuk.html#background\\">Amy Proctor</a> is based at the <a href=\\"https://www.ncl.ac.uk/cre/\\">Centre for Rural Economy</a> at Newcastle University. She is interested in agricultural extension and processes of expertise exchange within rural land management and has published widely on this. Her research has focused on the knowledge-practices of farmers and their advisors and the performance and practice of the advisory encounter. Amy is also interested in developing innovative and interactive ways of engaging with stakeholders and has co-led <a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a>, a national knowledge exchange network for rural professionals which provides a platform for inter-professional learning and debate among farm advisers and opportunities for exchange with research communities. In FIELD, Amy will develop and conduct the social science aspects of the project including in-depth interviews and ethnographic research with farmers and advisers and focus groups with farmers and consumers.</p><p></p><hr/><p></p><h3>Sue Bradley</h3><h4>Newcastle University<br/>History</h4><p>Sue Bradley is an oral historian in the <a href=\\"https://www.ncl.ac.uk/cre/\\">Centre for Rural Economy</a>, Newcastle University, where her research has ranged from flood risk to honey bee health and veterinary practice. She is interested in how oral history can help to address current concerns, and in using audio testimonies from older practitioners as a basis for discussions with their counterparts today. Her work for FIELD includes recording a collection of life-story interviews that will contribute insights from first-hand accounts of working with cattle and sheep in the north of England since the 1940&#x27;s. This collection will be archived at the <a href=\\"https://merl.reading.ac.uk/\\">Museum for English Rural Life</a> to serve beyond the project as a permanent public research resource. Sue also works part-time in <a href=\\"https://research.ncl.ac.uk/oralhistory/\\">Newcastle University\\u2019s Oral History Unit</a>. Before coming to Newcastle she was responsible for creating the British Library\\u2019s Book Trade Lives collection of recordings with booksellers and publishers.</p><p></p><hr/><p></p><h3>Dr Beth Clark</h3><h4>Newcastle University<br/>Social Science</h4><p><a href=\\"https://www.ncl.ac.uk/cre/about/staff/profile/bethclark.html#background\\">Beth\\u2019s</a> research background in sports, exercise and nutrition and food marketing reflects her research interests in food and communication. She is particularly interested in exploring how people relate to animal products and different food production practices, such as motivations for food choice, innovation and technology in production, knowledge of food production practices, and food cultures. Through this she works with a range of stakeholders from across the food supply chain, which has fuelled an interest in communication, including how individuals and groups share information and trust different information sources.She has two roles on the FIELD project. The first is part of the social science research team, involving interviews, focus groups and observations with farmers, farming advisors and the public, to explore their different experiences and perceptions of endemic livestock disease. The second role focuses on public engagement, including the online communications and website for FIELD, as well as identifying and organising opportunities for greater interaction with the projects many stakeholders, including members of the farming community and the public.</p><hr/><p></p><h3>Dr Ewan Coleman</h3><h4>University of Edinburgh<br/>Epidemiology &amp; Economics</h4><p>Ewan Colman is a post-doctoral research associate at the <a href=\\"https://www.ed.ac.uk/roslin\\">Roslin Institute</a> at the University of Edinburgh. He has a background in mathematics, particularly in applied probability, data science, and network science. His research uses computational modelling to explore the relationship between behaviour and the spread of infectious disease. Ewan&#x27;s past interests include the dynamics of conversations on social media, the social and spatial organisation of ant colonies, and the how the ever-increasing amount of public health data can be exploited to detect and mitigate epidemic diseases. As a member of the FIELD project, he will focus on the spread of BVD through cattle trade, and how changing attitudes towards biosecurity can reduce the prevalence of BVD on a national scale.</p><p></p><hr/><p></p><h3>Prof Rowland Kao</h3><h4>University of Edinburgh<br/>Epidemiology &amp; Economics</h4><p>Awaiting text</p><p></p><hr/><p></p><h3>Maria Suella Rodrigues</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Maria Suella Rodrigues is a doctoral candidate at the University of Glasgow, supervised under Professor Nicholas Hanley (MVLS), Dr. Souvik Datta (ASBS) at the University of Glasgow and Professor Rowland Kao from the University of Edinburgh. Maria holds a BSc degree in Economics from Lancaster University. Following that she moved to the University of Glasgow where she pursued the MRes in Economics, graduating in 2018. She is interested in investigating research questions in the areas of agricultural and environmental economics as well as applied micro-econometrics and choice-modelling theory. During her MRes dissertation she modelled consumer preferences for forest disease management with use of Choice modelling data. Additionally, she has received extensive training in choice-modelling from the Choice Modelling Centre, University of Leeds. As part of the FIELD project, Maria will design field experiments and model both farmer and consumer preferences in relation to farm animal welfare.</p><p></p><hr/><p></p><h3>Dr Lewis Holloway</h3><h4>University of Hull<br/>Social Science</h4><p><a href=\\"https://www.hull.ac.uk/faculties/staff-profiles/lewis-holloway.aspx\\">Lewis Holloway</a> is a Reader in Human Geography at the University of Hull. He has research interests in food, farming and the countryside, and has a particular interest in farm animals and agricultural technologies. Recent research has focused on the ways in which genetic, information and robotic technologies have affected livestock farming, and has involved in-depth research with farmers and technology developers to understand how new technologies are engaged with, adopted and contested by farmers. Lewis is interested in the situated ethics associated with animal agriculture, and in how technologies can transform farming ethics and knowledge-practices. Lewis will be involved in developing and conducting the social scientific elements of the FIELD project. This will include on-farm interview and observational work with farmers, farm animals and expert advisors, and focus groups with farmers and public groups.</p><p></p><hr/><p></p><h3>Dr Niamh Mahon</h3><h4>University of Hull<br/>Social Science</h4><p><a href=\\"https://www.researchgate.net/profile/Niamh_Mahon\\">Niamh</a> is a Post-Doctoral Research Associate at the University of Hull. In this role she is involved in the social science components of the FIELD project. This includes in-depth interviews and observational work with farmers and expert advisors, and focus groups with farmers and the public, conducted to explore their different experiences and perceptions of endemic livestock disease. Prior to this Niamh under took a PhD at Nottingham Trent University developing stakeholder-sensitive indicators of the Sustainable Intensification of UK agriculture and a Master\\u2019s degree from the University of East Anglia in Sustainable Agriculture and Food Security. She has also worked as a research assistant in socio-economics and policy for the Organic Research Centre. Niamh is a member of the Food and Climate Research Network and the Sustainable Intensification Research Network.</p><p></p><hr/><p></p><h3>Prof Nick Hanley</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Nick Hanley is a <a href=\\"https://www.gla.ac.uk/researchinstitutes/bahcm/staff/nicholashanley/\\">Professor of Environmental and One Health Economics</a> at the University of Glasgow. His PhD was in Agricultural Economics. His current main research interests include behavioural economics, the design of Payment for Ecosystem Service schemes, environmental valuation,one health economics, the economics of sustainable development, markets for biodiversity offsets,and the economics of invasive species.He is an honorary professor at the universities of St Andrews and Stirling. Nick is co-author of a textbook in environmental cost-benefit analysis with Edward Barbier; and two textbooks on environmental economics (with Jason Shogren and Ben White).</p><p></p>", "latest_revision_created_at": "2019-01-22T12:11:53.941Z"}	\N	15	4
72	f	2019-01-18 13:10:11.509631+00	{"locked": false, "title": "Policy and practice notes", "draft_title": "Policy and practice notes", "has_unpublished_changes": false, "first_published_at": null, "depth": 4, "expired": false, "last_published_at": null, "live": false, "content_type": 31, "slug": "policy-and-practice-notes", "latest_revision_created_at": null, "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "0001000200050003", "seo_title": "", "live_revision": null, "url_path": "/home2/resources/policy-and-practice-notes/", "owner": 4, "search_description": "", "pk": 32, "body": "<p>Our policy and practice notes have been designed to provide short and insightful summaries into key findings from the project and what these could mean in terms of farming policy and practice. Click on each note below to read more.</p><p>Have any questions about these? Then <a id=\\"8\\" linktype=\\"page\\">contact us.</a></p>", "go_live_at": null}	\N	32	4
160	f	2019-02-01 15:00:11.416218+00	{"first_published_at": "2019-01-18T10:05:05.566Z", "url_path": "/home2/about/project/methodology/", "expire_at": null, "path": "00010002000200010002", "numchild": 0, "show_in_menus": false, "pk": 27, "has_unpublished_changes": true, "live_revision": 157, "expired": false, "locked": false, "body": "<p>The research team is formed of three disciplinary clusters. Although the three clusters have their own research they will each will draw upon and feed into the others. Each cluster will therefore not be working in isolation, reflecting the interdisciplinary approach at the core of the project. Find out more about the methods being used in the three clusters below.</p><p></p><hr/><p></p><hr/><h3></h3><h3>Economics and Epidemiology</h3><p>Better understanding of the spatial interactions amongst farmers</p><p>Simulation models to enable prediction of responses to a range of factors including disease parameters, costs, support measures and new information</p><p>Examine how farmer decision making is affected by past experience of disease, health and welfare priorities, perceptions and evaluations of disease management methods</p><p>Variation in consumer preferences</p><p>Look to establish trade-offs</p><p>WTP animal welfare in relation to other product attributes</p><p>Models that incorporate aspects from the other disciplines, such as social pressures, economic incentives and past disease experiences may improve disease predictions</p><p></p><p>Greater understanding of human-animal relationships and how these relate to animal health and welfare</p><ul><li>Farmer survey of farm animal health</li><li>&#x27;Food busk&#x27; to establish public perceptions of animal health</li><li>Consumer survey of willigness-to-pay for farm animal we</li><li>The creation of farm-level epi-economic models to model various scenarios</li><li>The creation of farm network models to examine the relationships between farmer decision-making and disease control</li></ul><hr/><h3></h3><h3>History</h3><p>The history team will explore the post-war changes in animal production systems and disease management.</p><p>Experience, understanding and management of BVD and lameness</p><p>How the different farming systems have evolved over time and also what are understandings of \\u2018food farming\\u2019 for different stakeholders</p><p>Texts, images and existing oral history recordings, including journal articles, advertising material, popular press, government material and grey literature and films</p><p>Also give an indication of who is giving what advice</p><p>Understanding the influence of historical forces can also help us to better understand the present, in relation to farming practices, sources of information and consumer behaviour</p><ul><li>Digitisation of historical agricultural images and videos</li><li>Creation of a timeline to display</li><li>Oral history to promote discussion and reflection of life stories</li><li>Exploration of the ways in which farmers, expert advisors, scientific researchers and the state experienced, understood, managed and talked about BVD and lameness</li><li>The evolution<br/></li></ul><hr/><h3></h3><h3>Social Science</h3><p>The social science cluster is tasked with exploring how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other.</p><p>This will be achived through a number of different methods including;</p><ul><li>Survey of farmers to establish farm management practices</li><li>Interviews with farmers, farm advisors</li><li>Focus groups with farmers</li><li>Farm walks to understand the real world context of disease</li></ul><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p>Farm walks to understand the real world context of disease</p><p>Explore how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other</p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p></p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-02-01T14:33:17.101Z", "depth": 5, "draft_title": "Methodology", "live": true, "latest_revision_created_at": "2019-02-01T14:42:19.448Z", "owner": 6, "slug": "methodology", "search_description": "", "content_type": 31, "title": "Methodology"}	\N	27	4
199	f	2019-02-21 10:46:26.725274+00	{"go_live_at": null, "seo_title": "", "title": "Videos", "last_published_at": "2019-01-25T12:52:07.664Z", "expire_at": null, "path": "00010002000500020003", "expired": false, "slug": "videos", "locked": false, "first_published_at": "2019-01-25T12:52:07.664Z", "depth": 5, "owner": 6, "body": "<p></p>", "pk": 39, "content_type": 31, "live_revision": 118, "latest_revision_created_at": "2019-01-25T12:52:07.645Z", "search_description": "", "live": true, "url_path": "/home2/resources/media/videos/", "draft_title": "Videos", "has_unpublished_changes": false, "numchild": 0, "show_in_menus": true}	\N	39	2
55	f	2019-01-17 10:11:05.334007+00	{"locked": false, "title": "The Project", "draft_title": "The Project", "has_unpublished_changes": false, "first_published_at": "2019-01-10T13:08:41.922Z", "depth": 4, "expired": false, "last_published_at": "2019-01-11T02:32:31.694Z", "live": true, "content_type": 31, "slug": "project", "latest_revision_created_at": "2019-01-11T02:32:31.673Z", "show_in_menus": true, "numchild": 1, "expire_at": null, "path": "0001000200030001", "seo_title": "", "live_revision": 29, "url_path": "/home2/about/project/", "owner": 2, "search_description": "", "pk": 14, "body": "<p>Livestock disease today is a complex problem that threatens the development of more sustainable, ethical and efficient farming methods. While traditional,discipline-specific approaches have helped to address this problem, many of farming\\u2019s current challenges cut across disciplines, affecting animal welfare, the environment, and future food security. A new approach is therefore required, which FIELD provides by integrating scientific, social scientific and humanities perspectives on two case study health problems in Britain. </p><p>Through embedding these problems in time, space and society, and enrolling farmers and other publics in their investigation, FIELD will interrogate their changing biological, ontological and social identities, their relationships with livestock systems and farming communities, and how animal behaviours have shaped their expression, interpretation and management by humans. The project explores how responses to disease in the past have informed its effects in the present; how studying disease in the present can enhance understandings of its past, and how these investigations can inform and be informed by future predictions of disease. FIELD will thereby generate new ways of thinking about, predicting, and intervening in the effects of disease on individual farms and in farming communities, for the benefit of animals, farmers, consumers and the environment.</p><p></p><h2><a id=\\"24\\" linktype=\\"page\\">Approaches</a></h2><h2>Methodology</h2>", "go_live_at": null}	\N	14	6
107	f	2019-01-22 17:05:46.004294+00	{"entry_categories": [], "go_live_at": "2019-01-11T14:32:00Z", "search_description": "", "slug": "news-item-test", "depth": 4, "show_in_menus": false, "expired": false, "url_path": "/home2/blog-news/news-item-test/", "num_comments": 0, "header_image": null, "numchild": 0, "first_published_at": "2019-01-11T14:33:17.886Z", "has_unpublished_changes": false, "excerpt": "<p></p>", "last_published_at": "2019-01-11T14:33:17.886Z", "title": "Main text", "expire_at": "2019-01-31T14:32:00Z", "draft_title": "News Item test", "path": "0001000200060003", "live_revision": 54, "content_type": 37, "owner": 4, "pk": 26, "related_entrypage_to": [], "seo_title": "", "locked": false, "live": true, "related_entrypage_from": [], "body": "<p>Stay up to date with the latest FIELD project news, research and events with our news hub! Follow us on <a href=\\"https://twitter.com/field_wt\\">Twitter</a> to get the latest insights into the project. Explore our news section to get more in-depth insights on project events, results and key discussions from the mainstream press or find out more about what the FIELD team is up to in our blog.</p><p>Do you have something that you think should be featured on our news or blog, or think there is an event near you that we should be attending? <a id=\\"8\\" linktype=\\"page\\">Contact us</a> to let us know!</p>", "entry_tags": [{"tag": 2, "pk": null, "content_object": 26}, {"tag": 3, "pk": null, "content_object": 26}], "date": "2019-01-11T14:28:00Z", "latest_revision_created_at": "2019-01-11T14:33:17.859Z"}	\N	26	4
98	f	2019-01-22 12:19:50.936258+00	{"go_live_at": null, "search_description": "", "slug": "research-team", "depth": 4, "show_in_menus": true, "expired": false, "url_path": "/home2/about/meet-team/", "numchild": 0, "first_published_at": "2019-01-10T13:08:57.025Z", "has_unpublished_changes": true, "last_published_at": "2019-01-21T15:19:31.147Z", "title": "Research team", "expire_at": null, "draft_title": "Research team", "path": "0001000200020002", "live_revision": 84, "content_type": 31, "owner": 2, "pk": 15, "seo_title": "", "locked": false, "live": true, "body": "<h3>Prof Abigail Woods</h3><h4>King&#x27;s College London<br/>History</h4><p>Abigail Woods is Head of the Department of History, and <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Professor in the History of Human and</a> <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Animal Health at King&#x27;s College London.</a> Reflecting her earlier career as a veterinary surgeon, her research focuses on the history of animal health in 19th and 20th century Britain, and its intersections with the histories of human health and livestock production. Her recent research has explored the history of veterinary expertise, policy and practice; the changing concepts of animal health, welfare and productivity; and how patterns and perceptions of livestock disease have changed over time. As principle investigator of the FIELD project, she is developing the first social histories of BVD and cattle lameness, and bringing them into dialogue with contemporary scientific and social scientific perspectives.</p><p></p><hr/><p></p><h3>Nicole Gosling</h3><h4>King&#x27;s College London<br/>History</h4><p>Nicole Gosling is a PhD student at King\\u2019s College in London and will be writing her dissertation as a contribution to the FIELD project. She studied her BSc in Ecology at the University of Victoria, and recently completed an MA in Environmental History at Uppsala University. Broadly speaking, Nicole\\u2019s interests include how humans interact with nature, with a focus on human-animal relationships. She explored these relationships in her master\\u2019s thesis \\u2018Making Sense of Cattle: A story from farm to food\\u2019 where she looked at how different actors experience cattle bodies during the production of beef. Building on this line of thinking, Nicole\\u2019s role in the FIELD project will be focused on the history of lameness in sheep.</p><p></p><hr/><p></p><h3>Prof Karen Sayer</h3><h4>Leeds Trinity University<br/>History</h4><p><a href=\\"http://research.leedstrinity.ac.uk/en/persons/karen-sayer(5c5fb33f-b15c-497f-870a-ad1d04f03454).html\\">Professor of Social and Cultural History at Leeds Trinity University,</a> Leeds, UK, Karen Sayer specialises in the study of British agriculture, landscape and environment in the 19th and 20th centuries. Her first monograph, <i>Women of the Fields: Representations of Femininity in Nineteenth Century Rural Society</i> (MUP 1995) used a discursive and interdisciplinary approach to assess the representation of women\\u2019s work in agriculture in Parliamentary Reports alongside art, literature and the press, to explain legislative intervention and control of their employment. She built on this work with her second monograph <i>Country Cottages: A Cultural History</i> (MUP, 2000). Drawing on the work of the social sciences, architecture and geography to scrutinise the values attached historically to the idea and material culture of the cottage, and the experiences of those who inhabited it, the book encompassed a spatial reading of the political and material effects of the rural idyll that impact at the level of national identity and \\u2018race\\u2019, class and sex. She has continued to address the shape of, values attaching to and understandings of the British landscape and environment, and experiences of those living in the countryside. Today she works on energy landscapes \\u2013 e.g. with P. Brassley &amp; J. Burchardt <i>Transforming the countryside?</i> <i>The Electrification of Rural England 1890-1970</i> (Routledge, 2016) \\u2013 the managed spaces of the farm, history of livestock agriculture and animal history.</p><p>Within the FIELD project, she addresses the tensions that beset the \\u2018modernisation\\u2019 of UK livestock farming after 1947 and the different, competing messages attaching to animal welfare and consumption, as seen in the use of the British countryside as site of amenity and site of production. This work incorporates ideas of animals as active agents of history, and is framed by notions of interconnectivity of farm, the farm animal, disease organisms, farmers, labourers, marketeers, sales reps, government officials, journalists and the non-farming public over time.</p><p></p><hr/><p></p><h3>Dr James Bowen</h3><h4>Leeds Trinity University<br/>History</h4><p>James P. Bowen is a Post-Doctoral Research Associate in History based at Leeds Trinity University with research interests in agricultural and rural history. He was formerly a Research Associate (Victoria County History-Cumbria Project) in the Department of History, Lancaster University and was the Contributing Editor for The Herefordshire Victoria County History Trust Short on the parish of Colwall. He was formerly a Post-Doctoral Research Associate based at the Department of Geography and Planning, University of Liverpool employed on \\u2018Spaces of experience and horizons of expectation: the implications of extreme weather events, past, present and future\\u2019, a three-year project, funded as part of the Care for the Future programme of the Arts and Humanities Research Council.He completed a PhD at Lancaster University supervised by Professor A.J.L. Winchester and held the Economic History Society\\u2019s Tawney Junior Research Fellowship in 2012-13 at the Institute of Historical Research, London.</p><p></p><hr/><p></p><h3>Dr Amy Proctor</h3><h4>Newcastle University<br/>Social Science</h4><p><a href=\\"https://www.ncl.ac.uk/cre/about/staff/profile/amyproctornclacuk.html#background\\">Amy Proctor</a> is based at the <a href=\\"https://www.ncl.ac.uk/cre/\\">Centre for Rural Economy</a> at Newcastle University. She is interested in agricultural extension and processes of expertise exchange within rural land management and has published widely on this. Her research has focused on the knowledge-practices of farmers and their advisors and the performance and practice of the advisory encounter. Amy is also interested in developing innovative and interactive ways of engaging with stakeholders and has co-led <a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a>, a national knowledge exchange network for rural professionals which provides a platform for inter-professional learning and debate among farm advisers and opportunities for exchange with research communities. In FIELD, Amy will develop and conduct the social science aspects of the project including in-depth interviews and ethnographic research with farmers and advisers and focus groups with farmers and consumers.</p><p></p><hr/><p></p><h3>Sue Bradley</h3><h4>Newcastle University<br/>History</h4><p>Sue Bradley is an oral historian in the <a href=\\"https://www.ncl.ac.uk/cre/\\">Centre for Rural Economy</a>, Newcastle University, where her research has ranged from flood risk to honey bee health and veterinary practice. She is interested in how oral history can help to address current concerns, and in using audio testimonies from older practitioners as a basis for discussions with their counterparts today. Her work for FIELD includes recording a collection of life-story interviews that will contribute insights from first-hand accounts of working with cattle and sheep in the north of England since the 1940&#x27;s. This collection will be archived at the <a href=\\"https://merl.reading.ac.uk/\\">Museum for English Rural Life</a> to serve beyond the project as a permanent public research resource. Sue also works part-time in <a href=\\"https://research.ncl.ac.uk/oralhistory/\\">Newcastle University\\u2019s Oral History Unit</a>. Before coming to Newcastle she was responsible for creating the British Library\\u2019s Book Trade Lives collection of recordings with booksellers and publishers.</p><p></p><hr/><p></p><h3>Dr Beth Clark</h3><h4>Newcastle University<br/>Social Science</h4><p><a href=\\"https://www.ncl.ac.uk/cre/about/staff/profile/bethclark.html#background\\">Beth\\u2019s</a> research background in sports, exercise and nutrition and food marketing reflects her research interests in food and communication. She is particularly interested in exploring how people relate to animal products and different food production practices, such as motivations for food choice, innovation and technology in production, knowledge of food production practices, and food cultures. Through this she works with a range of stakeholders from across the food supply chain, which has fuelled an interest in communication, including how individuals and groups share information and trust different information sources.She has two roles on the FIELD project. The first is part of the social science research team, involving interviews, focus groups and observations with farmers, farming advisors and the public, to explore their different experiences and perceptions of endemic livestock disease. The second role focuses on public engagement, including the online communications and website for FIELD, as well as identifying and organising opportunities for greater interaction with the projects many stakeholders, including members of the farming community and the public.</p><hr/><p></p><h3>Dr Ewan Coleman</h3><h4>University of Edinburgh<br/>Epidemiology &amp; Economics</h4><p>Ewan Colman is a post-doctoral research associate at the <a href=\\"https://www.ed.ac.uk/roslin\\">Roslin Institute</a> at the University of Edinburgh. He has a background in mathematics, particularly in applied probability, data science, and network science. His research uses computational modelling to explore the relationship between behaviour and the spread of infectious disease. Ewan&#x27;s past interests include the dynamics of conversations on social media, the social and spatial organisation of ant colonies, and the how the ever-increasing amount of public health data can be exploited to detect and mitigate epidemic diseases. As a member of the FIELD project, he will focus on the spread of BVD through cattle trade, and how changing attitudes towards biosecurity can reduce the prevalence of BVD on a national scale.</p><p></p><hr/><p></p><h3>Prof Rowland Kao</h3><h4>University of Edinburgh<br/>Epidemiology &amp; Economics</h4><p>Awaiting text</p><p></p><hr/><p></p><h3>Maria Suella Rodrigues</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Maria Suella Rodrigues is a doctoral candidate at the University of Glasgow, supervised under Professor Nicholas Hanley (MVLS), Dr. Souvik Datta (ASBS) at the University of Glasgow and Professor Rowland Kao from the University of Edinburgh. Maria holds a BSc degree in Economics from Lancaster University. Following that she moved to the University of Glasgow where she pursued the MRes in Economics, graduating in 2018. She is interested in investigating research questions in the areas of agricultural and environmental economics as well as applied micro-econometrics and choice-modelling theory. During her MRes dissertation she modelled consumer preferences for forest disease management with use of Choice modelling data. Additionally, she has received extensive training in choice-modelling from the Choice Modelling Centre, University of Leeds. As part of the FIELD project, Maria will design field experiments and model both farmer and consumer preferences in relation to farm animal welfare.</p><p></p><hr/><p></p><h3>Dr Lewis Holloway</h3><h4>University of Hull<br/>Social Science</h4><p><a href=\\"https://www.hull.ac.uk/faculties/staff-profiles/lewis-holloway.aspx\\">Lewis Holloway</a> is a Reader in Human Geography at the University of Hull. He has research interests in food, farming and the countryside, and has a particular interest in farm animals and agricultural technologies. Recent research has focused on the ways in which genetic, information and robotic technologies have affected livestock farming, and has involved in-depth research with farmers and technology developers to understand how new technologies are engaged with, adopted and contested by farmers. Lewis is interested in the situated ethics associated with animal agriculture, and in how technologies can transform farming ethics and knowledge-practices. Lewis will be involved in developing and conducting the social scientific elements of the FIELD project. This will include on-farm interview and observational work with farmers, farm animals and expert advisors, and focus groups with farmers and public groups.</p><p></p><hr/><p></p><h3>Dr Niamh Mahon</h3><h4>University of Hull<br/>Social Science</h4><p><a href=\\"https://www.researchgate.net/profile/Niamh_Mahon\\">Niamh</a> is a Post-Doctoral Research Associate at the University of Hull. In this role she is involved in the social science components of the FIELD project. This includes in-depth interviews and observational work with farmers and expert advisors, and focus groups with farmers and the public, conducted to explore their different experiences and perceptions of endemic livestock disease. Prior to this Niamh under took a PhD at Nottingham Trent University developing stakeholder-sensitive indicators of the Sustainable Intensification of UK agriculture and a Master\\u2019s degree from the University of East Anglia in Sustainable Agriculture and Food Security. She has also worked as a research assistant in socio-economics and policy for the Organic Research Centre. Niamh is a member of the Food and Climate Research Network and the Sustainable Intensification Research Network.</p><p></p><hr/><p></p><h3>Prof Nick Hanley</h3><h4>University of Glasgow<br/>Epidemiology &amp; Economics</h4><p>Nick Hanley is a <a href=\\"https://www.gla.ac.uk/researchinstitutes/bahcm/staff/nicholashanley/\\">Professor of Environmental and One Health Economics</a> at the University of Glasgow. His PhD was in Agricultural Economics. His current main research interests include behavioural economics, the design of Payment for Ecosystem Service schemes, environmental valuation,one health economics, the economics of sustainable development, markets for biodiversity offsets,and the economics of invasive species.He is an honorary professor at the universities of St Andrews and Stirling. Nick is co-author of a textbook in environmental cost-benefit analysis with Edward Barbier; and two textbooks on environmental economics (with Jason Shogren and Ben White).</p><p></p>", "latest_revision_created_at": "2019-01-22T12:19:05.518Z"}	\N	15	4
105	f	2019-01-22 17:01:53.308995+00	{"go_live_at": null, "search_description": "", "slug": "research-team", "depth": 4, "show_in_menus": true, "expired": false, "url_path": "/home2/about/research-team/", "numchild": 0, "first_published_at": "2019-01-10T13:08:57.025Z", "has_unpublished_changes": true, "last_published_at": "2019-01-21T15:19:31.147Z", "title": "Research team", "expire_at": null, "draft_title": "Research team", "path": "0001000200020002", "live_revision": 84, "content_type": 31, "owner": 2, "pk": 15, "seo_title": "", "locked": false, "live": true, "body": "<p>The research on the FIELD research project will be conducted by a team of 12 individuals from 6 different UK universities, and from 3 different scientific disciplines.</p><p>Find out more about the different team members below.</p><p></p><hr/><h2>Prof Abigail Woods</h2><h3>King&#x27;s College London</h3><h4>History</h4><p>Abigail Woods is Head of the Department of History, and <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Professor in the History of Human and</a> <a href=\\"https://www.kcl.ac.uk/people/person.aspx?id=d96b2f85-d0fd-4df8-832b-f72b2d3243d3\\">Animal Health at King&#x27;s College London.</a> Reflecting her earlier career as a veterinary surgeon, her research focuses on the history of animal health in 19th and 20th century Britain, and its intersections with the histories of human health and livestock production. Her recent research has explored the history of veterinary expertise, policy and practice; the changing concepts of animal health, welfare and productivity; and how patterns and perceptions of livestock disease have changed over time. As principle investigator of the FIELD project, she is developing the first social histories of BVD and cattle lameness, and bringing them into dialogue with contemporary scientific and social scientific perspectives.</p><p></p><hr/><h2>Nicole Gosling</h2><h3>King&#x27;s College London</h3><h4>History</h4><p>Nicole Gosling is a PhD student at King\\u2019s College in London and will be writing her dissertation as a contribution to the FIELD project. She studied her BSc in Ecology at the University of Victoria, and recently completed an MA in Environmental History at Uppsala University. Broadly speaking, Nicole\\u2019s interests include how humans interact with nature, with a focus on human-animal relationships. She explored these relationships in her master\\u2019s thesis \\u2018Making Sense of Cattle: A story from farm to food\\u2019 where she looked at how different actors experience cattle bodies during the production of beef. Building on this line of thinking, Nicole\\u2019s role in the FIELD project will be focused on the history of lameness in sheep.</p><p></p><hr/><h2>Prof Karen Sayer</h2><h3>Leeds Trinity University</h3><h4>History</h4><p><a href=\\"http://research.leedstrinity.ac.uk/en/persons/karen-sayer(5c5fb33f-b15c-497f-870a-ad1d04f03454).html\\">Professor of Social and Cultural History at Leeds Trinity University,</a> Leeds, UK, Karen Sayer specialises in the study of British agriculture, landscape and environment in the 19th and 20th centuries. Her first monograph, <i>Women of the Fields: Representations of Femininity in Nineteenth Century Rural Society</i> (MUP 1995) used a discursive and interdisciplinary approach to assess the representation of women\\u2019s work in agriculture in Parliamentary Reports alongside art, literature and the press, to explain legislative intervention and control of their employment. She built on this work with her second monograph <i>Country Cottages: A Cultural History</i> (MUP, 2000). Drawing on the work of the social sciences, architecture and geography to scrutinise the values attached historically to the idea and material culture of the cottage, and the experiences of those who inhabited it, the book encompassed a spatial reading of the political and material effects of the rural idyll that impact at the level of national identity and \\u2018race\\u2019, class and sex. She has continued to address the shape of, values attaching to and understandings of the British landscape and environment, and experiences of those living in the countryside. Today she works on energy landscapes \\u2013 e.g. with P. Brassley &amp; J. Burchardt <i>Transforming the countryside?</i> <i>The Electrification of Rural England 1890-1970</i> (Routledge, 2016) \\u2013 the managed spaces of the farm, history of livestock agriculture and animal history.</p><p>Within the FIELD project, she addresses the tensions that beset the \\u2018modernisation\\u2019 of UK livestock farming after 1947 and the different, competing messages attaching to animal welfare and consumption, as seen in the use of the British countryside as site of amenity and site of production. This work incorporates ideas of animals as active agents of history, and is framed by notions of interconnectivity of farm, the farm animal, disease organisms, farmers, labourers, marketeers, sales reps, government officials, journalists and the non-farming public over time.</p><p></p><hr/><h2>Dr James Bowen</h2><h3>Leeds Trinity University</h3><h4>History</h4><p>James P. Bowen is a Post-Doctoral Research Associate in History based at Leeds Trinity University with research interests in agricultural and rural history. He was formerly a Research Associate (Victoria County History-Cumbria Project) in the Department of History, Lancaster University and was the Contributing Editor for The Herefordshire Victoria County History Trust Short on the parish of Colwall. He was formerly a Post-Doctoral Research Associate based at the Department of Geography and Planning, University of Liverpool employed on \\u2018Spaces of experience and horizons of expectation: the implications of extreme weather events, past, present and future\\u2019, a three-year project, funded as part of the Care for the Future programme of the Arts and Humanities Research Council.He completed a PhD at Lancaster University supervised by Professor A.J.L. Winchester and held the Economic History Society\\u2019s Tawney Junior Research Fellowship in 2012-13 at the Institute of Historical Research, London.</p><p></p><hr/><h2>Dr Amy Proctor</h2><h3>Newcastle University</h3><h4>Social Science</h4><p><a href=\\"https://www.ncl.ac.uk/cre/about/staff/profile/amyproctornclacuk.html#background\\">Amy Proctor</a> is based at the <a href=\\"https://www.ncl.ac.uk/cre/\\">Centre for Rural Economy</a> at Newcastle University. She is interested in agricultural extension and processes of expertise exchange within rural land management and has published widely on this. Her research has focused on the knowledge-practices of farmers and their advisors and the performance and practice of the advisory encounter. Amy is also interested in developing innovative and interactive ways of engaging with stakeholders and has co-led <a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a>, a national knowledge exchange network for rural professionals which provides a platform for inter-professional learning and debate among farm advisers and opportunities for exchange with research communities. In FIELD, Amy will develop and conduct the social science aspects of the project including in-depth interviews and ethnographic research with farmers and advisers and focus groups with farmers and consumers.</p><p></p><hr/><h2>Sue Bradley</h2><h3>Newcastle University</h3><h4>History</h4><p>Sue Bradley is an oral historian in the <a href=\\"https://www.ncl.ac.uk/cre/\\">Centre for Rural Economy</a>, Newcastle University, where her research has ranged from flood risk to honey bee health and veterinary practice. She is interested in how oral history can help to address current concerns, and in using audio testimonies from older practitioners as a basis for discussions with their counterparts today. Her work for FIELD includes recording a collection of life-story interviews that will contribute insights from first-hand accounts of working with cattle and sheep in the north of England since the 1940&#x27;s. This collection will be archived at the <a href=\\"https://merl.reading.ac.uk/\\">Museum for English Rural Life</a> to serve beyond the project as a permanent public research resource. Sue also works part-time in <a href=\\"https://research.ncl.ac.uk/oralhistory/\\">Newcastle University\\u2019s Oral History Unit</a>. Before coming to Newcastle she was responsible for creating the British Library\\u2019s Book Trade Lives collection of recordings with booksellers and publishers.</p><p></p><hr/><h2>Dr Beth Clark</h2><h3>Newcastle University</h3><h4>Social Science</h4><p><a href=\\"https://www.ncl.ac.uk/cre/about/staff/profile/bethclark.html#background\\">Beth\\u2019s</a> research background in sports, exercise and nutrition and food marketing reflects her research interests in food and communication. She is particularly interested in exploring how people relate to animal products and different food production practices, such as motivations for food choice, innovation and technology in production, knowledge of food production practices, and food cultures. Through this she works with a range of stakeholders from across the food supply chain, which has fuelled an interest in communication, including how individuals and groups share information and trust different information sources.She has two roles on the FIELD project. The first is part of the social science research team, involving interviews, focus groups and observations with farmers, farming advisors and the public, to explore their different experiences and perceptions of endemic livestock disease. The second role focuses on public engagement, including the online communications and website for FIELD, as well as identifying and organising opportunities for greater interaction with the projects many stakeholders, including members of the farming community and the public.</p><hr/><h2>Dr Ewan Coleman</h2><h3>University of Edinburgh</h3><h4>Epidemiology &amp; Economics</h4><p>Ewan Colman is a post-doctoral research associate at the <a href=\\"https://www.ed.ac.uk/roslin\\">Roslin Institute</a> at the University of Edinburgh. He has a background in mathematics, particularly in applied probability, data science, and network science. His research uses computational modelling to explore the relationship between behaviour and the spread of infectious disease. Ewan&#x27;s past interests include the dynamics of conversations on social media, the social and spatial organisation of ant colonies, and the how the ever-increasing amount of public health data can be exploited to detect and mitigate epidemic diseases. As a member of the FIELD project, he will focus on the spread of BVD through cattle trade, and how changing attitudes towards biosecurity can reduce the prevalence of BVD on a national scale.</p><p></p><hr/><h2>Prof Rowland Kao</h2><h3>University of Edinburgh</h3><h4>Epidemiology &amp; Economics</h4><p>Awaiting text</p><p></p><hr/><h2>Maria Suella Rodrigues</h2><h3>University of Glasgow</h3><h4>Epidemiology &amp; Economics</h4><p>Maria Suella Rodrigues is a doctoral candidate at the University of Glasgow, supervised under Professor Nicholas Hanley (MVLS), Dr. Souvik Datta (ASBS) at the University of Glasgow and Professor Rowland Kao from the University of Edinburgh. Maria holds a BSc degree in Economics from Lancaster University. Following that she moved to the University of Glasgow where she pursued the MRes in Economics, graduating in 2018. She is interested in investigating research questions in the areas of agricultural and environmental economics as well as applied micro-econometrics and choice-modelling theory. During her MRes dissertation she modelled consumer preferences for forest disease management with use of Choice modelling data. Additionally, she has received extensive training in choice-modelling from the Choice Modelling Centre, University of Leeds. As part of the FIELD project, Maria will design field experiments and model both farmer and consumer preferences in relation to farm animal welfare.</p><p></p><hr/><h2>Dr Lewis Holloway</h2><h3>University of Hull</h3><h4>Social Science</h4><p><a href=\\"https://www.hull.ac.uk/faculties/staff-profiles/lewis-holloway.aspx\\">Lewis Holloway</a> is a Reader in Human Geography at the University of Hull. He has research interests in food, farming and the countryside, and has a particular interest in farm animals and agricultural technologies. Recent research has focused on the ways in which genetic, information and robotic technologies have affected livestock farming, and has involved in-depth research with farmers and technology developers to understand how new technologies are engaged with, adopted and contested by farmers. Lewis is interested in the situated ethics associated with animal agriculture, and in how technologies can transform farming ethics and knowledge-practices. Lewis will be involved in developing and conducting the social scientific elements of the FIELD project. This will include on-farm interview and observational work with farmers, farm animals and expert advisors, and focus groups with farmers and public groups.</p><p></p><hr/><h2>Dr Niamh Mahon</h2><h3>University of Hull</h3><h4>Social Science</h4><p><a href=\\"https://www.researchgate.net/profile/Niamh_Mahon\\">Niamh</a> is a Post-Doctoral Research Associate at the University of Hull. In this role she is involved in the social science components of the FIELD project. This includes in-depth interviews and observational work with farmers and expert advisors, and focus groups with farmers and the public, conducted to explore their different experiences and perceptions of endemic livestock disease. Prior to this Niamh under took a PhD at Nottingham Trent University developing stakeholder-sensitive indicators of the Sustainable Intensification of UK agriculture and a Master\\u2019s degree from the University of East Anglia in Sustainable Agriculture and Food Security. She has also worked as a research assistant in socio-economics and policy for the Organic Research Centre. Niamh is a member of the Food and Climate Research Network and the Sustainable Intensification Research Network.</p><p></p><hr/><h2>Prof Nick Hanley</h2><h3>University of Glasgow</h3><h4>Epidemiology &amp; Economics</h4><p>Nick Hanley is a <a href=\\"https://www.gla.ac.uk/researchinstitutes/bahcm/staff/nicholashanley/\\">Professor of Environmental and One Health Economics</a> at the University of Glasgow. His PhD was in Agricultural Economics. His current main research interests include behavioural economics, the design of Payment for Ecosystem Service schemes, environmental valuation,one health economics, the economics of sustainable development, markets for biodiversity offsets,and the economics of invasive species.He is an honorary professor at the universities of St Andrews and Stirling. Nick is co-author of a textbook in environmental cost-benefit analysis with Edward Barbier; and two textbooks on environmental economics (with Jason Shogren and Ben White).</p><p></p><hr/><p></p>", "latest_revision_created_at": "2019-01-22T12:19:50.936Z"}	\N	15	4
103	f	2019-01-22 16:47:26.518396+00	{"go_live_at": null, "search_description": "", "slug": "collaborator-networks", "depth": 4, "show_in_menus": false, "expired": false, "url_path": "/home2/about/collaborator-networks/", "numchild": 0, "first_published_at": null, "has_unpublished_changes": true, "last_published_at": null, "title": "Collaborator networks", "expire_at": null, "draft_title": "Collaborator networks", "path": "0001000200020004", "live_revision": null, "content_type": 31, "owner": 4, "pk": 35, "seo_title": "", "locked": false, "live": false, "body": "<p>The FIELD project is fortunate to have an engaged network of external stakeholders, or collaborators, who are actively involved in helping to shape the project, to ensure both its real world relevance, technical accuracy and ultimately ensure the success of the FIELD project. Find out more about each of our collaborators below.</p><p></p><hr/><h2>Agriculture and Horticulture Development Board</h2><p>The <a href=\\"https://ahdb.org.uk/\\">AHDB</a> undertakes research and development across the food supply chain, as well as acting as a key knowledge broker at the farm level, providing advice and expertise on a wide range of farming related topics.</p><hr/><p></p><h2>Tim Brigstoke</h2><h3>Policy Director</h3><h4>Royal Association of British Dairy Farmers</h4><p>The <a href=\\"http://www.rabdf.co.uk/\\">RABDF</a> focuses on the needs of milk producers, and influences and lobbies government and policymakers about the key issues of its members.</p><hr/><h2>Professor Henry Buller</h2><h3>Professor of Geography</h3><h4>Exeter University</h4><p>An internationally renowned expert on animal welfare and the biopolitics of human-animal relations, and social science adviser to Defra.</p><p></p><hr/><h2>DEFRA</h2><p>Defra will provide expertise through their Animal Welfare and Exotic Disease Control team, who have years of experience in understanding farmer decision making in in relation to animal health.</p><hr/><h2>Dr Ollie Douglas</h2><h3>Assistant Curator</h3><h4>Museum of English Rural Life</h4><p>An experienced museum professional who will provide expert input to help the history cluster navigate the <a href=\\"https://merl.reading.ac.uk/\\">MERL</a> archives.</p><p></p><hr/><h2>Flavour Sense Nation</h2><p><a href=\\"http://flavoursense.com/\\">Flavour Sense Nation</a> are a company that creates interactive events to explore the perceptions of food. They will be providing their expertise in relation to FIELD&#x27;s Food Busk.</p><hr/><h2>Professor Rob Fraser</h2><h3>Emeritus Professor of Agricultural Economics</h3><h4>University of Kent</h4><p>An expert in agricultural economics and member of Defra&#x27;s Economic Advisory Panel.</p><p></p><hr/><h2>Professor Laura Green</h2><h3>Veterinary Epidemiologist</h3><h4>University of Warwick</h4><p>A leading expert on endemic livestock disease, in particular lameness in sheep, who has worked with industry stakeholders to translate her research into practice, which has resulted in a significant reduction in lameness prevalence.</p><p></p><hr/><h2>Landbridge</h2><p><a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a> is a national knowledge exchange network for rural professionals, which provides a platform for inter-professional learning and debate with the aim of improving the advice given to farmers and other businesses.</p><hr/><h2>John McFarlane</h2><h3>Vet</h3><h4>Alnorthumbria Veterinary Group</h4><p>A practising farm vet who is active in veterinary politics and a key member of the <a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a> knowledge exchange network.</p><p></p><hr/><h2>Bill Mellor</h2><h3>Chair BVDfree England</h3><p><a href=\\"https://bvdfree.org.uk/\\">BVDfree England</a> is a voluntary industry-led scheme working to eliminate BVD in all cattle in the UK by 2022.</p><hr/><h2>Museum of English Rural Life</h2><p>The <a href=\\"https://merl.reading.ac.uk/\\">MERL</a> </p><hr/><h2>Paul Roger</h2><h3>Veterinary Consultant</h3><p>An independent consultant in sheep health and welfare, and a RCVS Recognised Specialist in Sheep Health and Production.</p><p></p><hr/><h2>Nicola Smith</h2><h3>Livestock Researcher</h3><h4>National Sheep Association</h4><p>The <a href=\\"https://www.nationalsheep.org.uk/\\">NSA</a></p><hr/><h2>Jon Statham</h2><h3>Vet</h3><h4>Bishopton Veterinary Group</h4><p>A practising farm vet and RCVS Recognised Specialist in Cattle Health and Production.</p><hr/><h2>Scottish Government</h2><p>The Scottish government</p><h2></h2>", "latest_revision_created_at": "2019-01-22T12:51:05.679Z"}	\N	35	4
104	f	2019-01-22 16:54:29.734277+00	{"go_live_at": null, "search_description": "", "slug": "collaborator-networks", "depth": 4, "show_in_menus": false, "expired": false, "url_path": "/home2/about/collaborator-networks/", "numchild": 0, "first_published_at": null, "has_unpublished_changes": true, "last_published_at": null, "title": "Collaborator networks", "expire_at": null, "draft_title": "Collaborator networks", "path": "0001000200020004", "live_revision": null, "content_type": 31, "owner": 4, "pk": 35, "seo_title": "", "locked": false, "live": false, "body": "<p>The FIELD project is fortunate to have an engaged network of external stakeholders, or collaborators, who are actively involved in helping to shape the project, to ensure both its real world relevance, technical accuracy and ultimately ensure the success of the FIELD project. Find out more about each of our collaborators below.</p><p></p><hr/><h2>Agriculture and Horticulture Development Board</h2><p>The <a href=\\"https://ahdb.org.uk/\\">AHDB</a> undertakes research and development across the food supply chain, as well as acting as a key knowledge broker at the farm level, providing advice and expertise on a wide range of farming related topics.</p><hr/><p></p><h2>Tim Brigstoke</h2><h3>Policy Director</h3><h4>Royal Association of British Dairy Farmers</h4><p>The <a href=\\"http://www.rabdf.co.uk/\\">RABDF</a> focuses on the needs of milk producers, and influences and lobbies government and policymakers about the key issues of its members.</p><hr/><h2>Professor Henry Buller</h2><h3>Professor of Geography</h3><h4>Exeter University</h4><p>An internationally renowned expert on animal welfare and the biopolitics of human-animal relations, and social science adviser to Defra.</p><p></p><hr/><h2>DEFRA</h2><p>Defra will provide expertise through their Animal Welfare and Exotic Disease Control team, who have years of experience in understanding farmer decision making in in relation to animal health.</p><hr/><h2>Dr Ollie Douglas</h2><h3>Assistant Curator</h3><h4>Museum of English Rural Life</h4><p>An experienced museum professional who will provide expert input to help the history cluster navigate the <a href=\\"https://merl.reading.ac.uk/\\">MERL</a> archives.</p><p></p><hr/><h2>Flavour Sense Nation</h2><p><a href=\\"http://flavoursense.com/\\">Flavour Sense Nation</a> are a company that creates interactive events to explore the perceptions of food. They will be providing their expertise in relation to FIELD&#x27;s Food Busk.</p><hr/><h2>Professor Rob Fraser</h2><h3>Emeritus Professor of Agricultural Economics</h3><h4>University of Kent</h4><p>An expert in agricultural economics and member of Defra&#x27;s Economic Advisory Panel.</p><p></p><hr/><h2>Professor Laura Green</h2><h3>Veterinary Epidemiologist</h3><h4>University of Warwick</h4><p>A leading expert on endemic livestock disease, in particular lameness in sheep, who has worked with industry stakeholders to translate her research into practice, which has resulted in a significant reduction in lameness prevalence.</p><p></p><hr/><h2>Landbridge</h2><p><a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a> is a national knowledge exchange network for rural professionals, which provides a platform for inter-professional learning and debate with the aim of improving the advice given to farmers and other businesses.</p><hr/><h2>John McFarlane</h2><h3>Vet</h3><h4>Alnorthumbria Veterinary Group</h4><p>A practising farm vet who is active in veterinary politics and a key member of the <a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a> knowledge exchange network.</p><p></p><hr/><h2>Bill Mellor</h2><h3>Chair BVDfree England</h3><p><a href=\\"https://bvdfree.org.uk/\\">BVDfree England</a> is a voluntary industry-led scheme working to eliminate BVD in all cattle in the UK by 2022.</p><hr/><h2>Museum of English Rural Life</h2><p>The <a href=\\"https://merl.reading.ac.uk/\\">MERL</a> aims to challenge perceptions about rural England by revealing the historical and contemporary relevance of country life. The MERL has expertise in public engagement activities, as well as having a number of collections key to assisting the FIELD research.</p><hr/><h2>Paul Roger</h2><h3>Veterinary Consultant</h3><p>An independent consultant in sheep health and welfare, and a RCVS Recognised Specialist in Sheep Health and Production.</p><p></p><hr/><h2>Nicola Smith</h2><h3>Livestock Researcher</h3><h4>National Sheep Association</h4><p>The <a href=\\"https://www.nationalsheep.org.uk/\\">NSA</a> represents the views and interests of sheep producers throughout the UK, and will be essential for providing sheep farmer perspectives throughout the project.</p><hr/><h2>Jon Statham</h2><h3>Vet</h3><h4>Bishopton Veterinary Group</h4><p>A practising farm vet and RCVS Recognised Specialist in Cattle Health and Production.</p><hr/><h2>Scottish Government</h2><p>The Scottish government recently introduced a <a href=\\"https://www2.gov.scot/Topics/farmingrural/Agriculture/animal-welfare/Diseases/disease/bvd/eradication\\">BVD eradication scheme</a>. Understanding this further will be vital for the FIELD project.</p><p></p><hr/><p></p><h2></h2>", "latest_revision_created_at": "2019-01-22T16:47:26.518Z"}	\N	35	4
151	f	2019-02-01 09:59:38.355301+00	{"first_published_at": "2019-01-25T13:14:41.558Z", "url_path": "/home2/about/meetteam/", "expire_at": null, "path": "0001000200020005", "numchild": 2, "show_in_menus": false, "pk": 36, "has_unpublished_changes": true, "live_revision": 121, "expired": false, "locked": false, "body": "<p>The FIELD team is composed of a number of different research disciplines. The team will be supported throughout the project by a range of different industry and professional stakeholders who will provide their expertise and input to help shape the project and ensure its relevance.</p><p>Find out more about the different <a id=\\"15\\" linktype=\\"page\\">team members</a> and stakeholders.</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-25T13:14:41.558Z", "depth": 4, "draft_title": "Meet the team", "live": true, "latest_revision_created_at": "2019-01-29T16:37:49.648Z", "owner": 4, "slug": "meetteam", "search_description": "", "content_type": 31, "title": "Meet the team"}	\N	36	6
161	f	2019-02-01 15:04:22.924319+00	{"first_published_at": "2019-01-18T10:05:05.566Z", "url_path": "/home2/about/project/methodology/", "expire_at": null, "path": "00010002000200010002", "numchild": 0, "show_in_menus": false, "pk": 27, "has_unpublished_changes": true, "live_revision": 157, "expired": false, "locked": false, "body": "<p>The research team is formed of three disciplinary clusters. Although the three clusters have their own research they will each will draw upon and feed into the others. Each cluster will therefore not be working in isolation, reflecting the interdisciplinary approach at the core of the project. Find out more about the methods being used in the three clusters below.</p><p></p><hr/><p></p><hr/><h3></h3><h3>Economics and Epidemiology</h3><p>Better understanding of the spatial interactions amongst farmers</p><p>Simulation models to enable prediction of responses to a range of factors including disease parameters, costs, support measures and new information</p><p>Examine how farmer decision making is affected by past experience of disease, health and welfare priorities, perceptions and evaluations of disease management methods</p><p>Variation in consumer preferences</p><p>Look to establish trade-offs</p><p>WTP animal welfare in relation to other product attributes</p><p>Models that incorporate aspects from the other disciplines, such as social pressures, economic incentives and past disease experiences may improve disease predictions</p><p></p><p>Greater understanding of human-animal relationships and how these relate to animal health and welfare</p><ul><li>Farmer survey of farm animal health</li><li>&#x27;Food busk&#x27; to establish public perceptions of animal health</li><li>Consumer survey of willigness-to-pay for farm animal we</li><li>The creation of farm-level epi-economic models to model various scenarios</li><li>The creation of farm network models to examine the relationships between farmer decision-making and disease control</li></ul><hr/><h3></h3><h3>History</h3><p>The history team will explore the post-war changes in animal production systems and disease management.</p><p>Experience, understanding and management of BVD and lameness</p><p>How the different farming systems have evolved over time and also what are understandings of \\u2018food farming\\u2019 for different stakeholders</p><p>Texts, images and existing oral history recordings, including journal articles, advertising material, popular press, government material and grey literature and films</p><p>Also give an indication of who is giving what advice</p><p>Understanding the influence of historical forces can also help us to better understand the present, in relation to farming practices, sources of information and consumer behaviour</p><ul><li>Digitisation of historical agricultural images and videos</li><li>Creation of a timeline to display</li><li>Oral history to promote discussion and reflection of life stories</li><li>Exploration of the ways in which farmers, expert advisors, scientific researchers and the state experienced, understood, managed and talked about BVD and lameness, and subsequently, what advice was given to farmers.</li><li>The evolution of beef, sheep and dairy systems, and changes in farmer and consumer perceptions to explore what is meant by good farming<br/></li></ul><hr/><h3></h3><h3>Social Science</h3><p>The social science cluster is tasked with exploring how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other.</p><p>This will be achived through a number of different methods including;</p><ul><li>Survey of farmers to establish farm management practices</li><li>Interviews with farmers, farm advisors</li><li>Focus groups with farmers</li><li>Farm walks to understand the real world context of disease</li><li>Knowledge-exchange workshop with rural advisors</li></ul><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p>Farm walks to understand the real world context of disease</p><p>Explore how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other</p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p></p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-02-01T14:33:17.101Z", "depth": 5, "draft_title": "Methodology", "live": true, "latest_revision_created_at": "2019-02-01T15:00:11.416Z", "owner": 6, "slug": "methodology", "search_description": "", "content_type": 31, "title": "Methodology"}	\N	27	4
163	f	2019-02-01 18:54:45.835854+00	{"first_published_at": "2019-01-18T10:05:05.566Z", "url_path": "/home2/about/project/methodology/", "expire_at": null, "path": "00010002000200010002", "numchild": 0, "show_in_menus": false, "pk": 27, "has_unpublished_changes": true, "live_revision": 157, "expired": false, "locked": false, "body": "<p>The research team is formed of three disciplinary clusters. Although the three clusters have their own research they will each will draw upon and feed into the others. Each cluster will therefore not be working in isolation, reflecting the interdisciplinary approach at the core of the project. Find out more about the methods being used in the three clusters below.</p><p></p><hr/><p></p><hr/><h3></h3><h3>Economics and Epidemiology</h3><p>Better understanding of the spatial interactions amongst farmers</p><p>Simulation models to enable prediction of responses to a range of factors including disease parameters, costs, support measures and new information</p><p>Examine how farmer decision making is affected by past experience of disease, health and welfare priorities, perceptions and evaluations of disease management methods</p><p>Variation in consumer preferences</p><p>Look to establish trade-offs</p><p>WTP animal welfare in relation to other product attributes</p><p>Models that incorporate aspects from the other disciplines, such as social pressures, economic incentives and past disease experiences may improve disease predictions</p><p></p><p>Greater understanding of human-animal relationships and how these relate to animal health and welfare</p><ul><li>Farmer survey of farm animal health</li><li>&#x27;Food busk&#x27; to establish public perceptions of animal health</li><li>Consumer survey of willigness-to-pay for farm animal we</li><li>The creation of farm-level epi-economic models to model various scenarios</li><li>The creation of farm network models to examine the relationships between farmer decision-making and disease control</li></ul><hr/><h3></h3><h3>History</h3><p>The history team will explore the post-war changes in animal production systems and disease management.</p><p>Experience, understanding and management of BVD and lameness</p><p>How the different farming systems have evolved over time and also what are understandings of \\u2018food farming\\u2019 for different stakeholders</p><p>Texts, images and existing oral history recordings, including journal articles, advertising material, popular press, government material and grey literature and films</p><p>Also give an indication of who is giving what advice</p><p>Understanding the influence of historical forces can also help us to better understand the present, in relation to farming practices, sources of information and consumer behaviour</p><ul><li>Digitisation of historical agricultural images and videos</li><li>Creation of a timeline to display</li><li>Oral history to promote discussion and reflection of life stories</li><li>Exploration of the ways in which farmers, expert advisors, scientific researchers and the state experienced, understood, managed and talked about BVD and lameness, and subsequently, what advice was given to farmers.</li><li>The evolution of beef, sheep and dairy systems, and changes in farmer and consumer perceptions to explore what is meant by good farming<br/></li></ul><hr/><h3></h3><h3>Social Science</h3><p>The social science cluster is tasked with exploring how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other.</p><p>This will be achived through a number of different methods including;</p><ul><li>Survey of farmers to establish farm management practices</li><li>Interviews with farmers, farm advisors</li><li>Focus groups with farmers</li><li>Farm walks to understand the real world context of disease</li><li>Knowledge-exchange workshop with rural advisors</li></ul><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p>Farm walks to understand the real world context of disease</p><p>Explore how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other</p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p></p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-02-01T14:33:17.101Z", "depth": 5, "draft_title": "Methodology", "live": true, "latest_revision_created_at": "2019-02-01T15:04:22.924Z", "owner": 6, "slug": "methodology", "search_description": "", "content_type": 31, "title": "Methodology"}	\N	27	4
164	f	2019-02-04 09:52:13.607099+00	{"first_published_at": "2019-01-18T10:05:05.566Z", "url_path": "/home2/about/project/methodology/", "expire_at": null, "path": "00010002000200010002", "numchild": 0, "show_in_menus": false, "pk": 27, "has_unpublished_changes": true, "live_revision": 157, "expired": false, "locked": false, "body": "<p>The research team is formed of three disciplinary clusters. Although the three clusters have their own research they will each will draw upon and feed into the others. Each cluster will therefore not be working in isolation, reflecting the interdisciplinary approach at the core of the project. Find out more about the methods being used in the three clusters below.</p><p></p><hr/><p></p><hr/><h3></h3><h3>Economics and Epidemiology</h3><p>This cluster combines the expertise of both economics and epidemiology to explore the trade offs that consumers and farmers make, as well as the interactions </p><p>Our economists will examine how farmer decision making is affected by past experience of disease, health and welfare priorities, perceptions and evaluations of disease management methods</p><p>Better understanding of the spatial interactions amongst farmers</p><p>Simulation models to enable prediction of responses to a range of factors including disease parameters, costs, support measures and new information</p><p></p><p>Variation in consumer preferences</p><p>Look to establish trade-offs</p><p>WTP animal welfare in relation to other product attributes</p><p>The models developed within this cluster will incorporate aspects from the other disciplinary clusters as well, such as social pressures, economic incentives and past disease experiences,to explore how this may improve disease predictions.</p><p></p><p>Greater understanding of human-animal relationships and how these relate to animal health and welfare</p><ul><li>Farmer survey of farm animal health</li><li>&#x27;Food busk&#x27; to establish public perceptions of animal health</li><li>Consumer survey of willigness-to-pay for farm animal we</li><li>The creation of farm-level epi-economic models to model various scenarios</li><li>The creation of farm network models to examine the relationships between farmer decision-making and disease control</li></ul><hr/><h3></h3><h3>History</h3><p>The history team will explore the post-war changes in animal production systems and disease management, including how the different farming systems have evolved over time and also what are understandings of \\u2018good farming\\u2019 for different stakeholders</p><p>Experience, understanding and management of BVD and lameness</p><p></p><p>Texts, images and existing oral history recordings, including journal articles, advertising material, popular press, government material and grey literature and films</p><p>Also give an indication of who is giving what advice</p><p>Understanding the influence of historical forces can also help us to better understand the present, in relation to farming practices, sources of information and consumer behaviour</p><ul><li>Digitisation of historical agricultural images and videos</li><li>Creation of a timeline to display</li><li>Oral history to promote discussion and reflection of life stories</li><li>Exploration of the ways in which farmers, expert advisors, scientific researchers and the state experienced, understood, managed and talked about BVD and lameness, and subsequently, what advice was given to farmers.</li><li>The evolution of beef, sheep and dairy systems, and changes in farmer and consumer perceptions to explore what is meant by good farming<br/></li></ul><hr/><h3></h3><h3>Social Science</h3><p>The social science cluster is tasked with exploring how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other.</p><p>This will be achived through a number of different methods including;</p><ul><li>Survey of farmers to establish farm management practices</li><li>Interviews with farmers, farm advisors</li><li>Focus groups with farmers</li><li>Farm walks to understand the real world context of disease</li><li>Knowledge-exchange workshop with rural advisors</li></ul><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p>Farm walks to understand the real world context of disease</p><p>Explore how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other</p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p></p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-02-01T14:33:17.101Z", "depth": 5, "draft_title": "Methodology", "live": true, "latest_revision_created_at": "2019-02-01T18:54:45.835Z", "owner": 6, "slug": "methodology", "search_description": "", "content_type": 31, "title": "Methodology"}	\N	27	4
57	f	2019-01-17 10:14:01.376848+00	{"locked": false, "title": "The Project", "draft_title": "The Project", "has_unpublished_changes": true, "first_published_at": "2019-01-10T13:08:41.922Z", "depth": 4, "expired": false, "last_published_at": "2019-01-11T02:32:31.694Z", "live": true, "content_type": 31, "slug": "project", "latest_revision_created_at": "2019-01-17T10:11:05.334Z", "show_in_menus": true, "numchild": 2, "expire_at": null, "path": "0001000200030001", "seo_title": "", "live_revision": 29, "url_path": "/home2/about/project/", "owner": 2, "search_description": "", "pk": 14, "body": "<p>Livestock disease today is a complex problem that threatens the development of more sustainable, ethical and efficient farming methods. While traditional,discipline-specific approaches have helped to address this problem, many of farming\\u2019s current challenges cut across disciplines, affecting animal welfare, the environment, and future food security. A new approach is therefore required, which FIELD provides by integrating scientific, social scientific and humanities perspectives on two case study health problems in Britain.</p><p>Through embedding these problems in time, space and society, and enrolling farmers and other publics in their investigation, FIELD will interrogate their changing biological, ontological and social identities, their relationships with livestock systems and farming communities, and how animal behaviours have shaped their expression, interpretation and management by humans. The project explores how responses to disease in the past have informed its effects in the present; how studying disease in the present can enhance understandings of its past, and how these investigations can inform and be informed by future predictions of disease. FIELD will thereby generate new ways of thinking about, predicting, and intervening in the effects of disease on individual farms and in farming communities, for the benefit of animals, farmers, consumers and the environment.</p><p></p><p></p><h2><a id=\\"24\\" linktype=\\"page\\">Approaches</a></h2><p></p><h2><a id=\\"27\\" linktype=\\"page\\">Methodology</a></h2>", "go_live_at": null}	\N	14	6
108	f	2019-01-23 10:22:55.86942+00	{"go_live_at": null, "search_description": "", "slug": "home2", "depth": 2, "show_in_menus": true, "expired": false, "url_path": "/home2/", "numchild": 6, "first_published_at": "2019-01-11T01:18:30.245Z", "has_unpublished_changes": true, "last_published_at": "2019-01-11T01:24:33.846Z", "title": "Home", "expire_at": null, "draft_title": "Home", "path": "00010002", "live_revision": 22, "content_type": 31, "owner": 1, "pk": 18, "seo_title": "", "locked": false, "live": true, "body": "<p>Better ways of understanding livestock disease are urgently required to ensure animal health and welfare, as well as farming sustainability. The Farm-level Interdisciplinary approaches to Endemic Livestock Diseases (FIELD) project, looks to bring together experts from industry, governance and academia to explore the realms of nature and culture, science and society and human and animal, and their impact on disease. Insights from the project will be used to develop better predictions ad disease and further insights into disease management.</p><p></p><h2><a id=\\"3\\" linktype=\\"page\\">News </a></h2>", "latest_revision_created_at": "2019-01-18T12:06:54.363Z"}	\N	18	6
109	f	2019-01-23 10:29:14.124322+00	{"go_live_at": null, "search_description": "", "slug": "policy-practice-notes", "depth": 5, "show_in_menus": false, "expired": false, "url_path": "/home2/groups/focus-farming/policy-practice-notes/", "numchild": 0, "first_published_at": null, "has_unpublished_changes": false, "last_published_at": null, "title": "Policy & Practice Notes", "expire_at": null, "draft_title": "Policy & Practice Notes", "path": "00010002000300020001", "live_revision": null, "content_type": 31, "owner": 6, "pk": 37, "seo_title": "", "locked": false, "live": true, "body": "<p></p>", "latest_revision_created_at": null}	\N	37	6
155	f	2019-02-01 14:24:46.665555+00	{"first_published_at": null, "url_path": "/home2/about/meetteam/collaborator-networks/", "expire_at": null, "path": "00010002000200050002", "numchild": 0, "show_in_menus": false, "pk": 35, "has_unpublished_changes": true, "live_revision": null, "expired": false, "locked": false, "body": "<p>The FIELD project is fortunate to work with an engaged network of individuals and organisations. From our steering committe, to our external collaborators and knowledge exchange partners, we have a range of stakeholders who are actively involved in helping to shape the project. Together, they will help to ensure FIELD&#x27;s real world relevance, technical accuracy and ultimately ensure the success of the FIELD project. Find out more about each of our collaborators below.</p><p></p><p></p><p></p><hr/><p></p><hr/><h2>Steering Committee</h2><p>This group of individuals will provide the FIELD project with strategic insight, including reviewing the project&#x27;s progress, providing critical insight, offering advice on future activities, and advising on the research topics being studied throughout the project.</p><p></p><hr/><h3>Professor Henry Buller</h3><h4>Professor of Geography, Exeter University</h4><p>An internationally renowned expert on animal welfare and the biopolitics of human-animal relations, and social science adviser to Defra. He will provide support for the social science work, and will bring expertise on livestock welfare, consumer perspectives and animals as shapers of human society.</p><hr/><h3>Dr Ollie Douglas</h3><h4>Assistant Curator, Museum of English Rural Life</h4><p>An experienced museum professional who will provide expert input to help the history cluster navigate the <a href=\\"https://merl.reading.ac.uk/\\">MERL</a> archives. He will also oversee the digitisation of its films and images for the purposes of project research and public engagement, and support the knowledge exchange activities.</p><hr/><h3>Professor Rob Fraser</h3><h4>Emeritus Professor of Agricultural Economics, University of Kent</h4><p>An expert in agricultural economics and member of Defra&#x27;s Economic Advisory Panel. He will provide support for the economists in the project through his expertise in the economics of livestock disease, its social and moral dimensions, and commercial and political contexts.</p><hr/><h3>Professor Laura Green</h3><h4>Veterinary Epidemiologist, University of Warwick</h4><p>A leading expert on endemic livestock disease, in particular lameness in sheep, who has worked with industry stakeholders to translate her research into practice, which has resulted in a significant reduction in lameness prevalence. She will advise on the epidemiological aspects of the project, inter-disciplinary working and animal welfare.</p><hr/><h3>John McFarlane</h3><h4>Vet, Alnorthumbria Veterinary Group</h4><p>A practising farm vet who is active in veterinary politics and a key member of the <a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a> knowledge exchange network. As well as providing his veterinary expertise, he will assist the project in expanding its network to ensure its success, through facilitating connections with farmers, vets and other rural professionals.</p><hr/><p></p><p></p><p></p><hr/><p></p><hr/><h2>External Collaborators</h2><p>These individuals possess knowledge, skills and networks crucial to the FIELD project activities, including being a source of expert advice.</p><p></p><hr/><h3>Susannah Bolton</h3><h4>Agriculture and Horticulture Development Board</h4><p>The <a href=\\"https://ahdb.org.uk/\\">AHDB</a> undertakes research and development across the food supply chain, as well as acting as a key knowledge broker at the farm level, providing advice and expertise on a wide range of farming related topics. Susannah will help the project engage with a wide variety of stakeholders in the co-production of knowledge and dissemination of research findings.</p><hr/><h3>Tim Brigstoke</h3><h4>Policy Director, Royal Association of British Dairy Farmers</h4><p>The <a href=\\"http://www.rabdf.co.uk/\\">RABDF</a> focuses on the needs of milk producers, and influences and lobbies government and policymakers about the key issues of its members. Tim will bring the experiences and perspectives of the dairy industry to the project.</p><hr/><h3>Charlotte Carne</h3><h4>Animal Welfare and Exotic Disease Control Team, DEFRA</h4><p>Defra will provide expertise through their Animal Welfare and Exotic Disease Control team, who have years of experience in understanding farmer decision making in relation to animal health. Charlotte will provide a means of disseminating the research findings to policy makers.</p><hr/><h3>Bill Mellor</h3><h4>Chair BVDfree England</h4><p><a href=\\"https://bvdfree.org.uk/\\">BVDfree England</a> is a voluntary industry-led scheme working to eliminate BVD in all cattle in the UK by 2022. Bill will provide input on the project design and interpretation of the results, given his expertise from the BVDfree programme.</p><hr/><h3>Jenny Purcell</h3><h4>BVD Policy Manager, Scottish Government</h4><p>The Scottish government recently introduced a <a href=\\"https://www2.gov.scot/Topics/farmingrural/Agriculture/animal-welfare/Diseases/disease/bvd/eradication\\">BVD eradication scheme</a>. Understanding this further will be vital for the FIELD project, and Jenny will be a crucial facilitator in this process of knowledge exchange.</p><hr/><h3>Paul Roger</h3><h4>Veterinary Consultant</h4><p>An independent consultant in sheep health and welfare, and a RCVS Recognised Specialist in Sheep Health and Production. He will provide expert veterinary perspectives on lameness in sheep.</p><hr/><h3>Jon Statham</h3><h4>Vet, Bishopton Veterinary Group</h4><p>A practising farm vet and RCVS Recognised Specialist in Cattle Health and Production, who will provide expert veterinary input on BVD and lameness in cattle.</p><hr/><h3>Nicola Smith</h3><h4>Livestock Researcher, National Sheep Association</h4><p>The <a href=\\"https://www.nationalsheep.org.uk/\\">NSA</a> represents the views and interests of sheep producers throughout the UK, and will be essential for providing sheep farmer perspectives throughout the project. Nicola will bring a sheep industry perspective to the project, and will assist in bringing sheep farmers into the research as co-producers.</p><hr/><p></p><p></p><p></p><hr/><p></p><hr/><h2>Knowledge Exchange Partners</h2><p>These organisations will support the project&#x27;s knowledge exchange activities for all of our interested audiences.</p><p></p><hr/><h3>Flavour Sense Nation</h3><p><a href=\\"http://flavoursense.com/\\">Flavour Sense Nation</a> are a company that creates interactive events to explore the perceptions of food. They will be providing their expertise in relation to FIELD&#x27;s Food Busk, which will provide an opportunity to explore public perceptions of animal health and welfare.</p><hr/><h3>Landbridge</h3><p><a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a> is a national knowledge exchange network for rural professionals, which provides a platform for inter-professional learning and debate with the aim of improving the advice given to farmers and other businesses. As well as providing advice on the project, Landbridge will help facilitate a knowledge-exchange workshop with rural professionals during the project.</p><hr/><h3>Museum of English Rural Life</h3><p>The <a href=\\"https://merl.reading.ac.uk/\\">MERL</a> aims to challenge perceptions about rural England by revealing the historical and contemporary relevance of country life. The MERL has expertise in public engagement activities, as well as having a number of collections key to assisting the FIELD research. It will help the project to develop its public-facing work through the use of its venues, networks and expertise in this area.</p><hr/><p></p><hr/><p></p>", "seo_title": "", "go_live_at": null, "last_published_at": null, "depth": 5, "draft_title": "Collaborator Networks", "live": false, "latest_revision_created_at": "2019-01-29T16:33:54.563Z", "owner": 4, "slug": "collaborator-networks", "search_description": "", "content_type": 31, "title": "Collaborator Networks"}	\N	35	6
100	f	2019-01-22 12:39:01.310498+00	{"go_live_at": null, "search_description": "", "slug": "collaborator-networks", "depth": 4, "show_in_menus": false, "expired": false, "url_path": "/home2/about/collaborator-networks/", "numchild": 0, "first_published_at": null, "has_unpublished_changes": false, "last_published_at": null, "title": "Collaborator networks", "expire_at": null, "draft_title": "Collaborator networks", "path": "0001000200020004", "live_revision": null, "content_type": 31, "owner": 4, "pk": 35, "seo_title": "", "locked": false, "live": false, "body": "<p>The FIELD project is fortunate to have an engaged network of external stakeholders, or collaborators, who are actively involved in helping to shape the project, to ensure both its real world relevance, technical accuracy and ultimately ensure the success of the FIELD project. Find out more about each of our collaborators below.</p><p></p><hr/><h2>Professor Henry Buller</h2><h3>Professor of Geography</h3><h4>Exeter University</h4><p>An internationally renowned expert on animal welfare and the biopolitics of human-animal relations, and social science adviser to Defra.</p><hr/><h2>Dr Ollie Douglas</h2><h3>Assistant Curator</h3><h4>Museum of English Rural Life</h4><p>An experienced museum professional who will provide expert input to help the history cluster navigate the <a href=\\"https://merl.reading.ac.uk/\\">MERL</a> archives.</p><p></p><hr/><h2>Professor Rob Fraser</h2><h3>Emeritus Professor of Agricultural Economics</h3><h4>University of Kent</h4><p>An expert in agricultural economics and member of Defra&#x27;s Economic Advisory Panel.</p><p></p><hr/><h2>Professor Laura Green</h2><h3>Veterinary Epidemiologist</h3><h4>University of Warwick</h4><p>A leading expert on endemic livestock disease, in particular lameness in sheep, who has worked with industry stakeholders to translate her research into practice, which has resulted in a significant reduction in lameness prevalence.</p><p></p><hr/><h2>John McFarlane</h2><h3>Vet</h3><h4>Alnorthumbria Veterinary Group</h4><p>A practising farm vet who is active in veterinary politics and a key member of the <a href=\\"http://www.relu.ac.uk/landbridge/\\">Landbridge</a> knowledge exchange network.</p><hr/><h2>Paul Roger</h2><h3>Veterinary Consultant</h3><p></p><hr/><h2>Jon Statham</h2><h3>Vet</h3><h4>Bishopton Veterinary Group</h4><p></p><hr/><p></p><h2></h2>", "latest_revision_created_at": null}	\N	35	4
106	f	2019-01-22 17:02:22.062141+00	{"go_live_at": null, "search_description": "", "slug": "meetteam", "depth": 4, "show_in_menus": false, "expired": false, "url_path": "/home2/about/meetteam/", "numchild": 0, "first_published_at": null, "has_unpublished_changes": false, "last_published_at": null, "title": "Meet the team", "expire_at": null, "draft_title": "Meet the team", "path": "0001000200020005", "live_revision": null, "content_type": 31, "owner": 4, "pk": 36, "seo_title": "", "locked": false, "live": false, "body": "<p></p>", "latest_revision_created_at": null}	\N	36	4
152	f	2019-02-01 13:02:13.553939+00	{"first_published_at": "2019-01-18T10:05:05.566Z", "url_path": "/home2/about/project/methodology/", "expire_at": null, "path": "00010002000200010002", "numchild": 0, "show_in_menus": false, "pk": 27, "has_unpublished_changes": true, "live_revision": 62, "expired": false, "locked": false, "body": "<p>The research team is formed of three disciplinary clusters. Although the three clusters have their own research they will each will draw upon and feed into the others. Each cluster will therefore not be working in isolation, reflecting the interdisciplinary approach at the core of the project. Find out more about the methods being used in the three clusters below.</p><p></p><hr/><p></p><hr/><h3></h3><h3>Economics and Epidemiology</h3><p>Better understanding of the spatial interactions amongst farmers</p><p>Simulation models to enable prediction of responses to a range of factors including disease parameters, costs, support measures and new information</p><p>Examine how farmer decision making is affected by past experience of disease, health and welfare priorities, perceptions and evaluations of disease management methods</p><p>Variation in consumer preferences</p><p>Look to establish trade-offs</p><p>WTP animal welfare in relation to other product attributes</p><p>Models that incorporate aspects from the other disciplines, such as social pressures, economic incentives and past disease experiences may improve disease predictions</p><p></p><p>Greater understanding of human-animal relationships and how these relate to animal health and welfare</p><hr/><h3></h3><h3>History</h3><p>Changes over time</p><p>Experience, understanding and management of BVD and lameness</p><p>How the different farming systems have evolved over time and also what are understandings of \\u2018food farming\\u2019 for different stakeholders</p><p>Texts, images and existing oral history recordings, including journal articles, advertising material, popular press, government material and grey literature and films</p><p>Also give an indication of who is giving what advice</p><p>Creation of a timeline</p><p>Understanding the influence of historical forces can also help us to better understand the present, in relation to farming practices, sources of information and consumer behaviour</p><p>Oral history to promote discussion and reflection<br/></p><hr/><h3></h3><h3>Social Science</h3><p>The social science cluster is tasked with exploring  how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other.</p><p>This will be achived through a number of different methods including;</p><ul><li>Survey of farmers</li><li>Interviews</li><li>Focus groups</li><li>Farm walks to understand the real world context of disease</li></ul><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p>Farm walks to understand the real world context of disease</p><p>Explore how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other</p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p></p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-18T10:05:05.566Z", "depth": 5, "draft_title": "Methodology", "live": true, "latest_revision_created_at": "2019-01-31T13:49:17.769Z", "owner": 6, "slug": "methodology", "search_description": "", "content_type": 31, "title": "Methodology"}	\N	27	4
153	f	2019-02-01 13:04:07.849567+00	{"first_published_at": "2019-01-18T10:05:05.566Z", "url_path": "/home2/about/project/methodology/", "expire_at": null, "path": "00010002000200010002", "numchild": 0, "show_in_menus": false, "pk": 27, "has_unpublished_changes": true, "live_revision": 62, "expired": false, "locked": false, "body": "<p>The research team is formed of three disciplinary clusters. Although the three clusters have their own research they will each will draw upon and feed into the others. Each cluster will therefore not be working in isolation, reflecting the interdisciplinary approach at the core of the project. Find out more about the methods being used in the three clusters below.</p><p></p><hr/><p></p><hr/><h3></h3><h3>Economics and Epidemiology</h3><p>Better understanding of the spatial interactions amongst farmers</p><p>Simulation models to enable prediction of responses to a range of factors including disease parameters, costs, support measures and new information</p><p>Examine how farmer decision making is affected by past experience of disease, health and welfare priorities, perceptions and evaluations of disease management methods</p><p>Variation in consumer preferences</p><p>Look to establish trade-offs</p><p>WTP animal welfare in relation to other product attributes</p><p>Models that incorporate aspects from the other disciplines, such as social pressures, economic incentives and past disease experiences may improve disease predictions</p><p></p><p>Greater understanding of human-animal relationships and how these relate to animal health and welfare</p><hr/><h3></h3><h3>History</h3><p>Changes over time</p><p>Experience, understanding and management of BVD and lameness</p><p>How the different farming systems have evolved over time and also what are understandings of \\u2018food farming\\u2019 for different stakeholders</p><p>Texts, images and existing oral history recordings, including journal articles, advertising material, popular press, government material and grey literature and films</p><p>Also give an indication of who is giving what advice</p><p>Creation of a timeline</p><p>Understanding the influence of historical forces can also help us to better understand the present, in relation to farming practices, sources of information and consumer behaviour</p><ul><li>Creation of a timeline to display</li><li>Oral history to promote discussion and reflection<br/></li></ul><hr/><h3></h3><h3>Social Science</h3><p>The social science cluster is tasked with exploring how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other.</p><p>This will be achived through a number of different methods including;</p><ul><li>Survey of farmers</li><li>Interviews</li><li>Focus groups</li><li>Farm walks to understand the real world context of disease</li></ul><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p>Farm walks to understand the real world context of disease</p><p>Explore how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other</p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p></p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-18T10:05:05.566Z", "depth": 5, "draft_title": "Methodology", "live": true, "latest_revision_created_at": "2019-02-01T13:02:13.553Z", "owner": 6, "slug": "methodology", "search_description": "", "content_type": 31, "title": "Methodology"}	\N	27	4
154	f	2019-02-01 14:00:34.162733+00	{"first_published_at": "2019-01-18T10:05:05.566Z", "url_path": "/home2/about/project/methodology/", "expire_at": null, "path": "00010002000200010002", "numchild": 0, "show_in_menus": false, "pk": 27, "has_unpublished_changes": true, "live_revision": 62, "expired": false, "locked": false, "body": "<p>The research team is formed of three disciplinary clusters. Although the three clusters have their own research they will each will draw upon and feed into the others. Each cluster will therefore not be working in isolation, reflecting the interdisciplinary approach at the core of the project. Find out more about the methods being used in the three clusters below.</p><p></p><hr/><p></p><hr/><h3></h3><h3>Economics and Epidemiology</h3><p>Better understanding of the spatial interactions amongst farmers</p><p>Simulation models to enable prediction of responses to a range of factors including disease parameters, costs, support measures and new information</p><p>Examine how farmer decision making is affected by past experience of disease, health and welfare priorities, perceptions and evaluations of disease management methods</p><p>Variation in consumer preferences</p><p>Look to establish trade-offs</p><p>WTP animal welfare in relation to other product attributes</p><p>Models that incorporate aspects from the other disciplines, such as social pressures, economic incentives and past disease experiences may improve disease predictions</p><p></p><p>Greater understanding of human-animal relationships and how these relate to animal health and welfare</p><ul><li>Farmer survey of farm animal health</li><li>&#x27;Food busk&#x27; to establish public perceptions of animal health </li><li>Consumer survey of willigness-to-pay for farm animal we</li></ul><hr/><h3></h3><h3>History</h3><p>Changes over time</p><p>Experience, understanding and management of BVD and lameness</p><p>How the different farming systems have evolved over time and also what are understandings of \\u2018food farming\\u2019 for different stakeholders</p><p>Texts, images and existing oral history recordings, including journal articles, advertising material, popular press, government material and grey literature and films</p><p>Also give an indication of who is giving what advice</p><p>Understanding the influence of historical forces can also help us to better understand the present, in relation to farming practices, sources of information and consumer behaviour</p><ul><li>Digitisation of historical agricultural images and videos</li><li>Creation of a timeline to display</li><li>Oral history to promote discussion and reflection<br/></li></ul><hr/><h3></h3><h3>Social Science</h3><p>The social science cluster is tasked with exploring how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other.</p><p>This will be achived through a number of different methods including;</p><ul><li>Survey of farmers to establish farm management practices</li><li>Interviews</li><li>Focus groups</li><li>Farm walks to understand the real world context of disease</li></ul><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p>Farm walks to understand the real world context of disease</p><p>Explore how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other</p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p><p>Co-evolve with human-animal relations, livestock production practices, farming communities and consumer concerns</p><p>Looking to explore how knowledge-practices emerge and evolve through interviews and focus groups both farmers and advisors</p><p></p><p>Explore relationships between different stakeholders knowledge practices</p><p>Management options, resources available, experiences of livestock health and welfare</p><p>Explore factors identified in the other disciplinary clusters</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-18T10:05:05.566Z", "depth": 5, "draft_title": "Methodology", "live": true, "latest_revision_created_at": "2019-02-01T13:04:07.849Z", "owner": 6, "slug": "methodology", "search_description": "", "content_type": 31, "title": "Methodology"}	\N	27	4
81	f	2019-01-21 12:51:55.374296+00	{"locked": false, "title": "The Project", "draft_title": "The Project", "has_unpublished_changes": true, "first_published_at": "2019-01-10T13:08:41.922Z", "depth": 4, "expired": false, "last_published_at": "2019-01-21T12:25:11.839Z", "live": true, "content_type": 31, "slug": "project", "latest_revision_created_at": "2019-01-21T12:51:52.194Z", "show_in_menus": true, "numchild": 2, "expire_at": null, "path": "0001000200020001", "seo_title": "", "live_revision": 79, "url_path": "/home2/about/project/", "owner": 2, "search_description": "", "pk": 14, "body": "<p></p><p></p><p>Livestock disease is a complex problem that threatens the development of more sustainable, ethical and efficient farming methods. While traditional, discipline-specific approaches have helped to address the problem of livestock disease, many of farming\\u2019s current challenges cut across disciplines, affecting animal welfare, the environment, and future food security. A new approach is therefore required to reflect the interdisciplinary nature of the challenges facing farmers today. FIELD aims to provide this by integrating scientific, social scientific and humanities perspectives on two case study health problems in Britain; BVD and lameness.</p><p>Through embedding these problems in time, space and society, and enrolling farmers and other publics in their investigation, FIELD will interrogate the changing biological, ontological and social identities of livestock diseases, their relationships with livestock systems and farming communities, and how animal behaviours have shaped their expression, interpretation and management by humans. The project explores how responses to disease in the past have informed its effects in the present; how studying disease in the present can enhance understandings of its past, and how these investigations can inform and be informed by future predictions of disease. FIELD will thereby generate new ways of thinking about, predicting, and intervening in the effects of disease on individual farms and in farming communities, for the benefit of animals, farmers, consumers and the environment.</p><p></p><p></p><h2><a id=\\"24\\" linktype=\\"page\\">Approaches</a></h2><p></p><h2><a id=\\"27\\" linktype=\\"page\\">Methodology</a></h2>", "go_live_at": null}	\N	14	6
112	f	2019-01-25 12:43:23.22895+00	{"go_live_at": null, "search_description": "", "slug": "home2", "depth": 2, "show_in_menus": true, "expired": false, "url_path": "/home2/", "numchild": 6, "first_published_at": "2019-01-11T01:18:30.245Z", "has_unpublished_changes": false, "last_published_at": "2019-01-23T10:22:55.891Z", "title": "Home", "expire_at": null, "draft_title": "Home", "path": "00010002", "live_revision": 108, "content_type": 31, "owner": 1, "pk": 18, "seo_title": "", "locked": false, "live": true, "body": "<p>Better ways of understanding livestock disease are urgently required to ensure animal health and welfare, as well as farming sustainability. The Farm-level Interdisciplinary approaches to Endemic Livestock Diseases (FIELD) project, looks to bring together experts from industry, governance and academia to explore the realms of nature and culture, science and society and human and animal, and their impact on disease. Insights from the project will be used to develop better predictions ad disease and further insights into disease management.</p><p></p><p>[Timeline]</p><p></p><h2><a id=\\"3\\" linktype=\\"page\\">News</a></h2>", "latest_revision_created_at": "2019-01-23T10:22:55.869Z"}	\N	18	6
110	f	2019-01-23 10:29:48.966785+00	{"go_live_at": null, "search_description": "", "slug": "focus-farming", "depth": 4, "show_in_menus": false, "expired": false, "url_path": "/home2/groups/focus-farming/", "numchild": 1, "first_published_at": "2019-01-11T11:59:31.921Z", "has_unpublished_changes": false, "last_published_at": "2019-01-11T11:59:31.921Z", "title": "Focus on Farming", "expire_at": null, "draft_title": "Focus on Farming", "path": "0001000200030002", "live_revision": 36, "content_type": 31, "owner": 2, "pk": 19, "seo_title": "", "locked": false, "live": true, "body": "<h2><a id=\\"8\\" linktype=\\"page\\">Contact Us</a></h2>", "latest_revision_created_at": "2019-01-11T11:59:31.903Z"}	\N	19	6
48	f	2019-01-11 12:11:25.323869+00	{"locked": false, "title": "Approaches", "draft_title": "Approaches", "has_unpublished_changes": false, "first_published_at": null, "depth": 5, "expired": false, "last_published_at": null, "live": true, "content_type": 31, "slug": "approaches", "latest_revision_created_at": null, "show_in_menus": true, "numchild": 0, "expire_at": null, "path": "00010002000300010001", "seo_title": "", "live_revision": null, "url_path": "/home2/about/project/approaches/", "owner": 2, "search_description": "", "pk": 24, "body": "<p></p>", "go_live_at": null}	\N	24	2
165	f	2019-02-04 10:12:50.255719+00	{"first_published_at": "2019-01-10T13:05:00.666Z", "url_path": "/home2/resources/", "expire_at": null, "path": "000100020005", "numchild": 4, "show_in_menus": true, "pk": 7, "has_unpublished_changes": false, "live_revision": 87, "expired": false, "locked": false, "body": "<p>Want to explore how farming has changed over the past few decades and the key events that have shaped this, or explore in-depth the findings of the FIELD research and what this means for policy and practice? Then our resources section is the right place for you!</p><p>Visit our <a id=\\"28\\" linktype=\\"page\\">timeline</a> which is perfect for exploring the past 60 years of agricultural change. Head over to our <a id=\\"29\\" linktype=\\"page\\">media</a> gallery to see and hear how farming has changed since the Second World War. Check out our latest research<a id=\\"33\\" linktype=\\"page\\"> papers</a> to get more in-depth information about our methods and findings, or take a look at our <a id=\\"32\\" linktype=\\"page\\">policy and practice notes</a> to see what the implications of the research are.</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-21T15:19:58.342Z", "depth": 3, "draft_title": "Resources", "live": true, "latest_revision_created_at": "2019-01-21T15:19:58.319Z", "owner": 2, "slug": "resources", "search_description": "", "content_type": 31, "title": "Resources"}	\N	7	6
7	f	2019-01-10 13:05:00.634887+00	{"draft_title": "Resources", "last_published_at": null, "url_path": "/home/resources/", "numchild": 0, "seo_title": "", "first_published_at": null, "go_live_at": null, "slug": "resources", "expired": false, "depth": 3, "locked": false, "expire_at": null, "body": "<h2>Placeholder</h2>", "live": true, "latest_revision_created_at": null, "path": "000100010004", "has_unpublished_changes": false, "show_in_menus": false, "pk": 7, "content_type": 31, "live_revision": null, "title": "Resources", "owner": 2, "search_description": ""}	\N	7	2
138	f	2019-01-31 11:23:28.109423+00	{"first_published_at": "2019-01-11T12:11:25.341Z", "url_path": "/home2/about/project/approaches/", "expire_at": null, "path": "00010002000200010001", "numchild": 0, "show_in_menus": true, "pk": 24, "has_unpublished_changes": false, "live_revision": 48, "expired": false, "locked": false, "body": "<p>  </p><embed alt=\\"Conceptual approach white\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"15\\"/><p></p><p></p><p>The FIELD project has interdisciplinary research at its core. Previous research for solutions has been hampered by traditional research discipline silos</p><p>Cuts across the realms of nature, culture, science, society, human and animal </p><p>Look to explore the past and present of two example diseases, and how they relate to changes in farming systems, communities and the wider world. This will help us to develop better predictions of disease in the future, and to advise on its management.</p><p>Develop a new interdisciplinary approach</p><p>Study the disease as a co-evolutionary process: as a biological and social phenomenon that shapes and is shaped by farming systems and communities (see figure)</p><p>Look at different types of production systems across farms in the North East and Cumbria</p><p></p><p>  </p><p>FIELD has interdisciplinary working at its core. Examine interconnected social and biological identities of livestock disease</p><p>Develop and foster mutual understandings by involving stakeholders as co-producers of knowledge, both in terms of shaping the research focus and providing feedback on findings</p><p>Innovative knowledge-exchange</p><p>Models that incorporate aspects from the other disciplines, such as social pressures, economic incentives and past disease experiences may improve disease predictions</p><p>Encourage new ways of thinking about the relationships between livestock diseases, farming systems and communities</p><p>Greater understanding of human-animal relationships and how these relate to animal health and welfare</p><p>Explore interconnections identified in the different disciplines</p><p>Team of early career researchers will be central to this</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-11T12:11:25.341Z", "depth": 5, "draft_title": "Approaches", "live": true, "latest_revision_created_at": "2019-01-11T12:11:25.323Z", "owner": 2, "slug": "approaches", "search_description": "", "content_type": 31, "title": "Approaches"}	\N	24	4
139	f	2019-01-31 13:30:08.061868+00	{"first_published_at": "2019-01-11T12:11:25.341Z", "url_path": "/home2/about/project/approaches/", "expire_at": null, "path": "00010002000200010001", "numchild": 0, "show_in_menus": true, "pk": 24, "has_unpublished_changes": true, "live_revision": 48, "expired": false, "locked": false, "body": "<p>Previous research for solutions to livestock disease has been hampered by traditional research discipline silos. The FIELD project seeks to examine the social and biological identities of livestock disease, and cut across the realms of nature, culture, science, society, human and animal. This will enable us to study livestock disease as a co-evolutionary process: as both a biological and social phenomenon that shapes and is shaped by farming systems and communities, as emphasised in the diagram below. </p><p></p><embed alt=\\"Conceptual approach white\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"15\\"/><p></p><p>Given how interconnected these aspects are, it is unsuprising that FIELD has an interdisciplinary approach at its core. By working both within and across the three main research disciplines involved in the project </p><p>This will help to encourage new ways of thinking about the relationships between livestock diseases, farming systems and communities which will help us to develop better predictions of disease in the future, and to advise on its management.</p><p>Our network of <a id=\\"35\\" linktype=\\"page\\">collaborators</a> will also </p><p></p><p></p><p>Look to explore the past and present of two example diseases, and how they relate to changes in farming systems, communities and the wider world. </p><p></p><p></p><p>Look at different types of production systems across farms in the North East and Cumbria</p><p></p><p></p><p>Develop and foster mutual understandings by involving stakeholders as co-producers of knowledge, both in terms of shaping the research focus and providing feedback on findings</p><p>Innovative knowledge-exchange will help to facilitate the creation of these understandings</p><p>Models that incorporate aspects from the other disciplines, such as social pressures, economic incentives and past disease experiences may improve disease predictions</p><p></p><p>Greater understanding of human-animal relationships and how these relate to animal health and welfare</p><p>Explore interconnections identified in the different disciplines</p><p>Team of early career researchers will be central to this</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-11T12:11:25.341Z", "depth": 5, "draft_title": "Approaches", "live": true, "latest_revision_created_at": "2019-01-31T11:23:28.109Z", "owner": 2, "slug": "approaches", "search_description": "", "content_type": 31, "title": "Approaches"}	\N	24	4
140	f	2019-01-31 13:31:18.813254+00	{"first_published_at": "2019-01-11T12:11:25.341Z", "url_path": "/home2/about/project/approaches/", "expire_at": null, "path": "00010002000200010001", "numchild": 0, "show_in_menus": true, "pk": 24, "has_unpublished_changes": true, "live_revision": 48, "expired": false, "locked": false, "body": "<h3>Interdisciplinary nature</h3><p>Previous research for solutions to livestock disease has been hampered by traditional research discipline silos. The FIELD project seeks to examine the social and biological identities of livestock disease, and cut across the realms of nature, culture, science, society, human and animal. This will enable us to study livestock disease as a co-evolutionary process: as both a biological and social phenomenon that shapes and is shaped by farming systems and communities, as emphasised in the diagram below.</p><p></p><embed alt=\\"Conceptual approach white\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"15\\"/><p></p><p>Given how interconnected these aspects are, it is unsuprising that FIELD has an interdisciplinary approach at its core. By working both within and across the three main research disciplines involved in the project. </p><p>This will help to encourage new ways of thinking about the relationships between livestock diseases, farming systems and communities which will help us to develop better predictions of disease in the future, and to advise on its management.</p><p>Our network of <a id=\\"35\\" linktype=\\"page\\">collaborators</a> will also</p><p></p><h3>Project case studies</h3><p>Look to explore the past and present of two example diseases, and how they relate to changes in farming systems, communities and the wider world. </p><p>Look at different types of production systems across farms in the North East and Cumbria</p><p></p><p></p><p>Develop and foster mutual understandings by involving stakeholders as co-producers of knowledge, both in terms of shaping the research focus and providing feedback on findings</p><p>Innovative knowledge-exchange will help to facilitate the creation of these understandings</p><p>Models that incorporate aspects from the other disciplines, such as social pressures, economic incentives and past disease experiences may improve disease predictions</p><p></p><p>Greater understanding of human-animal relationships and how these relate to animal health and welfare</p><p>Explore interconnections identified in the different disciplines</p><p>Team of early career researchers will be central to this</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-11T12:11:25.341Z", "depth": 5, "draft_title": "Approaches", "live": true, "latest_revision_created_at": "2019-01-31T13:30:08.061Z", "owner": 2, "slug": "approaches", "search_description": "", "content_type": 31, "title": "Approaches"}	\N	24	4
141	f	2019-01-31 13:36:16.523708+00	{"first_published_at": "2019-01-11T12:11:25.341Z", "url_path": "/home2/about/project/approaches/", "expire_at": null, "path": "00010002000200010001", "numchild": 0, "show_in_menus": true, "pk": 24, "has_unpublished_changes": true, "live_revision": 48, "expired": false, "locked": false, "body": "<p>The FIELD project strives to deliver a new approach to studying livestock disease, which not only </p><p></p><p></p><hr/><p></p><h3>Interdisciplinary nature</h3><p>Previous research for solutions to livestock disease has been hampered by traditional research discipline silos. The FIELD project seeks to examine the social and biological identities of livestock disease, and cut across the realms of nature, culture, science, society, human and animal. This will enable us to study livestock disease as a co-evolutionary process: as both a biological and social phenomenon that shapes and is shaped by farming systems and communities, as emphasised in the diagram below.</p><p></p><embed alt=\\"Conceptual approach white\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"15\\"/><p></p><p>Given how interconnected these aspects are, it is unsuprising that FIELD has an interdisciplinary approach at its core. By working both within and across the three main research disciplines involved in the project.</p><p>This will help to encourage new ways of thinking about the relationships between livestock diseases, farming systems and communities which will help us to develop better predictions of disease in the future, and to advise on its management.</p><p>Models that incorporate aspects from the other disciplines, such as social pressures, economic incentives and past disease experiences may improve disease predictions</p><p></p><p>Greater understanding of human-animal relationships and how these relate to animal health and welfare</p><p>Explore interconnections identified in the different disciplines</p><p>Team of early career researchers will be central to this</p><p></p><hr/><p></p><h3>Stakeholder input</h3><p>Our network of <a id=\\"35\\" linktype=\\"page\\">collaborators</a> will also</p><p>Develop and foster mutual understandings by involving stakeholders as co-producers of knowledge, both in terms of shaping the research focus and providing feedback on findings</p><p>Innovative knowledge-exchange will help to facilitate the creation of these understandings</p><p></p><hr/><p></p><h3>Project case studies</h3><p>Look to explore the past and present of two example diseases, and how they relate to changes in farming systems, communities and the wider world.</p><p>Look at different types of production systems across farms in the North East and Cumbria</p><p></p><p></p><p></p><p></p><p></p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-11T12:11:25.341Z", "depth": 5, "draft_title": "Approaches", "live": true, "latest_revision_created_at": "2019-01-31T13:31:18.813Z", "owner": 2, "slug": "approaches", "search_description": "", "content_type": 31, "title": "Approaches"}	\N	24	4
144	f	2019-01-31 13:42:57.038388+00	{"first_published_at": "2019-01-11T12:11:25.341Z", "url_path": "/home2/about/project/approaches/", "expire_at": null, "path": "00010002000200010001", "numchild": 0, "show_in_menus": true, "pk": 24, "has_unpublished_changes": true, "live_revision": 48, "expired": false, "locked": false, "body": "<p>The FIELD project strives to deliver a new approach to studying livestock disease, which not only wil help shed new light on this topic but will also be co-produced with key stakeholders throughout the research process to ensure the relevance of the project recommendations to the two case study diseases being explored. Find out more about the approaches the FIELD project is using below.</p><p></p><p></p><hr/><p></p><h3>Interdisciplinary nature</h3><p>Previous research for solutions to livestock disease has been hampered by traditional research discipline silos. The FIELD project seeks to examine the social and biological identities of livestock disease, and cut across the realms of nature, culture, science, society, human and animal. This will enable us to study livestock disease as a co-evolutionary process: as both a biological and social phenomenon that shapes and is shaped by farming systems and communities, as emphasised in the diagram below.</p><p></p><embed alt=\\"Conceptual approach white\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"15\\"/><p></p><p>Given how interconnected these aspects are, it is unsuprising that FIELD has an interdisciplinary approach at its core. Working both within and across the three main research disciplines involved in the project will help to encourage new ways of thinking about the relationships between livestock diseases, farming systems and communities, which in turn will help us to develop better predictions of disease in the future, and to advise on its management.</p><p></p><p>Explore interconnections identified in the different disciplines</p><p>Team of early career researchers will be central to this</p><p></p><hr/><p></p><h3>Stakeholder input</h3><p>Our network of <a id=\\"35\\" linktype=\\"page\\">collaborators</a> will also</p><p>Develop and foster mutual understandings by involving stakeholders as co-producers of knowledge, both in terms of shaping the research focus and providing feedback on findings</p><p>Innovative knowledge-exchange will help to facilitate the creation of these understandings</p><p></p><p></p><p></p><embed alt=\\"Expertise.png\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"16\\"/><p></p><p></p><hr/><p></p><h3>Project case studies</h3><p>Look to explore the past and present of two example diseases, and how they relate to changes in farming systems, communities and the wider world.</p><p>Look at different types of production systems across farms in the North East and Cumbria</p><p></p><p></p><p></p><p></p><p></p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-11T12:11:25.341Z", "depth": 5, "draft_title": "Approaches", "live": true, "latest_revision_created_at": "2019-01-31T13:41:14.797Z", "owner": 2, "slug": "approaches", "search_description": "", "content_type": 31, "title": "Approaches"}	\N	24	4
147	f	2019-01-31 13:49:44.053649+00	{"first_published_at": "2019-01-11T12:11:25.341Z", "url_path": "/home2/about/project/approaches/", "expire_at": null, "path": "00010002000200010001", "numchild": 0, "show_in_menus": true, "pk": 24, "has_unpublished_changes": true, "live_revision": 48, "expired": false, "locked": false, "body": "<p>The FIELD project strives to deliver a new approach to studying livestock disease, which not only wil help shed new light on this topic but will also be co-produced with key stakeholders throughout the research process to ensure the relevance of the project recommendations to the two case study diseases being explored. Find out more about the approaches the FIELD project is using below.</p><p></p><p></p><hr/><p></p><h3>Interdisciplinary nature</h3><p>Previous research for solutions to livestock disease has been hampered by traditional research discipline silos. The FIELD project seeks to examine the social and biological identities of livestock disease, and cut across the realms of nature, culture, science, society, human and animal. This will enable us to study livestock disease as a co-evolutionary process: as both a biological and social phenomenon that shapes and is shaped by farming systems and communities, as emphasised in the diagram below.</p><p></p><embed alt=\\"Conceptual approach white\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"15\\"/><p></p><p>Given how interconnected these aspects are, it is unsuprising that FIELD has an interdisciplinary approach at its core. Working both within and across the three main research disciplines involved in the project will help to encourage new ways of thinking about the relationships between livestock diseases, farming systems and communities, which in turn will help us to develop better predictions of disease in the future, and to advise on its management.</p><p></p><p>Explore interconnections identified in the different disciplines More connections between the three will emerge as the project develops, leading to a project which is truly interdisciplinary in nature.</p><p></p><p>Team of early career researchers will be central to this</p><p></p><hr/><p></p><h3>Stakeholder input</h3><p>Our network of <a id=\\"35\\" linktype=\\"page\\">collaborators</a> will also</p><p>Develop and foster mutual understandings by involving stakeholders as co-producers of knowledge, both in terms of shaping the research focus and providing feedback on findings</p><p>Innovative knowledge-exchange will help to facilitate the creation of these understandings</p><p></p><p></p><p></p><embed alt=\\"Expertise.png\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"16\\"/><p></p><p></p><hr/><p></p><h3>Project case studies</h3><p>Look to explore the past and present of two example diseases, and how they relate to changes in farming systems, communities and the wider world.</p><p>Look at different types of production systems across farms in the North East and Cumbria</p><p></p><p></p><p></p><p></p><p></p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-11T12:11:25.341Z", "depth": 5, "draft_title": "Approaches", "live": true, "latest_revision_created_at": "2019-01-31T13:42:57.038Z", "owner": 2, "slug": "approaches", "search_description": "", "content_type": 31, "title": "Approaches"}	\N	24	4
158	f	2019-02-01 14:37:22.196066+00	{"first_published_at": "2019-01-11T12:11:25.341Z", "url_path": "/home2/about/project/approaches/", "expire_at": null, "path": "00010002000200010001", "numchild": 0, "show_in_menus": true, "pk": 24, "has_unpublished_changes": true, "live_revision": 48, "expired": false, "locked": false, "body": "<p>The FIELD project strives to deliver a new approach to studying livestock disease, which not only wil help shed new light on this topic but will also be co-produced with key stakeholders throughout the research process to ensure the relevance of the project recommendations to the two case study diseases being explored. Find out more about the approaches the FIELD project is using below.</p><p></p><p></p><hr/><p></p><h3>Interdisciplinary nature</h3><p>Previous research for solutions to livestock disease has been hampered by traditional research discipline silos. The FIELD project seeks to examine the social and biological identities of livestock disease, and cut across the realms of nature, culture, science, society, human and animal. This will enable us to study livestock disease as a co-evolutionary process: as both a biological and social phenomenon that shapes and is shaped by farming systems and communities, as emphasised in the diagram below.</p><p></p><embed alt=\\"Conceptual approach white\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"15\\"/><p></p><p>Given how interconnected these aspects are, it is unsuprising that FIELD has an interdisciplinary approach at its core. Working both within and across the three main research disciplines involved in the project will help to encourage new ways of thinking about the relationships between livestock diseases, farming systems and communities, which in turn will help us to develop better predictions of disease in the future, and to advise on its management.</p><p></p><p>Explore interconnections identified in the different disciplines. More connections between the three will emerge as the project develops, leading to a project which is truly interdisciplinary in nature.</p><p></p><p>The team of early career researchers will be central to this.</p><p></p><hr/><p></p><h3>Stakeholder input</h3><p>Our network of <a id=\\"35\\" linktype=\\"page\\">collaborators</a> will also develop and foster mutual understandings by involving stakeholders as co-producers of knowledge, both in terms of shaping the research focus and providing feedback on findings.</p><p>Innovative knowledge-exchange will help to facilitate the creation of these understandings.</p><p></p><p></p><p></p><embed alt=\\"Expertise.png\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"16\\"/><p></p><p></p><hr/><p></p><h3>Project case studies</h3><p>Look to explore the past and present of two example diseases, and how they relate to changes in farming systems, communities and the wider world.</p><p>Look at different types of production systems across farms in the North East and Cumbria</p><p></p><p></p><p></p><p></p><p></p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-11T12:11:25.341Z", "depth": 5, "draft_title": "Approaches", "live": true, "latest_revision_created_at": "2019-01-31T13:49:44.053Z", "owner": 2, "slug": "approaches", "search_description": "", "content_type": 31, "title": "Approaches"}	\N	24	6
63	f	2019-01-18 12:03:17.722892+00	{"locked": false, "title": "Communities", "draft_title": "Groups", "has_unpublished_changes": false, "first_published_at": "2019-01-10T12:55:28.847Z", "depth": 3, "expired": false, "last_published_at": "2019-01-11T12:02:14.066Z", "live": true, "content_type": 31, "slug": "groups", "latest_revision_created_at": "2019-01-11T12:02:14.048Z", "show_in_menus": true, "numchild": 4, "expire_at": null, "path": "000100020002", "seo_title": "", "live_revision": 40, "url_path": "/home2/groups/", "owner": 2, "search_description": "", "pk": 6, "body": "<h2>Placeholder Header 2</h2><h3>Placeholder Header 3</h3><h4>Placeholder Header 4</h4><p>Placeholder normal text</p><ol><li>Numbered list 1</li><li>Numbered list 2</li></ol><ul><li>Bullet list 1</li><li>Bullet list 2</li></ul><blockquote>A quotation</blockquote><hr/><p>Horizontal line divider ^^^</p><p></p><p></p><p></p>", "go_live_at": null}	\N	6	4
92	f	2019-01-21 15:20:38.34046+00	{"locked": false, "title": "Communities", "draft_title": "Communities", "has_unpublished_changes": true, "first_published_at": "2019-01-10T12:55:28.847Z", "depth": 3, "expired": false, "last_published_at": "2019-01-11T12:02:14.066Z", "live": true, "content_type": 31, "slug": "groups", "latest_revision_created_at": "2019-01-18T12:52:43.331Z", "show_in_menus": true, "numchild": 4, "expire_at": null, "path": "000100020003", "seo_title": "", "live_revision": 40, "url_path": "/home2/groups/", "owner": 2, "search_description": "", "pk": 6, "body": "<p></p><p>We think FIELD is of interest to a range of different communities, incorporating a range of different stakeholders, given how integral livestock production is to our daily lives; be that as a source of income, an important portion of the food we eat, not to mention being part of the landscapes we know and love in the UK. Each community will have different interests in FIELD, which is why we\\u2019ve broken them out below to signpost you to the website content we think will be most relevant. This doesn\\u2019t stop you from exploring more than one though!</p><p>Visit the communities below to find out more about the <a id=\\"10\\" linktype=\\"page\\">research</a> the FIELD team are doing, what it means in <a id=\\"21\\" linktype=\\"page\\">policy</a> and on <a id=\\"19\\" linktype=\\"page\\">farms</a>, and finally what it means for the ultimate end users of food chains, <a id=\\"20\\" linktype=\\"page\\">consumers</a>, in relation to how the food we eat is produced.</p><p></p><p></p>", "go_live_at": null}	\N	6	2
19	f	2019-01-10 13:39:51.111326+00	{"draft_title": "Groups", "last_published_at": "2019-01-10T12:55:28.847Z", "url_path": "/home/groups/", "numchild": 1, "seo_title": "", "first_published_at": "2019-01-10T12:55:28.847Z", "go_live_at": null, "slug": "groups", "expired": false, "depth": 3, "locked": false, "expire_at": null, "body": "<h2>Placeholder Header 2</h2><h3>Placeholder Header 3</h3><h4>Placeholder Header 4</h4><p>Placeholder normal text</p><ol><li>Numbered list 1</li><li>Numbered list 2</li></ol><ul><li>Bullet list 1</li><li>Bullet list 2</li></ul><blockquote>A quotation</blockquote>", "live": true, "latest_revision_created_at": "2019-01-10T12:55:28.827Z", "path": "000100010001", "has_unpublished_changes": false, "show_in_menus": false, "pk": 6, "content_type": 31, "live_revision": 6, "title": "Groups", "owner": 2, "search_description": ""}	\N	6	2
66	f	2019-01-18 12:51:19.775347+00	{"locked": false, "title": "Communities", "draft_title": "Communities", "has_unpublished_changes": true, "first_published_at": "2019-01-10T12:55:28.847Z", "depth": 3, "expired": false, "last_published_at": "2019-01-11T12:02:14.066Z", "live": true, "content_type": 31, "slug": "groups", "latest_revision_created_at": "2019-01-18T12:03:17.722Z", "show_in_menus": true, "numchild": 4, "expire_at": null, "path": "000100020003", "seo_title": "", "live_revision": 40, "url_path": "/home2/groups/", "owner": 2, "search_description": "", "pk": 6, "body": "<p>  </p><p>We think FIELD is of interest to a range of different communities, incorporating a range of different stakeholders, given how integral livestock production is to our daily lives; be that as a source of income, an important portion of the food we eat, not to mention being part of the landscapes we know and love in the UK. Each community will have different interests in FIELD, which is why we\\u2019ve broken them out below to signpost you to the website content we think will be most relevant.  This doesn\\u2019t stop you from exploring more than one though!</p><p>Visit the communities below to find out more about the research the FIELD team are doing, what it means in policy and for farms, and finally what it means for the ultimate end users of food chains, consumers, in relation to how the food we eat is produced.</p><p></p><p></p>", "go_live_at": null}	\N	6	4
87	f	2019-01-21 15:19:58.319779+00	{"locked": false, "title": "Resources", "draft_title": "Resources", "has_unpublished_changes": true, "first_published_at": "2019-01-10T13:05:00.666Z", "depth": 3, "expired": false, "last_published_at": "2019-01-11T02:30:57.276Z", "live": true, "content_type": 31, "slug": "resources", "latest_revision_created_at": "2019-01-18T13:13:16.682Z", "show_in_menus": true, "numchild": 4, "expire_at": null, "path": "000100020005", "seo_title": "", "live_revision": 26, "url_path": "/home2/resources/", "owner": 2, "search_description": "", "pk": 7, "body": "<p>Want to explore how farming has changed over the past few decades and the key events that have shaped this, or explore in-depth the findings of the FIELD research and what this means for policy and practice? Then our resources section is the right place for you!</p><p>Visit our <a id=\\"28\\" linktype=\\"page\\">timeline</a> which is perfect for exploring the past 60 years of agricultural change. Head over to our <a id=\\"29\\" linktype=\\"page\\">media</a> gallery to see and hear how farming has changed since the Second World War? Check out our latest research<a id=\\"33\\" linktype=\\"page\\"> papers</a> to see more in-depth about our methods and findings, or see our <a id=\\"32\\" linktype=\\"page\\">policy and practice notes</a> to see what the implications of the research are.</p>", "go_live_at": null}	\N	7	2
67	f	2019-01-18 12:52:43.331847+00	{"locked": false, "title": "Communities", "draft_title": "Communities", "has_unpublished_changes": true, "first_published_at": "2019-01-10T12:55:28.847Z", "depth": 3, "expired": false, "last_published_at": "2019-01-11T12:02:14.066Z", "live": true, "content_type": 31, "slug": "groups", "latest_revision_created_at": "2019-01-18T12:51:19.775Z", "show_in_menus": true, "numchild": 4, "expire_at": null, "path": "000100020003", "seo_title": "", "live_revision": 40, "url_path": "/home2/groups/", "owner": 2, "search_description": "", "pk": 6, "body": "<p></p><p>We think FIELD is of interest to a range of different communities, incorporating a range of different stakeholders, given how integral livestock production is to our daily lives; be that as a source of income, an important portion of the food we eat, not to mention being part of the landscapes we know and love in the UK. Each community will have different interests in FIELD, which is why we\\u2019ve broken them out below to signpost you to the website content we think will be most relevant. This doesn\\u2019t stop you from exploring more than one though!</p><p>Visit the communities below to find out more about the <a id=\\"10\\" linktype=\\"page\\">research</a> the FIELD team are doing, what it means in <a id=\\"21\\" linktype=\\"page\\">policy</a> and on <a id=\\"19\\" linktype=\\"page\\">farms</a>, and finally what it means for the ultimate end users of food chains, <a id=\\"20\\" linktype=\\"page\\">consumers</a>, in relation to how the food we eat is produced.</p><p></p><p></p>", "go_live_at": null}	\N	6	4
20	f	2019-01-10 13:43:27.830136+00	{"draft_title": "Groups", "last_published_at": "2019-01-10T13:39:51.136Z", "url_path": "/home/groups/", "numchild": 1, "seo_title": "", "first_published_at": "2019-01-10T12:55:28.847Z", "go_live_at": null, "slug": "groups", "expired": false, "depth": 3, "locked": false, "expire_at": null, "body": "<h2>Placeholder Header 2</h2><h3>Placeholder Header 3</h3><h4>Placeholder Header 4</h4><p>Placeholder normal text</p><ol><li>Numbered list 1</li><li>Numbered list 2</li></ol><ul><li>Bullet list 1</li><li>Bullet list 2</li></ul><blockquote>A quotation</blockquote><blockquote></blockquote><hr/><p>Horizontal line divider ^^^</p><p>Image left</p><embed alt=\\"_1020566.JPG\\" embedtype=\\"image\\" format=\\"left\\" id=\\"2\\"/><p>Image centre</p><p></p><embed alt=\\"_1020566.JPG\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"2\\"/><p>Image right</p><p></p><embed alt=\\"_1020566.JPG\\" embedtype=\\"image\\" format=\\"right\\" id=\\"2\\"/><p></p>", "live": true, "latest_revision_created_at": "2019-01-10T13:39:51.111Z", "path": "000100010001", "has_unpublished_changes": false, "show_in_menus": false, "pk": 6, "content_type": 31, "live_revision": 19, "title": "Groups", "owner": 2, "search_description": ""}	\N	6	2
24	f	2019-01-11 02:30:31.996748+00	{"show_in_menus": true, "live": true, "numchild": 1, "title": "Groups", "expire_at": null, "slug": "groups", "body": "<h2>Placeholder Header 2</h2><h3>Placeholder Header 3</h3><h4>Placeholder Header 4</h4><p>Placeholder normal text</p><ol><li>Numbered list 1</li><li>Numbered list 2</li></ol><ul><li>Bullet list 1</li><li>Bullet list 2</li></ul><blockquote>A quotation</blockquote><blockquote></blockquote><hr/><p>Horizontal line divider ^^^</p><p>Image left</p><embed alt=\\"_1020566.JPG\\" embedtype=\\"image\\" format=\\"left\\" id=\\"2\\"/><p>Image centre</p><p></p><embed alt=\\"_1020566.JPG\\" embedtype=\\"image\\" format=\\"fullwidth\\" id=\\"2\\"/><p>Image right</p><p></p><embed alt=\\"_1020566.JPG\\" embedtype=\\"image\\" format=\\"right\\" id=\\"2\\"/><p></p>", "expired": false, "locked": false, "first_published_at": "2019-01-10T12:55:28.847Z", "go_live_at": null, "depth": 3, "draft_title": "Groups", "content_type": 31, "has_unpublished_changes": false, "latest_revision_created_at": "2019-01-10T13:43:27.830Z", "search_description": "", "last_published_at": "2019-01-10T13:43:27.860Z", "url_path": "/home2/groups/", "seo_title": "", "live_revision": 20, "path": "000100020002", "pk": 6, "owner": 2}	\N	6	1
162	f	2019-02-01 15:41:52.375122+00	{"first_published_at": "2019-01-10T12:55:28.847Z", "url_path": "/home2/groups/", "expire_at": null, "path": "000100020003", "numchild": 4, "show_in_menus": true, "pk": 6, "has_unpublished_changes": false, "live_revision": 92, "expired": false, "locked": false, "body": "<p></p><p>We think FIELD is of interest to a range of different communities, incorporating a range of different stakeholders, given how integral livestock production is to our daily lives; be that as a source of income, an important portion of the food we eat, not to mention being part of the landscapes we know and love in the UK. Each community will have different interests in FIELD, which is why we\\u2019ve broken them out below to signpost you to the website content we think will be most relevant. This doesn\\u2019t stop you from exploring more than one, though!</p><p>Visit the communities below to find out more about the <a id=\\"10\\" linktype=\\"page\\">research</a> the FIELD team are doing, what it means in <a id=\\"21\\" linktype=\\"page\\">policy</a> and on <a id=\\"19\\" linktype=\\"page\\">farms</a>, and finally what it means for the ultimate end users of food chains, <a id=\\"20\\" linktype=\\"page\\">consumers</a>, in relation to how the food we eat is produced.</p><p></p><p></p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-21T15:20:38.360Z", "depth": 3, "draft_title": "Communities", "live": true, "latest_revision_created_at": "2019-01-21T15:20:38.340Z", "owner": 2, "slug": "groups", "search_description": "", "content_type": 31, "title": "Communities"}	\N	6	6
181	f	2019-02-15 12:44:11.313244+00	{"first_published_at": "2019-01-11T14:26:12.271Z", "url_path": "/home2/about/faq/", "expire_at": null, "path": "0001000200020003", "numchild": 0, "show_in_menus": true, "pk": 25, "has_unpublished_changes": false, "live_revision": 150, "expired": false, "locked": false, "body": "<p>Endemic livestock disease is not something all of us have to think about on a daily basis. We&#x27;ve therefore put together a list of questions to give you some more information about these, and the project more generally.</p><p>Have a question which is not answered in the FAQs below? Please <a id=\\"8\\" linktype=\\"page\\">contact us</a> and we will answer it!</p><p></p><p></p><p></p><hr/><p></p><hr/><p></p><h4>What are endemic diseases?</h4><p>Endemic diseases exist permanently in a population or region, such as the cold virus in humans. They differ from more exotic invasive diseases, such as avian influenza, which typically occur from infections brought in from off the farm and are not usually present. Eradication of some of these disease is possible, although this can be very resource and time consuming.</p><p></p><hr/><p></p><h4>Why are endemic livestock diseases important?</h4><p>Endemic livestock diseases are important from a number of perspectives. If an animal is sick, then it has implications for the animal&#x27;s well-being and welfare. When an animal is ill, they also become less productive, such as by having slower growth or reduced milk yields, which can affect producer profits. Sick animals also need medical treatment, including from antibiotics to fight bacterial infections. Reducing the amount of endemic diseases present will result in animals needing less treatment, resulting in the reduced use of antibiotics and other medicines.</p><p></p><hr/><p></p><h4>Why do animals get these diseases?</h4><p>Like for humans, there are many diseases that animals can catch (think of colds, stomach bugs and viruses) that are easily spread, and almost impossible to get rid of. For animals, we describe these as endemic diseases. Endemic diseases are described as multifactorial, meaning that they occur due to a number of different factors. Livestock can pick up these diseases from other animals on the farm (both farm and wild animals), off neighbouring farms, or from people and equipment that come onto the farm which may be carrying germs. Weather conditions can also affect disease spread, as can an animal\\u2019s genetics.</p><p></p><hr/><p></p><h4>What impact do they have?</h4><p>As well as making animals ill (so affecting their health and welfare), they can impact on their productivity, and this can have severe economic implications.</p><p></p><hr/><p></p><h4>Why BVD and lameness?</h4><p>Bovine viral diarrhoea (BVD) and lameness are two of the most prevalent diseases in cattle and sheep in the UK today. They also have different management practices and different symptoms and can be spread in different ways. This allows us to compare and contrast across two very different diseases, which will give us more learning&#x27;s for endemic diseases in general.</p><p></p><hr/><h4></h4><h4>What is lameness?</h4><p>Lameness is any condition or injury that affects the animals\\u2019 feet and legs, and subsequently their gait (walk) and standing position. It is a multifactorial in nature, meaning that it can be caused by a number of different factors, and is often as a result of a combination of different things. Possible factors linked to lameness include management practices, environmental factors such as the weather or ground condition, infections, or the animals\\u2019 physical characteristics. </p><p></p><hr/><p></p><h4>What is BVD?</h4><p>Bovine Viral Diarrhoea (BVD) is a viral disease that predominantly affects cattle. It is a contagious disease and the main method of spread is by other animals, such as through their faeces. BVD reduces the reproductive performance and compromises the immune system of infected animals. This leads to secondary health problems and an overall lowering of productivity. It is relatively simple to detect through blood tests, and animals can be vaccinated against the disease. BVD is not a zoonoses, so infected animals do not pose a risk to human health and meat from these animals can enter the human food chain.</p><hr/><p></p><h4>Will these diseases affect the animal products that I eat?</h4><p>No, they won\\u2019t. These diseases are not zoonotic, i.e. cannot be transferred to humans, and so do not have implications for food safety or human health. In addition, any sick animals treated with medicines have to follow strict regulations in relation to how long they must be free of medicines before they can enter the human food chain, to ensure that no residues are present in the food we eat.</p><p>Any concerns related to human health are to do with antimicrobial resistance (AMR). As for humans, AMR is a growing concern for animals, and so a reduction in antibiotic use is encouraged. Farmers and veterinarians both follow <a href=\\"https://www.ruma.org.uk/\\">RUMA</a> guidelines, which encourage the more responsible use of antibiotics, which are used only as and when an animal has a disease. If we can reduce the number of animals having a disease, we can reduce the amount of antibiotics used, which has benefits for humans and animals.</p><p></p><hr/><p></p><h4>Are these diseases specific to different types of animal production system?</h4><p>Given the range of different factors linked to endemic diseases, they can occur in any type of animal production system e.g. indoor, free range, organic etc. Some diseases are more common in intensive systems, whereas others are more common in outdoor systems due to greater exposure to the environment and wild animals and micro-organisms which may transmit disease.</p><p></p><hr/><p></p><h4>Why do we still have these diseases?</h4><p>Although the practices and treatments for these diseases exist, there can be barriers to using these in farming practice for a number of different reasons, including various factors known to cause these diseases. Also, given that a number of these diseases are influenced by the environmental factors, including the weather, they can be very difficult to control.</p><p>FIELD looks to explore why these diseases are still present and what can further be done to enable better control and a reduction in these.</p><p></p><hr/><p></p><h4>What do these diseases mean for animal welfare?</h4><p>As for humans, when an animal is sick it affects their well-being, either through feeling generally unwell or being in pain from the infection that they have. Animals who are sick are treated according to the illness they have, which may include antibiotics to treat bacterial infections, pain killers and anti-inflammatory medicines.</p><p></p><hr/><p></p><h4>Does Brexit affect this at all?</h4><p>It is not known how Brexit may affect these diseases, but any implications are likely to be due to regulation and trade. The UK is world-renowned for its high standards of welfare, which are currently higher than EU minimum regulations. This is likely to continue post-Brexit and so animals&#x27; well-being (including fast and effective treatment of diseases should they arise) is likely to continue to be protected.</p><p></p><hr/><p></p><h4>How is FIELD different to other projects?</h4><p>The influence of people is an often overlooked element in livestock disease management and research. The FIELD team is bringing together a range of different expertise to counteract this. Find out more <a id=\\"14\\" linktype=\\"page\\">about the project</a> to get further details of how we plan to do this.</p><p></p><hr/><p></p><h4>What is FIELD going to do?</h4><p>The FIELD project will work to develop better predictive models, as well as to provide recommendations for policy and practice based on the interactions we have with our research participants and stakeholders involved in the project.</p><p></p><hr/><p></p><h4>Can I get involved in the FIELD project?</h4><p>The FIELD team would love to hear from you! We look forward to hearing your questions, opinions, perspectives and experiences, be that as a member of the public, farmer or farm adviser. Visit our<a id=\\"8\\" linktype=\\"page\\"> contact us</a> page to find out how to reach the team.</p><p></p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-02-01T09:58:12.586Z", "depth": 4, "draft_title": "Frequently Asked Questions", "live": true, "latest_revision_created_at": "2019-02-01T09:58:12.560Z", "owner": 2, "slug": "faq", "search_description": "", "content_type": 31, "title": "Frequently Asked Questions"}	\N	25	4
182	f	2019-02-18 13:53:31.851351+00	{"go_live_at": null, "seo_title": "", "title": "Methodology", "last_published_at": "2019-02-01T14:33:17.101Z", "expire_at": null, "path": "00010002000200010002", "expired": false, "slug": "methodology", "locked": false, "first_published_at": "2019-01-18T10:05:05.566Z", "depth": 5, "owner": 6, "body": "<p>In practice, what do these approaches mean we will do? In order to ensure that the FIELD project can achieve its objectives, a number of different research activities and steps will be undertaken as part of the overall research process, as illustrated below.</p><p>Although these different activities will be undertaken in the three different disciplinary clusters within the project, they will each will draw upon and feed into the others. Each cluster will therefore not be working in isolation, reflecting the interdisciplinary approach at the core of the project. Regular research meetings and reflections will help us to establish how to best work across disciplines and more connections between the three will emerge as the project develops, leading to a project which is truly interdisciplinary in nature. Regular contact with our <a id=\\"35\\" linktype=\\"page\\">collaborators</a> will be intrinsic to each stage to ensure the project\\u2019s relevance.</p><p>Together, this will enable us to achieve:</p><ul><li>A novel interdisciplinary method of studying disease that embeds social science and history in the modelling process</li><li>New ways of thinking about the relationship between livestock diseases, farming systems and communities</li><li>Suggestions for interventions to promote livestock health and welfare</li><li>New ways of thinking about human-animal relationships and how they influence animal health and welfare</li><li>Better understandings of farmers\\u2019, experts\\u2019, and consumers\\u2019 attitudes to and preferences for livestock health and welfare,  as well as their perceptions of each other\\u2019s attitudes</li><li>Better understandings of the spatial interactions between farmers, relevant to disease transmission</li></ul><p>Find out more about the methods being used in the three disciplinary clusters below.</p><p>  </p><hr/><p></p><hr/><p> </p><h3><b>Economics and Epidemiology</b></h3><p>This cluster combines the expertise of both economics and epidemiology to explore the trade-offs that consumers and farmers make, as well as the interactions between a range of factors that influence disease management.</p><p>The FIELD economists will examine how farmer decision making is affected by past experiences of disease, health and welfare priorities, perceptions and evaluations of disease management methods, and will look to establish trade-offs within these. They will also explore the variations in consumer preferences for higher welfare products, and how this varies in relation to other product attributes. Through the conduction of a choice experiment, they will then evaluate how consumer perceptions translate into purchasing behaviours.</p><p>The FIELD epidemiologist will look to gain a better understanding of the spatial interactions amongst farmers and how this related to disease control and management. They will look to develop simulation models to enable prediction of responses to a range of factors including disease parameters, costs, support measures and new disease information. The models developed within this cluster will incorporate aspects from the other disciplinary clusters, such as social pressures, economic incentives and past disease experiences, to explore how this may improve disease predictions, given how they may all affect farmer behaviour. </p><p>Specific methods used in the project include:</p><ul><li>Farmer survey of farm animal health</li><li>&#x27;Food busk&#x27; to establish public perceptions of animal health</li><li>Consumer survey of willingness-to-pay for farm animal welfare</li><li>The creation of farm-level epi-economic models to model various disease scenarios</li><li>The creation of farm network models to examine the relationships between farmer decision-making and disease control</li></ul><p>  </p><hr/><h3><br/> <b>History</b></h3><p>A greater understanding of the influence of historical forces that affect farming practices can help the other research disciplines to produce more critically informed accounts of the present, in relation to farming practices, sources of information and consumer behaviour. The history team will therefore explore the post-war changes in animal production systems and disease management, including how the different farming systems have evolved over time and also what understandings of \\u2018good farming\\u2019 are for different stakeholders. This will include how farming practices have changed over time, historical experiences of disease, and exploring how the understanding and management of BVD and lameness has evolved. It will also give an indication of who is giving what advice to whom in relation to farming and disease management.</p><p>This will be achieved through the exploration of texts, images and existing oral history recordings, including journal articles, advertising material, popular press, government material and grey literature and films. Specific methods employed by the history cluster include:</p><ul><li>Digitisation of historical      agricultural images and videos</li><li>Creation of a timeline to      display key events and perspectives</li><li>Oral history to promote      discussion and reflection of life stories</li><li>Exploration of the ways in      which farmers, expert advisors, scientific researchers and the state      experienced, understood, managed and talked about BVD and lameness, and      subsequently, what advice was given to farmers</li><li>The evolution of beef, sheep      and dairy systems, and changes in farmer and consumer perceptions to      explore what is meant by good farming </li></ul><p>   </p><hr/><p></p><h3><b>Social Science</b></h3><p>The social science cluster is tasked with exploring how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other. This will lead to a greater understanding of human-animal relationships and how these relate to animal health and welfare, and well as provide insights into how knowledge-practices emerge.</p><p>Insights obtained from both the history and economics clusters can be explored in more detail with the qualitative nature of the research enabling relationships between different stakeholders to be explored, and a wider range of influences on practices to be identified. The real world context of disease will be explored through farm walks, which will enable the researchers to experience disease management practices first hand. By feeding views of different stakeholders to one another, greater mutual understandings can also be created.</p><p>This will be achieved through a number of different methods including;</p><ul><li>A survey of farmers to      establish farm management practices</li><li>Interviews with farmers and      farm advisors</li><li>Focus groups with farmers</li><li>Farm walks to understand the      real world context of disease</li><li>A knowledge-exchange      workshop with rural advisors</li></ul><p>  </p>", "pk": 27, "content_type": 31, "live_revision": 157, "latest_revision_created_at": "2019-02-04T09:52:13.607Z", "search_description": "", "live": true, "url_path": "/home2/about/project/methodology/", "draft_title": "Methodology", "has_unpublished_changes": true, "numchild": 0, "show_in_menus": false}	\N	27	4
184	f	2019-02-18 13:58:20.554386+00	{"go_live_at": null, "seo_title": "", "title": "Approaches", "last_published_at": "2019-02-01T14:37:22.218Z", "expire_at": null, "path": "00010002000200010001", "expired": false, "slug": "approaches", "locked": false, "first_published_at": "2019-01-11T12:11:25.341Z", "depth": 5, "owner": 2, "body": "<h2>Context</h2><p>Endemic diseases are those which exist permanently in a population, usually at low levels. Whilst these are difficult to eradicate completely, they can be reduced to lower levels through changes to farm management practices. As endemic diseases are not restricted to a particular type of production system, the FIELD team will explore different production systems including indoor dairy (where cows are kept indoors all year around), \\u2018grazed\\u2019 dairy systems (where cows are grazing outside for part of the year), lowland beef and sheep farming, and upland beef and sheep farming.</p><p>The FIELD project will explore endemic disease from 1947 onwards, from when a new Agricultural Act set the post-war farming agenda (see our timeline to explore further). We will examine how changes over time have been influenced by cultural, social, economic and regulatory factors, and how this has shaped farming practice across different systems in relation to disease.</p><p></p><hr/><p></p><hr/><p></p><h2>FIELD approach</h2><h3>Farming systems</h3><p>The FIELD project will draw upon the approach of farming systems research, which aims to support more sustainable agricultural by exploring how farming practices and perceptions co-evolve with their social, economic and environmental contexts. Disease will be studied as part of this co-evolutionary process; as a biological and social phenomenon that shapes and is shaped by farming systems and communities. In the project, we will define community in several different ways, including by close neighbours (spatially), trading networks (commercially) and socially (networks of influence, including historical influences). This will enable us to study disease much more holistically, helping to overcome some of the limitations of previous research.</p><p></p><hr/><p></p><h3>Interdisciplinary nature</h3><p>Central to the approach is the interdisciplinary nature of the project, which will provide additional strength to the methods being used. An interdisciplinary approach is rarely applied to livestock disease that are more typically explored through more traditional disciplinary silos. This means that the biology of disease and its management in animals are considered separately from the socio-cultural and economic factors that shape human perceptions of, and responses to it. This fragmented knowledge has impeded disease understandings and control, with there being a lack of attention to human factors and specific historical and local circumstances. </p><p>The FIELD project seeks to examine the social and biological identities of livestock disease, and cut across the realms of nature and culture, science and society, human and animal. This will enable the team to study livestock disease as a co-evolutionary process: as both a biological and social phenomenon that shapes and is shaped by farming systems and communities, as emphasised in the diagram below.</p><p>Given how interconnected the above aspects are, it is unsurprising that FIELD has an interdisciplinary approach at its core. Working both within and across the three main research disciplines involved in the project will help to encourage new ways of thinking about the relationships between livestock diseases, farming systems and communities, which in turn will help us to develop better predictions of disease in the future, and to advise on its management.</p><p></p><hr/><p></p><h3>Stakeholder involvement</h3><p>The FIELD project would like to determine how farmers, experts and consumers perceive and respond to livestock disease, how they believe each other to perceive it, and how these perceptions are shaped by human-animal relationships. This will enable the promotion of greater mutual understanding and improve disease responses. Our network of collaborators will also develop and foster mutual understandings by involving stakeholders as co-producers of knowledge, both in terms of shaping the research focus and providing feedback on findings obtained during different stages of the project. Our innovative knowledge-exchange programme will help to facilitate the creation of these understandings, so as to work more effectively towards the future promotion of livestock health and welfare.</p><p></p><hr/><p></p><hr/><p></p><h2>Case studies</h2><p>The FIELD project will specifically look at two diseases as case studies, as these capture the different impacts of endemic disease. Firstly, the project will explore lameness as this is affected most by individual farm actions. Secondly, bovine viral diarrhoea (BVD) will explored, which has a community affect due to its infectious nature and ability to spread between farms. Both of these disease are amongst the most common endemic livestock diseases in the UK today. The complexity of the diseases also makes them ideal case studies for investigation though an interdisciplinary approach that integrates different perspectives, including how they relate to changes in farming systems, communities and the wider world. Find out more about BVD and lameness below.</p><p></p><hr/><p></p><h3>BVD</h3><h3>Lameness</h3><p></p><hr/><p></p><hr/><p></p><p></p><p></p><p></p>", "pk": 24, "content_type": 31, "live_revision": 158, "latest_revision_created_at": "2019-02-01T14:37:22.196Z", "search_description": "", "live": true, "url_path": "/home2/about/project/approaches/", "draft_title": "Approaches", "has_unpublished_changes": false, "numchild": 0, "show_in_menus": true}	\N	24	4
185	f	2019-02-18 14:03:05.486682+00	{"go_live_at": null, "seo_title": "", "title": "Approaches", "last_published_at": "2019-02-01T14:37:22.218Z", "expire_at": null, "path": "00010002000200010001", "expired": false, "slug": "approaches", "locked": false, "first_published_at": "2019-01-11T12:11:25.341Z", "depth": 5, "owner": 2, "body": "<h2>Context</h2><p>Endemic diseases are those which exist permanently in a population, usually at low levels. Whilst these are difficult to eradicate completely, they can be reduced to lower levels through changes to farm management practices. As endemic diseases are not restricted to a particular type of production system, the FIELD team will explore different production systems including indoor dairy (where cows are kept indoors all year around), \\u2018grazed\\u2019 dairy systems (where cows are grazing outside for part of the year), lowland beef and sheep farming, and upland beef and sheep farming.</p><p>The FIELD project will explore endemic disease from 1947 onwards, from when a new Agricultural Act set the post-war farming agenda (see our <b>timeline</b> to explore further). We will examine how changes over time have been influenced by cultural, social, economic and regulatory factors, and how this has shaped farming practice across different systems in relation to disease.</p><p></p><hr/><p></p><hr/><p></p><h2>FIELD approach</h2><h3>Farming systems</h3><p>The FIELD project will draw upon the approach of farming systems research, which aims to support more sustainable agricultural by exploring how farming practices and perceptions co-evolve with their social, economic and environmental contexts. Disease will be studied as part of this co-evolutionary process; as a biological and social phenomenon that shapes and is shaped by farming systems and communities. In the project, we will define community in several different ways, including by close neighbours (spatially), trading networks (commercially) and socially (networks of influence, including historical influences). This will enable us to study disease much more holistically, helping to overcome some of the limitations of previous research.</p><p></p><hr/><p></p><h3>Interdisciplinary nature</h3><p>Central to the approach is the interdisciplinary nature of the project, which will provide additional strength to the methods being used. An interdisciplinary approach is rarely applied to livestock disease that are more typically explored through more traditional disciplinary silos. This means that the biology of disease and its management in animals are considered separately from the socio-cultural and economic factors that shape human perceptions of, and responses to it. This fragmented knowledge has impeded disease understandings and control, with there being a lack of attention to human factors and specific historical and local circumstances.</p><p>The FIELD project seeks to examine the social and biological identities of livestock disease, and cut across the realms of nature and culture, science and society, human and animal. This will enable the team to study livestock disease as a co-evolutionary process: as both a biological and social phenomenon that shapes and is shaped by farming systems and communities, as emphasised in the diagram below.</p><p>Given how interconnected the above aspects are, it is unsurprising that FIELD has an interdisciplinary approach at its core. Working both within and across the three main research disciplines involved in the project will help to encourage new ways of thinking about the relationships between livestock diseases, farming systems and communities, which in turn will help us to develop better predictions of disease in the future, and to advise on its management.</p><p></p><hr/><p></p><h3>Stakeholder involvement</h3><p>The FIELD project would like to determine how farmers, experts and consumers perceive and respond to livestock disease, how they believe each other to perceive it, and how these perceptions are shaped by human-animal relationships. This will enable the promotion of greater mutual understanding and improve disease responses. Our network of <a id=\\"35\\" linktype=\\"page\\">collaborators</a> will also develop and foster mutual understandings by involving stakeholders as co-producers of knowledge, both in terms of shaping the research focus and providing feedback on findings obtained during different stages of the project. Our innovative knowledge-exchange programme will help to facilitate the creation of these understandings, so as to work more effectively towards the future promotion of livestock health and welfare.</p><p></p><hr/><p></p><hr/><p></p><h2>Case studies</h2><p>The FIELD project will specifically look at two diseases as case studies, as these capture the different impacts of endemic disease. Firstly, the project will explore lameness as this is affected most by individual farm actions. Secondly, bovine viral diarrhoea (BVD) will explored, which has a community affect due to its infectious nature and ability to spread between farms. Both of these disease are amongst the most common endemic livestock diseases in the UK today. The complexity of the diseases also makes them ideal case studies for investigation though an interdisciplinary approach that integrates different perspectives, including how they relate to changes in farming systems, communities and the wider world. Find out more about BVD and lameness below.</p><p></p><hr/><p></p><h3>BVD</h3><p>  Bovine Viral Diarrhoea (BVD) is a viral disease that predominantly affects cattle. It is a contagious disease and the main method of spread is by other animals, such as through their faeces. BVD reduces the reproductive performance and compromises the immune system of infected animals. This leads to secondary health problems and an overall lowering of productivity. It is relatively simple to detect through blood tests, and animals can be vaccinated against the disease. BVD is not a zoonoses, so infected animals do not pose a risk to human health and meat from these animals can enter the human food chain.</p><p></p><h3>Lameness</h3><p> Lameness is any condition or injury that affects the animals\\u2019 feet and legs, and subsequently their gait (walk) and standing position. It is a multifactorial in nature, meaning that it can be caused by a number of different factors, and is often as a result of a combination of different things. Possible factors linked to lameness include management practices, environmental factors such as the weather or ground condition, infections, or the animals\\u2019 physical characteristics.  </p><hr/><p></p><hr/><p></p><p></p><p></p><p></p>", "pk": 24, "content_type": 31, "live_revision": 158, "latest_revision_created_at": "2019-02-18T13:58:20.554Z", "search_description": "", "live": true, "url_path": "/home2/about/project/approaches/", "draft_title": "Approaches", "has_unpublished_changes": true, "numchild": 0, "show_in_menus": true}	\N	24	4
186	f	2019-02-18 14:06:44.726622+00	{"go_live_at": null, "seo_title": "", "title": "The Project", "last_published_at": "2019-01-21T15:19:19.231Z", "expire_at": null, "path": "0001000200020001", "expired": false, "slug": "project", "locked": false, "first_published_at": "2019-01-10T13:08:41.922Z", "depth": 4, "owner": 2, "body": "<h2>The problem</h2><p>Better ways of understanding and managing endemic livestock diseases are urgently required. These diseases affect all types of production systems, and undermine livestock welfare, productivity and potentially human health. Livestock disease is a complex problem that threatens the development of more sustainable, ethical and efficient farming methods. While traditional, discipline-specific approaches have helped to address the problem of livestock disease, many of farming\\u2019s current challenges cut across disciplines, affecting animal welfare, the environment, and future food security. New approaches are therefore required to reflect the interdisciplinary nature of the challenges facing farmers today. FIELD aims to provide this by integrating scientific, social scientific and humanities methods on two case study health problems in Britain; Bovine Viral Diarrhoea and lameness.</p><p></p><hr/><h2>Our solution</h2><p>Through embedding these problems in time, space and society, and enrolling farmers and other publics in their investigation, FIELD will interrogate the changing biological, ontological and social identities of livestock diseases, their relationships with livestock systems and farming communities, and how animal behaviours have shaped their expression, interpretation and management by humans. </p><p>The project explores how responses to disease in the past have informed its affects in the present; how studying disease in the present can enhance understandings of its past, and how these investigations can inform and be informed by future predictions of disease. FIELD will thereby generate new ways of thinking about, predicting, and intervening in the effects of disease on individual farms and in farming communities. This will benefit animals, farmers, consumers and the environment.</p><p></p><hr/><h2>Our aims</h2><p>More specifically, the project aims to:</p><ul><li>Develop new interdisciplinary methods for studying livestock disease</li><li>Explore the interconnected social and biological nature of livestock disease and how these co-evolve with different production practices, farming communities, human-animal relationships and consumer concerns</li><li>Examine and account for changes over time in how farmers, consumers and experts perceive and respond to disease, and how they perceive each other to perceive it</li></ul><p>This will facilitate:</p><ul><li>Developing better predictions of livestock disease</li><li>Identifying best-bet interventions for the UK farming industry</li><li>Fostering mutual understandings and involving stakeholders as co-producers of knowledge</li><li>Developing real world solutions</li></ul><p>    </p><hr/><p></p><hr/><p> </p><h2><a id=\\"24\\" linktype=\\"page\\">Approaches</a></h2><p></p><h2><a id=\\"27\\" linktype=\\"page\\">Methodology</a></h2>", "pk": 14, "content_type": 31, "live_revision": 82, "latest_revision_created_at": "2019-01-22T16:35:12.200Z", "search_description": "", "live": true, "url_path": "/home2/about/project/", "draft_title": "The Project", "has_unpublished_changes": true, "numchild": 2, "show_in_menus": true}	\N	14	4
187	f	2019-02-18 14:08:15.172528+00	{"go_live_at": null, "seo_title": "", "title": "The Project", "last_published_at": "2019-01-21T15:19:19.231Z", "expire_at": null, "path": "0001000200020001", "expired": false, "slug": "project", "locked": false, "first_published_at": "2019-01-10T13:08:41.922Z", "depth": 4, "owner": 2, "body": "<h2>The problem</h2><p>Better ways of understanding and managing endemic livestock diseases are urgently required. These diseases affect all types of production systems, and undermine livestock welfare, productivity and potentially human health. Livestock disease is a complex problem that threatens the development of more sustainable, ethical and efficient farming methods. While traditional, discipline-specific approaches have helped to address the problem of livestock disease, many of farming\\u2019s current challenges cut across disciplines, affecting animal welfare, the environment, and future food security. New approaches are therefore required to reflect the interdisciplinary nature of the challenges facing farmers today. FIELD aims to provide this by integrating scientific, social scientific and humanities methods on two case study health problems in Britain; Bovine Viral Diarrhoea and lameness.</p><p></p><hr/><h2>Our solution</h2><p>Through embedding these problems in time, space and society, and enrolling farmers and other publics in their investigation, FIELD will interrogate the changing biological, ontological and social identities of livestock diseases, their relationships with livestock systems and farming communities, and how animal behaviours have shaped their expression, interpretation and management by humans.</p><p>The project explores how responses to disease in the past have informed its affects in the present; how studying disease in the present can enhance understandings of its past, and how these investigations can inform and be informed by future predictions of disease. FIELD will thereby generate new ways of thinking about, predicting, and intervening in the effects of disease on individual farms and in farming communities. This will benefit animals, farmers, consumers and the environment.</p><p></p><hr/><h2>Our aims</h2><p>More specifically, the project aims to:</p><ul><li>Develop new interdisciplinary methods for studying livestock disease;</li><li>Explore the interconnected social and biological nature of livestock disease and how these co-evolve with different production practices, farming communities, human-animal relationships and consumer concerns;</li><li>Examine and account for changes over time in how farmers, consumers and experts perceive and respond to disease, and how they perceive each other to perceive it.</li></ul><p>This will facilitate:</p><ul><li>Developing better predictions of livestock disease;</li><li>Identifying best-bet interventions for the UK farming industry;</li><li>Fostering mutual understandings and involving stakeholders as co-producers of knowledge;</li><li>Developing real world solutions.</li></ul><p></p><hr/><p></p><hr/><p></p><h2><a id=\\"24\\" linktype=\\"page\\">Approaches</a></h2><p></p><h2><a id=\\"27\\" linktype=\\"page\\">Methodology</a></h2>", "pk": 14, "content_type": 31, "live_revision": 82, "latest_revision_created_at": "2019-02-18T14:06:44.726Z", "search_description": "", "live": true, "url_path": "/home2/about/project/", "draft_title": "The Project", "has_unpublished_changes": true, "numchild": 2, "show_in_menus": true}	\N	14	4
183	f	2019-02-18 13:54:30.518065+00	{"go_live_at": null, "seo_title": "", "title": "Methodology", "last_published_at": "2019-02-01T14:33:17.101Z", "expire_at": null, "path": "00010002000200010002", "expired": false, "slug": "methodology", "locked": false, "first_published_at": "2019-01-18T10:05:05.566Z", "depth": 5, "owner": 6, "body": "<p>In practice, what do these approaches mean we will do? In order to ensure that the FIELD project can achieve its objectives, a number of different research activities and steps will be undertaken as part of the overall research process, as illustrated below.</p><p>Although these different activities will be undertaken in the three different disciplinary clusters within the project, they will each will draw upon and feed into the others. Each cluster will therefore not be working in isolation, reflecting the interdisciplinary approach at the core of the project. Regular research meetings and reflections will help us to establish how to best work across disciplines and more connections between the three will emerge as the project develops, leading to a project which is truly interdisciplinary in nature. Regular contact with our <a id=\\"35\\" linktype=\\"page\\">collaborators</a> will be intrinsic to each stage to ensure the project\\u2019s relevance.</p><p>Together, this will enable us to achieve:</p><ul><li>A novel interdisciplinary method of studying disease that embeds social science and history in the modelling process</li><li>New ways of thinking about the relationship between livestock diseases, farming systems and communities</li><li>Suggestions for interventions to promote livestock health and welfare</li><li>New ways of thinking about human-animal relationships and how they influence animal health and welfare</li><li>Better understandings of farmers\\u2019, experts\\u2019, and consumers\\u2019 attitudes to and preferences for livestock health and welfare, as well as their perceptions of each other\\u2019s attitudes</li><li>Better understandings of the spatial interactions between farmers, relevant to disease transmission</li></ul><p>Find out more about the methods being used in the three disciplinary clusters below.</p><p></p><hr/><p></p><hr/><p></p><h3><b>Economics and Epidemiology</b></h3><p>This cluster combines the expertise of both economics and epidemiology to explore the trade-offs that consumers and farmers make, as well as the interactions between a range of factors that influence disease management.</p><p>The FIELD economists will examine how farmer decision making is affected by past experiences of disease, health and welfare priorities, perceptions and evaluations of disease management methods, and will look to establish trade-offs within these. They will also explore the variations in consumer preferences for higher welfare products, and how this varies in relation to other product attributes. Through the conduction of a choice experiment, they will then evaluate how consumer perceptions translate into purchasing behaviours.</p><p>The FIELD epidemiologist will look to gain a better understanding of the spatial interactions amongst farmers and how this related to disease control and management. They will look to develop simulation models to enable prediction of responses to a range of factors including disease parameters, costs, support measures and new disease information. The models developed within this cluster will incorporate aspects from the other disciplinary clusters, such as social pressures, economic incentives and past disease experiences, to explore how this may improve disease predictions, given how they may all affect farmer behaviour.</p><p>Specific methods used in the project include:</p><ul><li>Farmer survey of farm animal health</li><li>&#x27;Food busk&#x27; to establish public perceptions of animal health</li><li>Consumer survey of willingness-to-pay for farm animal welfare</li><li>The creation of farm-level epi-economic models to model various disease scenarios</li><li>The creation of farm network models to examine the relationships between farmer decision-making and disease control</li></ul><p></p><hr/><h3><br/><b>History</b></h3><p>A greater understanding of the influence of historical forces that affect farming practices can help the other research disciplines to produce more critically informed accounts of the present, in relation to farming practices, sources of information and consumer behaviour. The history team will therefore explore the post-war changes in animal production systems and disease management, including how the different farming systems have evolved over time and also what understandings of \\u2018good farming\\u2019 are for different stakeholders. This will include how farming practices have changed over time, historical experiences of disease, and exploring how the understanding and management of BVD and lameness has evolved. It will also give an indication of who is giving what advice to whom in relation to farming and disease management.</p><p>This will be achieved through the exploration of texts, images and existing oral history recordings, including journal articles, advertising material, popular press, government material and grey literature and films. Specific methods employed by the history cluster include:</p><ul><li>Digitisation of historical agricultural images and videos</li><li>Creation of a timeline to display key events and perspectives</li><li>Oral history to promote discussion and reflection of life stories</li><li>Exploration of the ways in which farmers, expert advisors, scientific researchers and the state experienced, understood, managed and talked about BVD and lameness, and subsequently, what advice was given to farmers</li><li>The evolution of beef, sheep and dairy systems, and changes in farmer and consumer perceptions to explore what is meant by good farming</li></ul><p></p><hr/><p></p><h3><b>Social Science</b></h3><p>The social science cluster is tasked with exploring how farmers, experts and consumers perceive and respond to livestock disease, including how they perceive each other. This will lead to a greater understanding of human-animal relationships and how these relate to animal health and welfare, and well as provide insights into how knowledge-practices emerge.</p><p>Insights obtained from both the history and economics clusters can be explored in more detail with the qualitative nature of the research enabling relationships between different stakeholders to be explored, and a wider range of influences on practices to be identified. The real world context of disease will be explored through farm walks, which will enable the researchers to experience disease management practices first hand. By feeding views of different stakeholders to one another, greater mutual understandings can also be created.</p><p>This will be achieved through a number of different methods including;</p><ul><li>A survey of farmers to establish farm management practices</li><li>Interviews with farmers and farm advisors</li><li>Focus groups with farmers</li><li>Farm walks to understand the real world context of disease</li><li>A knowledge-exchange workshop with rural advisors</li></ul><p></p>", "pk": 27, "content_type": 31, "live_revision": 157, "latest_revision_created_at": "2019-02-18T13:53:31.851Z", "search_description": "", "live": true, "url_path": "/home2/about/project/methodology/", "draft_title": "Methodology", "has_unpublished_changes": true, "numchild": 0, "show_in_menus": false}	\N	27	4
132	f	2019-01-29 16:58:15.336355+00	{"depth": 4, "seo_title": "", "live": true, "title": "Papers", "body": "<p>Get access to the latest research publications from the FIELD team here. Pressed for time? Each paper is accompanied with a simple summary and key points so you can read at speed!</p><p>Have any questions about these? Then <a id=\\"8\\" linktype=\\"page\\">contact us</a>.</p><p></p><p></p><p></p><hr/><h2>The public and farm animal welfare</h2><hr/><h3>Public perceptions of farm animal welfare</h3><p>This paper reports on the results of a systematic search of the literature to establish what the public think about farm animal welfare. The results indicate that the public have concerns over more modern, and intensive animal production systems, which were thought to breach to two core components of good welfare: humane treatment and naturalness.</p><p></p><p>Read more here: <a id=\\"4\\" linktype=\\"document\\">Public attitudes to farm animal welfare</a></p><p></p><h3>Are the public willing to pay for higher welfare?</h3><p>This paper uses a systematic search of the literature to find out what members of the public are willing to pay for higher welfare animal products. The findings show that the public would pay a small premium for higher welfare products, although this varied by animal type and across different population groups.</p><p></p><p>Read more here: <a id=\\"3\\" linktype=\\"document\\">Willingness-to-pay farm animal welfare</a></p>", "draft_title": "Papers", "owner": 4, "expired": false, "live_revision": 88, "url_path": "/home2/resources/papers/", "content_type": 31, "locked": false, "go_live_at": null, "first_published_at": "2019-01-21T15:20:11.674Z", "path": "0001000200050004", "slug": "papers", "last_published_at": "2019-01-21T15:20:11.674Z", "has_unpublished_changes": true, "expire_at": null, "pk": 33, "latest_revision_created_at": "2019-01-29T16:55:48.333Z", "search_description": "", "numchild": 0, "show_in_menus": false}	\N	33	4
173	f	2019-02-14 08:16:27.667023+00	{"first_published_at": "2019-01-10T12:55:28.847Z", "url_path": "/home2/groups/", "expire_at": null, "path": "000100020003", "numchild": 4, "show_in_menus": true, "pk": 6, "has_unpublished_changes": false, "live_revision": 162, "expired": false, "locked": false, "body": "<p></p><p>We think FIELD is of interest to a range of different communities, incorporating a range of different stakeholders, given how integral livestock production is to our daily lives; be that as a source of income, an important portion of the food we eat, not to mention being part of the landscapes we know and love in the UK. Each community will have different interests in FIELD, which is why we have broken them out below to signpost you to the website content we think will be most relevant. This does not stop you from exploring more than one though!</p><p>Visit the communities below to find out more about the <a id=\\"10\\" linktype=\\"page\\">research</a> the FIELD team are doing, what it means in <a id=\\"21\\" linktype=\\"page\\">policy</a> and on <a id=\\"19\\" linktype=\\"page\\">farms</a>, and finally what it means for the ultimate end users of food chains, <a id=\\"20\\" linktype=\\"page\\">consumers</a>, in relation to how the food we eat is produced.</p><p></p><p></p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-02-01T15:41:52.398Z", "depth": 3, "draft_title": "Communities", "live": true, "latest_revision_created_at": "2019-02-01T15:41:52.375Z", "owner": 2, "slug": "groups", "search_description": "", "content_type": 31, "title": "Communities"}	\N	6	4
175	f	2019-02-15 12:36:47.191065+00	{"first_published_at": "2019-01-10T12:55:28.847Z", "url_path": "/home2/groups/", "expire_at": null, "path": "000100020003", "numchild": 4, "show_in_menus": true, "pk": 6, "has_unpublished_changes": true, "live_revision": 162, "expired": false, "locked": false, "body": "<p></p><p>We think FIELD is of interest to a range of different communities, incorporating a range of different stakeholders, given how integral livestock production is to our daily lives; be that as a source of income, an important portion of the food we eat, not to mention being part of the landscapes we know and love in the UK. Each community will have different interests in FIELD, which is why we have broken them out below to signpost you to the website content we think will be most relevant. This does not stop you from exploring more than one though!</p><p>Visit the communities below to find out more about the <a id=\\"10\\" linktype=\\"page\\">research</a> the FIELD team are doing, what it means in <a id=\\"21\\" linktype=\\"page\\">policy</a> and on <a id=\\"19\\" linktype=\\"page\\">farms</a>, and finally what it means for the ultimate end users of food chains, <a id=\\"20\\" linktype=\\"page\\">consumers</a>, in relation to how the food we eat is produced.</p><p></p><p></p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-02-01T15:41:52.398Z", "depth": 3, "draft_title": "Communities", "live": true, "latest_revision_created_at": "2019-02-14T08:16:27.667Z", "owner": 2, "slug": "groups", "search_description": "", "content_type": 31, "title": "Communities"}	\N	6	4
178	f	2019-02-15 12:41:05.715382+00	{"first_published_at": "2019-01-11T11:59:50.233Z", "url_path": "/home2/groups/focus-consumers/", "expire_at": null, "path": "0001000200030003", "numchild": 0, "show_in_menus": true, "pk": 20, "has_unpublished_changes": false, "live_revision": 170, "expired": false, "locked": false, "body": "<p> </p><p>A more holistic understanding of livestock disease is required in order to develop the most sustainable, ethical and efficient farming methods going forward. A greater understanding of more modern farming practices across a range of different production systems, as well as the historical changes to British sheep and cattle farming since the Second World War, will enable us to see the biological, regulatory and cultural factors that have shaped farming management, and use this to develop models to better predict disease incidence and control in the future. </p><p>Explore our timeline to find out just how British farming has changed since the Second World War, and the cultural and regulatory factors that have shaped this. See for yourself just how farming has changed over the years with our <a id=\\"29\\" linktype=\\"page\\">media </a>pages, including the wealth of images supplied by the Museum of English Rural Life. Visit our <a id=\\"4\\" linktype=\\"page\\">about</a> pages to find out more about what endemic livestock diseases are, including our <a id=\\"25\\" linktype=\\"page\\">frequently asked questions</a>.</p><p>Don\\u2019t forget <a id=\\"8\\" linktype=\\"page\\">get in touch</a> with us to let us know your thoughts!</p><h2><a id=\\"29\\" linktype=\\"page\\">Media</a></h2>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-02-07T10:44:19.824Z", "depth": 4, "draft_title": "Focus on Consumers", "live": true, "latest_revision_created_at": "2019-02-07T10:44:19.799Z", "owner": 2, "slug": "focus-consumers", "search_description": "", "content_type": 31, "title": "Focus on Consumers"}	\N	20	4
180	f	2019-02-15 12:43:26.270147+00	{"first_published_at": "2019-01-10T13:06:51.901Z", "url_path": "/home2/groups/focus-research/", "expire_at": null, "path": "0001000200030001", "numchild": 2, "show_in_menus": true, "pk": 10, "has_unpublished_changes": false, "live_revision": 113, "expired": false, "locked": false, "body": "<p>  </p><p>The FIELD project adopts an interdisciplinary approach to studying endemic livestock disease, integrating scientific, social scientific and humanities methods to provide a more holistic overview than previous scientific research. This novel approach reflects the multifactorial nature of the problems that farmers face today, and will enable the project team to explore how practices and perceptions have co-evolved between farmers and advisors and regulatory and socio-cultural factors since the Second World War.</p><p>Discover more about the <a id=\\"4\\" linktype=\\"page\\">approaches and methods</a> the project will use to explore endemic livestock disease, or <a id=\\"36\\" linktype=\\"page\\">meet the team</a> to find out more about the different ranges of expertise involved in the project.</p><p>Why not check out our <a id=\\"3\\" linktype=\\"page\\">blog</a> to find out more about the events and reflections on the research process, or our timeline for an overview of key events in British farming since the 1957 Agricultural Act.</p><h2><a id=\\"24\\" linktype=\\"page\\">Approaches</a></h2>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-25T12:46:29.967Z", "depth": 4, "draft_title": "Focus on Research", "live": true, "latest_revision_created_at": "2019-01-25T12:46:29.945Z", "owner": 2, "slug": "focus-research", "search_description": "", "content_type": 31, "title": "Focus on Research"}	\N	10	4
179	f	2019-02-15 12:42:30.192032+00	{"first_published_at": "2019-01-11T11:59:31.921Z", "url_path": "/home2/groups/focus-farming/", "expire_at": null, "path": "0001000200030002", "numchild": 1, "show_in_menus": false, "pk": 19, "has_unpublished_changes": false, "live_revision": 115, "expired": false, "locked": false, "body": "<p></p><p>Livestock disease is a complex problem with important implications for farm productivity as well as animal health and welfare. The FIELD project seeks to adopt a novel approach to exploring livestock disease combining a range of different expertise, and using BVD and lameness as two case study diseases. Involvement of our collaborator network throughout the research process will help to ensure the projects real world relevance, and we will be gaining first hand perspectives of BVD and lameness experiences through our research with farmers.</p><p>Our findings will provide a greater understanding of the complexities of livestock disease, including the social and cultural factors that have shaped, and continue to shape, their management today. Explore our timeline for an overview of key dates and events to British farming since the Second World War, and see how these relate to your own farming experiences over the years. Explore our <a id=\\"29\\" linktype=\\"page\\">media </a>gallery to see just how livestock farming has changed over the years.</p><p>We would love for you to <a id=\\"8\\" linktype=\\"page\\">get in touch</a> to let us know your experiences and views on livestock disease and farming as well. Fancy taking part in the project? If you farm sheep and/or cattle and live in the North of England and would like to talk more in-depth about BVD and lameness, then drop us an email!</p><h2><a id=\\"8\\" linktype=\\"page\\">Contact Us</a></h2>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-25T12:47:02.898Z", "depth": 4, "draft_title": "Focus on Farming", "live": true, "latest_revision_created_at": "2019-01-25T12:47:02.877Z", "owner": 2, "slug": "focus-farming", "search_description": "", "content_type": 31, "title": "Focus on Farming"}	\N	19	4
190	f	2019-02-21 10:44:15.70011+00	{"go_live_at": null, "seo_title": "", "title": "Focus on Farming", "last_published_at": "2019-01-25T12:47:02.898Z", "expire_at": null, "path": "0001000200030002", "expired": false, "slug": "focus-farming", "locked": false, "first_published_at": "2019-01-11T11:59:31.921Z", "depth": 4, "owner": 2, "body": "<p></p><p>Livestock disease is a complex problem with important implications for farm productivity as well as animal health and welfare. The FIELD project seeks to adopt a novel approach to exploring livestock disease combining a range of different expertise, and using BVD and lameness as two case study diseases. Involvement of our collaborator network throughout the research process will help to ensure the projects real world relevance, and we will be gaining first hand perspectives of BVD and lameness experiences through our research with farmers.</p><p>Our findings will provide a greater understanding of the complexities of livestock disease, including the social and cultural factors that have shaped, and continue to shape, their management today. Explore our timeline for an overview of key dates and events to British farming since the Second World War, and see how these relate to your own farming experiences over the years. Explore our <a id=\\"29\\" linktype=\\"page\\">media</a> gallery to see just how livestock farming has changed over the years.</p><p>We would love for you to <a id=\\"8\\" linktype=\\"page\\">get in touch</a> to let us know your experiences and views on livestock disease and farming as well. Fancy taking part in the project? If you farm sheep and/or cattle and live in the North of England and would like to talk more in-depth about BVD and lameness, then drop us an email!</p><h2><a id=\\"8\\" linktype=\\"page\\">Contact Us</a></h2>", "pk": 19, "content_type": 31, "live_revision": 115, "latest_revision_created_at": "2019-02-15T12:42:30.192Z", "search_description": "", "live": true, "url_path": "/home2/groups/focus-farming/", "draft_title": "Focus on Farming", "has_unpublished_changes": true, "numchild": 1, "show_in_menus": true}	\N	19	2
191	f	2019-02-21 10:44:20.503852+00	{"go_live_at": null, "seo_title": "", "title": "Focus on Farming", "last_published_at": "2019-01-25T12:47:02.898Z", "expire_at": null, "path": "0001000200030002", "expired": false, "slug": "focus-farming", "locked": false, "first_published_at": "2019-01-11T11:59:31.921Z", "depth": 4, "owner": 2, "body": "<p></p><p>Livestock disease is a complex problem with important implications for farm productivity as well as animal health and welfare. The FIELD project seeks to adopt a novel approach to exploring livestock disease combining a range of different expertise, and using BVD and lameness as two case study diseases. Involvement of our collaborator network throughout the research process will help to ensure the projects real world relevance, and we will be gaining first hand perspectives of BVD and lameness experiences through our research with farmers.</p><p>Our findings will provide a greater understanding of the complexities of livestock disease, including the social and cultural factors that have shaped, and continue to shape, their management today. Explore our timeline for an overview of key dates and events to British farming since the Second World War, and see how these relate to your own farming experiences over the years. Explore our <a id=\\"29\\" linktype=\\"page\\">media</a> gallery to see just how livestock farming has changed over the years.</p><p>We would love for you to <a id=\\"8\\" linktype=\\"page\\">get in touch</a> to let us know your experiences and views on livestock disease and farming as well. Fancy taking part in the project? If you farm sheep and/or cattle and live in the North of England and would like to talk more in-depth about BVD and lameness, then drop us an email!</p><h2><a id=\\"8\\" linktype=\\"page\\">Contact Us</a></h2>", "pk": 19, "content_type": 31, "live_revision": 115, "latest_revision_created_at": "2019-02-21T10:44:15.700Z", "search_description": "", "live": true, "url_path": "/home2/groups/focus-farming/", "draft_title": "Focus on Farming", "has_unpublished_changes": true, "numchild": 1, "show_in_menus": true}	\N	19	2
176	f	2019-02-15 12:38:17.196992+00	{"first_published_at": "2019-01-11T12:00:08.374Z", "url_path": "/home2/groups/focus-advisors-and-policy-makers/", "expire_at": null, "path": "0001000200030004", "numchild": 1, "show_in_menus": false, "pk": 21, "has_unpublished_changes": false, "live_revision": 171, "expired": false, "locked": false, "body": "<p></p><p>Better ways of understanding and managing endemic livestock diseases are urgently required. The management of endemic livestock disease is an important policy consideration, with reductions in disease incidence having important implications for animal health and welfare as well as farm productivity and the reduced use of antimicrobials. </p><p>The FIELD project involves a number of different research elements, interconnected together across the different methods used to provide a truly interdisciplinary project that will provide more in-depth insights and understandings as to how we think about and manage endemic livestock disease, and how we can better predict this in the future.</p><p>By looking to the past we can explore what has influenced farming practice today, as explored in our timeline. Through talking to farmers, advisors and consumers we can understand what factors have shaped perceptions of livestock disease, and with our network of <a id=\\"35\\" linktype=\\"page\\">collaborators</a> we can ensure the real world relevance of the work we do.</p><p>Find out more about the research we are up to on our about pages, and explore the latest research findings and recommendations in our papers and policy and practice notes for succinct overviews and recommendations </p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-02-07T10:44:46.457Z", "depth": 4, "draft_title": "Focus on Advisors and Policy-Makers", "live": true, "latest_revision_created_at": "2019-02-07T10:44:46.435Z", "owner": 2, "slug": "focus-advisors-and-policy-makers", "search_description": "", "content_type": 31, "title": "Focus on Advisors and Policy-Makers"}	\N	21	4
177	f	2019-02-15 12:40:02.818914+00	{"first_published_at": "2019-01-11T12:00:08.374Z", "url_path": "/home2/groups/focus-advisors-and-policy-makers/", "expire_at": null, "path": "0001000200030004", "numchild": 1, "show_in_menus": false, "pk": 21, "has_unpublished_changes": true, "live_revision": 171, "expired": false, "locked": false, "body": "<p></p><p>Better ways of understanding and managing endemic livestock diseases are urgently required. The management of endemic livestock disease is an important policy consideration, with reductions in disease incidence having important implications for animal health and welfare as well as farm productivity and the reduced use of antimicrobials.</p><p>The FIELD project involves a number of different research elements, interconnected together across the different methods used to provide a truly interdisciplinary project that will provide more in-depth insights and understandings as to how we think about and manage endemic livestock disease, and how we can better predict this in the future.</p><p>By looking to the past we can explore what has influenced farming practice today, as explored in our timeline. Through talking to farmers, advisors and consumers we can understand what factors have shaped perceptions of livestock disease, and with our network of <a id=\\"35\\" linktype=\\"page\\">collaborators</a> we can ensure the real world relevance of the work we do.</p><p>Find out more about the research we are up to on our <a id=\\"4\\" linktype=\\"page\\">about</a> pages, and explore the latest research findings and recommendations in our <a id=\\"33\\" linktype=\\"page\\">papers</a> and <a id=\\"32\\" linktype=\\"page\\">policy and practice notes</a> for succinct overviews and recommendations.</p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-02-07T10:44:46.457Z", "depth": 4, "draft_title": "Focus on Advisors and Policy-Makers", "live": true, "latest_revision_created_at": "2019-02-15T12:38:17.196Z", "owner": 2, "slug": "focus-advisors-and-policy-makers", "search_description": "", "content_type": 31, "title": "Focus on Advisors and Policy-Makers"}	\N	21	4
192	f	2019-02-21 10:44:37.567038+00	{"go_live_at": null, "seo_title": "", "title": "Focus on Advisors and Policy-Makers", "last_published_at": "2019-02-07T10:44:46.457Z", "expire_at": null, "path": "0001000200030004", "expired": false, "slug": "focus-advisors-and-policy-makers", "locked": false, "first_published_at": "2019-01-11T12:00:08.374Z", "depth": 4, "owner": 2, "body": "<p></p><p>Better ways of understanding and managing endemic livestock diseases are urgently required. The management of endemic livestock disease is an important policy consideration, with reductions in disease incidence having important implications for animal health and welfare as well as farm productivity and the reduced use of antimicrobials.</p><p>The FIELD project involves a number of different research elements, interconnected together across the different methods used to provide a truly interdisciplinary project that will provide more in-depth insights and understandings as to how we think about and manage endemic livestock disease, and how we can better predict this in the future.</p><p>By looking to the past we can explore what has influenced farming practice today, as explored in our timeline. Through talking to farmers, advisors and consumers we can understand what factors have shaped perceptions of livestock disease, and with our network of <a id=\\"35\\" linktype=\\"page\\">collaborators</a> we can ensure the real world relevance of the work we do.</p><p>Find out more about the research we are up to on our <a id=\\"4\\" linktype=\\"page\\">about</a> pages, and explore the latest research findings and recommendations in our <a id=\\"33\\" linktype=\\"page\\">papers</a> and <a id=\\"32\\" linktype=\\"page\\">policy and practice notes</a> for succinct overviews and recommendations.</p>", "pk": 21, "content_type": 31, "live_revision": 171, "latest_revision_created_at": "2019-02-15T12:40:02.818Z", "search_description": "", "live": true, "url_path": "/home2/groups/focus-advisors-and-policy-makers/", "draft_title": "Focus on Advisors and Policy-Makers", "has_unpublished_changes": true, "numchild": 1, "show_in_menus": true}	\N	21	2
195	f	2019-02-21 10:45:51.837706+00	{"go_live_at": null, "seo_title": "", "title": "Timeline", "last_published_at": "2019-01-21T15:20:27.053Z", "expire_at": null, "path": "0001000200050001", "expired": false, "slug": "timeline", "locked": false, "first_published_at": "2019-01-21T15:20:27.053Z", "depth": 4, "owner": 4, "body": "<p></p><p>Our timeline has been put together by the FIELD historians to provide key dates and events in British farming since 1947. It includes aspects in relation to policy, production, veterinary science and medicine. Scroll through the timeline to explore these, and click on key dates to discover these in more depth.</p><p>Do any of these dates resonate with you? Do you have a story to tell about a particular decade, an image or film that gives us a snapshot of what livestock farming was like, or have we missed anything you think is important? We would love to hear your stories and experiences of farming and veterinary medicine since 1947. <a id=\\"8\\" linktype=\\"page\\">Contact us</a> to tell us more!</p>", "pk": 28, "content_type": 31, "live_revision": 91, "latest_revision_created_at": "2019-01-21T15:20:27.035Z", "search_description": "", "live": true, "url_path": "/home2/resources/timeline/", "draft_title": "Timeline", "has_unpublished_changes": false, "numchild": 0, "show_in_menus": true}	\N	28	2
91	f	2019-01-21 15:20:27.035704+00	{"locked": false, "title": "Timeline", "draft_title": "Timeline", "has_unpublished_changes": true, "first_published_at": null, "depth": 4, "expired": false, "last_published_at": null, "live": false, "content_type": 31, "slug": "timeline", "latest_revision_created_at": "2019-01-18T12:53:43.719Z", "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "0001000200050001", "seo_title": "", "live_revision": null, "url_path": "/home2/resources/timeline/", "owner": 4, "search_description": "", "pk": 28, "body": "<p></p><p>Our timeline has been put together by the FIELD historians to provide key dates and events in British farming since 1947. It includes aspects in relation to policy, production, veterinary science and medicine. Scroll through the timeline to explore these, and click on key dates to discover these in more depth.</p><p>Do any of these dates resonate with you? Do you have a story to tell about a particular decade, an image or film that gives us a snapshot of what livestock farming was like, or have we missed anything you think is important? We would love to hear your stories and experiences of farming and veterinary medicine since 1947. <a id=\\"8\\" linktype=\\"page\\">Contact us</a> to tell us more!</p>", "go_live_at": null}	\N	28	2
131	f	2019-01-29 16:55:48.333953+00	{"depth": 4, "seo_title": "", "live": true, "title": "Papers", "body": "<p>Get access to the latest research publications from the FIELD team here. Pressed for time? Each paper is accompanied with a simple summary and key points so you can read at speed!</p><p>Have any questions about these? Then <a id=\\"8\\" linktype=\\"page\\">contact us</a>.</p><p></p><p></p><p></p><hr/><h2>The public and farm animal welfare</h2><hr/><h3>Public perceptions of farm animal welfare</h3><p>This paper reports on the results of a systematic search of the literature to establish what the public think about farm animal welfare. The results indicate that the public have concerns over more modern, and intensive animal production systems, which were thought to breach to two core components of good welfare: humane treatment and naturalness. </p><p></p><p>Read more here: <a id=\\"4\\" linktype=\\"document\\">Public attitudes to farm animal welfare</a></p><p></p><p></p>", "draft_title": "Papers", "owner": 4, "expired": false, "live_revision": 88, "url_path": "/home2/resources/papers/", "content_type": 31, "locked": false, "go_live_at": null, "first_published_at": "2019-01-21T15:20:11.674Z", "path": "0001000200050004", "slug": "papers", "last_published_at": "2019-01-21T15:20:11.674Z", "has_unpublished_changes": false, "expire_at": null, "pk": 33, "latest_revision_created_at": "2019-01-21T15:20:11.657Z", "search_description": "", "numchild": 0, "show_in_menus": false}	\N	33	4
73	f	2019-01-18 13:10:45.454259+00	{"locked": false, "title": "Papers", "draft_title": "Papers", "has_unpublished_changes": false, "first_published_at": null, "depth": 4, "expired": false, "last_published_at": null, "live": false, "content_type": 31, "slug": "papers", "latest_revision_created_at": null, "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "0001000200050004", "seo_title": "", "live_revision": null, "url_path": "/home2/resources/papers/", "owner": 4, "search_description": "", "pk": 33, "body": "<p>Get access to the latest research publications from the FIELD team here. Pressed for time? Each paper is accompanied with a simple summary and key points so you can read at speed!</p><p>Have any questions about these? Then <a id=\\"8\\" linktype=\\"page\\">contact us</a>.</p>", "go_live_at": null}	\N	33	4
90	f	2019-01-21 15:20:21.572825+00	{"locked": false, "title": "Media", "draft_title": "Media", "has_unpublished_changes": true, "first_published_at": null, "depth": 4, "expired": false, "last_published_at": null, "live": false, "content_type": 31, "slug": "media", "latest_revision_created_at": "2019-01-18T13:04:42.370Z", "show_in_menus": false, "numchild": 2, "expire_at": null, "path": "0001000200050002", "seo_title": "", "live_revision": null, "url_path": "/home2/resources/media/", "owner": 4, "search_description": "", "pk": 29, "body": "<p>FIELD is fortunate enough to have access to a range of different media to showcase, from historical images of livestock farming to audio recordings of interviews.</p>", "go_live_at": null}	\N	29	2
196	f	2019-02-21 10:45:59.578467+00	{"go_live_at": null, "seo_title": "", "title": "Media", "last_published_at": "2019-01-21T15:20:21.591Z", "expire_at": null, "path": "0001000200050002", "expired": false, "slug": "media", "locked": false, "first_published_at": "2019-01-21T15:20:21.591Z", "depth": 4, "owner": 4, "body": "<p>FIELD is fortunate enough to have access to a range of different media to showcase, from historical images of livestock farming to audio recordings of interviews.</p>", "pk": 29, "content_type": 31, "live_revision": 90, "latest_revision_created_at": "2019-01-21T15:20:21.572Z", "search_description": "", "live": true, "url_path": "/home2/resources/media/", "draft_title": "Media", "has_unpublished_changes": false, "numchild": 3, "show_in_menus": true}	\N	29	2
69	f	2019-01-18 13:04:42.370049+00	{"locked": false, "title": "Media", "draft_title": "Media", "has_unpublished_changes": false, "first_published_at": null, "depth": 4, "expired": false, "last_published_at": null, "live": false, "content_type": 31, "slug": "media", "latest_revision_created_at": null, "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "0001000200050002", "seo_title": "", "live_revision": null, "url_path": "/home2/resources/media/", "owner": 4, "search_description": "", "pk": 29, "body": "<p>FIELD is fortunate enough to have access to a range of different media to showcase, from historical images of livestock farming to audio recordings of interviews.</p>", "go_live_at": null}	\N	29	4
166	f	2019-02-04 10:16:09.309766+00	{"first_published_at": "2019-01-21T15:20:11.674Z", "url_path": "/home2/resources/papers/", "expire_at": null, "path": "0001000200050004", "numchild": 0, "show_in_menus": false, "pk": 33, "has_unpublished_changes": true, "live_revision": 88, "expired": false, "locked": false, "body": "<p>Get access to the latest research publications from the FIELD team here. Pressed for time? Each paper is accompanied with a simple summary and key points so you can read at speed!</p><p>Have any questions about these? Then <a id=\\"8\\" linktype=\\"page\\">contact us</a>.</p><p></p><p></p><p></p><hr/><h2>The public and farm animal welfare</h2><hr/><h3>Public perceptions of farm animal welfare</h3><p>This paper reports on the results of a systematic search of the literature to establish what the public think about farm animal welfare. The results indicate that the public have concerns over more modern and intensive animal production systems, which were thought to breach to two core components of good welfare: humane treatment and naturalness.</p><p></p><p>Read more here: <a id=\\"4\\" linktype=\\"document\\">Public attitudes to farm animal welfare</a></p><p></p><h3>Are the public willing to pay for higher welfare?</h3><p>This paper uses a systematic search of the literature to find out what members of the public are willing to pay for higher welfare animal products. The findings show that the public would pay a small premium for higher welfare products, although this varied by animal type and across different population groups.</p><p></p><p>Read more here: <a id=\\"3\\" linktype=\\"document\\">Willingness-to-pay farm animal welfare</a></p>", "seo_title": "", "go_live_at": null, "last_published_at": "2019-01-21T15:20:11.674Z", "depth": 4, "draft_title": "Papers", "live": true, "latest_revision_created_at": "2019-01-29T16:58:15.336Z", "owner": 4, "slug": "papers", "search_description": "", "content_type": 31, "title": "Papers"}	\N	33	6
194	f	2019-02-21 10:45:45.212938+00	{"go_live_at": null, "seo_title": "", "title": "Papers", "last_published_at": "2019-02-04T10:16:09.330Z", "expire_at": null, "path": "0001000200050004", "expired": false, "slug": "papers", "locked": false, "first_published_at": "2019-01-21T15:20:11.674Z", "depth": 4, "owner": 4, "body": "<p>Get access to the latest research publications from the FIELD team here. Pressed for time? Each paper is accompanied with a simple summary and key points so you can read at speed!</p><p>Have any questions about these? Then <a id=\\"8\\" linktype=\\"page\\">contact us</a>.</p><p></p><p></p><p></p><hr/><h2>The public and farm animal welfare</h2><hr/><h3>Public perceptions of farm animal welfare</h3><p>This paper reports on the results of a systematic search of the literature to establish what the public think about farm animal welfare. The results indicate that the public have concerns over more modern and intensive animal production systems, which were thought to breach to two core components of good welfare: humane treatment and naturalness.</p><p></p><p>Read more here: <a id=\\"4\\" linktype=\\"document\\">Public attitudes to farm animal welfare</a></p><p></p><h3>Are the public willing to pay for higher welfare?</h3><p>This paper uses a systematic search of the literature to find out what members of the public are willing to pay for higher welfare animal products. The findings show that the public would pay a small premium for higher welfare products, although this varied by animal type and across different population groups.</p><p></p><p>Read more here: <a id=\\"3\\" linktype=\\"document\\">Willingness-to-pay farm animal welfare</a></p>", "pk": 33, "content_type": 31, "live_revision": 166, "latest_revision_created_at": "2019-02-04T10:16:09.309Z", "search_description": "", "live": true, "url_path": "/home2/resources/papers/", "draft_title": "Papers", "has_unpublished_changes": false, "numchild": 0, "show_in_menus": true}	\N	33	2
68	f	2019-01-18 12:53:43.719863+00	{"locked": false, "title": "Timeline", "draft_title": "Timeline", "has_unpublished_changes": false, "first_published_at": null, "depth": 4, "expired": false, "last_published_at": null, "live": false, "content_type": 31, "slug": "timeline", "latest_revision_created_at": null, "show_in_menus": false, "numchild": 0, "expire_at": null, "path": "0001000200050001", "seo_title": "", "live_revision": null, "url_path": "/home2/resources/timeline/", "owner": 4, "search_description": "", "pk": 28, "body": "<p>  </p><p>Our timeline has been put together by the FIELD historians to provide key dates and events in British farming since 1947. It includes aspects in relation to policy, production, veterinary science and medicine. Scroll through the timeline to explore these, and click on key dates to discover these in more depth.</p><p>Do any of these dates resonate with you? Do you have a story to tell about a particular decade, an image or film that gives us a snapshot of what livestock farming was like, or have we missed anything you think is important? We would love to hear your stories and experiences of farming and veterinary medicine since 1947. <a id=\\"8\\" linktype=\\"page\\">Contact us</a> to tell us more!</p>", "go_live_at": null}	\N	28	4
\.


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailcore_pagerevision_id_seq', 199, true);


--
-- Data for Name: wagtailcore_pageviewrestriction; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailcore_pageviewrestriction (id, password, page_id, restriction_type) FROM stdin;
\.


--
-- Data for Name: wagtailcore_pageviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailcore_pageviewrestriction_groups (id, pageviewrestriction_id, group_id) FROM stdin;
\.


--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailcore_pageviewrestriction_groups_id_seq', 1, false);


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailcore_pageviewrestriction_id_seq', 1, false);


--
-- Data for Name: wagtailcore_site; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailcore_site (id, hostname, port, is_default_site, root_page_id, site_name) FROM stdin;
1	localhost	80	t	18	Field
\.


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailcore_site_id_seq', 1, true);


--
-- Data for Name: wagtaildocs_document; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtaildocs_document (id, title, file, created_at, uploaded_by_user_id, collection_id, file_size) FROM stdin;
2	Public attitudes endemic livestock disease	documents/Clark_et_al_2019_Plos.pdf	2019-01-29 16:47:18.8509+00	4	1	630197
3	Willingness-to-pay farm animal welfare	documents/Clark_et_al_2017.pdf	2019-01-29 16:48:00.582969+00	4	1	464945
4	Public attitudes to farm animal welfare	documents/Clark_et_al_2016.pdf	2019-01-29 16:48:39.360502+00	4	1	482824
5	Production diseases policy note.pdf	documents/Production_diseases_policy_note.pdf	2019-01-29 16:50:58.891149+00	4	1	1848437
\.


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtaildocs_document_id_seq', 5, true);


--
-- Data for Name: wagtailembeds_embed; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailembeds_embed (id, url, max_width, type, html, title, author_name, provider_name, thumbnail_url, width, height, last_updated) FROM stdin;
\.


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailembeds_embed_id_seq', 1, false);


--
-- Data for Name: wagtailforms_formsubmission; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailforms_formsubmission (id, form_data, submit_time, page_id) FROM stdin;
\.


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailforms_formsubmission_id_seq', 1, false);


--
-- Data for Name: wagtailimages_image; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailimages_image (id, title, file, width, height, created_at, focal_point_x, focal_point_y, focal_point_width, focal_point_height, uploaded_by_user_id, file_size, collection_id, file_hash) FROM stdin;
88	P FW PH1/OS/313/1/4372, Museum of English Rural Life, University of Reading	original_images/P_FW_OS_313_1_4372.jpg	948	1199	2019-02-08 09:31:42.420491+00	\N	\N	\N	\N	6	300542	1	29441abf189ff37f4bbb3771553a5979cb783684
4	field1.jpeg	original_images/field1.jpeg	1200	550	2019-01-11 02:35:05.566114+00	\N	\N	\N	\N	1	413245	1	e1b1e8f45024c29bf7aba3c7310339d5658deaaf
5	field2.jpeg	original_images/field2.jpeg	750	496	2019-01-11 02:35:26.660542+00	413	309	141	160	1	87553	1	25949923a36911e5795225a60086ac093ceadb8d
9	Vet1	original_images/car-10.jpg	540	374	2019-01-29 12:11:25.9769+00	\N	\N	\N	\N	4	238883	1	871c3a00ed6c2900e5effbb28bd1135bda9855ed
8	Advisors1	original_images/car-02.jpg	540	374	2019-01-29 12:10:47.434816+00	\N	\N	\N	\N	4	236226	1	1b3f620e59be94af3b2dde6ca0097047a2dce1d6
10	Cows1	original_images/car-09.jpg	540	374	2019-01-29 12:11:44.887993+00	\N	\N	\N	\N	4	285517	1	51f44166de3f4b3d1ff264ba817476b10f98e44d
12	Advisers2	original_images/IMGP2422.JPG	2112	2816	2019-01-29 12:12:25.461559+00	\N	\N	\N	\N	4	4361179	1	9b0fa87df148867e7c75aaef3df987dc823f6898
11	Landscape1	original_images/car-01.jpg	540	374	2019-01-29 12:11:57.017999+00	\N	\N	\N	\N	4	199487	1	05cf48782d435da9f35249ebc46d61e82a76e1f7
13	Hay bales	original_images/25639.jpg	2048	1356	2019-01-29 12:13:54.510077+00	\N	\N	\N	\N	4	1806815	1	8df49c56c6ced6350bce266f87297cd2eed10e62
14	Conceptual approach	original_images/Conceptual_approach.png	1422	1070	2019-01-31 11:21:34.87121+00	\N	\N	\N	\N	4	57617	1	107f7b178c717bf3c52f401ff6da1e77fb982c65
15	Conceptual approach white	original_images/Conceptual_approach_white.png	1443	1083	2019-01-31 11:22:53.539184+00	\N	\N	\N	\N	4	78062	1	3c2264196d93663f6408dcd225ad3d871debf2ce
16	Expertise.png	original_images/Expertise.png	1333	889	2019-01-31 11:25:34.053094+00	\N	\N	\N	\N	4	95922	1	b2e7453534758281b223e3ac4729d9f7d5fb593e
17	Expertise white.png	original_images/Expertise_white.png	1333	889	2019-01-31 13:36:41.91865+00	\N	\N	\N	\N	4	93513	1	ad1ecc7b228297b025a46edd73e8314ff5854550
22	P FW PH1/OS/158/2/1814, Museum of English Rural Life, University of Reading	original_images/P_FW_OS_158_2_1814.jpg	1199	905	2019-02-08 09:17:27.357487+00	\N	\N	\N	\N	6	256594	1	ed87904a1ace6454ef38871a91fca207c03b691e
24	P FW PH1/59/10/9/2, Museum of English Rural Life, University of Reading	original_images/P_FW_BT_59_10_9_2.jpg	1199	973	2019-02-08 09:18:30.787433+00	\N	\N	\N	\N	6	391115	1	618381e2bb1c216d361cfdb1ca3cf4dbb55667ee
52	P FW PH1/OS/15/121, Museum of English Rural Life, University of Reading	original_images/P_FW_OS_15_121.jpg	930	1199	2019-02-08 09:25:05.544813+00	\N	\N	\N	\N	6	281169	1	f10f3639cff751768b23bc509b1b10fef9084354
111	P FW PH1/59/8/10/3, Museum of English Rural Life, University of Reading	original_images/P_FW_BT_59_8_10_3.jpg	1200	1002	2019-02-08 09:35:44.693612+00	\N	\N	\N	\N	6	204194	1	8f6fca4802c59776a6aa7469c831de0e5d8934ed
109	P FW PH1/59/8/10/1, Museum of English Rural Life, University of Reading	original_images/P_FW_BT_59_8_10_1.jpg	1200	1001	2019-02-08 09:35:25.696408+00	\N	\N	\N	\N	6	251636	1	52ae3a6dec7e78b6b5cb9594d96de3d23d35f8b2
107	P FW PH1/OS/57/571, Museum of English Rural Life, University of Reading	original_images/P_FW_OS_57_571.jpg	922	1199	2019-02-08 09:35:06.137002+00	\N	\N	\N	\N	6	316568	1	d6cd8192faf171e85a5504cc3a5723f10aad2745
105	P FW PH1/OS/57/567, Museum of English Rural Life, University of Reading	original_images/P_FW_OS_57_567.jpg	960	1200	2019-02-08 09:34:48.397038+00	\N	\N	\N	\N	6	275243	1	f1f8d598fa8f80ba84682480f59502cd19ff19a1
103	P FW PH1/OS/142/1484, Museum of English Rural Life, University of Reading	original_images/P_FW_OS_142_1484.jpg	1199	918	2019-02-08 09:34:31.760252+00	\N	\N	\N	\N	6	368907	1	a6ab279d4dbedcf01afd44c00ab4e50c8a54e325
101	P FW PH1/OS/128/1360, Museum of English Rural Life, University of Reading	original_images/P_FW_OS_128_1360.jpg	1199	915	2019-02-08 09:34:15.503865+00	\N	\N	\N	\N	6	292816	1	11e10dc0f1e6f39f9066160079238aad8477229a
99	P FW PH1/57/12/4/15, Museum of English Rural Life, University of Reading	original_images/P_FW_57_12_4_15.jpg	1200	961	2019-02-08 09:33:59.102356+00	\N	\N	\N	\N	6	209698	1	93c35eadb0ae1546977cb75b1523b172ac801563
97	P FW PH1/57/12/4/14, Museum of English Rural Life, University of Reading	original_images/P_FW_57_12_4_14.jpg	1200	961	2019-02-08 09:33:40.55292+00	\N	\N	\N	\N	6	297783	1	1403e0c95532a0bb839d15cd4ce40212f91c63c3
95	P FW PH1/59/9/7/5, Museum of English Rural Life, University of Reading	original_images/P_FW_T_59_9_7_5.jpg	974	1200	2019-02-08 09:33:20.297262+00	\N	\N	\N	\N	6	282650	1	ce386ef793ce61905b60b41d2e3c2dcfaac23a45
93	P FW PH1/57/10/2/3, Museum of English Rural Life, University of Reading	original_images/P_FW_T_57_10_2_3.jpg	1199	997	2019-02-08 09:32:51.121909+00	\N	\N	\N	\N	6	338281	1	ba36621bf1420f6cca1770577d054fe0b9178e35
90	P FW PH1/57/3/7/5, Museum of English Rural Life, University of Reading	original_images/P_FW_C_57_3_7_5.jpg	1199	912	2019-02-08 09:32:00.465261+00	\N	\N	\N	\N	6	260769	1	1e226b5e8c99b4284b5bf8975c08def4f5cf723f
115	P FW PH1/57/3/4/2/10, Museum of English Rural Life, University of Reading	original_images/P_FW_T_57_3_4_2_10.jpg	968	1199	2019-02-08 09:36:36.167633+00	\N	\N	\N	\N	6	355006	1	5921245d9dfef69fe045336cb1447052f3ba11eb
113	P FW PH1/59/8/10/7, Museum of English Rural Life, University of Reading	original_images/P_FW_BT_59_8_10_7.jpg	1199	981	2019-02-08 09:36:15.595121+00	\N	\N	\N	\N	6	283711	1	b24e3ddcb60f83ed9bc5528529a82a7cbb6a807e
86	P FW PH1/59/10/8/4/12, Museum of English Rural Life, University of Reading	original_images/P_FW_59_10_8_4_12.jpg	1199	973	2019-02-08 09:31:25.607166+00	\N	\N	\N	\N	6	323197	1	7f21950cb81c1c68f2b4ada4ea9fcf207cb5eb21
84	P FW PH1/61/6/3/1, Museum of English Rural Life, University of Reading	original_images/P_FW_T_61_6_3_1.jpg	1199	987	2019-02-08 09:31:07.23771+00	\N	\N	\N	\N	6	226955	1	3e8fd11ce61031d4521b1e084eb7cdf8d6aced9f
82	P FW PH1/59/9/1/4, Museum of English Rural Life, University of Reading	original_images/P_FW_T_59_9_1_4.jpg	1200	985	2019-02-08 09:30:50.015097+00	\N	\N	\N	\N	6	498686	1	498bf15fb4c5f57fdea63ab55fc02d0e70cea256
80	P FW PH1/59/9/1/2, Museum of English Rural Life, University of Reading	original_images/P_FW_T_59_9_1_2.jpg	1200	985	2019-02-08 09:30:32.232606+00	\N	\N	\N	\N	6	357517	1	6bbac415b5f36b221f0a9820ed91d783cf8bd4d4
78	P FW PH1/59/3/2/2/6, Museum of English Rural Life, University of Reading	original_images/P_FW_T_59_3_2_2_6.jpg	1200	1018	2019-02-08 09:30:13.244457+00	\N	\N	\N	\N	6	391292	1	cc45105950f17e6fd48a1bf8f8a2066cadb60aed
76	P FW PH1/59/3/2/1/9, Museum of English Rural Life, University of Reading	original_images/P_FW_T_59_3_2_1_9.jpg	1200	990	2019-02-08 09:29:55.32641+00	\N	\N	\N	\N	6	502749	1	1b3359df1c05531eac1390fc24c71d68d12c13bd
74	P FW PH1/59/3/2/1/6, Museum of English Rural Life, University of Reading	original_images/P_FW_T_59_3_2_1_6.jpg	1200	990	2019-02-08 09:29:37.10073+00	\N	\N	\N	\N	6	375949	1	0dc2f73542bc52597a378a292f48fe6a94ff2872
72	P FW PH1/59/3/2/1/3, Museum of English Rural Life, University of Reading	original_images/P_FW_T_59_3_2_1_3.jpg	1199	973	2019-02-08 09:29:20.197686+00	\N	\N	\N	\N	6	290680	1	5dc9840b93234f0fe489fe68ca97dca17105805b
70	P FW PH1/54/10/8/2/3, Museum of English Rural Life, University of Reading	original_images/P_FW_C_54_10_8_2_3.jpg	1015	984	2019-02-08 09:28:58.049196+00	\N	\N	\N	\N	6	178790	1	1b51e2ab4cb94cbb58b106ac5c85494c4f28694b
68	P FW PH1/57/8/7/2/8, Museum of English Rural Life, University of Reading	original_images/P_FW_C_57_8_7_2_8.jpg	1199	978	2019-02-08 09:28:31.163529+00	\N	\N	\N	\N	6	265006	1	ff7aa384478f920315f8cb2c1bb12c46624d67f8
66	P FW PH1/57/8/7/2/1, Museum of English Rural Life, University of Reading	original_images/P_FW_C_57_8_7_2_1.jpg	1199	978	2019-02-08 09:28:10.969328+00	\N	\N	\N	\N	6	267016	1	733724b38101127844c0b203e84c1d2a1d62b615
64	P FW PH1/57/8/7/1/6, Museum of English Rural Life, University of Reading	original_images/P_FW_C_57_8_7_1_6.jpg	1199	978	2019-02-08 09:27:37.666195+00	\N	\N	\N	\N	6	453874	1	3bf2280af25d2b3fd7508b577ff34b4bea42ab5a
62	P FW PH1/57/8/7/1/4, Museum of English Rural Life, University of Reading	original_images/P_FW_C_57_8_7_1_4.jpg	1199	978	2019-02-08 09:27:14.672406+00	\N	\N	\N	\N	6	285551	1	d93baa41d9081d8c0702e91e86a6bb27189e147b
60	P FW PH1/57/8/7/1/3, Museum of English Rural Life, University of Reading	original_images/P_FW_C_57_8_7_1_3.jpg	1199	978	2019-02-08 09:26:57.250869+00	\N	\N	\N	\N	6	282778	1	b26fa31e402d19e23916656a06622587712025c4
58	P FW PH1/59/4/6/2, Museum of English Rural Life, University of Reading	original_images/P_FW_C_59_4_6_2.jpg	1200	961	2019-02-08 09:26:29.258024+00	\N	\N	\N	\N	6	267911	1	e387c7dd52e78a55f1fe0a197ddf6435b85f55d1
56	P FW PH1/59/4/6/1, Museum of English Rural Life, University of Reading	original_images/P_FW_C_59_4_6_1.jpg	1200	961	2019-02-08 09:25:52.867419+00	\N	\N	\N	\N	6	231552	1	45e846a560b73f08f157605d324ad08f95bd051a
54	P FW PH1/OS/15/124, Museum of English Rural Life, University of Reading	original_images/P_FW_OS_15_124.jpg	1199	930	2019-02-08 09:25:25.083426+00	\N	\N	\N	\N	6	317666	1	7a9ff8f316e6c4a39e1eade13dd1c9c41f015659
50	P FW PH1/OS/3/27, Museum of English Rural Life, University of Reading	original_images/P_FW_OS_3_27.jpg	1199	907	2019-02-08 09:24:45.97869+00	\N	\N	\N	\N	6	281564	1	f4282466084299a103dc39f73271ac74801fcd59
48	P FW PH1/OS/3/25, Museum of English Rural Life, University of Reading	original_images/P_FW_OS_3_25.jpg	1199	919	2019-02-08 09:24:24.869526+00	\N	\N	\N	\N	6	282504	1	aa2ded9d03dc81f0264f0f7cca95b319f08ab367
46	P FW PH1/59/8/13/7, Museum of English Rural Life, University of Reading	original_images/P_FW_BT_59_8_13_7.jpg	1199	946	2019-02-08 09:24:07.704206+00	\N	\N	\N	\N	6	230019	1	ced80284209087390808067d3de6cf4e8f08e667
44	P FW PH1/59/8/13/2, Museum of English Rural Life, University of Reading	original_images/P_FW_BT_59_8_13_2.jpg	1200	1003	2019-02-08 09:23:45.65375+00	\N	\N	\N	\N	6	314064	1	f19898ccab26758e9463da607eddf1daea735e7b
42	P FW PH1/59/8/13/1, Museum of English Rural Life, University of Reading	original_images/P_FW_BT_59_8_13_1.jpg	1199	998	2019-02-08 09:23:20.06973+00	\N	\N	\N	\N	6	370030	1	09985eef77e1f793bd30a5ea877d9c2059d90fb6
40	P FW PH1/OS/405/1/11, Museum of English Rural Life, University of Reading	original_images/P_FW_OS_405_1_11.jpg	1117	1073	2019-02-08 09:22:43.06903+00	\N	\N	\N	\N	6	247592	1	cebcf4cfd128834089b832301744c2eb5615e9e0
38	P FW PH1/OS/405/1/12, Museum of English Rural Life, University of Reading	original_images/P_FW_OS_405_1_12.jpg	1117	1073	2019-02-08 09:22:20.999511+00	\N	\N	\N	\N	6	261922	1	904da2e4051e10d3b55f119653c23f0bf36bcd99
36	P FW PH1/57/11/7/8, Museum of English Rural Life, University of Reading	original_images/P_FW_T_57_11_7_8.jpg	1199	998	2019-02-08 09:22:00.914962+00	\N	\N	\N	\N	6	294724	1	3e51521549b5d56a17bd138fcf27d7f32033be37
34	P FW PH1/54/11/7/11, Museum of English Rural Life, University of Reading	original_images/P_FW_T_54_11_7_11.jpg	986	1199	2019-02-08 09:21:28.515747+00	\N	\N	\N	\N	6	330420	1	02adc9fad9d8f82976230d7a2bd5e94955ea06fb
32	P FW PH1/54/11/23/7, Museum of English Rural Life, University of Reading	original_images/P_FW_C_54_11_23_7.jpg	1199	903	2019-02-08 09:21:04.875788+00	\N	\N	\N	\N	6	321926	1	c8f01fc5c56bcc5aa0210e4c3661a20146d82647
30	P FW PH1/59/9/11/7, Museum of English Rural Life, University of Reading	original_images/P_FW_BT_59_9_11_7.jpg	1199	995	2019-02-08 09:20:40.956463+00	\N	\N	\N	\N	6	317408	1	429d2c792e7d7f9b415eb08d450c8d917dc5edd6
28	P FW PH1/59/10/9/4, Museum of English Rural Life, University of Reading	original_images/P_FW_BT_59_10_9_4.jpg	1199	959	2019-02-08 09:20:11.608621+00	\N	\N	\N	\N	6	474055	1	9e6332f6c5978dce72354ce71cb1159025bf1e1d
26	P FW PH1/59/10/9/3, Museum of English Rural Life, University of Reading	original_images/P_FW_BT_59_10_9_3.jpg	1200	971	2019-02-08 09:19:29.894431+00	\N	\N	\N	\N	6	388904	1	0dd900e4362633f6caf40601b0e27301a18400c7
20	P FW PH1/OS/158/1/1507, Museum of English Rural Life, University of Reading	original_images/P_FW_OS_158_1_1507.jpg	935	1199	2019-02-08 09:16:48.870563+00	\N	\N	\N	\N	6	284107	1	0d383c4852e868dedfb620c87235f313bf97d20d
18	P FW PH1/OS/113/1185, Museum of English Rural Life, University of Reading	original_images/P_FW_OS_113_1185.jpg	1200	927	2019-02-08 09:14:17.842356+00	\N	\N	\N	\N	6	379151	1	115c6ef56af9149eac7ed437cde20e9ecdc32166
\.


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailimages_image_id_seq', 116, true);


--
-- Data for Name: wagtailimages_rendition; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailimages_rendition (id, file, width, height, focal_point_key, image_id, filter_spec) FROM stdin;
9	images/field1.max-165x165.jpg	165	75		4	max-165x165
10	images/field2.max-165x165.jpg	165	109		5	max-165x165
15	images/field2.2e16d0ba.fill-800x240.jpg	750	226	2e16d0ba	5	fill-800x240
16	images/field1.2e16d0ba.fill-800x240.jpg	800	240	2e16d0ba	4	fill-800x240
17	images/field2.2e16d0ba.fill-800x450.jpg	750	422	2e16d0ba	5	fill-800x450
18	images/field2.original.jpg	750	496		5	original
19	images/field2.max-800x600.jpg	750	496		5	max-800x600
20	images/field2.89967c20.fill-800x240.jpg	750	226	89967c20	5	fill-800x240
21	images/field2.89967c20.fill-800x450.jpg	750	423	89967c20	5	fill-800x450
22	images/field1.max-800x600.jpg	800	366		4	max-800x600
32	images/IMGP2422.max-165x165.jpg	123	165		12	max-165x165
33	images/car-01.max-165x165.jpg	165	114		11	max-165x165
34	images/car-09.max-165x165.jpg	165	114		10	max-165x165
35	images/car-10.max-165x165.jpg	165	114		9	max-165x165
36	images/car-02.max-165x165.jpg	165	114		8	max-165x165
37	images/car-02.original.jpg	540	374		8	original
38	images/car-02.max-800x600.jpg	540	374		8	max-800x600
39	images/car-09.original.jpg	540	374		10	original
40	images/car-09.max-800x600.jpg	540	374		10	max-800x600
41	images/IMGP2422.original.jpg	2112	2816		12	original
42	images/IMGP2422.max-800x600.jpg	450	600		12	max-800x600
43	images/car-01.original.jpg	540	374		11	original
44	images/car-01.max-800x600.jpg	540	374		11	max-800x600
45	images/25639.max-165x165.jpg	165	109		13	max-165x165
46	images/Conceptual_approach.max-800x600.png	797	600		14	max-800x600
47	images/Conceptual_approach.width-800.png	800	601		14	width-800
48	images/Conceptual_approach.max-165x165.png	165	124		14	max-165x165
49	images/Conceptual_approach_white.max-800x600.png	799	600		15	max-800x600
50	images/Conceptual_approach_white.width-800.png	800	600		15	width-800
51	images/Conceptual_approach_white.max-165x165.png	165	123		15	max-165x165
52	images/Expertise.max-800x600.png	800	533		16	max-800x600
53	images/Expertise.max-165x165.png	165	110		16	max-165x165
54	images/Expertise_white.max-800x600.png	800	533		17	max-800x600
55	images/Expertise_white.width-800.png	800	533		17	width-800
56	images/Expertise_white.max-165x165.png	165	110		17	max-165x165
57	images/Expertise.width-800.png	800	533		16	width-800
58	images/Expertise_white.original.png	1333	889		17	original
59	images/Conceptual_approach_white.original.png	1443	1083		15	original
60	images/25639.original.jpg	2048	1356		13	original
61	images/25639.max-800x600.jpg	800	529		13	max-800x600
62	images/P_FW_OS_113_1185.max-165x165.jpg	165	127		18	max-165x165
63	images/P_FW_T_57_3_4_2_10.max-165x165.jpg	133	165		115	max-165x165
64	images/P_FW_BT_59_8_10_7.max-165x165.jpg	165	135		113	max-165x165
65	images/P_FW_BT_59_8_10_3.max-165x165.jpg	165	137		111	max-165x165
66	images/P_FW_BT_59_8_10_1.max-165x165.jpg	165	137		109	max-165x165
67	images/P_FW_OS_57_571.max-165x165.jpg	126	165		107	max-165x165
68	images/P_FW_OS_57_567.max-165x165.jpg	132	165		105	max-165x165
69	images/P_FW_OS_142_1484.max-165x165.jpg	165	126		103	max-165x165
70	images/P_FW_OS_128_1360.max-165x165.jpg	165	125		101	max-165x165
71	images/P_FW_57_12_4_15.max-165x165.jpg	165	132		99	max-165x165
72	images/P_FW_57_12_4_14.max-165x165.jpg	165	132		97	max-165x165
73	images/P_FW_T_59_9_7_5.max-165x165.jpg	133	165		95	max-165x165
74	images/P_FW_T_57_10_2_3.max-165x165.jpg	165	137		93	max-165x165
75	images/P_FW_C_57_3_7_5.max-165x165.jpg	165	125		90	max-165x165
76	images/P_FW_OS_313_1_4372.max-165x165.jpg	130	165		88	max-165x165
77	images/P_FW_59_10_8_4_12.max-165x165.jpg	165	133		86	max-165x165
78	images/P_FW_T_61_6_3_1.max-165x165.jpg	165	135		84	max-165x165
79	images/P_FW_T_59_9_1_4.max-165x165.jpg	165	135		82	max-165x165
80	images/P_FW_T_59_9_1_2.max-165x165.jpg	165	135		80	max-165x165
81	images/P_FW_T_59_3_2_2_6.max-165x165.jpg	165	139		78	max-165x165
82	images/P_FW_T_59_3_2_1_9.max-165x165.jpg	165	136		76	max-165x165
83	images/P_FW_T_59_3_2_1_6.max-165x165.jpg	165	136		74	max-165x165
84	images/P_FW_T_59_3_2_1_3.max-165x165.jpg	165	133		72	max-165x165
85	images/P_FW_C_54_10_8_2_3.max-165x165.jpg	165	159		70	max-165x165
86	images/P_FW_C_57_8_7_2_8.max-165x165.jpg	165	134		68	max-165x165
87	images/P_FW_C_57_8_7_2_1.max-165x165.jpg	165	134		66	max-165x165
88	images/P_FW_C_57_8_7_1_6.max-165x165.jpg	165	134		64	max-165x165
89	images/P_FW_C_57_8_7_1_4.max-165x165.jpg	165	134		62	max-165x165
90	images/P_FW_C_57_8_7_1_3.max-165x165.jpg	165	134		60	max-165x165
91	images/P_FW_C_59_4_6_2.max-165x165.jpg	165	132		58	max-165x165
92	images/P_FW_C_59_4_6_1.max-165x165.jpg	165	132		56	max-165x165
93	images/P_FW_OS_15_124.max-165x165.jpg	165	127		54	max-165x165
94	images/P_FW_OS_15_121.max-165x165.jpg	127	165		52	max-165x165
95	images/P_FW_OS_3_27.max-165x165.jpg	165	124		50	max-165x165
96	images/P_FW_OS_3_25.max-165x165.jpg	165	126		48	max-165x165
97	images/P_FW_BT_59_8_13_7.max-165x165.jpg	165	130		46	max-165x165
98	images/P_FW_BT_59_8_13_2.max-165x165.jpg	165	137		44	max-165x165
99	images/P_FW_BT_59_8_13_1.max-165x165.jpg	165	137		42	max-165x165
100	images/P_FW_OS_405_1_11.max-165x165.jpg	165	158		40	max-165x165
101	images/P_FW_OS_405_1_12.max-165x165.jpg	165	158		38	max-165x165
102	images/P_FW_T_57_11_7_8.max-165x165.jpg	165	137		36	max-165x165
103	images/P_FW_T_54_11_7_11.max-165x165.jpg	135	165		34	max-165x165
104	images/P_FW_C_54_11_23_7.max-165x165.jpg	165	124		32	max-165x165
105	images/P_FW_BT_59_9_11_7.max-165x165.jpg	165	136		30	max-165x165
106	images/P_FW_BT_59_10_9_4.max-165x165.jpg	165	131		28	max-165x165
107	images/P_FW_BT_59_10_9_3.max-165x165.jpg	165	133		26	max-165x165
108	images/P_FW_BT_59_10_9_2.max-165x165.jpg	165	133		24	max-165x165
109	images/P_FW_OS_158_2_1814.max-165x165.jpg	165	124		22	max-165x165
110	images/P_FW_OS_158_1_1507.max-165x165.jpg	128	165		20	max-165x165
111	images/P_FW_T_57_3_4_2_10.original.jpg	968	1199		115	original
112	images/P_FW_T_57_3_4_2_10.max-800x600.jpg	484	600		115	max-800x600
113	images/P_FW_BT_59_8_10_7.original.jpg	1199	981		113	original
114	images/P_FW_BT_59_8_10_7.max-800x600.jpg	733	600		113	max-800x600
115	images/P_FW_BT_59_8_10_3.original.jpg	1200	1002		111	original
116	images/P_FW_BT_59_8_10_3.max-800x600.jpg	718	600		111	max-800x600
117	images/P_FW_BT_59_8_10_1.original.jpg	1200	1001		109	original
118	images/P_FW_BT_59_8_10_1.max-800x600.jpg	719	600		109	max-800x600
119	images/P_FW_OS_57_571.original.jpg	922	1199		107	original
120	images/P_FW_OS_57_571.max-800x600.jpg	461	600		107	max-800x600
121	images/P_FW_OS_57_567.original.jpg	960	1200		105	original
122	images/P_FW_OS_57_567.max-800x600.jpg	480	600		105	max-800x600
123	images/P_FW_OS_142_1484.original.jpg	1199	918		103	original
124	images/P_FW_OS_142_1484.max-800x600.jpg	783	600		103	max-800x600
125	images/P_FW_OS_128_1360.original.jpg	1199	915		101	original
126	images/P_FW_OS_128_1360.max-800x600.jpg	786	600		101	max-800x600
127	images/P_FW_57_12_4_15.original.jpg	1200	961		99	original
128	images/P_FW_57_12_4_15.max-800x600.jpg	749	600		99	max-800x600
129	images/P_FW_57_12_4_14.original.jpg	1200	961		97	original
130	images/P_FW_57_12_4_14.max-800x600.jpg	749	600		97	max-800x600
131	images/P_FW_T_59_9_7_5.original.jpg	974	1200		95	original
132	images/P_FW_T_59_9_7_5.max-800x600.jpg	487	600		95	max-800x600
133	images/P_FW_T_57_10_2_3.original.jpg	1199	997		93	original
134	images/P_FW_T_57_10_2_3.max-800x600.jpg	721	600		93	max-800x600
135	images/P_FW_C_57_3_7_5.original.jpg	1199	912		90	original
136	images/P_FW_C_57_3_7_5.max-800x600.jpg	788	600		90	max-800x600
137	images/P_FW_OS_313_1_4372.original.jpg	948	1199		88	original
138	images/P_FW_OS_313_1_4372.max-800x600.jpg	474	600		88	max-800x600
139	images/P_FW_59_10_8_4_12.original.jpg	1199	973		86	original
140	images/P_FW_59_10_8_4_12.max-800x600.jpg	739	600		86	max-800x600
141	images/P_FW_T_61_6_3_1.original.jpg	1199	987		84	original
142	images/P_FW_T_61_6_3_1.max-800x600.jpg	728	600		84	max-800x600
143	images/P_FW_T_59_9_1_4.original.jpg	1200	985		82	original
144	images/P_FW_T_59_9_1_4.max-800x600.jpg	730	600		82	max-800x600
145	images/P_FW_T_59_9_1_2.original.jpg	1200	985		80	original
146	images/P_FW_T_59_9_1_2.max-800x600.jpg	730	600		80	max-800x600
147	images/P_FW_T_59_3_2_2_6.original.jpg	1200	1018		78	original
148	images/P_FW_T_59_3_2_2_6.max-800x600.jpg	707	600		78	max-800x600
149	images/P_FW_T_59_3_2_1_9.original.jpg	1200	990		76	original
150	images/P_FW_T_59_3_2_1_9.max-800x600.jpg	727	600		76	max-800x600
151	images/P_FW_T_59_3_2_1_6.original.jpg	1200	990		74	original
152	images/P_FW_T_59_3_2_1_6.max-800x600.jpg	727	600		74	max-800x600
153	images/P_FW_T_59_3_2_1_3.original.jpg	1199	973		72	original
154	images/P_FW_T_59_3_2_1_3.max-800x600.jpg	739	600		72	max-800x600
155	images/P_FW_C_54_10_8_2_3.original.jpg	1015	984		70	original
156	images/P_FW_C_54_10_8_2_3.max-800x600.jpg	618	600		70	max-800x600
157	images/P_FW_C_57_8_7_2_8.original.jpg	1199	978		68	original
158	images/P_FW_C_57_8_7_2_8.max-800x600.jpg	735	600		68	max-800x600
159	images/P_FW_C_57_8_7_2_1.original.jpg	1199	978		66	original
160	images/P_FW_C_57_8_7_2_1.max-800x600.jpg	735	600		66	max-800x600
161	images/P_FW_C_57_8_7_1_6.original.jpg	1199	978		64	original
162	images/P_FW_C_57_8_7_1_6.max-800x600.jpg	735	600		64	max-800x600
163	images/P_FW_C_57_8_7_1_4.original.jpg	1199	978		62	original
164	images/P_FW_C_57_8_7_1_4.max-800x600.jpg	735	600		62	max-800x600
165	images/P_FW_C_57_8_7_1_3.original.jpg	1199	978		60	original
166	images/P_FW_C_57_8_7_1_3.max-800x600.jpg	735	600		60	max-800x600
167	images/P_FW_C_59_4_6_2.original.jpg	1200	961		58	original
168	images/P_FW_C_59_4_6_2.max-800x600.jpg	749	600		58	max-800x600
169	images/P_FW_C_59_4_6_1.original.jpg	1200	961		56	original
170	images/P_FW_C_59_4_6_1.max-800x600.jpg	749	600		56	max-800x600
171	images/P_FW_OS_15_124.original.jpg	1199	930		54	original
172	images/P_FW_OS_15_124.max-800x600.jpg	773	600		54	max-800x600
173	images/P_FW_OS_15_121.original.jpg	930	1199		52	original
174	images/P_FW_OS_15_121.max-800x600.jpg	465	600		52	max-800x600
175	images/P_FW_OS_3_27.original.jpg	1199	907		50	original
176	images/P_FW_OS_3_27.max-800x600.jpg	793	600		50	max-800x600
177	images/P_FW_OS_3_25.original.jpg	1199	919		48	original
178	images/P_FW_OS_3_25.max-800x600.jpg	782	600		48	max-800x600
179	images/P_FW_BT_59_8_13_7.original.jpg	1199	946		46	original
180	images/P_FW_BT_59_8_13_7.max-800x600.jpg	760	600		46	max-800x600
181	images/P_FW_BT_59_8_13_2.original.jpg	1200	1003		44	original
182	images/P_FW_BT_59_8_13_2.max-800x600.jpg	717	600		44	max-800x600
183	images/P_FW_BT_59_8_13_1.original.jpg	1199	998		42	original
184	images/P_FW_BT_59_8_13_1.max-800x600.jpg	720	600		42	max-800x600
185	images/P_FW_OS_405_1_11.original.jpg	1117	1073		40	original
186	images/P_FW_OS_405_1_11.max-800x600.jpg	624	600		40	max-800x600
187	images/P_FW_OS_405_1_12.original.jpg	1117	1073		38	original
188	images/P_FW_OS_405_1_12.max-800x600.jpg	624	600		38	max-800x600
189	images/P_FW_T_57_11_7_8.original.jpg	1199	998		36	original
190	images/P_FW_T_57_11_7_8.max-800x600.jpg	720	600		36	max-800x600
191	images/P_FW_T_54_11_7_11.original.jpg	986	1199		34	original
192	images/P_FW_T_54_11_7_11.max-800x600.jpg	493	600		34	max-800x600
193	images/P_FW_C_54_11_23_7.original.jpg	1199	903		32	original
194	images/P_FW_C_54_11_23_7.max-800x600.jpg	796	600		32	max-800x600
195	images/P_FW_BT_59_9_11_7.original.jpg	1199	995		30	original
196	images/P_FW_BT_59_9_11_7.max-800x600.jpg	723	600		30	max-800x600
197	images/P_FW_BT_59_10_9_4.original.jpg	1199	959		28	original
198	images/P_FW_BT_59_10_9_4.max-800x600.jpg	750	600		28	max-800x600
199	images/P_FW_BT_59_10_9_3.original.jpg	1200	971		26	original
200	images/P_FW_BT_59_10_9_3.max-800x600.jpg	741	600		26	max-800x600
201	images/P_FW_OS_158_1_1507.original.jpg	935	1199		20	original
202	images/P_FW_OS_158_1_1507.max-800x600.jpg	467	600		20	max-800x600
203	images/P_FW_OS_113_1185.original.jpg	1200	927		18	original
204	images/P_FW_OS_113_1185.max-800x600.jpg	776	600		18	max-800x600
205	images/car-10.original.jpg	540	374		9	original
206	images/car-10.max-800x600.jpg	540	374		9	max-800x600
207	images/field1.2e16d0ba.fill-800x450.jpg	800	450	2e16d0ba	4	fill-800x450
\.


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailimages_rendition_id_seq', 207, true);


--
-- Data for Name: wagtailmenus_flatmenu; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailmenus_flatmenu (id, title, handle, heading, site_id, max_levels, use_specific) FROM stdin;
\.


--
-- Name: wagtailmenus_flatmenu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailmenus_flatmenu_id_seq', 1, false);


--
-- Data for Name: wagtailmenus_flatmenuitem; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailmenus_flatmenuitem (id, sort_order, link_text, link_url, link_page_id, menu_id, url_append, allow_subnav, handle) FROM stdin;
\.


--
-- Name: wagtailmenus_flatmenuitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailmenus_flatmenuitem_id_seq', 1, false);


--
-- Data for Name: wagtailmenus_mainmenu; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailmenus_mainmenu (id, site_id, max_levels, use_specific) FROM stdin;
1	1	3	0
\.


--
-- Name: wagtailmenus_mainmenu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailmenus_mainmenu_id_seq', 1, true);


--
-- Data for Name: wagtailmenus_mainmenuitem; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailmenus_mainmenuitem (id, sort_order, link_text, link_url, link_page_id, menu_id, allow_subnav, url_append, handle) FROM stdin;
4	0		\N	18	1	t		
\.


--
-- Name: wagtailmenus_mainmenuitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailmenus_mainmenuitem_id_seq', 5, true);


--
-- Data for Name: wagtailredirects_redirect; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailredirects_redirect (id, old_path, is_permanent, redirect_link, redirect_page_id, site_id) FROM stdin;
\.


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailredirects_redirect_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_editorspick; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailsearch_editorspick (id, sort_order, description, page_id, query_id) FROM stdin;
\.


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailsearch_editorspick_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_query; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailsearch_query (id, query_string) FROM stdin;
1	post
2	blog
\.


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailsearch_query_id_seq', 2, true);


--
-- Data for Name: wagtailsearch_querydailyhits; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailsearch_querydailyhits (id, date, hits, query_id) FROM stdin;
1	2019-01-09	1	1
2	2019-01-10	3	1
4	2019-01-11	1	2
3	2019-01-11	4	1
5	2019-01-21	1	1
\.


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailsearch_querydailyhits_id_seq', 5, true);


--
-- Data for Name: wagtailusers_userprofile; Type: TABLE DATA; Schema: public; Owner: app_field
--

COPY public.wagtailusers_userprofile (id, submitted_notifications, approved_notifications, rejected_notifications, user_id, preferred_language, current_time_zone, avatar) FROM stdin;
1	t	t	t	3			
2	t	t	t	1			
\.


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app_field
--

SELECT pg_catalog.setval('public.wagtailusers_userprofile_id_seq', 2, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: kdl_wagtail_page_richpage_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.kdl_wagtail_page_richpage
    ADD CONSTRAINT kdl_wagtail_page_richpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: puput_blogpage_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_blogpage
    ADD CONSTRAINT puput_blogpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: puput_category_name_key; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_category
    ADD CONSTRAINT puput_category_name_key UNIQUE (name);


--
-- Name: puput_category_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_category
    ADD CONSTRAINT puput_category_pkey PRIMARY KEY (id);


--
-- Name: puput_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_category
    ADD CONSTRAINT puput_category_slug_key UNIQUE (slug);


--
-- Name: puput_categoryentrypage_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_categoryentrypage
    ADD CONSTRAINT puput_categoryentrypage_pkey PRIMARY KEY (id);


--
-- Name: puput_entrypage_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_entrypage
    ADD CONSTRAINT puput_entrypage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: puput_entrypagerelated_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_entrypagerelated
    ADD CONSTRAINT puput_entrypagerelated_pkey PRIMARY KEY (id);


--
-- Name: puput_tagentrypage_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_tagentrypage
    ADD CONSTRAINT puput_tagentrypage_pkey PRIMARY KEY (id);


--
-- Name: t1_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.t1
    ADD CONSTRAINT t1_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collection_path_key; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_path_key UNIQUE (path);


--
-- Name: wagtailcore_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq UNIQUE (collectionviewrestriction_id, group_id);


--
-- Name: wagtailcore_collectionviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collectionviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction
    ADD CONSTRAINT wagtailcore_collectionviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_groupcollect_group_id_collection_id_p_a21cefe9_uniq; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollect_group_id_collection_id_p_a21cefe9_uniq UNIQUE (group_id, collection_id, permission_id);


--
-- Name: wagtailcore_groupcollectionpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionpermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_grouppageper_group_id_page_id_permiss_0898bdf8_uniq; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppageper_group_id_page_id_permiss_0898bdf8_uniq UNIQUE (group_id, page_id, permission_type);


--
-- Name: wagtailcore_grouppagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_page_path_key; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_path_key UNIQUE (path);


--
-- Name: wagtailcore_page_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pagerevision_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrest_pageviewrestriction_id_g_d23f80bb_uniq; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrest_pageviewrestriction_id_g_d23f80bb_uniq UNIQUE (pageviewrestriction_id, group_id);


--
-- Name: wagtailcore_pageviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_site_hostname_port_2c626d70_uniq; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_hostname_port_2c626d70_uniq UNIQUE (hostname, port);


--
-- Name: wagtailcore_site_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_pkey PRIMARY KEY (id);


--
-- Name: wagtaildocs_document_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed_url_max_width_8a2922d8_uniq; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_url_max_width_8a2922d8_uniq UNIQUE (url, max_width);


--
-- Name: wagtailforms_formsubmission_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmission_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_image_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_rendition_image_id_filter_spec_foc_323c8fe0_uniq; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_image_id_filter_spec_foc_323c8fe0_uniq UNIQUE (image_id, filter_spec, focal_point_key);


--
-- Name: wagtailimages_rendition_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_pkey PRIMARY KEY (id);


--
-- Name: wagtailmenus_flatmenu_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailmenus_flatmenu
    ADD CONSTRAINT wagtailmenus_flatmenu_pkey PRIMARY KEY (id);


--
-- Name: wagtailmenus_flatmenu_site_id_handle_7b0cab3a_uniq; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailmenus_flatmenu
    ADD CONSTRAINT wagtailmenus_flatmenu_site_id_handle_7b0cab3a_uniq UNIQUE (site_id, handle);


--
-- Name: wagtailmenus_flatmenuitem_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailmenus_flatmenuitem
    ADD CONSTRAINT wagtailmenus_flatmenuitem_pkey PRIMARY KEY (id);


--
-- Name: wagtailmenus_mainmenu_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailmenus_mainmenu
    ADD CONSTRAINT wagtailmenus_mainmenu_pkey PRIMARY KEY (id);


--
-- Name: wagtailmenus_mainmenu_site_id_key; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailmenus_mainmenu
    ADD CONSTRAINT wagtailmenus_mainmenu_site_id_key UNIQUE (site_id);


--
-- Name: wagtailmenus_mainmenuitem_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailmenus_mainmenuitem
    ADD CONSTRAINT wagtailmenus_mainmenuitem_pkey PRIMARY KEY (id);


--
-- Name: wagtailredirects_redirect_old_path_site_id_783622d7_uniq; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_old_path_site_id_783622d7_uniq UNIQUE (old_path, site_id);


--
-- Name: wagtailredirects_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_editorspick_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editorspick_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query_query_string_key; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_query_string_key UNIQUE (query_string);


--
-- Name: wagtailsearch_querydailyhits_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_querydailyhits_query_id_date_1dd232e6_uniq; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_query_id_date_1dd232e6_uniq UNIQUE (query_id, date);


--
-- Name: wagtailusers_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_pkey PRIMARY KEY (id);


--
-- Name: wagtailusers_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: puput_blogpage_header_image_id_26328fc5; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX puput_blogpage_header_image_id_26328fc5 ON public.puput_blogpage USING btree (header_image_id);


--
-- Name: puput_category_name_dda73b16_like; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX puput_category_name_dda73b16_like ON public.puput_category USING btree (name varchar_pattern_ops);


--
-- Name: puput_category_parent_id_1178e53c; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX puput_category_parent_id_1178e53c ON public.puput_category USING btree (parent_id);


--
-- Name: puput_category_slug_2d6b57e9_like; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX puput_category_slug_2d6b57e9_like ON public.puput_category USING btree (slug varchar_pattern_ops);


--
-- Name: puput_categoryentrypage_category_id_c72ee26b; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX puput_categoryentrypage_category_id_c72ee26b ON public.puput_categoryentrypage USING btree (category_id);


--
-- Name: puput_categoryentrypage_page_id_cd5c1ea8; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX puput_categoryentrypage_page_id_cd5c1ea8 ON public.puput_categoryentrypage USING btree (page_id);


--
-- Name: puput_entrypage_header_image_id_0b1f03cc; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX puput_entrypage_header_image_id_0b1f03cc ON public.puput_entrypage USING btree (header_image_id);


--
-- Name: puput_entrypagerelated_entrypage_from_id_0a315375; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX puput_entrypagerelated_entrypage_from_id_0a315375 ON public.puput_entrypagerelated USING btree (entrypage_from_id);


--
-- Name: puput_entrypagerelated_entrypage_to_id_8e606029; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX puput_entrypagerelated_entrypage_to_id_8e606029 ON public.puput_entrypagerelated USING btree (entrypage_to_id);


--
-- Name: puput_tagentrypage_content_object_id_ba928a7d; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX puput_tagentrypage_content_object_id_ba928a7d ON public.puput_tagentrypage USING btree (content_object_id);


--
-- Name: puput_tagentrypage_tag_id_eac01467; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX puput_tagentrypage_tag_id_eac01467 ON public.puput_tagentrypage USING btree (tag_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: wagtailcore_collection_path_d848dc19_like; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_collection_path_d848dc19_like ON public.wagtailcore_collection USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_collectionview_collectionviewrestriction__47320efd; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_collectionview_collectionviewrestriction__47320efd ON public.wagtailcore_collectionviewrestriction_groups USING btree (collectionviewrestriction_id);


--
-- Name: wagtailcore_collectionviewrestriction_collection_id_761908ec; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_collectionviewrestriction_collection_id_761908ec ON public.wagtailcore_collectionviewrestriction USING btree (collection_id);


--
-- Name: wagtailcore_collectionviewrestriction_groups_group_id_1823f2a3; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_collectionviewrestriction_groups_group_id_1823f2a3 ON public.wagtailcore_collectionviewrestriction_groups USING btree (group_id);


--
-- Name: wagtailcore_groupcollectionpermission_collection_id_5423575a; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_groupcollectionpermission_collection_id_5423575a ON public.wagtailcore_groupcollectionpermission USING btree (collection_id);


--
-- Name: wagtailcore_groupcollectionpermission_group_id_05d61460; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_groupcollectionpermission_group_id_05d61460 ON public.wagtailcore_groupcollectionpermission USING btree (group_id);


--
-- Name: wagtailcore_groupcollectionpermission_permission_id_1b626275; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_groupcollectionpermission_permission_id_1b626275 ON public.wagtailcore_groupcollectionpermission USING btree (permission_id);


--
-- Name: wagtailcore_grouppagepermission_group_id_fc07e671; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_grouppagepermission_group_id_fc07e671 ON public.wagtailcore_grouppagepermission USING btree (group_id);


--
-- Name: wagtailcore_grouppagepermission_page_id_710b114a; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_grouppagepermission_page_id_710b114a ON public.wagtailcore_grouppagepermission USING btree (page_id);


--
-- Name: wagtailcore_page_content_type_id_c28424df; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_page_content_type_id_c28424df ON public.wagtailcore_page USING btree (content_type_id);


--
-- Name: wagtailcore_page_first_published_at_2b5dd637; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_page_first_published_at_2b5dd637 ON public.wagtailcore_page USING btree (first_published_at);


--
-- Name: wagtailcore_page_live_revision_id_930bd822; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_page_live_revision_id_930bd822 ON public.wagtailcore_page USING btree (live_revision_id);


--
-- Name: wagtailcore_page_owner_id_fbf7c332; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_page_owner_id_fbf7c332 ON public.wagtailcore_page USING btree (owner_id);


--
-- Name: wagtailcore_page_path_98eba2c8_like; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_page_path_98eba2c8_like ON public.wagtailcore_page USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_page_slug_e7c11b8f; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_page_slug_e7c11b8f ON public.wagtailcore_page USING btree (slug);


--
-- Name: wagtailcore_page_slug_e7c11b8f_like; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_page_slug_e7c11b8f_like ON public.wagtailcore_page USING btree (slug varchar_pattern_ops);


--
-- Name: wagtailcore_pagerevision_created_at_66954e3b; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_pagerevision_created_at_66954e3b ON public.wagtailcore_pagerevision USING btree (created_at);


--
-- Name: wagtailcore_pagerevision_page_id_d421cc1d; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_pagerevision_page_id_d421cc1d ON public.wagtailcore_pagerevision USING btree (page_id);


--
-- Name: wagtailcore_pagerevision_submitted_for_moderation_c682e44c; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_pagerevision_submitted_for_moderation_c682e44c ON public.wagtailcore_pagerevision USING btree (submitted_for_moderation);


--
-- Name: wagtailcore_pagerevision_user_id_2409d2f4; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_pagerevision_user_id_2409d2f4 ON public.wagtailcore_pagerevision USING btree (user_id);


--
-- Name: wagtailcore_pageviewrestri_pageviewrestriction_id_f147a99a; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_pageviewrestri_pageviewrestriction_id_f147a99a ON public.wagtailcore_pageviewrestriction_groups USING btree (pageviewrestriction_id);


--
-- Name: wagtailcore_pageviewrestriction_groups_group_id_6460f223; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_pageviewrestriction_groups_group_id_6460f223 ON public.wagtailcore_pageviewrestriction_groups USING btree (group_id);


--
-- Name: wagtailcore_pageviewrestriction_page_id_15a8bea6; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_pageviewrestriction_page_id_15a8bea6 ON public.wagtailcore_pageviewrestriction USING btree (page_id);


--
-- Name: wagtailcore_site_hostname_96b20b46; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_site_hostname_96b20b46 ON public.wagtailcore_site USING btree (hostname);


--
-- Name: wagtailcore_site_hostname_96b20b46_like; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_site_hostname_96b20b46_like ON public.wagtailcore_site USING btree (hostname varchar_pattern_ops);


--
-- Name: wagtailcore_site_root_page_id_e02fb95c; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailcore_site_root_page_id_e02fb95c ON public.wagtailcore_site USING btree (root_page_id);


--
-- Name: wagtaildocs_document_collection_id_23881625; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtaildocs_document_collection_id_23881625 ON public.wagtaildocs_document USING btree (collection_id);


--
-- Name: wagtaildocs_document_uploaded_by_user_id_17258b41; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtaildocs_document_uploaded_by_user_id_17258b41 ON public.wagtaildocs_document USING btree (uploaded_by_user_id);


--
-- Name: wagtailforms_formsubmission_page_id_e48e93e7; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailforms_formsubmission_page_id_e48e93e7 ON public.wagtailforms_formsubmission USING btree (page_id);


--
-- Name: wagtailimages_image_collection_id_c2f8af7e; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailimages_image_collection_id_c2f8af7e ON public.wagtailimages_image USING btree (collection_id);


--
-- Name: wagtailimages_image_created_at_86fa6cd4; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailimages_image_created_at_86fa6cd4 ON public.wagtailimages_image USING btree (created_at);


--
-- Name: wagtailimages_image_uploaded_by_user_id_5d73dc75; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailimages_image_uploaded_by_user_id_5d73dc75 ON public.wagtailimages_image USING btree (uploaded_by_user_id);


--
-- Name: wagtailimages_rendition_filter_spec_1cba3201; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailimages_rendition_filter_spec_1cba3201 ON public.wagtailimages_rendition USING btree (filter_spec);


--
-- Name: wagtailimages_rendition_filter_spec_1cba3201_like; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailimages_rendition_filter_spec_1cba3201_like ON public.wagtailimages_rendition USING btree (filter_spec varchar_pattern_ops);


--
-- Name: wagtailimages_rendition_image_id_3e1fd774; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailimages_rendition_image_id_3e1fd774 ON public.wagtailimages_rendition USING btree (image_id);


--
-- Name: wagtailmenus_flatmenu_handle_fd420cad; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailmenus_flatmenu_handle_fd420cad ON public.wagtailmenus_flatmenu USING btree (handle);


--
-- Name: wagtailmenus_flatmenu_handle_fd420cad_like; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailmenus_flatmenu_handle_fd420cad_like ON public.wagtailmenus_flatmenu USING btree (handle varchar_pattern_ops);


--
-- Name: wagtailmenus_flatmenu_site_id_516a598d; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailmenus_flatmenu_site_id_516a598d ON public.wagtailmenus_flatmenu USING btree (site_id);


--
-- Name: wagtailmenus_flatmenuitem_link_page_id_36779c0f; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailmenus_flatmenuitem_link_page_id_36779c0f ON public.wagtailmenus_flatmenuitem USING btree (link_page_id);


--
-- Name: wagtailmenus_flatmenuitem_menu_id_757c39da; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailmenus_flatmenuitem_menu_id_757c39da ON public.wagtailmenus_flatmenuitem USING btree (menu_id);


--
-- Name: wagtailmenus_mainmenuitem_link_page_id_208a4a4d; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailmenus_mainmenuitem_link_page_id_208a4a4d ON public.wagtailmenus_mainmenuitem USING btree (link_page_id);


--
-- Name: wagtailmenus_mainmenuitem_menu_id_6505d4c4; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailmenus_mainmenuitem_menu_id_6505d4c4 ON public.wagtailmenus_mainmenuitem USING btree (menu_id);


--
-- Name: wagtailredirects_redirect_old_path_bb35247b; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailredirects_redirect_old_path_bb35247b ON public.wagtailredirects_redirect USING btree (old_path);


--
-- Name: wagtailredirects_redirect_old_path_bb35247b_like; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailredirects_redirect_old_path_bb35247b_like ON public.wagtailredirects_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: wagtailredirects_redirect_redirect_page_id_b5728a8f; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailredirects_redirect_redirect_page_id_b5728a8f ON public.wagtailredirects_redirect USING btree (redirect_page_id);


--
-- Name: wagtailredirects_redirect_site_id_780a0e1e; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailredirects_redirect_site_id_780a0e1e ON public.wagtailredirects_redirect USING btree (site_id);


--
-- Name: wagtailsearch_editorspick_page_id_28cbc274; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailsearch_editorspick_page_id_28cbc274 ON public.wagtailsearch_editorspick USING btree (page_id);


--
-- Name: wagtailsearch_editorspick_query_id_c6eee4a0; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailsearch_editorspick_query_id_c6eee4a0 ON public.wagtailsearch_editorspick USING btree (query_id);


--
-- Name: wagtailsearch_query_query_string_e785ea07_like; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailsearch_query_query_string_e785ea07_like ON public.wagtailsearch_query USING btree (query_string varchar_pattern_ops);


--
-- Name: wagtailsearch_querydailyhits_query_id_2185994b; Type: INDEX; Schema: public; Owner: app_field
--

CREATE INDEX wagtailsearch_querydailyhits_query_id_2185994b ON public.wagtailsearch_querydailyhits USING btree (query_id);


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kdl_wagtail_page_ric_page_ptr_id_cea17258_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.kdl_wagtail_page_richpage
    ADD CONSTRAINT kdl_wagtail_page_ric_page_ptr_id_cea17258_fk_wagtailco FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: puput_blogpage_header_image_id_26328fc5_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_blogpage
    ADD CONSTRAINT puput_blogpage_header_image_id_26328fc5_fk_wagtailim FOREIGN KEY (header_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: puput_blogpage_page_ptr_id_6ef7bf6b_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_blogpage
    ADD CONSTRAINT puput_blogpage_page_ptr_id_6ef7bf6b_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: puput_category_parent_id_1178e53c_fk_puput_category_id; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_category
    ADD CONSTRAINT puput_category_parent_id_1178e53c_fk_puput_category_id FOREIGN KEY (parent_id) REFERENCES public.puput_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: puput_categoryentryp_category_id_c72ee26b_fk_puput_cat; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_categoryentrypage
    ADD CONSTRAINT puput_categoryentryp_category_id_c72ee26b_fk_puput_cat FOREIGN KEY (category_id) REFERENCES public.puput_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: puput_categoryentryp_page_id_cd5c1ea8_fk_puput_ent; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_categoryentrypage
    ADD CONSTRAINT puput_categoryentryp_page_id_cd5c1ea8_fk_puput_ent FOREIGN KEY (page_id) REFERENCES public.puput_entrypage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: puput_entrypage_header_image_id_0b1f03cc_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_entrypage
    ADD CONSTRAINT puput_entrypage_header_image_id_0b1f03cc_fk_wagtailim FOREIGN KEY (header_image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: puput_entrypage_page_ptr_id_aa00d782_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_entrypage
    ADD CONSTRAINT puput_entrypage_page_ptr_id_aa00d782_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: puput_entrypagerelat_entrypage_from_id_0a315375_fk_puput_ent; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_entrypagerelated
    ADD CONSTRAINT puput_entrypagerelat_entrypage_from_id_0a315375_fk_puput_ent FOREIGN KEY (entrypage_from_id) REFERENCES public.puput_entrypage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: puput_entrypagerelat_entrypage_to_id_8e606029_fk_puput_ent; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_entrypagerelated
    ADD CONSTRAINT puput_entrypagerelat_entrypage_to_id_8e606029_fk_puput_ent FOREIGN KEY (entrypage_to_id) REFERENCES public.puput_entrypage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: puput_tagentrypage_content_object_id_ba928a7d_fk_puput_ent; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_tagentrypage
    ADD CONSTRAINT puput_tagentrypage_content_object_id_ba928a7d_fk_puput_ent FOREIGN KEY (content_object_id) REFERENCES public.puput_entrypage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: puput_tagentrypage_tag_id_eac01467_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.puput_tagentrypage
    ADD CONSTRAINT puput_tagentrypage_tag_id_eac01467_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collecti_collection_id_761908ec_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction
    ADD CONSTRAINT wagtailcore_collecti_collection_id_761908ec_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco FOREIGN KEY (collectionviewrestriction_id) REFERENCES public.wagtailcore_collectionviewrestriction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcol_group_id_05d61460_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_group_id_05d61460_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppag_page_id_710b114a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppag_page_id_710b114a_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page_content_type_id_c28424df_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_content_type_id_c28424df_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page_live_revision_id_930bd822_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_live_revision_id_930bd822_fk_wagtailco FOREIGN KEY (live_revision_id) REFERENCES public.wagtailcore_pagerevision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevi_page_id_d421cc1d_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevi_page_id_d421cc1d_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageview_group_id_6460f223_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageview_group_id_6460f223_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco FOREIGN KEY (pageviewrestriction_id) REFERENCES public.wagtailcore_pageviewrestriction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id FOREIGN KEY (root_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_document_collection_id_23881625_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_collection_id_23881625_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user FOREIGN KEY (uploaded_by_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user FOREIGN KEY (uploaded_by_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailmenus_flatmen_link_page_id_36779c0f_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailmenus_flatmenuitem
    ADD CONSTRAINT wagtailmenus_flatmen_link_page_id_36779c0f_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailmenus_flatmen_menu_id_757c39da_fk_wagtailme; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailmenus_flatmenuitem
    ADD CONSTRAINT wagtailmenus_flatmen_menu_id_757c39da_fk_wagtailme FOREIGN KEY (menu_id) REFERENCES public.wagtailmenus_flatmenu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailmenus_flatmenu_site_id_516a598d_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailmenus_flatmenu
    ADD CONSTRAINT wagtailmenus_flatmenu_site_id_516a598d_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailmenus_mainmen_link_page_id_208a4a4d_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailmenus_mainmenuitem
    ADD CONSTRAINT wagtailmenus_mainmen_link_page_id_208a4a4d_fk_wagtailco FOREIGN KEY (link_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailmenus_mainmen_menu_id_6505d4c4_fk_wagtailme; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailmenus_mainmenuitem
    ADD CONSTRAINT wagtailmenus_mainmen_menu_id_6505d4c4_fk_wagtailme FOREIGN KEY (menu_id) REFERENCES public.wagtailmenus_mainmenu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailmenus_mainmenu_site_id_84b0fde4_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailmenus_mainmenu
    ADD CONSTRAINT wagtailmenus_mainmenu_site_id_84b0fde4_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco FOREIGN KEY (redirect_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_red_site_id_780a0e1e_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_red_site_id_780a0e1e_fk_wagtailco FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_editor_page_id_28cbc274_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editor_page_id_28cbc274_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_editor_query_id_c6eee4a0_fk_wagtailse; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editor_query_id_c6eee4a0_fk_wagtailse FOREIGN KEY (query_id) REFERENCES public.wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_queryd_query_id_2185994b_fk_wagtailse; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_queryd_query_id_2185994b_fk_wagtailse FOREIGN KEY (query_id) REFERENCES public.wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: app_field
--

ALTER TABLE ONLY public.wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

