HA$PBExportHeader$com_pw_gparent.srw
$PBExportComments$$$HEX3$$997d7f624351$$ENDHEX$$Window$$HEX5$$08ff71511a9028750130$$ENDHEX$$LEG(leg_pw_parent)$$HEX1$$6830$$ENDHEX$$MES(mes_pw_parent)$$HEX4$$6e30997d7f624351$$ENDHEX$$Window$$HEX3$$6e30435109ff$$ENDHEX$$
forward
global type com_pw_gparent from window
end type
type rb_off from radiobutton within com_pw_gparent
end type
type rb_on from radiobutton within com_pw_gparent
end type
type cb_f12 from commandbutton within com_pw_gparent
end type
type cb_f11 from commandbutton within com_pw_gparent
end type
type cb_f10 from commandbutton within com_pw_gparent
end type
type cb_end from commandbutton within com_pw_gparent
end type
type cb_f8 from commandbutton within com_pw_gparent
end type
type cb_f7 from commandbutton within com_pw_gparent
end type
type cb_f6 from commandbutton within com_pw_gparent
end type
type cb_f5 from commandbutton within com_pw_gparent
end type
type cb_f4 from commandbutton within com_pw_gparent
end type
type cb_f3 from commandbutton within com_pw_gparent
end type
type cb_f2 from commandbutton within com_pw_gparent
end type
type cb_f1 from commandbutton within com_pw_gparent
end type
type st_message from statictext within com_pw_gparent
end type
type gb_preview from groupbox within com_pw_gparent
end type
end forward

global type com_pw_gparent from window
integer x = 4
integer y = 4
integer width = 4080
integer height = 2581
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
string icon = "Picture\CENT.ICO"
rb_off rb_off
rb_on rb_on
cb_f12 cb_f12
cb_f11 cb_f11
cb_f10 cb_f10
cb_end cb_end
cb_f8 cb_f8
cb_f7 cb_f7
cb_f6 cb_f6
cb_f5 cb_f5
cb_f4 cb_f4
cb_f3 cb_f3
cb_f2 cb_f2
cb_f1 cb_f1
st_message st_message
gb_preview gb_preview
end type
global com_pw_gparent com_pw_gparent

type variables
String		prog_name	//$$HEX8$$8cff9fff9bff78ff9eff97ff91ff0d54$$ENDHEX$$

String		is_save_moto_prog_name

DataWindow	preview_dw[]	//$$HEX2$$70533752$$ENDHEX$$dw
Long			print_zoom[]	//$$HEX4$$705337520d508773$$ENDHEX$$
Long			moto_zoom[]		//$$HEX4$$196a966e0d508773$$ENDHEX$$
end variables

forward prototypes
public subroutine setup (string as_prog_name)
public subroutine message_up (string as_message)
public subroutine preview (datawindow adw_preview_dw[], long al_print_zoom[], long al_moto_zoom[])
end prototypes

public subroutine setup (string as_prog_name);Integer		li_kbn

prog_name	= as_prog_name

//$$HEX24$$997d7f6248516e30d730ed30b030e930e03029ff24ff9230b030ed30fc30d030eb30095970656b303c680d7d59308b30$$ENDHEX$$
gstr_kaisya.prog_name	=	as_prog_name

//$$HEX19$$778dd5523b75629770659230d730ed30b030e930e030de30b930bf306b303c680d7d59308b30$$ENDHEX$$
pf_prog_up(1,	This.Title,	gstr_kaisya.prog_name)

//$$HEX19$$b330de30f330c930dc30bf30f3306b308cff67ff9dff78ff7cff6eff9dff923068883a790900$$ENDHEX$$
cb_f1.Text	+= gstr_kaisya.keyname[1]
cb_f2.Text	+= gstr_kaisya.keyname[2]
cb_f3.Text	+= gstr_kaisya.keyname[3]
cb_f4.Text	+= gstr_kaisya.keyname[4]
cb_f5.Text	+= gstr_kaisya.keyname[5]
cb_f6.Text	+= gstr_kaisya.keyname[6]
cb_f7.Text	+= gstr_kaisya.keyname[7]
cb_f8.Text	+= gstr_kaisya.keyname[8]
cb_f10.Text	+= gstr_kaisya.keyname[10]
cb_f11.Text	+= gstr_kaisya.keyname[11]
cb_f12.Text	+= gstr_kaisya.keyname[12]

