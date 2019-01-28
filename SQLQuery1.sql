/*Q1*/
SELECT VendorName, VendorCity, VendorState
FROM AP.dbo.Vendors;

/*Q2*/
SELECT InvoiceNumber AS Number, InvoiceTotal AS Total, 
PaymentTotal + CreditTotal AS Credits
FROM AP.dbo.Invoices
WHERE InvoiceTotal <= 200;

/*Q3*/
SELECT VendorContactLName + ',' + VendorContactFName AS [Full Name]
FROM AP.dbo.Vendors
ORDER BY VendorContactLName ASC;

/*Q4*/
	SELECT *
	FROM AP.dbo.Invoices
	WHERE ((InvoiceTotal - (PaymentTotal + CreditTotal)) > 0 AND PaymentDate IS NULL)OR
	((InvoiceTotal - (PaymentTotal + CreditTotal)) <= 0 AND PaymentDate IS NOT NULL);


/*Q5*/
SELECT VendorName, VendorZipCode, DefaultAccountNo,AccountDescription
FROM AP.dbo.Vendors AS v JOIN AP.dbo.GLAccounts AS g
	ON v.DefaultAccountNo = g.AccountNo
WHERE g.AccountDescription = 'Computer Equipment'
ORDER BY v.VendorName; 

/*Q6*/
SELECT DISTINCT Vendors1.VendorName, Vendors1.VendorContactLName + ',' + Vendors1.VendorContactFName AS Name
FROM AP.dbo.Vendors AS Vendors1 JOIN AP.dbo.Vendors AS Vendors2
	ON Vendors1.VendorContactLName = Vendors2.VendorContactLName
ORDER BY Vendors1.VendorName;

/*Q7*/
		SELECT VendorName, 'Outside NY' AS VendorState
		FROM AP.dbo.Vendors
		WHERE VendorState != 'NY'
	UNION
		SELECT VendorName, 'NY' AS VendorState
		FROM AP.dbo.Vendors
		WHERE VendorState = 'NY'
		ORDER BY VendorName desc;

/*Q8*/
SELECT g.AccountNo, g.AccountDescription
FROM AP.dbo.GLAccounts AS g LEFT JOIN AP.dbo.InvoiceLineItems AS i
	ON g.AccountNo = i.AccountNo
	WHERE i.AccountNo IS NULL
	ORDER BY g.AccountNo;
	

