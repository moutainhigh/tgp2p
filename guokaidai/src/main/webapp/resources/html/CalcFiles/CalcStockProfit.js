
			function calc(oDocument)
			{
				var valprice=parseFloat(oDocument.all.edprice.value);
				var valone=parseFloat(oDocument.all.edone.value);
				
				var valresult=Round(valprice/valone);
				oDocument.all.edresult.value=valresult;
			}
