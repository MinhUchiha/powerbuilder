HA$PBExportHeader$com_pw_menu.srw
$PBExportComments$$$HEX7$$997d7f62435192ff86ff6dff70ff$$ENDHEX$$
forward
global type com_pw_menu from window
end type
type st_2 from statictext within com_pw_menu
end type
type st_update from statictext within com_pw_menu
end type
type st_read_only from statictext within com_pw_menu
end type
type st_1 from puo_connect_status within com_pw_menu
end type
type cb_end from commandbutton within com_pw_menu
end type
type st_menu from statictext within com_pw_menu
end type
type st_system from statictext within com_pw_menu
end type
type st_ver from statictext within com_pw_menu
end type
end forward

global type com_pw_menu from window
integer width = 4088
integer height = 2652
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
long backcolor = 8421504
string icon = "Picture\CENT.ICO"
st_2 st_2
st_update st_update
st_read_only st_read_only
st_1 st_1
cb_end cb_end
st_menu st_menu
st_system st_system
st_ver st_ver
end type
global com_pw_menu com_pw_menu

type variables
Boolean	ib_read_only
end variables

forward prototypes
public subroutine wf_get_date ()
public subroutine wf_set_button ()
end prototypes

public subroutine wf_get_date ();/*___/___/___/___/___/___/___/___/___/___/___/___/___/___/___/___/___/

$$HEX3$$0d54f0790900$$ENDHEX$$wf_get_date
$$HEX3$$ac8a0e660900$$ENDHEX$$exe$$HEX12$$d530a130a430eb3088308a30f466b065e5654266d653975f$$ENDHEX$$
		(ora_tool_mdi$$HEX4$$88308a30155f2875$$ENDHEX$$)
$$HEX3$$155f70650900$$ENDHEX$$(Void)
$$HEX3$$3b6224500900$$ENDHEX$$(Void)
$$HEX4$$5c4f1062e5650900$$ENDHEX$$2005.09.07	jupiter	$$HEX15$$42663b526f300130b330e130f330c8302d4e02300d000a00f466b065e565$$ENDHEX$$

___/___/___/___/___/___/___/___/___/___/___/___/___/___/___/___/___/ */
application 		app
string				ls_appname, ls_path, ls_update
long					ll_findfile
win32_find_data	lstr_win32_find_data
filetime				lstr_filetime
systemtime			lstr_systemtime

//$$HEX10$$a230d730ea30b130fc30b730e730f330d653975f$$ENDHEX$$
app = GetApplication()
//$$HEX11$$a230d730ea30b130fc30b730e730f3300d54d653975f$$ENDHEX$$
ls_appname = app.AppName

//$$HEX6$$d530eb30d130b930d653975f$$ENDHEX$$
ls_path	=	ls_appname + ".exe"

ll_findfile	=	pf_FindFirstFile(ls_path, lstr_win32_find_data)
If ll_findfile <> -1 Then
	//$$HEX4$$f466b065e5654266$$ENDHEX$$
	pf_FileTimeToLocalFileTime(lstr_win32_find_data.ftlastwritetime, lstr_filetime)
	pf_FileTimeToSystemTime(lstr_filetime, lstr_systemtime)
	
	//$$HEX7$$f466b065e5654266923068883a79$$ENDHEX$$
	ls_update	=	String(lstr_systemtime.wYear, "0000")	+ "/"	+ &
						String(lstr_systemtime.wMonth, "00")	+ "/" + &
						String(lstr_systemtime.wDay, "00")		
//						+ Space(1) + &
//						String(lstr_systemtime.wHour, "00")		+ ":" + &
//						String(lstr_systemtime.wMinute, "00")	+ ":" + &
//						String(lstr_systemtime.wSecond, "00")

	st_update.text += ls_update
Else
	st_update.text = ""
End If

pf_findclose(ll_findfile)
end subroutine