end subroutine

public subroutine message_up (string as_message);/*------------------------------------------------------------------------------------------------------

	$$HEX6$$0d540030f07909001aff0900$$ENDHEX$$message_up
	
	$$HEX26$$ac8a00300e6609001aff0900e65106742d4e6e30e130c330bb30fc30b830c630ad30b930c830923068883a7957307e3059300230$$ENDHEX$$
	
	$$HEX6$$155f0030706509001aff0900$$ENDHEX$$(Val)string		as_message		$$HEX11$$68883a7992ff6fff7eff70ff7cff9eff6e3007639a5b$$ENDHEX$$
	
						0:	$$HEX18$$92ff6fff7eff70ff7cff9eff92305e9768883a796b3059308b3008ff0526997d7f624351$$ENDHEX$$dw$$HEX1$$6e30$$ENDHEX$$getfocus$$HEX10$$a430d930f330c8306b30188af08f086e052609ff$$ENDHEX$$
						1:	$$HEX8$$0c301c69227d2d4e0d306e3068883a79$$ENDHEX$$
						2:	$$HEX8$$0c30e65106742d4e0d306e3068883a79$$ENDHEX$$
						3:	$$HEX8$$0c30f466b0652d4e0d306e3068883a79$$ENDHEX$$
						
					$$HEX32$$3b20155f70656e3011ff8765575bee764c300a4e188ae54e16596e308765575b17526e30345808546f3001305d306e307e307e3068883a7957307e3059300230$$ENDHEX$$
					$$HEX30$$003008ff5f306030573001308765575b17524d528c5f6e30b930da30fc30b93092304a52649657305f30b6724b6167302452ad6557307e30593009ff$$ENDHEX$$
					$$HEX6$$3b2039654c888765575b08ff$$ENDHEX$$~n$$HEX9$$09ff823029522875ef53fd80673059300230$$ENDHEX$$
					$$HEX13$$3b20e65106748c5f0130997d7f6267305c4f106255308c305f30$$ENDHEX$$dw$$HEX29$$6b308cff6bff70ff76ff7dff4c307eff6fff84ff55308c308b30345808546f3001305e9768883a796e30188af08f6f300d4e8189673059300230$$ENDHEX$$
					
					($$HEX1$$8b4f$$ENDHEX$$)	message_up("1")					$$HEX3$$922109000900$$ENDHEX$$"$$HEX3$$e65106742d4e$$ENDHEX$$"
							message_up("12345")				$$HEX3$$922109000900$$ENDHEX$$"12345"
							message_up("$$HEX3$$423044304630$$ENDHEX$$~n$$HEX2$$48304a30$$ENDHEX$$")		$$HEX3$$922109000900$$ENDHEX$$"$$HEX3$$423044304630$$ENDHEX$$
																			  $$HEX2$$48304a30$$ENDHEX$$"
	
	$$HEX8$$3b628a30245009001aff09006a305730$$ENDHEX$$
	
	$$HEX6$$5c4f1062e56509001aff0900$$ENDHEX$$2005.07.19	Jupiter	y.furutani
	
	$$HEX6$$f466b065e56509001aff0900$$ENDHEX$$

------------------------------------------------------------------------------------------------------*/
string	ls_mode, ls_message, ls_rep, ls_str[]
long		ll_pos, ll_gyo, i, ll_moji, ll_max_moji, ll_s_w, ll_s_h, ll_w_w, ll_w_h, ll_x, ll_y

// $$HEX5$$155f70656e302452ad65$$ENDHEX$$
ls_mode		= pf_nvl_string(as_message, "")
choose case ls_mode
	case "0"		// 0:$$HEX3$$5e9768883a79$$ENDHEX$$
		ls_message	= ""
		
	case "1"		// 1:$$HEX3$$1c69227d2d4e$$ENDHEX$$
		ls_message	= "$$HEX3$$1c69227d2d4e$$ENDHEX$$"
		
	case "2"		// 2:$$HEX3$$e65106742d4e$$ENDHEX$$
		ls_message	= "$$HEX3$$e65106742d4e$$ENDHEX$$"
		
	case "3"		// 3:$$HEX3$$f466b0652d4e$$ENDHEX$$
		ls_message	= "$$HEX3$$f466b0652d4e$$ENDHEX$$"
		
	case else	// $$HEX3$$5d306e30d64e$$ENDHEX$$
		ls_message	= ls_mode
