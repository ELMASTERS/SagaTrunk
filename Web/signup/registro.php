<html>
<head>
<title>RO2 GOTW - Revival Project</title>
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

</head>

<body>
<form action="validar.php" method="post" name="registro" class="Estilo3" id="registro">
  <p>Usuario (sólo minúsculas): 
    <label> 
    <input name="usuario" type="text" id="usuario" size="20" maxlength="20" />
    </label>
  </p>
  <p>Contraseña (sólo minúsculas): 
    <input name="pass" type="password" id="pass" size="20" maxlength="30" />
  </p>
  <p>Correo Electronico:
    <input name="email" type="text" id="email" size="20" maxlength="49" />
  </p>
  <p>Fecha de Nacimiento (aaaa-mm-dd) a(año) m(mes) d(día):
    <input name="date" type="text" id="date" size="10" maxlength="10" />
  </p>
  <p>Sexo: 
    <label>
    <select name="sexo" id="sexo">
      <option value="1">Hombre (Male)</option>
      <option value="2">Mujer (Female)</option>
    </select>
    </label>
  </p>
  <p align="center" class="Estilo4"> <font size="1" face="Verdana, Arial, Helvetica, sans-serif"><span class="Estilo5"> 
    <?php
					require('cfg/config.php');
					$randomnumone = rand("0", "9");
					$randomnumtwo = rand("0", "9");
					$randomnumthree = rand("0", "9");
					$randomnumfour = rand("0", "9");
					$randomnumfive = rand("0", "9");
					$randomnumsix = rand("0", "9");
					$total =  $randomnumone." ".$randomnumtwo." ".$randomnumthree." ".$randomnumfour." ".$randomnumfive." ".$randomnumsix;
					$form = $randomnumone.$randomnumtwo.$randomnumthree.$randomnumfour.$randomnumfive.$randomnumsix;
					$exploded = explode(" ", $total);
					$one = 0;
					$two = 0;
					$three = 0;
					$four = 0;
					$five = 0;
					$six = 0;
					while($exploded['0'] != $one){
							$one++;
					}
					if($exploded['0'] == $one){
							echo "<img src=\"$imagenes/image$one.gif\">";
					}
					while($exploded['1'] != $two){
							$two++;
					}
					if($exploded['1'] == $two){
							echo "<img src=\"$imagenes/image$two.gif\">";
					}
					while($exploded['2'] != $three){
							$three++;
					}
					if($exploded['2'] == $three){
							echo "<img src=\"$imagenes/image$three.gif\">";
					}
					while($exploded['3'] != $four){
							$four++;
					}
					if($exploded['3'] == $four){
							echo "<img src=\"$imagenes/image$four.gif\">";
					}
					while($exploded['4'] != $five){
							$five++;
					}
					if($exploded['4'] == $five){
							echo "<img src=\"$imagenes/image$five.gif\">";
					}
					while($exploded['5'] != $six){
							$six++;
					}
					if($exploded['5'] == $six){
							echo "<img src=\"$imagenes/image$six.gif\"><br>";
					}

					echo "<input type=\"hidden\" name=\"image\" value=\"$form\">";
					?>
    </span></font></p>
  <p>Numero de Verificacion: 
    <label>
    <input name="verificacion" type="text" id="verificacion" size="20" maxlength="6" />
    </label>
  </p>
  <p align="center">
    <label>
    <input type="submit" name="Submit" value="CREAR CUENTA" />
    </label>
</p>
</form>
</body>

</html>
