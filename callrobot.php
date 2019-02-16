<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Configuración de robot</title>

<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<!-- Bootstrap CSS -->
  <link rel="stylesheet" href="Bootstrap_4/css/bootstrap.min.css">
<!-- Alertify CSS -->
  <link rel="stylesheet" href="plugins/alertifyjs/css/alertify.min.css">
<!-- Alertify theme default -->
<link rel="stylesheet" href="plugins/alertifyjs/css/themes/default.min.css"/>
</head>
<body background="img/robot.jpg">
  <style type="text/css">
  body {
    background-size: 100% ;
    background-repeat: no-repeat;
     }
  </style>

  <nav class="navbar navbar-dark bg-dark" style="filter:alpha(opacity=40); opacity:0.85;">
  <a href="https://www.alteor.cl/"target="_blank"><span class="navbar-brand mb-0 h1" style="color:red;">A L T E O R</span></a>

  <ul class="nav justify-content-end">
  <li class="nav-item">
    <img style="width:60px; height:50px; padding:10px;" src="img/chile.jpg"></img>
  </li>
  <li class="nav-item">
    <img style="width:60px; height:50px; padding:10px;" src="img/argentina.jpg"></img>
  </li>
  <li class="nav-item">
    <img style="width:60px; height:50px;padding:10px;" src="img/peru.jpg"></img>

  </li>
</ul>
</nav>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>




  <div class="container" style="filter:alpha(opacity=40); opacity:0.85;">
    <div class="page-header text-left">
      <h1>Configuración de robot <small>LLamados telefónicos</small></h1>
    </div>
    <form action="" method="POST">
      <div class="row">
      <div class="col-md-3">
          <p>Lista Gramáticas
         <select id="lista_reproduccion" name="grammar" class="form-control">
                  <option selected>Seleccione Grámatica....</option>
                  <option value="labPreguntaNombre_1.4.grxml">labPreguntaNombre_1.4.grxml</option>
                  <option value="labSiNoAbsolutos_1.2.grxml">labSiNoAbsolutos_1.2.grxml</option>
                  <option value="rc_SiNo_FechaCobranza_r1.grxml">rc_SiNo_FechaCobranza_r1.grxml</option>
                  <option value="rc_FechaCobranza_r1.grxml">rc_FechaCobranza_r1.grxml</option>
          </select>
        </p>
      </div>
      <div class="col-md-3">
        <p>Nivel Confianza
        <select id="videos" name="trust" class="form-control">
                  <option selected>Seleccione...</option>
                  <option value="40">40</option>
                  <option value="50">50</option>
                  <option value="60">60</option>
                  <option value="70">70</option>
                  <option value="80">80</option>
        </select>
      </p>
      </div>
      <div class="col-md-3">
       <p>Teléfono
      <input class="form-control" name=telefono type="text" maxlength="9" pattern="^[9|8|7|6|5|4|3]\d{8}$" placeholder="Ingrese télefono">
      </p>
      </div>
      <div class="col-md-3">
        <p><br><button id="enviar" name="btn_llamar" type="submit" class="btn btn-block btn-outline btn-success ">LLamar<i class="fas fa-phone"></i></button></p>
        <p><br><button id="stop" name="btn_stop " type="submit" class="btn btn-block btn-outline btn-danger">Detener<i class="fas fa-phone-slash"></i></button></p>
      </div>

      </div>
      </form>
    </div>

<!--librerias para alertas-->

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="JQuery/jquery-3.3.1.min.js"></script>
<!-- Popper.js-->
  <script src="Popper/popper.min.js"></script>
<!-- Bootstrap JS -->
  <script src="Bootstrap_4/js/bootstrap.min.js"></script>

<!-- Plugin Sweet alert -->
  <script src="plugins/sweetalert/sweetalert.min.js"></script>
<!-- Plugins Alertify -->
  <script src="plugins/alertifyjs/js/alertify.min.js"></script>
  <script>


   $("#stop").click(function (){
  	swal("Advertencia", "...Este botón no está en funcionamiento", "warning");
   });

</script>
 </body>
</html>

<?php