end choose

st_message.text	= ls_message


if ls_mode = "0" then
	
	// $$HEX3$$5e9768883a79$$ENDHEX$$
	st_message.visible		= false
	
else
	
	// $$HEX2$$68883a79$$ENDHEX$$
	
	// $$HEX16$$92ff6fff7eff70ff7cff9eff85516e3039654c888765575b6e306e7fdb634830$$ENDHEX$$
	ls_rep	= ls_message
	do while true
		
		// $$HEX7$$39654c888765575b92301c69227d$$ENDHEX$$
		ll_pos	= pf_nvl_number(pos(ls_rep, "~n"), 0)
		
		// $$HEX15$$39654c888765575b4c308b8964304b3089306a3051308c307030427d864e$$ENDHEX$$
		if ll_pos = 0 then
			exit
		end if
		
		// "~n" $$HEX2$$92302000$$ENDHEX$$"," $$HEX4$$6b306e7fdb634830$$ENDHEX$$
		ls_rep	= replace(ls_rep, ll_pos, 2, ",")
		
	loop
	
	// $$HEX5$$4d9117526b300959db63$$ENDHEX$$
	ll_gyo	= pf_csv_cut(ls_rep, ls_str[])
	
	// $$HEX8$$006727598765575b70659230d653975f$$ENDHEX$$
	ll_max_moji	= 0
	for i = 1 to ll_gyo
		//ll_moji	= len(ls_str[i])
		ll_moji	= lenA(ls_str[i])
		if ll_max_moji < ll_moji then
			ll_max_moji	= ll_moji
		end if
	next
	ll_max_moji	= ll_max_moji	+ 2

	// $$HEX14$$92ff6fff7eff70ff7cff9eff6e30455e6830d89a553092307a6c9a5b$$ENDHEX$$
	ll_s_w	= 18	* ll_max_moji	// $$HEX4$$455e0900090008ff$$ENDHEX$$X$$HEX5$$d430af30bb30eb3009ff$$ENDHEX$$
	ll_s_h	= 36	* ll_gyo			// $$HEX4$$d89a5530090008ff$$ENDHEX$$Y$$HEX5$$d430af30bb30eb3009ff$$ENDHEX$$
	
	// $$HEX13$$a630a330f330c930a6306e30455e6830d89a55309230d653975f$$ENDHEX$$
	ll_w_w	= UnitsToPixels(this.width, XUnitsToPixels!)			// $$HEX4$$455e0900090008ff$$ENDHEX$$PB$$HEX5$$58534d4f200092212000$$ENDHEX$$X$$HEX5$$d430af30bb30eb3009ff$$ENDHEX$$
	ll_w_h	= UnitsToPixels(this.height, YUnitsToPixels!)		// $$HEX4$$d89a5530090008ff$$ENDHEX$$PB$$HEX5$$58534d4f200092212000$$ENDHEX$$Y$$HEX5$$d430af30bb30eb3009ff$$ENDHEX$$
	ll_w_h	= ll_w_h	- UnitsToPixels(100, YUnitsToPixels!)		// $$HEX15$$bf30a430c830eb30d030fc306e30d89a553006529230de30a430ca30b930$$ENDHEX$$
	
	// $$HEX14$$92ff6fff7eff70ff7cff9eff6e3068883a794d4f6e7f92307a6c9a5b$$ENDHEX$$
	ll_x		= truncate((ll_w_w - ll_s_w) / 2, 0)					// $$HEX10$$92ff6fff7eff70ff7cff9eff6e302a6a4d4f6e7f$$ENDHEX$$
	ll_y		= truncate((ll_w_h - ll_s_h) / 2, 0)					// $$HEX10$$92ff6fff7eff70ff7cff9eff6e30267e4d4f6e7f$$ENDHEX$$
	
	// $$HEX9$$92ff6fff7eff70ff7cff9eff923068883a79$$ENDHEX$$
	st_message.x				= PixelsToUnits(ll_x, XPixelsToUnits!)		// X$$HEX7$$d430af30bb30eb30200092212000$$ENDHEX$$PB$$HEX2$$58534d4f$$ENDHEX$$
	st_message.y				= PixelsToUnits(ll_y, YPixelsToUnits!)		// Y$$HEX7$$d430af30bb30eb30200092212000$$ENDHEX$$PB$$HEX2$$58534d4f$$ENDHEX$$
	st_message.width			= PixelsToUnits(ll_s_w, XPixelsToUnits!)
	st_message.height			= PixelsToUnits(ll_s_h, YPixelsToUnits!)
	st_message.BringToTop	= true												// $$HEX12$$92ff6fff7eff70ff7cff9eff92304d5262976b30fb79d552$$ENDHEX$$
	
	st_message.visible		= true												// $$HEX2$$68883a79$$ENDHEX$$
	
