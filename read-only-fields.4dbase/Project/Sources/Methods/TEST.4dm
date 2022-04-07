//%attributes = {}
#DECLARE($signal : 4D:C1709.Signal)

READ WRITE:C146([Table_1:1])
READ ONLY:C145([Table_2:2])
ALL RECORDS:C47([Table_1:1])
SET MENU BAR:C67(1)

If (Count parameters:C259=0)
	
	GOTO SELECTED RECORD:C245([Table_1:1]; 2)  //lock it
	
	$signal:=New signal:C1641
	
	BRING TO FRONT:C326(New process:C317(Current method name:C684; 0; Current method name:C684; $signal))
	
	$signal.wait()
	
Else 
	
	FORM SET INPUT:C55([Table_1:1]; "Input")
	FORM SET OUTPUT:C54([Table_1:1]; "Output")
	
	$window:=Open form window:C675([Table_1:1]; "Input")
	
	MODIFY SELECTION:C204([Table_1:1])
	
	CLOSE WINDOW:C154($window)
	
	$signal.trigger()
	
End if 
