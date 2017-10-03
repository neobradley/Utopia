<?php
$datay1 = array($grade1, $grade2, $grade3, $grade4, $grade5, $grade6, $grade7, $grade8, $grade9, $grade10, $grade11, $grade12);

// Setup the graph
$graph = new Graph(300,250);
$graph->SetScale("textlin");

$graph->SetColor('#FFA500');
$graph->img->SetAntiAliasing(false);
$graph->title->Set('Progress Report (per Quarter)');
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