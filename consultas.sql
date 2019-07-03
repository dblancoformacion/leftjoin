-- (01) Lugares que no visitará nadie
SELECT lugar FROM lugares LEFT JOIN viajaran
  ON lugares.id_lugar=viajaran.id_lugar
  WHERE viajaran.id_lugar IS null;

-- (02) ¿A qué destinos va cada persona?
