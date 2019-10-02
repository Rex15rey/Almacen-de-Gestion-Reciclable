Create database rrrsystem;
use rrrsystem;

CREATE TABLE `tipousuario` (
  `idtipousuario` INT NOT NULL AUTO_INCREMENT,
  `Nombretipousuario` VARCHAR(25) NOT NULL,
  `descripcionusuario` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idtipousuario`));
  

  CREATE TABLE `tipodocumento` (
  `idtipodocumento` INT NOT NULL AUTO_INCREMENT,
  `nombredocumento` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idtipodocumento`));
  
  
  
  CREATE TABLE `usuario` (
  `numdocumento` INT(12) NOT NULL,
  `nombreusuario` VARCHAR(20) NOT NULL,
  `apellidousuario` VARCHAR(20) NOT NULL,
  `contraseña` VARCHAR(12) NOT NULL,
  `Email` VARCHAR(40) NOT NULL,
  `estadousuario` ENUM('Activo', 'En Espera', 'Rechazado') NOT NULL,
  `FechaRegistro` DATE NOT NULL,
  `tipousuario_idtipousuario` INT NOT NULL,
  `tipodocumento_idtipodocumento` INT NOT NULL,
  PRIMARY KEY (`numdocumento`),
  INDEX `fk_usuario_tipousuario1_idx` (`tipousuario_idtipousuario` ASC) ,
  INDEX `fk_usuario_tipodocumento1_idx` (`tipodocumento_idtipodocumento` ASC),
  CONSTRAINT `fk_usuario_tipousuario1`
    FOREIGN KEY (`tipousuario_idtipousuario`)
    REFERENCES `tipousuario` (`idtipousuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_tipodocumento1`
    FOREIGN KEY (`tipodocumento_idtipodocumento`)
    REFERENCES `tipodocumento` (`idtipodocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    CREATE TABLE `procedencia` (
  `idprocedencia` INT NOT NULL AUTO_INCREMENT,
  `nombreprocedencia` VARCHAR(20) NOT NULL,
  `seccion` VARCHAR(15) NOT NULL,
  `bloque` VARCHAR(5) NULL,
  PRIMARY KEY (`idprocedencia`));
  
  
  CREATE TABLE`entrada` (
  `identrada` INT NOT NULL AUTO_INCREMENT,
  `fechaentrada` DATE NOT NULL,
  `estadoentrada` ENUM('vendido', 'almacenado') NOT NULL,
  `procedencia` INT NOT NULL,
  `usuario_numdocumento` INT(12) NOT NULL,
  INDEX `fk_entregadiaria_procedencia1_idx` (`procedencia` ASC),
  PRIMARY KEY (`identrada`),
  INDEX `fk_entrada_usuario1_idx` (`usuario_numdocumento` ASC),
  CONSTRAINT `fk_entregadiaria_procedencia1`
    FOREIGN KEY (`procedencia`)
    REFERENCES `procedencia` (`idprocedencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_entrada_usuario1`
    FOREIGN KEY (`usuario_numdocumento`)
    REFERENCES `usuario` (`numdocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    CREATE TABLE `movimientos` (
  `idmovimientos` INT NOT NULL AUTO_INCREMENT,
  `fechamovimiento` DATE NOT NULL,
  `destino` VARCHAR(45) NOT NULL,
  `totalmovimiento` DOUBLE NOT NULL,
  PRIMARY KEY (`idmovimientos`));
  
  
  CREATE TABLE `clasificacion` (
  `idcolor` INT NOT NULL AUTO_INCREMENT,
  `color` VARCHAR(20) NOT NULL,
  `descripcioncolor` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`idcolor`));
  
  
  CREATE TABLE `material` (
  `idmaterial` INT NOT NULL AUTO_INCREMENT,
  `nombrematerial` VARCHAR(40) NOT NULL,
  `clasificacion_idclasificacion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmaterial`),
  INDEX `fk_materialreciclable_clasificacion1_idx` (`clasificacion_idclasificacion` ASC),
  CONSTRAINT `fk_materialreciclable_clasificacion1`
    FOREIGN KEY (`clasificacion_idclasificacion`)
    REFERENCES `clasificacion` (`idcolor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
    CREATE TABLE `detalleentrada` (
  `materialreciclable_idmaterial` INT NOT NULL,
  `entrada_identrada` INT NOT NULL,
  `cantidadentrada` INT NOT NULL,
  `unidadmedida` CHAR(2) NULL DEFAULT 'kg',
  PRIMARY KEY (`materialreciclable_idmaterial`, `entrada_identrada`),
  INDEX `fk_entregadiaria_has_materialreciclable_materialreciclable1_idx` (`materialreciclable_idmaterial` ASC),
  INDEX `fk_detalleentrada_entrada1_idx` (`entrada_identrada` ASC),
  CONSTRAINT `fk_entregadiaria_has_materialreciclable_materialreciclable1`
    FOREIGN KEY (`materialreciclable_idmaterial`)
    REFERENCES `material` (`idmaterial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleentrada_entrada1`
    FOREIGN KEY (`entrada_identrada`)
    REFERENCES `entrada` (`identrada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE`detallemovimiento` (
  `materialreciclable_idmaterial` INT NOT NULL,
  `movimientos_idmovimientos` INT NOT NULL,
  `cantidadmovimiento` INT NOT NULL,
  PRIMARY KEY (`materialreciclable_idmaterial`, `movimientos_idmovimientos`),
  INDEX `fk_materialreciclable_has_movimientos_movimientos1_idx` (`movimientos_idmovimientos` ASC),
  INDEX `fk_materialreciclable_has_movimientos_materialreciclable1_idx` (`materialreciclable_idmaterial` ASC),
  CONSTRAINT `fk_materialreciclable_has_movimientos_materialreciclable1`
    FOREIGN KEY (`materialreciclable_idmaterial`)
    REFERENCES `material` (`idmaterial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_materialreciclable_has_movimientos_movimientos1`
    FOREIGN KEY (`movimientos_idmovimientos`)
    REFERENCES `movimientos` (`idmovimientos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


    
    
    -- Registro de datos 
    
INSERT INTO tipousuario (Nombretipousuario,descripcionusuario) 
 	VALUES
    ("admin","Este usuario tiene permiso para gestionar cualquiera parte del sistema");
	

INSERT INTO tipodocumento (nombredocumento) 
 	VALUES
    ("cedula de ciudadania"),
    ("tarjeta de identida"),
    ("cedula de extranjeria");
    


