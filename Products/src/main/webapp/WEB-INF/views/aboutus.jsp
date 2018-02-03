<!DOCTYPE html>
<html lang="en">
<head>
  <title>Company Details</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    .col-sm-9
    {
    background-color:FloralWhite;
    }
    .col-sm-2
    {
    background-color:FloralWhite;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content 
      {    background-color:blue;
      height: auto;} 
   
    }
    h4
    {
    font-family:Georgia;
    color:Brown;
    }
    h2
    {
    font-family:Georgia;
    color:Purple;
    }
  </style>
</head>
<body>
<%@include file="header.jsp" %>
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav">
      <h4>Gorgeous world</h4>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="homePage">Home</a></li>
        <li><a href="services">Servics we provide</a></li>
        <li><a href="branch">Our Branches</a></li>
      </ul><br>
      </div>

    <div class="col-sm-9">
      <h4>About Company</h4>
      <hr>
      <h2>Gorgeous World</h2>
      <h5><span class="glyphicon glyphicon-time"></span> Post on Sep,29,2017.</h5>
      <p>Gorgeous world brings 15 years of experience in manufacturing furniture products. 
      It is proud of having skilled and motivated team members who are highly committed to 
      producing quality products and implementing positive change. 
      Their do it right the first time attitude is matched with the companys modern equipment
      to produce WoodMark Quality certified products with innovative designs. 
      WoodMark is a quality system designed for the wood products industry, 
      with the emphasis on ensuring consistent product quality and continuous improvement. 
      This innovative approach enables Dynamic to significantly increase its efficiency 
      and remain competitive in todays ever-changing marketplace.</p>

<div class="container-fluid bg-grey">
  <h2 class="text-center">CONTACT</h2>
  <div class="row">
    <div class="col-sm-5">
      <p>Contact us and we'll get back to you within 24 hours.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span>Marseille,Paris</p>
      <p><span class="glyphicon glyphicon-phone"></span> +00 1515151515</p>
      <p><span class="glyphicon glyphicon-envelope"></span>gworldfurn@gmail.com</p> 
    </div>
    <div class="col-sm-7">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Address" rows="5"></textarea><br>
      <div class="row">
        <div class="col-sm-12 form-group">
          <button class="btn btn-default pull-right" type="submit">Send</button>
        </div>
      </div> 
    </div>
  </div></div>

<h4>Leave a Comment:</h4>
      <form role="form">
        <div class="form-group">
          <textarea class="form-control" rows="3" required></textarea>
        </div>
        <button type="submit" class="btn btn-success">Submit</button>
      </form>
      <br><br>
      </div>
        </div>
      </div>
    </div>
  </div>
</div>
<footer class="container-fluid">
  <p>Don't dream just live your dreams</p>
</footer>

</body>
</html>
