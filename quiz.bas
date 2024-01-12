Sub quiz()
    Dim db As DAO.Database
    Dim rsQ As DAO.Recordset
    Dim fd As DAO.Field
    Dim answers As String
    Dim correctAns As String
    Dim userAnswer As String
    Dim versuchen As Integer
    versuchen = 0
    userAnswer = ""
    Dim sql As String
    Set db = Application.CurrentDb
    
    sql = "SELECT * FROM Question"
    Set rsQ = db.OpenRecordset(sql)
    
    Do While Not rsQ.EOF
        Dim rsA As DAO.Recordset
        Dim i As Integer
        i = 1
        sql = "SELECT * FROM AntwortsQuestions WHERE questionId = " & rsQ!ID
        Set rsA = db.OpenRecordset(sql)
        
        Do While Not rsA.EOF
            answers = answers & "[" & i & "] " & rsA!answer & vbCrLf
            If rsA!correct = True Then correctAns = i
            i = i + 1
            rsA.MoveNext
        Loop
        
        While userAnswer <> correctAns
            userAnswer = InputBox(rsQ!Name & vbCrLf & vbCrLf & answers)
            If userAnswer <> correctAns Then versuchen = versuchen + 1
        Wend
       
        answers = ""
        userAnswer = ""
        rsQ.MoveNext
    Loop
    
    
     MsgBox "Erfolg!" & vbCrLf & "Anzahl den falschen Versuchen: " & versuchen
    
End Sub
