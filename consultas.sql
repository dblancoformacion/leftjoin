-- (01) Lugares que no visitará nadie
SELECT lugar FROM lugares LEFT JOIN viajaran
  ON lugares.id_lugar=viajaran.id_lugar
  WHERE viajaran.id_lugar IS null;

-- (02) ¿A qué destinos va cada persona?
SELECT persona,lugar
  FROM personas JOIN viajaran USING(id_persona)
  JOIN lugares USING(id_lugar);

-- (03) ¿Qué personas no viajarán?
SELECT persona FROM viajaran RIGHT JOIN personas
  ON personas.id_persona=viajaran.id_persona
  WHERE viajaran.id_persona IS NULL;

-- (04) Persona que más viajará
SELECT MAX(persona) FROM personas; -- ¡¡Noooo!!

SELECT persona FROM (
    SELECT id_persona FROM viajaran GROUP BY 1
      HAVING COUNT(*)=(
        SELECT MAX(n) FROM (
            SELECT id_persona,COUNT(*) n
              FROM viajaran GROUP BY 1
        ) c1
    )
  ) c2 JOIN personas USING(id_persona);

-- (05) Lugar más visitado


-- (06) Destinos al que viajarán todas las personas que viajan



-- (07) Personas que viajarán a todos los destinos que se visitarán

-- c1
SELECT COUNT(DISTINCT id_lugar) FROM viajaran;
-- c2
SELECT id_persona FROM viajaran GROUP BY 1
  HAVING COUNT(*)=(
    SELECT COUNT(DISTINCT id_lugar) FROM viajaran
);
-- resultado
SELECT persona FROM (
    SELECT id_persona FROM viajaran GROUP BY 1
      HAVING COUNT(*)=(
        SELECT COUNT(DISTINCT id_lugar) FROM viajaran
    )  
  ) c3 JOIN personas USING(id_persona);

-- (08) Personas que sólo tienen previsto un viaje
SELECT persona FROM (
    SELECT id_persona FROM viajaran GROUP BY 1
      HAVING COUNT(*)=1  
  ) c1 JOIN personas USING(id_persona);

SELECT persona FROM personas WHERE id_persona IN (
    SELECT id_persona FROM viajaran GROUP BY id_persona
      HAVING COUNT(*)=1
);

