PGDMP     	                	    z            vetClinicCrm    13.3    13.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    100777    vetClinicCrm    DATABASE     k   CREATE DATABASE "vetClinicCrm" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE "vetClinicCrm";
                postgres    false            �            1259    109011    pet    TABLE     5  CREATE TABLE public.pet (
    id bigint NOT NULL,
    enabled boolean NOT NULL,
    age integer NOT NULL,
    breed character varying(255),
    gender character varying(255),
    name character varying(255),
    species character varying(255),
    statement character varying(255),
    pet_owner_id bigint
);
    DROP TABLE public.pet;
       public         heap    postgres    false            �            1259    109009 
   pet_id_seq    SEQUENCE     �   ALTER TABLE public.pet ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.pet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    206            �            1259    109021 	   pet_owner    TABLE     �   CREATE TABLE public.pet_owner (
    id bigint NOT NULL,
    enabled boolean NOT NULL,
    address character varying(255),
    e_mail character varying(255),
    name character varying(255),
    phone bigint,
    surname character varying(255)
);
    DROP TABLE public.pet_owner;
       public         heap    postgres    false            �            1259    109019    pet_owner_id_seq    SEQUENCE     �   ALTER TABLE public.pet_owner ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.pet_owner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    208            �            1259    108976    roles    TABLE     }   CREATE TABLE public.roles (
    role_id bigint NOT NULL,
    enable boolean NOT NULL,
    rolename character varying(255)
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    108974    roles_role_id_seq    SEQUENCE     �   ALTER TABLE public.roles ALTER COLUMN role_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.roles_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    201            �            1259    108983    users    TABLE     �   CREATE TABLE public.users (
    user_id bigint NOT NULL,
    email character varying(255),
    enable boolean NOT NULL,
    password character varying(255),
    username character varying(255)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    108991    users_roles    TABLE     ^   CREATE TABLE public.users_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);
    DROP TABLE public.users_roles;
       public         heap    postgres    false            �            1259    108981    users_user_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN user_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    203            �          0    109011    pet 
   TABLE DATA           f   COPY public.pet (id, enabled, age, breed, gender, name, species, statement, pet_owner_id) FROM stdin;
    public          postgres    false    206   �        �          0    109021 	   pet_owner 
   TABLE DATA           W   COPY public.pet_owner (id, enabled, address, e_mail, name, phone, surname) FROM stdin;
    public          postgres    false    208   W!       �          0    108976    roles 
   TABLE DATA           :   COPY public.roles (role_id, enable, rolename) FROM stdin;
    public          postgres    false    201   ;"       �          0    108983    users 
   TABLE DATA           K   COPY public.users (user_id, email, enable, password, username) FROM stdin;
    public          postgres    false    203   i"       �          0    108991    users_roles 
   TABLE DATA           7   COPY public.users_roles (user_id, role_id) FROM stdin;
    public          postgres    false    204   �#       �           0    0 
   pet_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.pet_id_seq', 11, true);
          public          postgres    false    205            �           0    0    pet_owner_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.pet_owner_id_seq', 6, true);
          public          postgres    false    207            �           0    0    roles_role_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.roles_role_id_seq', 1, false);
          public          postgres    false    200            �           0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 11, true);
          public          postgres    false    202            B           2606    109028    pet_owner pet_owner_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.pet_owner
    ADD CONSTRAINT pet_owner_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.pet_owner DROP CONSTRAINT pet_owner_pkey;
       public            postgres    false    208            @           2606    109018    pet pet_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.pet
    ADD CONSTRAINT pet_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.pet DROP CONSTRAINT pet_pkey;
       public            postgres    false    206            <           2606    108980    roles roles_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    201            >           2606    108990    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    203            D           2606    109004 '   users_roles fk2o0jvgh89lemvvo17cbqvdxaa    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fk2o0jvgh89lemvvo17cbqvdxaa FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 Q   ALTER TABLE ONLY public.users_roles DROP CONSTRAINT fk2o0jvgh89lemvvo17cbqvdxaa;
       public          postgres    false    2878    204    203            E           2606    109029    pet fkf4ngdyco1fpxsjdnfqnvyg9k1    FK CONSTRAINT     �   ALTER TABLE ONLY public.pet
    ADD CONSTRAINT fkf4ngdyco1fpxsjdnfqnvyg9k1 FOREIGN KEY (pet_owner_id) REFERENCES public.pet_owner(id);
 I   ALTER TABLE ONLY public.pet DROP CONSTRAINT fkf4ngdyco1fpxsjdnfqnvyg9k1;
       public          postgres    false    206    2882    208            C           2606    108999 '   users_roles fkj6m8fwv7oqv74fcehir1a9ffy    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fkj6m8fwv7oqv74fcehir1a9ffy FOREIGN KEY (role_id) REFERENCES public.roles(role_id);
 Q   ALTER TABLE ONLY public.users_roles DROP CONSTRAINT fkj6m8fwv7oqv74fcehir1a9ffy;
       public          postgres    false    2876    201    204            �   �   x�e�A
�0���9A��
n���;q�ؔI�[�������2�u!.f3�ǟYA1��QXA��C8�*��d��PZ[#�,�>� $��L)x����n2G=��N��k���Nm���e��Z�[%�ڡ��W0�`D¹�b������=r�>Lg���2$��[8���S���z��XS����7�VZ�      �   �   x�U�A
�0EדSx�Jc��]�J�]	n�4I��E���p�V7^�=��X�f�����	6�f���4+�<�3��
s,�#�hAG��m�5�*�?�Y�̛��|��BK�C׿����aD��}
�t�����]��?K��T���x��X}��� H)	�dgqDP�y/c�F��[iu�&E{EK�!�[Y�      �      x�3�,�v�22]|=��b���� A@�      �   G  x�Uιr�@ ��zyk.��VN��Lf�EQ�p,J�>#6���o~���3tz�@f<�q�L
v�sZ.M�A]�H������E��Ę�BO�&��0"��|-j�(��Z��_�gPj
2܆�b��c[�ΰ��gz��t3����|�M�U|�8j.h@�3﫺w���_�+W���AM��!�Y9P�{=\1B���6�	�8Q����w�*��2�U�~�&֞������Sa���麊}ou�{�ъ�zqǁ��7���wW��P��X��Ъ�b�) ~ٷĳ�{�G!o�m�gƛ,�+P��{¨/���?����      �      x�3�4�2�4�bC ��H��qqq /�_     