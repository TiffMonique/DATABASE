--4) Crear dos triggers, uno en la tabla clientes y otro en la tabla categor�as, estos trigger se
--deben ejecutar antes de realizar un insert en las tablas y debe de convertir a min�scula
--todos los campos que sean de tipo char en las tablas solicitadas.


--TRIGGER TABLA CLIENTES
CREATE OR REPLACE TRIGGER TG_INSERT_TABLA_CLIENTES
BEFORE INSERT ON CLIENTES
FOR EACH ROW


DECLARE

BEGIN
  :NEW.CEDULA_RUC:=LOWER(:NEW.CEDULA_RUD);
  :NEW.NOMBRECIA:=LOWER(:NEW.NOMBRECIA);
  :NEW.NOMBRECONTACTO:=LOWER(:NEW.NOMBRECONTACTO);
  :NEW.DIRECCIONCLI:=LOWER(:NEW.DIRECCIONCLI);
  :NEW.FAX:=LOWER(:NEW.FAX);
  :NEW.EMAIL:=LOWER(:NEW.EMAIL);
  :NEW.CELULAR:=LOWER(:NEW.CELULAR);
  :NEW.FIJO:=LOWER(:NEW.FIJO);
          
END;

INSERT INTO CLIENTES VALUES(13, '080120001','ANA','PEDRO','MIRAMONTES','GKPIJ','TMONIQUE@GMAIL.COM','98653214','32659847');

--TRIGGER PARA CATEGORIAS
CREATE OR REPLACE TRIGGER TG_INSERT_TABLA_CATEGORIAS
BEFORE INSERT ON CATEGORIAS
FOR EACH ROW
DECLARE

BEGIN

  :NEW.NOMBRECAT:=UCASE(:NEW.NOMBRECAT);
  
END;


INSERT INTO CATEGORIAS VALUES(800,'ESCOLAR');
INSERT INTO CATEGORIAS VALUES(900,'TECNOLOGIA');

INSERT INTO CLIENTES VALUES(11, '080120001','ANA','PEDRO','MIRAMONTES');

