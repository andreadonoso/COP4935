var semester = "Spring 2023";
var totals = [0, 0, 0, 0];
var NID = "";
var dateTaken = "";
var urlBase = 'http://COP4935.com';
var extension = 'aspx';

function populateTodaysDate(dt)
{
	if (dt.length == 0)
	{
		var d = new Date();
		dateTaken = (d.getMonth() + 1) + "/" + d.getDate() + "/" + d.getFullYear();
		document.getElementById("TodaysDate").innerHTML = dateTaken;
	}
	else
	{
		dateTaken = dt;
		document.getElementById("TodaysDate").innerHTML = dateTaken;
	}
}

function populateSemesterNumber()
{
	document.getElementById("SemesterNumber").innerHTML = semester;
}

function populateNIDNumber()
{
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	document.getElementById("NIDNumber").innerHTML = urlParams.get("NID");
	NID = urlParams.get("NID");
}

function evaluateCell( cell )
{
	var value = document.getElementById(cell).value.trim();
	var parsedValue = 0;

	try
	{
		parsedValue = parseInt(value);

		if( parsedValue > 10 )
		{
			parsedValue = 10;
			document.getElementById(cell).value = "" + parsedValue;
		}
		else if( parsedValue < 0 )
		{
			parsedValue = 0;
			document.getElementById(cell).value = "" + parsedValue;
		}
	}
	catch (err)
	{
		parsedValue = 0;
		document.getElementById(cell).value = "0";
	}
	if (Number.isNaN(parsedValue))
	{
		parsedValue = 0;
		document.getElementById(cell).value = "0";
	}

	return parsedValue;
}

function totalColumn( col )
{
	var total = 0;

	for( var row=1; row<=10; row++ )
	{
		total += evaluateCell(row + "-" + col);
	}

	totals[col - 1] = total;
	document.getElementById(col + "-total").value = total;
}

function getGroup(grp)
{
	var value = "";
	if( grp == 1 )
	{
		value = document.getElementById("FirstGroupNumber").value;
	}
	else if (grp == 2)
	{
		value = document.getElementById("SecondGroupNumber").value;
	}
	else if (grp == 3)
	{
		value = document.getElementById("SecondGroupNumber").value;
	}
	else if (grp == 4)
	{
		value = document.getElementById("SecondGroupNumber").value;
	}

	var retValue = 0;
	try
	{
		retValue = parseInt( value );
	}
	catch (err) { retValue = 0; }

	if (Number.isNaN(value))
	{
		retValue = 0;
	}


	return retValue;
}

function sendResults(dateID)
{

	var buttonText = document.getElementById("btnSubmit").innerHTML.toString();
	if (buttonText.indexOf("ubmit") < 0)
	{
		window.location.href = "Landing.aspx";
	}

	for( var i=1; i<=4; i++ )
	{
		totalColumn(i);
	}

	var parts = "";
	for (var col = 1; col <= 4; col++)
	{
		for (var row = 1; row <= 10; row++)
		{
			parts += (""+evaluateCell(row + "-" + col));
			if( row < 10 )
			{
				parts += ",";
			}
		}
		if( col < 4 )
		{
			parts += ":";
		}
	}

	var grps = "" + getGroup(1) + ";" + getGroup(2) + ";" + getGroup(3) + ";" + getGroup(4);

	var comments = document.getElementById("Remarks").value;

	var o = {"dateID":dateID, "total1":totals[0],"total2":totals[1],"total3":totals[2],"total4":totals[3],"dateTaken":dateTaken,"NID":NID,"parts":parts,"groups":grps,"comments":comments};
	var json = JSON.stringify(o);

	var url = urlBase + '/SubmitPeerReview.' + extension;

	var xhr = new XMLHttpRequest();
	xhr.open("POST", url, true);
	xhr.setRequestHeader("Content-type", "application/json; charset=UTF-8");
	try
	{
		xhr.onreadystatechange = function ()
		{
			if (this.readyState == 4 && this.status == 200)
			{
				var jsonObject = JSON.parse(xhr.responseText);
				var message = "Your feedback has been submitted.";
				if (jsonObject.error != "")
				{
					message = jsonObject.error;
				}
				else
				{
					document.getElementById("btnSubmit").innerHTML = "Back to Landing Page";
				}
				document.getElementById("errorMessage").innerHTML = message;
			}
		};
		xhr.send(json);
	}
	catch (err)
	{
		document.getElementById("errorMessage").innerHTML = err.message;
	}

}