end if

end subroutine

public subroutine preview (datawindow adw_preview_dw[], long al_print_zoom[], long al_moto_zoom[]);/*------------------------------------------------------------------------------------------------------
	$$HEX6$$0d540030f07909001aff0900$$ENDHEX$$preview
	
	$$HEX23$$ac8a00300e6609001aff0900705337528cff9fff9aff8bff9eff6dff70ff6e3007528a30ff66483092304c884630$$ENDHEX$$
	
	$$HEX6$$155f0030706509001aff0900$$ENDHEX$$(Val)datawindow		adw_preview_dw[]		$$HEX3$$705337522875$$ENDHEX$$DW	
					(Val)long				al_print_zoom[]		$$HEX9$$705337520d50877309000900090009000900$$ENDHEX$$
					(Val)long				al_moto_zoom[]			$$HEX4$$196a966e0d508773$$ENDHEX$$($$HEX7$$3b7562970a4e6e300d50877309ff$$ENDHEX$$
					
					$$HEX10$$3b2011ff3b7562976b30078970656e3070533752$$ENDHEX$$DW$$HEX5$$4c3042308b3034580854$$ENDHEX$$
					$$HEX1$$0030$$ENDHEX$$DW$$HEX27$$0130705337520d5087730130196a966e0d5087736e304d9117526e30fb6d4830575b9230004ef48155305b3066304f30603055304430$$ENDHEX$$
					
					$$HEX1$$8b4f$$ENDHEX$$)	DW			$$HEX9$$705337520d5087730900196a966e0d508773$$ENDHEX$$
							dw_main	60$$HEX3$$05ff09000900$$ENDHEX$$100$$HEX1$$05ff$$ENDHEX$$
							dw_sub	80$$HEX3$$05ff09000900$$ENDHEX$$100$$HEX1$$05ff$$ENDHEX$$
							
					$$HEX3$$922109000900$$ENDHEX$$preview_dw[1] = dw_main		preview_dw[2] = dw_sub
							print_zoom[1] = 60			print_zoom[2] = 80
							moto_zoom[1]  = 100			moto_zoom[2]  = 100
	$$HEX8$$3b628a30245009001aff09006a305730$$ENDHEX$$
	
	$$HEX6$$5c4f1062e56509001aff0900$$ENDHEX$$2007.02.20	TOSCO	M.Shindo
	
	$$HEX6$$f466b065e56509001aff0900$$ENDHEX$$
------------------------------------------------------------------------------------------------------*/
Long			ll_max, ll_prn_zoom, ll_moto_zoom
Integer		li_cnt
DataWindow 	dw_prn

ll_max	= UpperBound(adw_preview_dw[])

If	ll_max > 0 Then
	For li_cnt	= 1 To ll_max
		dw_prn 			= adw_preview_dw[li_cnt]
		ll_prn_zoom		= al_print_zoom[li_cnt]
		ll_moto_zoom	= al_moto_zoom[li_cnt]
		
		If rb_off.checked Then		//$$HEX7$$8cff9fff9aff8bff9eff6dff70ff$$ENDHEX$$OFF
			dw_prn.Object.DataWindow.zoom				= ll_moto_zoom
			dw_prn.Object.DataWindow.Print.Preview	= "no"
		Else 								//$$HEX7$$8cff9fff9aff8bff9eff6dff70ff$$ENDHEX$$ON
			dw_prn.Object.DataWindow.zoom				= ll_prn_zoom
			dw_prn.Object.DataWindow.Print.Preview	= "yes"			
		end if		
	Next