public subroutine wf_set_button ();/*__/__/__/__/__/__/__/__/__/__/__/__/__/__/__/__/__/__/__/__/__/__/__/

	$$HEX3$$0d54f0790900$$ENDHEX$$wf_set_button
	
	$$HEX23$$ac8a0e660900d730ed30b030e930e030de30b930bf300130a230af30bb30b9303652a15fde30b930bf3088308a30$$ENDHEX$$
			$$HEX18$$e130cb30e530fc306e30dc30bf30f3306e3068883a7901305e9768883a7992302d8a9a5b$$ENDHEX$$
			
			$$HEX4$$7f4f2875b965d56c$$ENDHEX$$
				$$HEX9$$997d7f624851e130cb30e530fc306e300c30$$ENDHEX$$st_menu$$HEX23$$0d306b30d730ed30b030e930e030de30b930bf306e30e130cb30e530fc300d54f07968300c54004e92302d8a9a5b$$ENDHEX$$
				$$HEX35$$997d7f624851e130cb30e530fc306e30dc30bf30f3306e300d54f0799230d730ed30b030e930e030de30b930bf306e30dc30bf30f3300d54f07968300c54004e92302d8a9a5b$$ENDHEX$$
			
	$$HEX3$$155f70650900$$ENDHEX$$(None)
	
	$$HEX3$$3b6224500900$$ENDHEX$$(None)
	
	$$HEX4$$5c4f1062e5650900$$ENDHEX$$2007.06.26	jupiter$$HEX1$$0030$$ENDHEX$$

__/__/__/__/__/__/__/__/__/__/__/__/__/__/__/__/__/__/__/__/__/__/__/ */
string	ls_menu_name
string	ls_button_name, ls_access_kbn
string	ls_prog_id 
long		ll_cnt = 0
string	ls_sql

string			ls_class[]
windowobject	lw_object[]
int				i

//$$HEX6$$e130cb30e530fc300d54f079$$ENDHEX$$(st_menu$$HEX9$$6b30188af08f57305f30c630ad30b930c830$$ENDHEX$$)
ls_menu_name	=	pf_nvl_string(st_menu.text, "")

ls_sql = "SELECT	$$HEX7$$d730ed30b030e930e03009000900$$ENDHEX$$"	+&
			"	,	$$HEX8$$dc30bf30f3300d54f079090009000900$$ENDHEX$$"	+&
			"	,	$$HEX9$$a230af30bb30b9303652a15f3a5306520900$$ENDHEX$$"	+&
			'	FROM	"$$HEX8$$d730ed30b030e930e030de30b930bf30$$ENDHEX$$"	'+	&
			"	WHERE	$$HEX7$$e130cb30e530fc300d54f0790900$$ENDHEX$$=	'"	+	ls_menu_name	+ "'"
			
DECLARE	PROG_CUR DYNAMIC CURSOR FOR SQLSA;
PREPARE	SQLSA	FROM :ls_sql;

OPEN DYNAMIC	PROG_CUR;

DO WHILE TRUE
	FETCH PROG_CUR
		INTO	:ls_prog_id			//$$HEX5$$d730ed30b030e930e030$$ENDHEX$$
			,	:ls_button_name	//$$HEX5$$dc30bf30f3300d54f079$$ENDHEX$$
			,	:ls_access_kbn		//$$HEX8$$a230af30bb30b9303652a15f3a530652$$ENDHEX$$
	;
	If sqlca.sqlcode <> 0 Then
		if sqlca.sqlcode = 100 then
			exit;
		end if
		CLOSE PROG_CUR;
	End If
	
	//$$HEX11$$a230af30bb30b9303652a15fde30b930bf30c2536771$$ENDHEX$$
	SELECT COUNT(*)
		INTO	:ll_cnt
		FROM	"$$HEX9$$a230af30bb30b9303652a15fde30b930bf30$$ENDHEX$$"
		WHERE	$$HEX7$$c562535f0580b330fc30c9300900$$ENDHEX$$=	:gstr_kaisya.tanto_code
		AND	$$HEX7$$d730ed30b030e930e03009000900$$ENDHEX$$=	:ls_prog_id
	;
	
	//window$$HEX2$$6e306851$$ENDHEX$$control$$HEX3$$6830d46b038f$$ENDHEX$$
	For i = 1 To UpperBound(control[])
		lw_object[i] = control[i]
		ls_class[i]  = lw_object[i].ClassName()
		
		//$$HEX18$$de30b930bf302d8a9a5b6830af30e930b9300d544c300c54583082306e304c30585b2857$$ENDHEX$$
		If ls_button_name = ls_class[i] Then
			//$$HEX10$$a230af30bb30b9303652a15f3a53065224522552$$ENDHEX$$
			if ls_access_kbn = '1' then	//1:$$HEX4$$3652a15f59308b30$$ENDHEX$$
				//Login$$HEX8$$c562535f05804c307f4f287524522552$$ENDHEX$$
				if ll_cnt > 0 then
					//Login$$HEX7$$c562535f05804c307f4f2875ef53$$ENDHEX$$
					control[i].Visible = True
				else
					//Login$$HEX8$$c562535f05804c307f4f28750d4eef53$$ENDHEX$$
					control[i].Visible = False
				end if
			else
				//0:$$HEX12$$3652a15f57306a3044300030b08a673082307f4f2875ef53$$ENDHEX$$
				control[i].Visible = True
			end if
		End If
	Next
	
