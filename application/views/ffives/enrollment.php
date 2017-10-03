<?php
$datay1 = array($students1, $students2, $students3, $students4, $students5, $students6, $students7, $students8, $students9, $students10, $students11, $students12);

// Setup the graph
$graph = new Graph(300,250);
$graph->SetScale("textlin");

$graph->SetColor('#FFA500');
$graph->img->SetAntiAliasing(false);
$graph->title->Set('Enrollment (per Quarter)');
$graph->SetBox(false);

$graph->img->SetAntiAliasing();

$graph->yaxis->HideZeroLabel();
$graph->yaxis->HideLine(false);
$graph->yaxis->HideTicks(false,false);

$graph->xgrid->Show();
$graph->xgrid->SetLineStyle("solid");
$graph->xaxis->SetTickLabels(array('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sept','Oct','Nov','Dec'));
$graph->xgrid->SetColor('#E3E3E3');

// Create the first line
$p1 = new LinePlot($datay1);
$graph->Add($p1);
$p1->SetColor("#6495ED");
//$p1->SetLegend('Line 1');


//$graph->legend->SetFrameWeight(1);

// Output line
$graph->Stroke();

?>