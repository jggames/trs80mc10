VERSION 5.00
Object = "{27395F88-0C0C-101B-A3C9-08002B2F49FB}#1.1#0"; "PICCLP32.OCX"
Begin VB.Form StrategoG 
   AutoRedraw      =   -1  'True
   Caption         =   "Stratego Board"
   ClientHeight    =   5475
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8265
   LinkTopic       =   "Form1"
   ScaleHeight     =   365
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   551
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Start The Game"
      Height          =   375
      Left            =   5520
      TabIndex        =   1
      Top             =   4920
      Width           =   1575
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   5490
      Left            =   0
      Picture         =   "StrategoG.frx":0000
      ScaleHeight     =   366
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   550
      TabIndex        =   0
      Top             =   0
      Width           =   8250
      Begin VB.CommandButton Command2 
         Caption         =   "Quit"
         Height          =   375
         Left            =   7200
         TabIndex        =   15
         Top             =   4920
         Width           =   855
      End
      Begin PicClip.PictureClip PictureClip2 
         Left            =   -480
         Top             =   5880
         _ExtentX        =   9525
         _ExtentY        =   794
         _Version        =   393216
         Picture         =   "StrategoG.frx":D402
      End
      Begin PicClip.PictureClip PictureClip3 
         Left            =   7320
         Top             =   5880
         _ExtentX        =   1588
         _ExtentY        =   794
         _Version        =   393216
         Picture         =   "StrategoG.frx":152E4
      End
      Begin PicClip.PictureClip PictureClip1 
         Left            =   6240
         Top             =   5880
         _ExtentX        =   1799
         _ExtentY        =   900
         _Version        =   393216
         Picture         =   "StrategoG.frx":1684E
      End
      Begin VB.Image Image1 
         Height          =   1020
         Left            =   5160
         Picture         =   "StrategoG.frx":183B8
         Top             =   5880
         Visible         =   0   'False
         Width           =   1020
      End
      Begin VB.Shape Shape3 
         BorderColor     =   &H0000FF00&
         BorderWidth     =   2
         Height          =   2055
         Left            =   225
         Top             =   3240
         Visible         =   0   'False
         Width           =   5055
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Start a New Game"
         BeginProperty Font 
            Name            =   "Lucida Sans"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   5520
         TabIndex        =   14
         Top             =   240
         Width           =   2535
      End
      Begin VB.Shape Shape2 
         BorderColor     =   &H0000FFFF&
         BorderWidth     =   2
         Height          =   495
         Left            =   2280
         Top             =   1680
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   255
         Index           =   11
         Left            =   7860
         TabIndex        =   13
         Top             =   2040
         Width           =   135
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   255
         Index           =   10
         Left            =   7860
         TabIndex        =   12
         Top             =   1440
         Width           =   135
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "8"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   255
         Index           =   9
         Left            =   7860
         TabIndex        =   11
         Top             =   840
         Width           =   135
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "5"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   255
         Index           =   8
         Left            =   7230
         TabIndex        =   10
         Top             =   2040
         Width           =   135
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "4"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   255
         Index           =   7
         Left            =   7230
         TabIndex        =   9
         Top             =   1440
         Width           =   135
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "4"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   255
         Index           =   6
         Left            =   7230
         TabIndex        =   8
         Top             =   840
         Width           =   135
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "4"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   255
         Index           =   5
         Left            =   6630
         TabIndex        =   7
         Top             =   2040
         Width           =   135
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "3"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   255
         Index           =   4
         Left            =   6630
         TabIndex        =   6
         Top             =   1440
         Width           =   135
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "2"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   255
         Index           =   3
         Left            =   6630
         TabIndex        =   5
         Top             =   840
         Width           =   135
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   255
         Index           =   2
         Left            =   6030
         TabIndex        =   4
         Top             =   2040
         Width           =   135
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   255
         Index           =   1
         Left            =   6030
         TabIndex        =   3
         Top             =   1440
         Width           =   135
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "6"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FFFF&
         Height          =   255
         Index           =   0
         Left            =   6030
         TabIndex        =   2
         Top             =   840
         Width           =   135
      End
      Begin VB.Shape Shape1 
         BorderColor     =   &H0000FFFF&
         BorderWidth     =   2
         Height          =   495
         Left            =   5520
         Top             =   840
         Visible         =   0   'False
         Width           =   495
      End
   End
