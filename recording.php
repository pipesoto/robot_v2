
<?php 

require('conection.php');
$query = "SELECT id , shortname FROM cfg_campaigns ORDER BY shortname ";
$resultado = $mysqli->query($query);




?>




<!DOCTYPE html>
<html lang="en">
<head>
  <title>robot_prueba</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script language="javascript" src="js/jquery-3.3.1.min.js" ></script>
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <!--date picker-->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

  <!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
  <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />
   <script>
    $(document).ready(function(){
      var date_input=$('input[name="date"]'); //our date input has the name "date"
      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
      var options={
        format: 'dd/mm/yyyy',
        container: container,
        todayHighlight: true,
        autoclose: true,
      };
      date_input.datepicker(options);
    })
  </script> 

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
</head>
<body>
  <!--navBar -->

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="callRobot.html">Call Robot</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="prueba.html">Home</a></li>
      <li><a href="#">Recording</a></li>
    </ul>
    <button class="btn btn-danger navbar-btn">Grammars</button>
  </div>
</nav>



<!-- end navbar -->

<!-- form-->
<div class="bootstrap-iso">
  <div class="container-fluid">
  <div class="row">
  <div class="col-md-12">

    
    <form id="combo" name="combo" action="guarda.php" method="post">
    <!--saltos de lineas posteriormente corregir en css-->
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

    <!-- end <br>-->

  <div class="form-row">

      
      <div class="form-group col-md-4">
        <label for="inputServer">Server</label>
        <input type="text" class="form-control" id="inputServer" placeholder="192.168.88.88">
      </div>

     
      <div class="form-group col-md-4">
        <label for="inputServer">Select Campaigns</label>
        <select name="cbx_estado" id="cbx_estado" class="form-control">
        <option value="0" class="form-control">Select Campaigns</option>
        <?php while($row = $resultado->fetch_assoc()) { ?>
          <option value="<?php echo $row['id']; ?>"><?php echo $row['shortname']; ?></option>
        <?php } ?>
      </select></div>

      <div class="selector-grammar form-group col-md-4">
        <label for="inputGrammar">Grammars</label>
        <select id="inputGrammar" class="form-control"></select>

      </div>  
      
      <div class="form-group  col-md-4">
        <label for="inputTelephone">Telephone</label>
        <input type="text" class="form-control" id="inputTelephone" placeholder="974389896">
      </div>
    <div class="form-row">
      <div class="form-group col-md-2"> 
        <label class="control-label" for="datebegin">Date begin</label>
        <input class="form-control" id="datebegin" name="date" placeholder="DD/MM/YYY" type="text"/>
      </div>
      <div class="form-group col-md-2"> 
        <label class="control-label" for="dateend">Date end</label>
        <input class="form-control" id="dateend" name="date" placeholder="DD/MM/YYY" type="text"/>
      </div>
    </div>
  </div>
  
      <div class="form-group col-md-4"> <!-- Submit button -->
        <button class="btn btn-primary " name="submit" type="submit">Buscar</button>
      </div>
     </form>
     

    </div>
  </div>    
 </div>
</div>

<!-- Form code ends --> 


</body>
</html>