LOOP


////$$HEX10$$d730ed30b030e930e030de30b930bf30c2536771$$ENDHEX$$
//DECLARE PROG_CUR CURSOR FOR
//	SELECT	$$HEX5$$d730ed30b030e930e030$$ENDHEX$$
//			,	$$HEX5$$dc30bf30f3300d54f079$$ENDHEX$$
//			,	$$HEX9$$a230af30bb30b9303652a15f3a5306520900$$ENDHEX$$//0:$$HEX6$$3652a15f57306a3044300900$$ENDHEX$$1:$$HEX4$$3652a15f59308b30$$ENDHEX$$
//		FROM	"$$HEX8$$d730ed30b030e930e030de30b930bf30$$ENDHEX$$"
//		WHERE	$$HEX7$$e130cb30e530fc300d54f0790900$$ENDHEX$$=	:ls_menu_name
//	;
//
///*$$HEX13$$6a266a266a266a266a266a266a266a266a266a266a266a266a26$$ENDHEX$$
//	$$HEX10$$e130cb30e530fc30dc30bf30f3306e303652a15f$$ENDHEX$$
//$$HEX13$$6a266a266a266a266a266a266a266a266a266a266a266a266a26$$ENDHEX$$*/
//OPEN PROG_CUR;
//
//If sqlca.sqlcode <> 0 Then
//	CLOSE PROG_CUR;
//	RETURN
//End If
//
//DO WHILE TRUE
//	FETCH PROG_CUR
//		INTO	:ls_prog_id			//$$HEX5$$d730ed30b030e930e030$$ENDHEX$$
//			,	:ls_button_name	//$$HEX5$$dc30bf30f3300d54f079$$ENDHEX$$
//			,	:ls_access_kbn		//$$HEX8$$a230af30bb30b9303652a15f3a530652$$ENDHEX$$
//	;
//	
//	If sqlca.sqlcode <> 0 Then
//		if sqlca.sqlcode = 100 then
//			exit;
//		end if
//		CLOSE PROG_CUR;
//	End If
//	
//	//$$HEX11$$a230af30bb30b9303652a15fde30b930bf30c2536771$$ENDHEX$$
//	SELECT COUNT(*)
//		INTO	:ll_cnt
//		FROM	"$$HEX9$$a230af30bb30b9303652a15fde30b930bf30$$ENDHEX$$"
//		WHERE	$$HEX7$$c562535f0580b330fc30c9300900$$ENDHEX$$=	:gstr_kaisya.tanto_code
//		AND	$$HEX7$$d730ed30b030e930e03009000900$$ENDHEX$$=	:ls_prog_id
//	;
//	
//	//window$$HEX2$$6e306851$$ENDHEX$$control$$HEX3$$6830d46b038f$$ENDHEX$$
//	For i = 1 To UpperBound(control[])
//		lw_object[i] = control[i]
//		ls_class[i]  = lw_object[i].ClassName()
//		
//		//$$HEX18$$de30b930bf302d8a9a5b6830af30e930b9300d544c300c54583082306e304c30585b2857$$ENDHEX$$
//		If ls_button_name = ls_class[i] Then
//			//$$HEX10$$a230af30bb30b9303652a15f3a53065224522552$$ENDHEX$$
//			if ls_access_kbn = '1' then	//1:$$HEX4$$3652a15f59308b30$$ENDHEX$$
//				//Login$$HEX8$$c562535f05804c307f4f287524522552$$ENDHEX$$
//				if ll_cnt > 0 then
//					//Login$$HEX7$$c562535f05804c307f4f2875ef53$$ENDHEX$$
//					control[i].Visible = True
//				else
//					//Login$$HEX8$$c562535f05804c307f4f28750d4eef53$$ENDHEX$$
//					control[i].Visible = False
//				end if
//			else
//				//0:$$HEX12$$3652a15f57306a3044300030b08a673082307f4f2875ef53$$ENDHEX$$
//				control[i].Visible = True
//			end if
//		End If
//	Next
//	
//LOOP
//
CLOSE PROG_CUR;
end subroutine