End If

end subroutine

on com_pw_gparent.create
this.rb_off=create rb_off
this.rb_on=create rb_on
this.cb_f12=create cb_f12
this.cb_f11=create cb_f11
this.cb_f10=create cb_f10
this.cb_end=create cb_end
this.cb_f8=create cb_f8
this.cb_f7=create cb_f7
this.cb_f6=create cb_f6
this.cb_f5=create cb_f5
this.cb_f4=create cb_f4
this.cb_f3=create cb_f3
this.cb_f2=create cb_f2
this.cb_f1=create cb_f1
this.st_message=create st_message
this.gb_preview=create gb_preview
this.Control[]={this.rb_off,&
this.rb_on,&
this.cb_f12,&
this.cb_f11,&
this.cb_f10,&
this.cb_end,&
this.cb_f8,&
this.cb_f7,&
this.cb_f6,&
this.cb_f5,&
this.cb_f4,&
this.cb_f3,&
this.cb_f2,&
this.cb_f1,&
this.st_message,&
this.gb_preview}
end on

on com_pw_gparent.destroy
destroy(this.rb_off)
destroy(this.rb_on)
destroy(this.cb_f12)
destroy(this.cb_f11)
destroy(this.cb_f10)
destroy(this.cb_end)
destroy(this.cb_f8)
destroy(this.cb_f7)
destroy(this.cb_f6)
destroy(this.cb_f5)
destroy(this.cb_f4)
destroy(this.cb_f3)
destroy(this.cb_f2)
destroy(this.cb_f1)
destroy(this.st_message)
destroy(this.gb_preview)
end on

event key;//Key
Choose Case Key
	Case gstr_kaisya.key[1]
		pf_fkey_set(cb_f1)
		Return 1
	Case gstr_kaisya.key[2]
		pf_fkey_set(cb_f2)
		Return 1
	Case gstr_kaisya.key[3]
		pf_fkey_set(cb_f3)
		Return 1
	Case gstr_kaisya.key[4]
		pf_fkey_set(cb_f4)
		Return 1
	Case gstr_kaisya.key[5]
		pf_fkey_set(cb_f5)
		Return 1
	Case gstr_kaisya.key[6]
		pf_fkey_set(cb_f6)
		Return 1
	Case gstr_kaisya.key[7]
		pf_fkey_set(cb_f7)
		Return 1
	Case gstr_kaisya.key[8]
		pf_fkey_set(cb_f8)
		Return 1
	Case gstr_kaisya.key[10]
		pf_fkey_set(cb_f10)
		Return 1
	Case gstr_kaisya.key[11]
		pf_fkey_set(cb_f11)
		Return 1
	Case gstr_kaisya.key[12]
		pf_fkey_set(cb_f12)
		Return 1
	Case Else
		Return 1
End Choose

end event

event open;pf_centerwindow(This)	//$$HEX10$$a630a330f330c930a6306e302d4e2e5968883a79$$ENDHEX$$

//$$HEX17$$c2536771823068306e30d730ed30b030e930e03029ff24ff9230dd4f585b59308b30$$ENDHEX$$
is_save_moto_prog_name = gstr_kaisya.prog_name

end event

event close;//
//$$HEX22$$778dd5523b75629770659230d730ed30b030e930e030de30b930bf304b308930de30a430ca30b93059308b30$$ENDHEX$$(setup$$HEX10$$6b306630ab30a630f330c830a230c330d730086e$$ENDHEX$$)
pf_prog_up(2,	This.Title,	gstr_kaisya.prog_name)

//$$HEX14$$c253677143516e30d730ed30b030e930e03029ff24ff92303b625930$$ENDHEX$$
gstr_kaisya.prog_name	=	is_save_moto_prog_name
end event

