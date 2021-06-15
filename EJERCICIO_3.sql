--3) Crear un bloque anónimo que inserte 6 nuevos registros en la tabla productos, estos
--productos también deben ser proporcionados por 6 nuevos proveedores. En este bloque
--anónimo se deben gestionar las siguientes excepciones: 1) valor duplicado de llave
--primaria, 2) el error -12899 relacionado a la cantidad máxima de caracteres permitidos en
--un campo de tipo varchar, 3) el error -2291 relacionado a un valor inexistente de llave
--foránea. En todas las situaciones en caso de éxito se deben aprobar los cambios y en
--caso de error se deben deshacer los cambios.



DECLARE

BEGIN

    INSERT INTO PROVEEDORES VALUES(13, 'JAUN LOPEZ', 'MARIA PAZ','98465872', '22708189');
    INSERT INTO PROVEEDORES VALUES(19, 'JUANA AVILA', 'MANUEL ANDRADE','88665872', '22709036');
    INSERT INTO PROVEEDORES VALUES(14, 'DAVID PAZ', 'BETY ARIAS','85465871', '22708133');
    INSERT INTO PROVEEDORES VALUES(15, 'PEDRO PEREZ', 'JULIA GARCIA','98460000', '22708192');
    INSERT INTO PROVEEDORES VALUES(16, 'MIRIAN GOMEZ', 'MARIA PAZ','99465872', '22708142');
    INSERT INTO PROVEEDORES VALUES(17, 'SANDY PACHECO', 'BETY ARIAS','87465837', '22708172');
  
    INSERT INTO PRODUCTOS VALUES (19,10,100,'LAPIZ',5.30,200);
    INSERT INTO PRODUCTOS VALUES (14,30,100,'SACAPUNTA',10,45);
    INSERT INTO PRODUCTOS VALUES (15,440,100,'CUADERNOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOo',32.15,600);
    INSERT INTO PRODUCTOS VALUES (16,50,100,'MOCHILA',200,25);
    INSERT INTO PRODUCTOS VALUES (17,60,100,'COLORES',42.25,36);
    INSERT INTO PRODUCTOS VALUES (18,12,100,'CALCULADORA',900.55,50);

    COMMIT;

EXCEPTION
--1
     WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE||' ERROR DE LA LLAVE PRIMARIA VALOR DUPLICADO');
        ROLLBACK;

        WHEN OTHERS THEN
--2
        IF SQLCODE = -12899 THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE|| 'Error -12899 , Cantidad maxima de caracteres permitidos en un campo de tipo Varchar');
        ROLLBACK;
        END IF;
--3
        IF SQLCODE = -2291 THEN
        DBMS_OUTPUT.PUT_LINE('Error -2291 ,VALOR INEXISTENTE DE LA LLAVE FORANEA' ||SQLCODE);
        ROLLBACK;
        END IF;

END;