End
Attribute VB_Name = "StrategoG"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'********************************
'**  Subject :Stratego Game OCX
'**  Credit  :Carl Harvey
'**  Date    :02-1999
'**  Info    :elterrorista@videotron.ca
'********************************
Dim DiffBoard, DiffBoardy As Integer 'Variable de Difference entre le bord de gauche et le debut du Board
Dim DiffPitinitx, DiffPitinity As Integer 'Variable de Difference entre le haut et le debut du Board
Dim OkPlacePiece As Boolean
Dim BoardPit(0 To 3, 0 To 2)
Dim BoardBoard(0 To 9, 0 To 9)
Dim CharacterT(0 To 11)
Dim MetCettePit As Integer
Dim PartienCour As Boolean
Dim NbPieceOnBoard As Integer
Dim Selected As Boolean
Dim PitSelected
Dim EatOtherPiece As Boolean
Dim selection(0 To 1)
Private Sub Command1_Click()
initGame
End Sub

Private Sub Command2_Click()
End
End Sub

Private Sub Form_Load()
PictureClip1.Cols = 2
PictureClip2.Cols = 12
PictureClip3.Cols = 2
DiffBoard = 13: DiffBoardy = 13 'Pixel
DiffPitinitx = 370: DiffPitinity = 60 'Pixel
Initaffichegrade
DrawBoard
DrawPitouneInit
End Sub
Public Sub initGame()
OkPlacePiece = True
MetCettePit = 0
DrawBoard
DrawPitouneInit
Initvalpitamettre
Shape1.Visible = True: Shape2.Visible = True: Shape3.Visible = True
Label2.Caption = "Bombe"
Shape1.Left = DiffPitinitx
Shape1.Top = DiffPitinity
MetCettePit = 0
NbPieceOnBoard = 0
DrawBoardJ2
PartienCour = True
End Sub
Private Sub Initvalpitamettre()
'Met le nombre de pitoune pour chaque pitoune
'show the number of piece for each charter
Label1(0).Caption = 6: Label1(1).Caption = 1: Label1(2).Caption = 1: Label1(3).Caption = 2: Label1(4).Caption = 3: Label1(5).Caption = 4: Label1(6).Caption = 4: Label1(7).Caption = 4: Label1(8).Caption = 5: Label1(9).Caption = 8: Label1(10).Caption = 1: Label1(11).Caption = 1
End Sub
Private Sub DrawBoard()
'Draw le Board Pieces verte
'draw the green on the board
Dim i, i2 As Integer
For i = 0 To 9
  For i2 = 0 To 9
   Picture1.PaintPicture PictureClip1.GraphicCell(1), i * 34 + DiffBoard, i2 * 34 + DiffBoardy
   BoardBoard(i, i2) = -1
  Next i2
Next i
'Draw le Board Pieces bleu(Lac)
'draw blue pieces
 BoardBoard(2, 4) = -2: BoardBoard(3, 4) = -2
 BoardBoard(2, 5) = -2: BoardBoard(3, 5) = -2
 BoardBoard(6, 4) = -2: BoardBoard(7, 4) = -2
 BoardBoard(6, 5) = -2: BoardBoard(7, 5) = -2
 Picture1.PaintPicture Image1.Picture, 2 * 34 + DiffBoard, 4 * 34 + DiffBoardy
 Picture1.PaintPicture Image1.Picture, 6 * 34 + DiffBoard, 4 * 34 + DiffBoardy
End Sub
Private Sub DrawPitouneInit()
Dim nb, i, i2 As Integer
For i = 0 To 3
  For i2 = 0 To 2
   Picture1.PaintPicture PictureClip2.GraphicCell(nb), i * 40 + DiffPitinitx, i2 * 40 + DiffPitinity
   BoardPit(i, i2) = nb
   nb = nb + 1
  Next i2
Next i
End Sub
Private Sub DrawBoardJ2()
Dim i, i2 As Integer
For i = 0 To 9
  For i2 = 0 To 3
     Picture1.PaintPicture PictureClip3.GraphicCell(1), i * 34 + (DiffBoard + 2), i2 * 34 + (DiffBoardy + 2)
  Next i2
Next i
End Sub