$servername = "127.0.0.1";
$username = "root";
$password = "";
$dbname = "bxp";
$link = mysqli_connect($servername, $username, $password, $dbname);
if (!$link) {
  echo "<script language='javascript'>";
  echo "alertify.error('Error de Coneccion a la BD')";
  echo "</script>";
  //die("Connection failed: " . mysqli_connect_error());
}

//condicion al presionar boton
if(isset($_POST['btn_llamar'])){

$trust = $_POST['trust'];
$grammar = $_POST['grammar'];
$telephone = $_POST['telefono'];



// Validación Por tipo de Gramática

if($grammar == 'labPreguntaNombre_1.4.grxml' ){
 $sql= "UPDATE cfg_questions SET inputtype='ASR',grammar='$grammar',confidencelevel='$trust',mrcp_opts='nit=3000&sct=1500&b=0&pr=fast' WHERE id=153";
 $res="UPDATE ct_valida_robot SET record_type='1',record_status='1',attempts='0',call_result='0',contact_info='$telephone', sched_time=null WHERE record_id=10738";
  if ($link->query($sql) === TRUE && $link->query($res) === TRUE ) {
 //echo "Llamando...";
echo "<script language='javascript'>";
echo "alertify.success('Llamando...')";
echo "</script>";

 }else {
   echo "<script language='javascript'>";
   echo "alertify.error('Todos los campos son obligatorios')";
   echo "</script>";
//echo "ERROR";
 }
 mysqli_close($link);
}
elseif ($grammar == 'labSiNoAbsolutos_1.2.grxml' ) {
 $sql="UPDATE cfg_questions SET inputtype='ASR',grammar='$grammar',confidencelevel='$trust',mrcp_opts='nit=3000&sct=1500&b=0&pr=fast' WHERE id=153";
 $res="UPDATE ct_valida_robot SET record_type='1',record_status='1',attempts='0',call_result='0',contact_info='$telephone',sched_time=null WHERE record_id=10738";
  if ($link->query($sql) === TRUE && $link->query($res) === TRUE ) {
//echo "Llamando...";
echo "<script language='javascript'>";
echo "alertify.success('Llamando...')";
echo "</script>";
 }else {
   echo "<script language='javascript'>";
   echo "alertify.error('Todos los campos son obligatorios')";
   echo "</script>";

  //echo "ERROR";
 }
 mysqli_close($link);

}elseif ($grammar == 'rc_SiNo_FechaCobranza_r1.grxml' ) {
$sql="UPDATE cfg_questions SET inputtype='ASR_DATE',grammar='$grammar',confidencelevel='$trust',mrcp_opts='nit=3000&sct=1500&b=0&pr=fast' WHERE id=153";
$res="UPDATE ct_valida_robot SET record_type='1',record_status='1',attempts='0',call_result='0', contact_info='$telephone',sched_time=null WHERE record_id=10738";
  if ($link->query($sql) === TRUE && $link->query($res) === TRUE ) {
 //echo "Llamando...";
 echo "<script language='javascript'>";
 echo "alertify.success('Llamando...')";
 echo "</script>";
 }else {
   echo "<script language='javascript'>";
   echo "alertify.error('Todos los campos son obligatorios')";
   echo "</script>";

//echo "ERROR";
 }
 mysqli_close($link);
} else {
$sql ="UPDATE cfg_questions SET inputtype='ASR_DATE',grammar='$grammar',confidencelevel='$trust',mrcp_opts='nit=3000&sct=1500&b=0&pr=fast' WHERE id=153";
$res="UPDATE ct_valida_robot SET record_type='1',record_status='1',attempts='0',call_result='0', contact_info='$telephone',sched_time=null WHERE record_id=10738";
  if ($link->query($sql) === TRUE && $link->query($res) === TRUE ) {
//echo "Llamando...";
echo "<script language='javascript'>";
echo "alertify.success('Llamando...')";
echo "</script>";
 }else {
   echo "<script language='javascript'>";
   echo "alertify.error('Todos los campos son obligatorios')";
   echo "</script>";
//echo "ERROR";
 }
 mysqli_close($link);
}
}




?>
