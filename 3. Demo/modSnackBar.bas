﻿B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=8.1
@EndOfDesignText@
'Static code module
Sub Process_Globals
	Public name As String = "snackCode"
	Public title As String = "Snack Bar"
	Private vm As BANanoVM
End Sub

Sub Code
	vm = pgIndex.vm
	'create a container to hold all contents
	Dim cont As VMContainer = vm.CreateContainer(name,Me)
	'hide this container
	cont.Hide
	'create 2 columns each spanning 12 columns
	cont.addrows(10).AddColumns2x6
	'
	vm.CreateButton("btns1", Me).SetLabel("Open Snackbar").SetDark(True).SetColorIntensity(vm.COLOR_RED, vm.INTENSITY_DARKEN2).AddToContainer(cont, 1, 1)
	'
	vm.AddContainer(cont)
End Sub

Sub btns1_click(e As BANanoEvent)
	vm.ShowSnackBar("I am a snack bar!")
End Sub
