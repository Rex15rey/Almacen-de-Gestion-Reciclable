Create database rrrsystem;
use rrrsystem;

CREATE TABLE tipousuario (
  idtipousuario INT NOT NULL AUTO_INCREMENT,
  Nombretipousuario VARCHAR(25) NOT NULL,
  descripcionusuario VARCHAR(100) NOT NULL,
  PRIMARY KEY (idtipousuario));
  
  

  CREATE TABLE tipodocumento(
  idtipodocumento INT NOT NULL AUTO_INCREMENT,
  nombredocumento VARCHAR(25) NOT NULL,
  PRIMARY KEY (idtipodocumento));
  
  
    CREATE TABLE usuario (
  numdocumento INT(12) NOT NULL,
  primernombre VARCHAR(20) NOT NULL,
  segundonombre VARCHAR(20) NULL,
  primerapellido VARCHAR(20) NOT NULL,
  segundoapellido VARCHAR(20) NULL,
  contraseña VARCHAR(12) NOT NULL,
  Email  VARCHAR(40) NOT NULL,
  estadousuario ENUM('Activo', 'En Espera', 'Rechazado') NOT NULL,
  FechaRegistro DATE NOT NULL,
  tipousuario_idtipousuario INT NOT NULL,
  tipodocumento_idtipodocumento INT NOT NULL,
  PRIMARY KEY (tipodocumento_idtipodocumento,numdocumento),
  INDEX fk_usuario_tipousuario1_idx (tipousuario_idtipousuario ASC) ,
  INDEX fk_usuario_tipodocumento1_idx (tipodocumento_idtipodocumento ASC),
  CONSTRAINT fk_usuario_tipousuario
    FOREIGN KEY (tipousuario_idtipousuario)
    REFERENCES tipousuario (idtipousuario),
  CONSTRAINT fk_usuario_tipodocumento
    FOREIGN KEY (tipodocumento_idtipodocumento)
    REFERENCES tipodocumento (idtipodocumento));


   CREATE TABLE procedencia (
  idprocedencia INT NOT NULL AUTO_INCREMENT,
  nombreprocedencia VARCHAR(20) NOT NULL,
  PRIMARY KEY (idprocedencia));
  
  
  CREATE TABLE entrada (
  identrada INT NOT NULL AUTO_INCREMENT,
  fechaentrada DATE NOT NULL,
  procedencia INT NOT NULL,
  usuario_numdocumento INT(12) NOT NULL,
  usuario_tipodocumento_idtipodocumento INT NOT NULL,
  INDEX fk_entrada_procedencia1_idx (procedencia ASC),
  PRIMARY KEY (identrada),
  INDEX fk_entrada_usuario1_idx (usuario_numdocumento ASC),
  CONSTRAINT fk_entrada_procedencia
    FOREIGN KEY (procedencia)
    REFERENCES procedencia (idprocedencia),
  CONSTRAINT fk_entrada_usuario
   FOREIGN KEY (usuario_tipodocumento_idtipodocumento,usuario_numdocumento)
    REFERENCES usuario (tipodocumento_idtipodocumento,numdocumento));
    
    
    
   CREATE TABLE movimiento (
  idmovimiento INT NOT NULL AUTO_INCREMENT,
  fechamovimiento DATE NOT NULL,
  destino ENUM('Venta', 'Huerta') NOT NULL,
  totalmovimiento DOUBLE NULL,
  PRIMARY KEY (idmovimiento));



CREATE TABLE clasificacion (
  idclasificacion INT NOT NULL AUTO_INCREMENT,
  color VARCHAR(20) NOT NULL,
  descripcioncolor VARCHAR(60) NOT NULL,
  PRIMARY KEY (idclasificacion));
  
  
  
  CREATE TABLE material (
  idmaterial INT NOT NULL AUTO_INCREMENT,
  nombrematerial VARCHAR(60) NOT NULL,
  clasificacion_idclasificacion INT NOT NULL,
  PRIMARY KEY (idmaterial),
  INDEX fk_material_clasificacion1_1dX (clasificacion_idclasificacion ASC),
  CONSTRAINT fk_material_clasificacion
   FOREIGN KEY (clasificacion_idclasificacion)
   REFERENCES clasificacion (idclasificacion));
    
    
   CREATE TABLE  detalleentrada (
  material_idmaterial INT NOT NULL,
  entrada_identrada INT NOT NULL,
  cantidadentrada INT NULL,
  pesoentrada DOUBLE NULL,
  PRIMARY KEY (material_idmaterial,entrada_identrada),
  INDEX fk_entrega_has_material_material1_idx (material_idmaterial ASC),
  INDEX fk_detalleentrada_entrada1_idx (entrada_identrada ASC),
  CONSTRAINT fk_entrega_has_material_material
    FOREIGN KEY (material_idmaterial)
    REFERENCES material (idmaterial),
  CONSTRAINT fk_detalleentrada_entrada
    FOREIGN KEY (entrada_identrada)
    REFERENCES entrada (identrada));
 
 
 
 
 
CREATE TABLE detallemovimiento (
  material_idmaterial INT NOT NULL,
  movimiento_idmovimiento INT NOT NULL,
  cantidadmovimiento INT NULL,
  pesomovimiento DOUBLE NULL,
  PRIMARY KEY (material_idmaterial,movimiento_idmovimiento),
  INDEX fk_material_has_movimiento_movimiento_idx(movimiento_idmovimiento ASC),
  INDEX fk_material_has_movimiento_material_idx (material_idmaterial ASC),
  CONSTRAINT fk_material_has_movimiento_material
    FOREIGN KEY (material_idmaterial)
    REFERENCES material (idmaterial),
  CONSTRAINT fk_material_has_movimiento_movimiento
    FOREIGN KEY (movimiento_idmovimiento)
    REFERENCES movimiento (idmovimiento)); 