<?php
$datay1 = array($activeStudent1, $activeStudent2, $activeStudent3, $activeStudent4, $activeStudent5, $activeStudent6, $activeStudent7, $activeStudent8, $activeStudent9, $activeStudent10, $activeStudent11, $activeStudent12);
$datay2 = array($inactiveStudent1, $inactiveStudent2, $inactiveStudent3, $inactiveStudent4, $inactiveStudent5, $inactiveStudent6, $inactiveStudent7, $inactiveStudent8, $inactiveStudent9, $inactiveStudent10, $inactiveStudent11, $inactiveStudent12);

// Setup the graph
$graph->SetScale("textlin");
$graph->SetColor('#FFA500');
$graph->img->SetAntiAliasing(false);
$graph->title->Set('Attendance of Students');
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
$p1->SetColor("#6495ED");;
$p1->SetLegend('Active');

 //Create the second line
$p2 = new LinePlot($datay2);
$graph->Add($p2);
$p2->SetColor("#B22222");
$p2->SetLegend('Inactive');

$graph->legend->SetFrameWeight(1);
$graph->legend->SetAbsPos(5,35,'right','top');

// Output line
$graph->Stroke();

?>