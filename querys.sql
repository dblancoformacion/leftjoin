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
  )