Private Sub Picture1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
 If OkPlacePiece Then
   Dim temp1, temp2
   If X > 360 And Y > 60 And X < 520 And Y < 170 Then
    'devant les Pitounes a placer
    
    temp1 = Int((X - 360) / 40)
    temp2 = Int((Y - 60) / 40)
    MetCettePit = BoardPit(temp1, temp2)
    Shape1.Left = temp1 * 40 + DiffPitinitx
    Shape1.Top = temp2 * 40 + DiffPitinity
    Label2.Caption = CharacterT(MetCettePit)
   Else
   'Devant le Board
   If X > DiffBoard And Y > DiffBoardy + 205 And X < 350 And Y < 350 Then
    temp1 = Int((X - DiffBoard) / 34)
    temp2 = Int((Y - DiffBoardy) / 34)
    If BoardBoard(temp1, temp2) <> -1 Then EnlevePit temp1, temp2: Exit Sub
    If Val(Label1(MetCettePit).Caption) > 0 Then
    NbPieceOnBoard = NbPieceOnBoard + 1
    MetPitounesurtab temp1, temp2, MetCettePit
    End If
    If NbPieceOnBoard = 40 Then
     Dim rep
     rep = MsgBox("You have finish ?", vbYesNo, "Qestion")
     If rep = vbYes Then
      OkPlacePiece = False
      Shape3.Visible = False
      Shape1.Visible = False
     Else
      EnlevePit temp1, temp2: Exit Sub
     End If
    End If
    End If
   End If
 Else
  If X > DiffBoard And Y > DiffBoardy And X < 350 And Y < 350 Then
    temp1 = Int((X - DiffBoard) / 34)
    temp2 = Int((Y - DiffBoardy) / 34)
    If Selected Then
     If temp1 = selection(0) And temp2 = selection(1) Then
      Selected = False
      PitSelected = -1
      selection(0) = -1
      selection(1) = -1
      Shape2.BorderColor = &HFFFF&
      Exit Sub
     End If
     'if scout
     
     If (Abs(temp1 - selection(0)) = 1 And temp2 = selection(1)) Or (Abs(temp2 - selection(1)) = 1 And (temp1 = selection(0))) Then
       If BoardBoard(temp1, temp2) > 12 Then
         'Check Mange l'autre
         MsgBox "Eat Other Piece"
       Else
       If BoardBoard(temp1, temp2) = -1 Then
        Bougepiece temp1, temp2
       End If
       End If
     End If
    Else
    If BoardBoard(temp1, temp2) > 0 And BoardBoard(temp1, temp2) < 11 Then
      Selected = True
      PitSelected = BoardBoard(temp1, temp2)
      selection(0) = temp1
      selection(1) = temp2
     Shape2.BorderColor = &HFF&
    End If
    End If
  End If
End If
End Sub
Private Sub Bougepiece(ind1, ind2)
BoardBoard(ind1, ind2) = BoardBoard(selection(0), selection(1))
BoardBoard(selection(0), selection(1)) = -1
Picture1.PaintPicture PictureClip1.GraphicCell(1), selection(0) * 34 + DiffBoard, selection(1) * 34 + DiffBoardy
MetPitounesurtab ind1, ind2, PitSelected
selection(0) = -1: selection(1) = -1
Selected = False
Shape2.Visible = False
Shape2.BorderColor = &HFFFF&
End Sub
Private Sub EnlevePit(ind1, ind2)
 Picture1.PaintPicture PictureClip1.GraphicCell(1), ind1 * 34 + DiffBoard, ind2 * 34 + DiffBoardy
 Label1(BoardBoard(ind1, ind2)).Caption = Val(Label1(BoardBoard(ind1, ind2)).Caption) + 1
 BoardBoard(ind1, ind2) = -1
 NbPieceOnBoard = NbPieceOnBoard - 1
End Sub
Private Sub MetPitounesurtab(ind1, ind2, pit)
 Picture1.PaintPicture PictureClip2.GraphicCell(pit), ind1 * 34 + DiffBoard + 2, ind2 * 34 + DiffBoardy + 2
 BoardBoard(ind1, ind2) = pit
 If OkPlacePiece Then Label1(pit).Caption = Val(Label1(pit).Caption) - 1
End Sub
Private Sub Picture1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
 If PartienCour Then
  If Not Selected Then
   Dim temp1, temp2
   temp1 = Int((X - DiffBoard) / 34)
   temp2 = Int((Y - DiffBoardy) / 34)
   If X > DiffBoard And Y > DiffBoardy And X < 350 And Y < 350 Then
   If (OkPlacePiece And (X > DiffBoard And Y > DiffBoardy + 205 And X < 350 And Y < 350)) Or (Not temdeplacerpit And (BoardBoard(temp1, temp2) > 0 And BoardBoard(temp1, temp2) < 11)) Then
     Shape2.Visible = True
      If Shape2.Left <> temp1 * 34 + DiffBoard Or Shape2.Top <> temp2 * 34 + DiffBoardy Then
        Shape2.Left = temp1 * 34 + DiffBoard
        Shape2.Top = temp2 * 34 + DiffBoard
      End If
    Else
      Shape2.Visible = False
    End If
   Else
    Shape2.Visible = False
   End If
   End If
 End If
End Sub

Private Sub Initaffichegrade()
 CharacterT(0) = "Bombe"
 CharacterT(1) = "Marshal"
 CharacterT(2) = "Générale"
 CharacterT(3) = "Colonel"
 CharacterT(4) = "Major"
 CharacterT(5) = "Capitaine"
 CharacterT(6) = "Lieutenant"
 CharacterT(7) = "Sergent"
 CharacterT(8) = "Démineur"
 CharacterT(9) = "Éclaireur"
 CharacterT(10) = "Espion"
 CharacterT(11) = "Drapeau"
End Sub
