Sub main()
    Dim db As DAO.Database
    Dim rsQ As DAO.Recordset
    Dim rsA As DAO.Recordset
    Dim fd As DAO.Field
    Dim fdA As DAO.Field
    Dim ausgabe As String
    Dim qstArray() As Object
    Dim sql As String
    Set db = Application.CurrentDb
    
    sql = "SELECT * FROM Question"
    Set rsQ = db.OpenRecordset(sql)
    
    sql = "SELECT * FROM AntwortsQuestions"
    Set rsA = db.OpenRecordset(sql)
    

    Do While Not rsQ.EOF
        
        
        
       
        rsQ.MoveNext
    Loop
    
    
End Sub
