use administracion;

# Query que genera el registro de profesores de un determinado colegio, en este caso L. C. Miramar

SELECT profesor.nombre,colegio.nombre FROM profesor 
	JOIN colegio on fk_colegio_profesor=id_colegio
	WHERE colegio.nombre='LICEO COMERCIAL MIRAMAR'
	ORDER BY profesor.nombre;

# Query que genera el registro de los alumnos que tienen promedio rojo por asignatura 

SELECT asignatura.nombre AS 'Nombre asignatura', nota.nota, alumno.nombre AS 'Nombre del Alumno' 
	FROM nota JOIN asignatura 
	ON nota.fk_asignatura_nota=id_asignatura 
	JOIN alumno 
	ON nota.fk_alumno_nota=id_alumno
	WHERE nota<4;

# Query que genera el registro de los alumnos con mejor promedio por asignatura

SELECT * FROM(SELECT asignatura.nombre AS 'nombre_asignatura', nota.nota, alumno.nombre AS 'Nombre del Alumno' 
		FROM nota JOIN asignatura 
		ON nota.fk_asignatura_nota=id_asignatura 
		JOIN alumno 
		ON nota.fk_alumno_nota=id_alumno
		ORDER BY nota.nota DESC
		LIMIT 10)
			 tmp_table
	GROUP BY tmp_table.nombre_asignatura;

