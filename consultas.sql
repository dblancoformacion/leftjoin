-- (01) Lugares que no visitará nadie
SELECT lugar FROM lugares LEFT JOIN viajaran
  ON lugares.id_lugar=viajaran.id_lugar
  WHERE viajaran.id_lugar IS null;

-- (02) ¿A qué destinos va cada persona?
SELECT persona,lugar
  FROM personas JOIN viajaran USING(id_persona)
  JOIN lugares USING(id_lugar);

-- (03) ¿Qué personas no viajarán?
-- (04) Persona que más viajará
-- (05) Lugar más visitado
-- (06) Destino al que ha ido todas las personas
-- (07) Persona que ha viajado a todos los destinos