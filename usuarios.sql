create DATABASE usuarios;
use usuarios;
Create table usuario(
ID int primary key not null auto_increment,
nombre varchar(40) not null,
email varchar(255) not null,
contrasena varchar(255) not null

);
create TABLE videos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  file_path VARCHAR(255)
);
insert into usuario() values(0,"juan","juanpa@gmail.com","hola123");

select * from usuario;


	select
	u.ID,
	u.nombre,
	u.email,
	u.contrasena
	from usuario u;
    
DELETE FROM usuario WHERE ID!=1;

SELECT * FROM usuario WHERE nombre = "juan" && contrasena= "hola123";


SELECT * FROM videos;
DELETE FROM videos WHERE ID!=0;
