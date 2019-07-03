CREATE TABLE personas(
  id_persona int AUTO_INCREMENT PRIMARY KEY,
  persona varchar(31),
  UNIQUE(persona)
);
CREATE TABLE lugares(
  id_lugar int AUTO_INCREMENT PRIMARY KEY,
  lugar varchar(31),
  UNIQUE(lugar)
);
CREATE TABLE viajaran(
  id_viaje int AUTO_INCREMENT PRIMARY KEY,
  id_persona int,
  id_lugar int,
  fecha date,
  FOREIGN KEY(id_persona) REFERENCES personas(id_persona),
  FOREIGN KEY(id_lugar) REFERENCES lugares(id_lugar)
  );

INSERT INTO personas (persona) VALUES
  ('Isabel'),('Antonio'),('Jhonny'),('Roberto'),('María');

INSERT INTO lugares (lugar) VALUES
  ('China'),('Hawai'),('Bogotá'),('Madrid'),('New York');

INSERT INTO viajaran (id_persona,id_lugar) VALUES
  (1,1),(2,2),(3,3),(4,4),(5,5);

INSERT INTO lugares (lugar) VALUES ('Noja');

INSERT INTO viajaran (id_lugar,id_persona)
  VALUES (2,4),(4,5),(5,3);

ALTER TABLE viajaran ADD UNIQUE(id_persona,id_lugar);

DELETE FROM viajaran WHERE id_persona=(
  SELECT id_persona FROM personas WHERE persona='Isabel'
);