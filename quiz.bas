Sub quiz()
    Dim db As DAO.Database
    Dim rsQ, rsA As DAO.Recordset
    Dim isExam
    Dim answers, correctAns, sql As String
    Dim userAnswer As String
    Dim i, versuchen, richtig As Integer
    richtig = 0
    versuchen = 0
    Set db = Application.CurrentDb
    sql = "SELECT * FROM Question"
    Set rsQ = db.OpenRecordset(sql)
    isExam = MsgBox("Willst du eine Prüfung schreiben?", vbYesNo, "Frage")
    Do While Not rsQ.EOF
        answers = ""
        userAnswer = ""
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
            userAnswer = InputBox(rsQ!Name & vbCrLf & vbCrLf & answers, "Quiz")
            If userAnswer = correctAns Then
                richtig = richtig + 1
            Else: versuchen = versuchen + 1
            End If
            If isExam = vbYes Then userAnswer = correctAns
        Wend
        rsQ.MoveNext
    Loop
    If isExam = vbYes Then
        MsgBox "Erfolg!" & vbCrLf & "Anzahl den richtigen Antworten: " & _
            richtig & vbCrLf & "In %: " & 100 / rsQ.RecordCount * richtig, vbInformation, "Prüfung Ergebnis"
    Else: MsgBox "Erfolg!" & vbCrLf & "Anzahl den falschen Versuchen: " & versuchen, vbInformation, "Training Ergebnis"
    End If
End Sub
