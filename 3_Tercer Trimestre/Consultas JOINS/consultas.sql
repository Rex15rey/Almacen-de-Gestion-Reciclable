-- consultas 
use rrrsystem; 

 
-- 1 información importante del usuario  
select  concat((primernombre),primerapellido) as Nombre_Usuario , numdocumento, nombredocumento, estadousuario, Nombretipousuario as tipodeusuario
from usuario , tipodocumento,tipousuario
where Nombretipousuario=(select Nombretipousuario from tipousuario)
group by Nombre_Usuario;


-- 2  gestionar material  
select material.nombrematerial,clasificacion.color
from clasificacion
inner join material
on material.clasificacion_idclasificacion=clasificacion.idclasificacion
order by color;

-- 3 responsable de la entrada 
select concat((primernombre),primerapellido) as Nombre_Usuario ,procedencia.nombreprocedencia, entrada.fechaentrada
from usuario
inner join entrada
on usuario.numdocumento=entrada.usuario_numdocumento
inner join procedencia 
on procedencia.idprocedencia=entrada.procedencia
order by fechaentrada;

-- 4  detalle de entrada
select entrada.fechaentrada, detalleentrada.pesoentrada, detalleentrada.cantidadentrada,material.nombrematerial
from entrada
inner join detalleentrada
on entrada.identrada=detalleentrada.entrada_identrada
inner join material
on material.idmaterial=detalleentrada.material_idmaterial
order by fechaentrada;

-- 5 gestionar entrada
select concat((primernombre),primerapellido) as Nombre_Usuario, entrada.fechaentrada,procedencia.nombreprocedencia,
material.nombrematerial,detalleentrada.pesoentrada,detalleentrada.cantidadentrada
from usuario
inner join entrada
on usuario.numdocumento=entrada.usuario_numdocumento
inner join procedencia 
on procedencia.idprocedencia=entrada.procedencia
inner join detalleentrada
on entrada.identrada=detalleentrada.entrada_identrada
inner join material
on material.idmaterial=detalleentrada.material_idmaterial
order by fechaentrada;

-- 6 gestionar usuario
select primernombre,segundonombre,primerapellido,segundoapellido,nombredocumento as tipo_de_documento,numdocumento,
Email,estadousuario,FechaRegistro,
Nombretipousuario as tipo_de_estado 
from usuario, tipousuario,tipodocumento
group by numdocumento;

-- 7 gestionar movimiento 

select movimiento.destino,movimiento.fechamovimiento,movimiento.totalmovimiento,
detallemovimiento.cantidadmovimiento,detallemovimiento.pesomovimiento,material.nombrematerial 
from movimiento
inner join detallemovimiento
on movimiento.idmovimiento=detallemovimiento.movimiento_idmovimiento
inner join material
on material.idmaterial=detallemovimiento.material_idmaterial;

-- 8 
select count(material.nombrematerial) as cantidad_material,clasificacion.color
from clasificacion
inner join material
on material.clasificacion_idclasificacion=clasificacion.idclasificacion
group by color;

-- 9
select max(detalleentrada.cantidadentrada) as maxima_cantidad_material,  material.nombrematerial
from detalleentrada
join material
on material.idmaterial=detalleentrada.material_idmaterial;

-- 10 
select detalleentrada.cantidadentrada as maxima_cantidad_material,  material.nombrematerial
from detalleentrada
join material
on material.idmaterial=detalleentrada.material_idmaterial;