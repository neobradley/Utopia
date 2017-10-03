<?php
$datay1 = array($activeTeacher1, $activeTeacher2, $activeTeacher3, $activeTeacher4, $activeTeacher5, $activeTeacher6, $activeTeacher7, $activeTeacher8, $activeTeacher9, $activeTeacher10, $activeTeacher11, $activeTeacher12);
$datay2 = array($inactiveTeacher1, $inactiveTeacher2, $inactiveTeacher3, $inactiveTeacher4, $inactiveTeacher5, $inactiveTeacher6, $inactiveTeacher7, $inactiveTeacher8, $inactiveTeacher9, $inactiveTeacher10, $inactiveTeacher11, $inactiveTeacher12);

// Setup the graph
$graph = new Graph(300,250);
$graph->SetScale("textlin");
$graph->SetColor('#FFA500');
$graph->img->SetAntiAliasing(false);
$graph->title->Set('Attendance of Teacher');
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