Sub quiz()

    Dim db As DAO.Database
    Dim rsQ As DAO.Recordset
    Dim fd As DAO.Field
    Dim answers As String
    Dim correctAns As String
    Dim userAnswer As String
    userAnswer = ""
    Dim sql As String
    Set db = Application.CurrentDb
    
    sql = "SELECT * FROM Question"
    Set rsQ = db.OpenRecordset(sql)
    
    
    Do While Not rsQ.EOF
        Dim rsA As DAO.Recordset
    
        sql = "SELECT * FROM AntwortsQuestions WHERE questionId = " & rsQ!ID
        Set rsA = db.OpenRecordset(sql)
        
        Do While Not rsA.EOF
            answers = answers & "[" & rsA!ID & "]" & rsA!answer & vbCrLf
            If rsA!correct = True Then correctAns = rsA!ID
            rsA.MoveNext
        Loop
        
        
        
        While userAnswer <> correctAns
            userAnswer = InputBox(rsQ!Name & vbCrLf & vbCrLf & answers)
        Wend
       
        answers = ""
        userAnswer = ""
        rsQ.MoveNext
    Loop
    
    
     MsgBox "Erfolg!"
    
End Sub
