--1) Crear un bloque anónimo que haga uso de un cursor para recorrer los registros de la
--tabla órdenes y verificar si ese registro tiene un valor igual a null en el campo descuento,
--si esta condición es verdadera se debe cambiar el valor del descuento a 0.15. En caso de
--que no haya coincidencia, escribir un mensaje en la pantalla que diga "registros no
--encontrados". Se debe aprobar los cambios realizados a los registros de la tabla órdenes

DECLARE
  CURSOR CURSOR_DESC IS SELECT ORDENES.DESCUENTO DESCUENTO,  ORDENES.ORDENID FROM ORDENES; 
  REGISTRO CURSOR_DESC%ROWTYPE;
   
BEGIN
  OPEN CURSOR_DESC;
  LOOP
    FETCH CURSOR_DESC INTO REGISTRO;
    EXIT WHEN CURSOR_DESC%NOTFOUND;
    
    IF (REGISTRO.DESCUENTO IS NULL) THEN
      UPDATE ORDENES ORDENES
      SET ORDENES.DESCUENTO=15;
      DBMS_OUTPUT.PUT_LINE('REGISTRO CAMBIADO');
      COMMIT;
    
    ELSE
        DBMS_OUTPUT.PUT_LINE('REGISTROS NO ENCONTRADOS');
    END IF;
  
  END LOOP;
  CLOSE CURSOR_DESC;

END;