event open;//pu_w_menu.open
// update 2001.11.15	#1167 $$HEX12$$bf30a430c830eb306e3096898d8a27609230d89a81308b30$$ENDHEX$$
pf_centerwindow(This)
string	ls_ret
ps_tanto	lstr_tanto
ps_bumon	lstr_bumon
ps_team	lstr_team

//$$HEX9$$c562535f0580b330fc30c9306e30d753d653$$ENDHEX$$
gstr_kaisya.tanto_code = commandparm()

//$$HEX8$$7cff7dff83ff91ff0d54f0792d8a9a5b$$ENDHEX$$

//$$HEX9$$8aff9eff70ff7cff9eff6eff9dff2d8a9a5b$$ENDHEX$$

//$$HEX13$$73ff68ff9dff84ff9eff73ff6e3080ff72ff84ff99ff2d8a9a5b$$ENDHEX$$
//This.Title	= st_system.Text + "(" + st_menu.Text + ")"
Choose Case pf_nvl_string(Left(gstr_kaisya.AppName, 1), "")
	Case "c"
		This.Title	= "$$HEX2$$71511a90$$ENDHEX$$_" + st_menu.Text + "(" + st_system.Text + ")"
	Case "s"
		This.Title	= "$$HEX2$$a98cf258$$ENDHEX$$_" + st_menu.Text + "(" + st_system.Text + ")"
	Case "m"
		This.Title	= "$$HEX2$$1f752375$$ENDHEX$$_" + st_menu.Text + "(" + st_system.Text + ")"
	Case ""
		This.Title	= st_menu.Text + "(" + st_system.Text + ")"		// 2001.11.15 modefied
End Choose

//This.Title	= st_menu.Text + "(" + st_system.Text + ")"		// 2001.11.15 modefied

wf_get_date()

//$$HEX14$$c562535f0580b330fc30c9304c3021714b3063305f3089308d51a65e$$ENDHEX$$Login
//IF st_menu.Text <> "$$HEX7$$e130a430f330e130cb30e530fc30$$ENDHEX$$" THEN
	If pf_nvl_string(gstr_kaisya.tanto_code, "") = "" Then
		OpenWithParm(pw_login, lstr_tanto)
		
		lstr_tanto = Message.PowerObjectParm
		if lstr_tanto.login = False then
			close(this)
			Return
		end if
		
		gstr_kaisya.tanto_code = lstr_tanto.$$HEX6$$c562535f0580b330fc30c930$$ENDHEX$$
		gstr_kaisya.tanto_name = lstr_tanto.$$HEX5$$c562535f05800d54f079$$ENDHEX$$
	Else
		//$$HEX17$$c562535f0580b330fc30c9304c30e2656b3042308c3070300d54f079bb30c330c830$$ENDHEX$$
		lstr_tanto.$$HEX5$$745e0867090009000900$$ENDHEX$$= pf_get_master_date(pf_get_sysdate())
		lstr_tanto.$$HEX7$$c562535f0580b330fc30c9300900$$ENDHEX$$= gstr_kaisya.tanto_code
		pf_get_tanto(lstr_tanto)
		gstr_kaisya.tanto_name = lstr_tanto.$$HEX5$$c562535f05800d54f079$$ENDHEX$$
	End If
//END IF

//
If pf_nvl_string(gstr_kaisya.tanto_code, "") = 'ADMINI' Then	//ADD 2007.11.1
	//$$HEX8$$dc30bf30f3302d8a9a5b57306a304430$$ENDHEX$$
Else
	//$$HEX6$$dc30bf30f3306e302d8a9a5b$$ENDHEX$$
	wf_set_button()
End If

