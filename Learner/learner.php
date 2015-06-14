<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta name="description" content="Program to learn languages">
<meta name="keywords" content="Learning,languages,easy,english">
<title>Learner</title>
</head>
<body>
<div id="MF" style="width:576px">
<div style="background-color:mediumseagreen;">
Learner</div>
<form id="panels" action="">
  <textarea id="panel4" style="height:146px;width:192px;float:left" onclick="panel4click()">
  </textarea>
  <textarea id="panel5" style="height:146px;width:192px;float:left" onclick="panel5click()">
  </textarea>
</form>
<div style="height:170px">
<form id="markset">
  <label>Mark yourself</label>
  <fieldset style="width:35px;float:left">
    <input type="radio" name="mark" value="5">5<br/>
    <input type="radio" name="mark" value="4">4<br/>
    <input type="radio" name="mark" value="3">3<br/>
    <input type="radio" name="mark" value="2">2<br/>
  </fieldset>
  <div style="height:123px">
  <a href="<?php
global $fname;
$fname="dictionary.txt";
echo $fname?>" target="_blank"><button id="txtbtn" type="button" style="width:55px">txt</button></a>
  <button id="delbtn" type="button" style="width:55px">del</button>
  <button id="prevbtn" type="button" style="width:55px">prev</button>
  <button id="editbtn" type="button" style="width:55px">edit</button>
  </div>
  <input type="checkbox" name="Reverse" value="Reverse" checked="checked" onclick="check">Reverse
  </form>
</div>
<div id="Label2" style="background-color:steelblue;width:345px;float:left;">
Learning rate:</div>
<div id="content" style="background-color:slategrey;width:231px;float:left;text-align:right">Use '\' for words division</div>
<form name="newword" action="learner.php" method="post">
<div style="width:288px;float:left">Word:<input type="text" name="word"></div>
<div style="width:288px;float:left">Meaning:<input type="text" name="meaning"></div>
<input type="submit" value="Add the word to the dictionary" style="width:576px">
</form>
</div>
</body>
<foot>
<script>
var 
  i=0,j=0,iold=0,
  gf=[{b:0,r:0},{b:0,r:0},{b:0,r:0},{b:0,r:0},{b:0,r:0},{b:0,r:0},{b:0,r:0}],
  L=0,
  A=new Array(),
  regime=false, Editing=false, b5=false; Reverse=true;

function update_array()
{
  var k=1;
  for (ii=5;ii>=2;ii--)
  {
    gf[ii].r=gf[ii+1].r+k*(gf[ii-1].b-gf[ii].b);
    k=k<<1;
  }
}

function gen()
{
  var ty=0;
  iold=i;
  ty=Math.floor(Math.random()*gf[2].r)+1;
  if (ty<=gf[3].r)
    if (ty<=gf[4].r)
      if (ty<=gf[5].r)
        i=ty
      else i=gf[4].b+(ty-1-gf[5].r)>>1
    else i=gf[3].b+(ty-1-gf[4].r)>>2
  else i=gf[2].b+(ty-1-gf[3].r)>>3;
  i++;
  document.getElementById("Label2").innerHTML=ty+"--"+gf[2].r+"--"+i;
}

function rating()
{
  document.getElementById("Label2").innerHTML='Learning rate (5-4-3-2): '+parseInt(gf[4].b-gf[5].b)+'-'+parseInt(gf[3].b-gf[4].b)+'-'+parseInt(gf[2].b-gf[3].b)+'-'+parseInt(gf[1].b-gf[2].b);
}

function Rereading()
{
  A=[{mark:5}<?php
    global $L, $fname;
    $L=0;
    $input=fopen($fname,"r") or exit(",0];document.write('Unable to open file!');");
    $servant=array(',{frn:"','",rus:"');
    $char=fgetc($input);
    while (!feof($input))
    {
      for ($i=0;$i<2;$i++)
      {
        echo $servant[$i];
        while ($char!='#')
        {
          echo($char);
          $char=fgetc($input);
        }
        $char=fgetc($input);
      }
      echo '",mark:'.$char.'}';
      fgets($input);
      $L++;
      $char=fgetc($input);
    }
  fclose($input);
  ?>];
  L=<?php echo $L?>;
  for (ii=1;ii<=L;ii++)
    if (A[ii-1].mark>A[ii].mark)
      gf[A[ii].mark].b=ii;
  gf[1].b=L+1; gf[5].b=1; gf[6].r=0;
  for (ii=2;ii<5;ii++)
    if (gf[ii].b==0) gf[ii].b=gf[ii-1].b;
  update_array();
  rating();
}

function outp(pnl5)
{
  if (Editing)
    return;
  if (pnl5)
    document.getElementById("panel5").innerHTML="";
  if (Reverse)
    document.getElementById("panel4").innerHTML=A[i].rus
  else
    document.getElementById("panel4").innerHTML=A[i].frn;
  var rdio=document.getElementsByName("mark");
  for(ii=0;ii<rdio.length;ii++)
    rdio[ii].checked=false;
  regime=false;
  b5=true;
  document.getElementById("delbtn").innerHTML="del";
}

function panel4click()
{
  if (document.getElementById("panel5").innerHTML!="")
    gen();
  outp(true);
}

function panel5click()
{
  outp(false);
  if (Editing) 
    return;
  if (Reverse)
    document.getElementById("panel5").innerHTML=A[i].frn
  else
    document.getElementById("panel5").innerHTML=A[i].rus;
  document.getElementsByName("mark")[5-A[i].mark].checked=true;
}

function check()
{
  Reverse=document.getElementsByName("reverse");
}

Rereading();
i=L;
<?php
$word=$_POST["word"];
$meaning=$_POST["meaning"];
$s=$word."#".$meaning."#2";
//$append=fopen($fname,"a");
file_put_contents($fname,$s,FILE_APPEND);
//fclose($append);
echo 'word="'.$word.'"; meaning="'.$meaning
?>";
if (word=="")
{
  outp(false);
  document.getElementById("panel5").innerHTML=A[i].frn;
}
else
{
  A[L++]={frn:word,rus:meaning,mark:2}
}
document.write(L);
</script>
</foot>
</html>
