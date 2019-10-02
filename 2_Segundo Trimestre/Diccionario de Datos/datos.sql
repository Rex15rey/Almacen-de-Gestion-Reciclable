-- Registro de datos 
    
INSERT INTO tipousuario (Nombretipousuario,descripcionusuario) 
 	VALUES
    ("admin","Este usuario tiene permiso para gestionar cualquiera parte del sistema");
	

    INSERT INTO tipodocumento(nombredocumento) 
 	VALUES
    ("Cedula de ciudadania"),
    ("Cedula de Extranjeria"),
    ("Tarjeta de identidad");


INSERT INTO usuario (numdocumento,primernombre,segundonombre,primerapellido,segundoapellido,contraseña,email,estadousuario,FechaRegistro,tipousuario_idtipousuario,tipodocumento_idtipodocumento) 
 	VALUES 
    (100032,"admin",null,"admin",null,"12345","admin@gmail.com","Activo",'2019-05-25',1,1);
    
    
    INSERT INTO procedencia(nombreprocedencia) 
 	VALUES
    ("cafeteria"),
    ("salon"),
    ("oficinas"),
    ("puntoecologico");
    
    
   
    INSERT INTO entrada(fechaentrada,procedencia,usuario_numdocumento,usuario_tipodocumento_idtipodocumento) 
 	VALUES
    ('2019-02-21',2,100032,1),
    ('2019-02-22',3,100032,1),
    ('2019-02-23',4,100032,1),
    ('2019-02-25',1,100032,1),
	('2019-02-25',2,100032,1);
    
    
    
    INSERT INTO movimiento(fechamovimiento,destino,totalmovimiento) 
 	VALUES
    ('2019-03-12',"Venta",85000),
    ('2018-09-11',"Venta",96000),
    ('2018-11-25',"Huerta",null);
    
    
    

    INSERT INTO clasificacion(color,descripcioncolor) 
 	VALUES
    ("Amarillo"," Se guardara toda clase de plasticos"),
    ("Verde","Se guardara toda clase de desechos organicos"),
    ("Azul"," Se guardara toda clase de papel y cartón"),
    ("Gris"," Se guardara toda clase de vidrio y metales"),
    ("Negro"," Se guardara toda clase de baterias y pilas");

    
    
    INSERT INTO material(nombrematerial,clasificacion_idclasificacion) 
 	VALUES
    ("Envases de plastico",1),
	("Briks",1),
	("latas",4),
	("Envases de papel",3),
	("Envases de cartón",3),
	("Envases de vidrio",4),
	("pilas de toda clase",5),
	("cascaras y restos de frutas ",2),
    ("periodicos o revistas",3),
    ("toda clase de papel",3);
  
    
    INSERT INTO detallemovimiento(material_idmaterial,movimiento_idmovimiento,cantidadmovimiento,pesomovimiento) 
 	VALUES
    (1,1,15,0.5),
    (3,1,10,null),
    (4,1,8,1.0),
    (10,1,35,2),
    (5,2,13,2.1),
    (6,2,22,8.5),
    (7,2,15,2.2),
    (9,3,32,6.5),
    (8,3,35,NULL),
    (1,3,55,NULL),
    (3,3,16,null);
    
    
    
    INSERT INTO detalleentrada(material_idmaterial,entrada_identrada,cantidadentrada,pesoentrada) 
 	VALUES
    (1,1,25,2.2),
	(2,1,5,0.7),
    (3,1,8,1),
    (4,1,11,1.5),
    (5,1,4,0.4),
    (6,1,10,1.8),
    (8,1,NULL,4.3),
    (9,1,16,2.3),
    (10,1,22,NULL);