//$$HEX11$$e55d3458e89080956830c130fc30e0306e3068883a79$$ENDHEX$$
if pf_nvl_string(gstr_kaisya.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, "") <> "" then
	lstr_bumon.$$HEX5$$745e0867090009000900$$ENDHEX$$=	pf_get_master_date(pf_get_sysdate())
	lstr_bumon.$$HEX6$$e8908095b330fc30c9300900$$ENDHEX$$=	gstr_kaisya.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$
	pf_get_bumon2(lstr_bumon)
	st_2.text	=	lstr_bumon.$$HEX6$$e8908095b330fc30c9302000$$ENDHEX$$+ ":" + lstr_bumon.$$HEX4$$e89080950d54f079$$ENDHEX$$
	
	lstr_team.$$HEX7$$745e086709000900090009000900$$ENDHEX$$=	pf_get_master_date(pf_get_sysdate())
	lstr_team.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$=	gstr_kaisya.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$
	lstr_team.$$HEX8$$c130fc30e030b330fc30c93009000900$$ENDHEX$$=	gstr_kaisya.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$
	pf_get_team(lstr_team)
	st_2.text	+=	"~r~n" + lstr_team.$$HEX7$$c130fc30e030b330fc30c9302000$$ENDHEX$$+ ":" + lstr_team.$$HEX5$$c130fc30e0300d54f079$$ENDHEX$$
end if

end event

on com_pw_menu.create
this.st_2=create st_2
this.st_update=create st_update
this.st_read_only=create st_read_only
this.st_1=create st_1
this.cb_end=create cb_end
this.st_menu=create st_menu
this.st_system=create st_system
this.st_ver=create st_ver
this.Control[]={this.st_2,&
this.st_update,&
this.st_read_only,&
this.st_1,&
this.cb_end,&
this.st_menu,&
this.st_system,&
this.st_ver}
end on

on com_pw_menu.destroy
destroy(this.st_2)
destroy(this.st_update)
destroy(this.st_read_only)
destroy(this.st_1)
destroy(this.cb_end)
destroy(this.st_menu)
destroy(this.st_system)
destroy(this.st_ver)
end on

type st_2 from statictext within com_pw_menu
integer x = 2932
integer y = 128
integer width = 1096
integer height = 156
integer textsize = -11
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
long textcolor = 16777215
long backcolor = 268435456
boolean enabled = false
long bordercolor = 67108864
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_update from statictext within com_pw_menu
integer x = 2988
integer y = 85
integer width = 1040
integer height = 43
integer textsize = -10
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
long textcolor = 16777215
long backcolor = 8421504
string text = "Last update:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_read_only from statictext within com_pw_menu
boolean visible = false
integer x = 2936
integer y = 128
integer width = 1040
integer height = 110
integer textsize = -20
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
long textcolor = 255
long backcolor = 8421504
boolean enabled = false
string text = "$$HEX9$$f466b0656f30a763483066300b4e55304430$$ENDHEX$$"
boolean focusrectangle = false
end type

type st_1 from puo_connect_status within com_pw_menu
integer x = 2432
integer y = 14
integer width = 1596
integer height = 71
boolean italic = false
end type

type cb_end from commandbutton within com_pw_menu
integer x = 1664
integer y = 2375
integer width = 752
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
string text = "$$HEX3$$3b6200308b30$$ENDHEX$$"
boolean cancel = true
end type

type st_menu from statictext within com_pw_menu
integer x = 48
integer y = 256
integer width = 2352
integer height = 114
integer textsize = -22
integer weight = 700
fontcharset fontcharset = shiftjis!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "$$HEX7$$2dff33ff2000b430b730c330af30$$ENDHEX$$"
long textcolor = 16711680
long backcolor = 8421504
boolean enabled = false
boolean focusrectangle = false
end type

type st_system from statictext within com_pw_menu
integer x = 48
integer width = 2068
integer height = 242
integer textsize = -48
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Century"
boolean italic = true
long textcolor = 65535
long backcolor = 8421504
string text = "CENTURION"
boolean focusrectangle = false
end type

event doubleclicked;
//If st_read_only.Visible Then
//	st_read_only.Visible		=	FALSE
//	ib_read_only	=	FALSE
//Else
//	st_read_only.Visible		=	TRUE
//	ib_read_only	=	TRUE
//End If
end event

type st_ver from statictext within com_pw_menu
integer x = 2136
integer y = 132
integer width = 504
integer height = 110
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Century"
boolean italic = true
long textcolor = 16777215
long backcolor = 8421504
boolean enabled = false
string text = "Ver.1.00"
boolean focusrectangle = false
end type

