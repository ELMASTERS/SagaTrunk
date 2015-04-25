<style type="text/css">
<!--
.Estilo2 {font-size: 12px; color: #000000; font-family: Verdana, Arial, Helvetica, sans-serif; font-weight: bold; }
.Estilo3 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
}
body,td,th {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #000000;
}
.Estilo4 {
	font-size: 14px;
	font-weight: bold;
}
.Estilo5 {font-size: 14px}
-->
</style>
<?
include ("cfg/config.php");
$usuario2 = $_POST['usuario']; 
$contra2 = $_POST['pass']; 
$sexo2 = $_POST['sexo']; 
$email2 = $_POST['email']; 
$date2 = $_POST['date']; 
$verificacion2 = $_POST['verificacion']; 
$num2 = $_POST['image']; 

if(empty($usuario2) || empty($contra2) || empty($sexo2) || empty($email2) || empty($verificacion2) || empty($date2)){ 
echo "Tienes que completar todos los Campos<br>";
die("NO SE COMPLETO EL REGISTRO<br>");
} 

if(!ereg("[a-z||0-9]", $usuario2)){
echo "Favor de usar solo a-z, 0-9 en usuario y contraseña!<br>";
die("NO SE COMPLETO EL REGISTRO<br>");
}

if(!ereg("[a-z||0-9]", $contra2)){
echo "Favor de usar solo a-z, 0-9 en usuario y contraseña!<br>";
die("NO SE COMPLETO EL REGISTRO<br>");
}

if(!ereg("[a-z||0-9]@[a-z||0-9].[a-z]", $email2)){ 
echo "Correo Electronico INCORRECTO!<br>";
die("NO SE COMPLETO EL REGISTRO<br>");
}

if(!ereg("-[0-9]", $date2)){ 
echo "Solo números y guiones en fecha de nacimiento!<br>";
die("NO SE COMPLETO EL REGISTRO<br>");
}

if($num2 != $verificacion2){
echo "Verificacion INCORRECTO!<br>";
die("NO SE COMPLETO EL REGISTRO<br>");
}

$link = mysql_connect ("$host","$usuario","$password");

if(!$link){
echo "Error MySQL: ".mysql_error()."<br>";
die("NO SE COMPLETO EL REGISTRO<br>"); 
}

if(!mysql_select_db("$ragnarok", $link)){ 
echo "Error MySQL: ".mysql_error()."<br>";
die("NO SE COMPLETO EL REGISTRO<br>");
}

$buscaremail = "SELECT email FROM login_email WHERE email LIKE '$email2'";
$resultado = mysql_query($buscaremail);

if (mysql_num_rows($resultado) > 0){
echo "Error al Checkear Correo Electronico: YA EXISTE<br> ";
die("NO SE COMPLETO EL REGISTRO<br>"); 
}

$buscarusuario = "SELECT userid FROM login WHERE userid LIKE '$usuario2'"; 
$resultadouser = mysql_query($buscarusuario);

if (mysql_num_rows($resultadouser) > 0){
echo "Error al Checkear Usuario: YA EXISTE<br> ";
die("NO SE COMPLETO EL REGISTRO<br>"); 
}

$contra3 = md5($contra2);
$date3 = date("Y-m-d");
$sql = mysql_query("INSERT INTO login(Username, Password, Gender, IsActivated, HasAgreed, DateOfBirth, DateOfRegistration) VALUES ('$usuario2', '$contra3', '$sexo2', '1', '1', '$date2', '$date3')");

if(!$sql){
echo "Error MySQL: ".mysql_error()."<br>";
die("ERROR EN MYSQL!, NO SE COMPLETO EL REGISTRO<br>");
}

echo "Gracias por registrarte.<br>";
?>
