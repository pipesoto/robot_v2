<?php
$link = mysql_connect('192.168.88.69', 'admin', 'AltAdmin$')
    or die('No se pudo conectar: ' . mysql_error());
mysql_select_db('bxp') or die('No se pudo seleccionar la base de datos');

$query="SELECT id,shortname FROM cfg_campaigns ORDER BY shortname";
$result = mysql_query($query)
        or die("Ocurrio un error en la consulta SQL");
mysql_close();
echo '<option value="0">Choose...</option>';
while (($fila = mysql_fetch_array($result)) != NULL) {
    echo '<option value="'.$fila["id"].'">'.$fila["shortname"].'</option>';
}
// Liberar resultados
mysql_free_result($result);

// Cerrar la conexión
mysql_close($link);

?>