type rb_off from radiobutton within com_pw_gparent
integer x = 320
integer y = 526
integer width = 220
integer height = 68
integer textsize = -11
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
long textcolor = 33554432
long backcolor = 67108864
string text = "OFF"
boolean checked = true
end type

event clicked;//$$HEX7$$8cff9fff9aff8bff9eff6dff70ff$$ENDHEX$$OFF
preview(preview_dw[], print_zoom[], moto_zoom[])
end event

type rb_on from radiobutton within com_pw_gparent
integer x = 64
integer y = 526
integer width = 220
integer height = 68
integer textsize = -11
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
long textcolor = 33554432
long backcolor = 67108864
string text = "ON"
end type

event clicked;//$$HEX7$$8cff9fff9aff8bff9eff6dff70ff$$ENDHEX$$ON
preview(preview_dw[], print_zoom[], moto_zoom[])
end event

type cb_f12 from commandbutton within com_pw_gparent
integer x = 560
integer y = 132
integer width = 512
integer height = 85
integer textsize = -11
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
end type

type cb_f11 from commandbutton within com_pw_gparent
integer x = 560
integer y = 242
integer width = 512
integer height = 85
integer textsize = -11
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
end type

type cb_f10 from commandbutton within com_pw_gparent
integer x = 560
integer y = 352
integer width = 512
integer height = 85
integer textsize = -11
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
end type

type cb_end from commandbutton within com_pw_gparent
integer x = 1648
integer y = 242
integer width = 512
integer height = 85
integer textsize = -11
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
string text = "$$HEX4$$3b62200020008b30$$ENDHEX$$"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_f8 from commandbutton within com_pw_gparent
integer x = 1648
integer y = 132
integer width = 512
integer height = 85
integer textsize = -11
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
string text = "$$HEX4$$4a52200020006496$$ENDHEX$$"
end type

type cb_f7 from commandbutton within com_pw_gparent
integer x = 1104
integer y = 132
integer width = 512
integer height = 85
integer textsize = -11
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
string text = "$$HEX4$$ee4f20002000636b$$ENDHEX$$"
end type

type cb_f6 from commandbutton within com_pw_gparent
integer x = 560
integer y = 21
integer width = 512
integer height = 85
integer textsize = -11
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
string text = "$$HEX5$$77ff6cff9dff7eff99ff$$ENDHEX$$"
end type

type cb_f5 from commandbutton within com_pw_gparent
integer x = 16
integer y = 132
integer width = 512
integer height = 85
integer textsize = -11
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
string text = "$$HEX4$$fd8f20002000a052$$ENDHEX$$"
end type

type cb_f4 from commandbutton within com_pw_gparent
integer x = 16
integer y = 21
integer width = 512
integer height = 85
integer textsize = -11
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
string text = "$$HEX4$$1c6920002000227d$$ENDHEX$$"
end type

type cb_f3 from commandbutton within com_pw_gparent
integer x = 1104
integer y = 242
integer width = 512
integer height = 85
integer textsize = -11
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
string text = "$$HEX4$$f46620002000b065$$ENDHEX$$"
end type

type cb_f2 from commandbutton within com_pw_gparent
integer x = 16
integer y = 242
integer width = 512
integer height = 85
integer textsize = -11
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
string text = "$$HEX4$$7053200020003752$$ENDHEX$$"
end type

type cb_f1 from commandbutton within com_pw_gparent
integer x = 2192
integer y = 242
integer width = 80
integer height = 85
integer textsize = -11
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
end type

event clicked;//$$HEX5$$d830eb30d7303b756297$$ENDHEX$$
pf_open_help(prog_name,	Parent.Title)

end event

type st_message from statictext within com_pw_gparent
boolean visible = false
integer width = 48
integer height = 43
integer textsize = -24
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
long textcolor = 16711935
long backcolor = 15793151
alignment alignment = center!
boolean border = true
long bordercolor = 255
boolean focusrectangle = false
end type

type gb_preview from groupbox within com_pw_gparent
integer x = 32
integer y = 469
integer width = 528
integer height = 142
integer textsize = -11
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
long textcolor = 33554432
long backcolor = 67108864
string text = "$$HEX9$$705337528cff9fff9aff8bff9eff6dff70ff$$ENDHEX$$"
end type

