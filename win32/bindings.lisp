(in-package #:org.shirakumo.framebuffers.win32.cffi)

(cffi:define-foreign-library user32
  (T (:defaults "user32")))

(cffi:define-foreign-library shcore
  (T (:defaults "shcore")))

(cffi:defcenum monitor-dpi-type
  (:effective-dpi 0)
  (:angular-dpi 1)
  (:raw-dpi 2))

(cffi:defcenum dpi-awareness
  (:unaware 0)
  (:system-dpi-aware 1)
  (:per-monitor-dpi-aware 2))

(cffi:defcenum (dpi-awareness-context :ssize)
  (:unaware -1)
  (:system-aware -2)
  (:per-monitor-aware -3)
  (:per-monitor-aware-2 -4)
  (:unaware-gdiscaled -5))

(cffi:defcenum (message-type :uint)
  (:null #x0000)
  (:create #x0001)
  (:destroy #x0002)
  (:move #x0003)
  (:size #x0005)
  (:activate #x0006)
  (:setfocus #x0007)
  (:killfocus #x0008)
  (:enable #x000a)
  (:setredraw #x000b)
  (:settext #x000c)
  (:gettext #x000d)
  (:gettextlength #x000e)
  (:paint #x000f)
  (:close #x0010)
  (:queryendsession #x0011)
  (:queryopen #x0013)
  (:endsession #x0016)
  (:quit #x0012)
  (:erasebkgnd #x0014)
  (:syscolorchange #x0015)
  (:showwindow #x0018)
  (:settingchange #x001a)
  (:devmodechange #x001b)
  (:activateapp #x001c)
  (:fontchange #x001d)
  (:timechange #x001e)
  (:cancelmode #x001f)
  (:setcursor #x0020)
  (:mouseactivate #x0021)
  (:childactivate #x0022)
  (:queuesync #x0023)
  (:getminmaxinfo #x0024)
  (:painticon #x0026)
  (:iconerasebkgnd #x0027)
  (:nextdlgctl #x0028)
  (:spoolerstatus #x002a)
  (:drawitem #x002b)
  (:measureitem #x002c)
  (:deleteitem #x002d)
  (:vkeytoitem #x002e)
  (:chartoitem #x002f)
  (:setfont #x0030)
  (:getfont #x0031)
  (:sethotkey #x0032)
  (:gethotkey #x0033)
  (:querydragicon #x0037)
  (:compareitem #x0039)
  (:getobject #x003d)
  (:compacting #x0041)
  (:commnotify #x0044)
  (:windowposchanging #x0046)
  (:windowposchanged #x0047)
  (:power #x0048)
  (:copydata #x004a)
  (:canceljournal #x004b)
  (:notify #x004e)
  (:inputlangchangerequest #x0050)
  (:inputlangchange #x0051)
  (:tcard #x0052)
  (:help #x0053)
  (:userchanged #x0054)
  (:notifyformat #x0055)
  (:contextmenu #x007b)
  (:stylechanging #x007c)
  (:stylechanged #x007d)
  (:displaychange #x007e)
  (:geticon #x007f)
  (:seticon #x0080)
  (:nccreate #x0081)
  (:ncdestroy #x0082)
  (:nccalcsize #x0083)
  (:nchittest #x0084)
  (:ncpaint #x0085)
  (:ncactivate #x0086)
  (:getdlgcode #x0087)
  (:syncpaint #x0088)
  (:ncmousemove #x00a0)
  (:nclbuttondown #x00a1)
  (:nclbuttonup #x00a2)
  (:nclbuttondblclk #x00a3)
  (:ncrbuttondown #x00a4)
  (:ncrbuttonup #x00a5)
  (:ncrbuttondblclk #x00a6)
  (:ncmbuttondown #x00a7)
  (:ncmbuttonup #x00a8)
  (:ncmbuttondblclk #x00a9)
  (:ncxbuttondown #x00ab)
  (:ncxbuttonup #x00ac)
  (:ncxbuttondblclk #x00ad)
  (:input-device-change #x00fe)
  (:input #x00ff)
  (:keyfirst #x0100)
  (:keydown #x0100)
  (:keyup #x0101)
  (:char #x0102)
  (:deadchar #x0103)
  (:syskeydown #x0104)
  (:syskeyup #x0105)
  (:syschar #x0106)
  (:sysdeadchar #x0107)
  (:unichar #x0109)
  (:keylast #x0109)
  (:ime-startcomposition #x010d)
  (:ime-endcomposition #x010e)
  (:ime-composition #x010f)
  (:ime-keylast #x010f)
  (:initdialog #x0110)
  (:command #x0111)
  (:syscommand #x0112)
  (:timer #x0113)
  (:hscroll #x0114)
  (:vscroll #x0115)
  (:initmenu #x0116)
  (:initmenupopup #x0117)
  (:menuselect #x011f)
  (:gesture #x0119)
  (:gesturenotify #x011a)
  (:menuchar #x0120)
  (:enteridle #x0121)
  (:menurbuttonup #x0122)
  (:menudrag #x0123)
  (:menugetobject #x0124)
  (:uninitmenupopup #x0125)
  (:menucommand #x0126)
  (:changeuistate #x0127)
  (:updateuistate #x0128)
  (:queryuistate #x0129)
  (:ctlcolormsgbox #x0132)
  (:ctlcoloredit #x0133)
  (:ctlcolorlistbox #x0134)
  (:ctlcolorbtn #x0135)
  (:ctlcolordlg #x0136)
  (:ctlcolorscrollbar #x0137)
  (:ctlcolorstatic #x0138)
  (:mousefirst #x0200)
  (:mousemove #x0200)
  (:lbuttondown #x0201)
  (:lbuttonup #x0202)
  (:lbuttondblclk #x0203)
  (:rbuttondown #x0204)
  (:rbuttonup #x0205)
  (:rbuttondblclk #x0206)
  (:mbuttondown #x0207)
  (:mbuttonup #x0208)
  (:mbuttondblclk #x0209)
  (:mousewheel #x020a)
  (:xbuttondown #x020b)
  (:xbuttonup #x020c)
  (:xbuttondblclk #x020d)
  (:mousehwheel #x020e)
  (:mouselast #x020e)
  (:parentnotify #x0210)
  (:entermenuloop #x0211)
  (:exitmenuloop #x0212)
  (:nextmenu #x0213)
  (:sizing #x0214)
  (:capturechanged #x0215)
  (:moving #x0216)
  (:powerbroadcast #x0218)
  (:devicechange #x0219)
  (:mdicreate #x0220)
  (:mdidestroy #x0221)
  (:mdiactivate #x0222)
  (:mdirestore #x0223)
  (:mdinext #x0224)
  (:mdimaximize #x0225)
  (:mditile #x0226)
  (:mdicascade #x0227)
  (:mdiiconarrange #x0228)
  (:mdigetactive #x0229)
  (:mdisetmenu #x0230)
  (:entersizemove #x0231)
  (:exitsizemove #x0232)
  (:dropfiles #x0233)
  (:mdirefreshmenu #x0234)
  (:pointerdevicechange #x238)
  (:pointerdeviceinrange #x239)
  (:pointerdeviceoutofrange #x23a)
  (:touch #x0240)
  (:ncpointerupdate #x0241)
  (:ncpointerdown #x0242)
  (:ncpointerup #x0243)
  (:pointerupdate #x0245)
  (:pointerdown #x0246)
  (:pointerup #x0247)
  (:pointerenter #x0249)
  (:pointerleave #x024a)
  (:pointeractivate #x024b)
  (:pointercapturechanged #x024c)
  (:touchhittesting #x024d)
  (:pointerwheel #x024e)
  (:pointerhwheel #x024f)
  (:pointerroutedto #x0251)
  (:pointerroutedaway #x0252)
  (:pointerroutedreleased #x0253)
  (:ime-setcontext #x0281)
  (:ime-notify #x0282)
  (:ime-control #x0283)
  (:ime-compositionfull #x0284)
  (:ime-select #x0285)
  (:ime-char #x0286)
  (:ime-request #x0288)
  (:ime-keydown #x0290)
  (:ime-keyup #x0291)
  (:mousehover #x02a1)
  (:mouseleave #x02a3)
  (:ncmousehover #x02a0)
  (:ncmouseleave #x02a2)
  (:wtssession-change #x02b1)
  (:tablet-first #x02c0)
  (:tablet-last #x02df)
  (:dpichanged #x02e0)
  (:dpichanged-beforeparent #x02e2)
  (:dpichanged-afterparent #x02e3)
  (:getdpiscaledsize #x02e4)
  (:cut #x0300)
  (:copy #x0301)
  (:paste #x0302)
  (:clear #x0303)
  (:undo #x0304)
  (:renderformat #x0305)
  (:renderallformats #x0306)
  (:destroyclipboard #x0307)
  (:drawclipboard #x0308)
  (:paintclipboard #x0309)
  (:vscrollclipboard #x030a)
  (:sizeclipboard #x030b)
  (:askcbformatname #x030c)
  (:changecbchain #x030d)
  (:hscrollclipboard #x030e)
  (:querynewpalette #x030f)
  (:paletteischanging #x0310)
  (:palettechanged #x0311)
  (:hotkey #x0312)
  (:print #x0317)
  (:printclient #x0318)
  (:appcommand #x0319)
  (:themechanged #x031a)
  (:clipboardupdate #x031d)
  (:dwmcompositionchanged #x031e)
  (:dwmncrenderingchanged #x031f)
  (:dwmcolorizationcolorchanged #x0320)
  (:dwmwindowmaximizedchange #x0321)
  (:dwmsendiconicthumbnail #x0323)
  (:dwmsendiconiclivepreviewbitmap #x0326)
  (:gettitlebarinfoex #x033f)
  (:handheldfirst #x0358)
  (:handheldlast #x035f)
  (:afxfirst #x0360)
  (:afxlast #x037f)
  (:penwinfirst #x0380)
  (:penwinlast #x038f)
  (:app #x8000)
  (:user #x0400))

(cffi:defbitfield window-style
  (:overlapped #x00000000)
  (:popup #x80000000)
  (:child #x40000000)
  (:minimize #x20000000)
  (:visible #x10000000)
  (:disabled #x08000000)
  (:clipsiblings #x04000000)
  (:clipchildren #x02000000)
  (:maximize #x01000000)
  (:caption #x00c00000)
  (:border #x00800000)
  (:dlgframe #x00400000)
  (:vscroll #x00200000)
  (:hscroll #x00100000)
  (:sysmenu #x00080000)
  (:thickframe #x00040000)
  (:group #x00020000)
  (:tabstop #x00010000)
  (:minimizebox #x00020000)
  (:maximizebox #x00010000))

(cffi:defbitfield window-style-ex
  (:dlgmodalframe #x00000001)
  (:noparentnotify #x00000004)
  (:topmost #x00000008)
  (:acceptfiles #x00000010)
  (:transparent #x00000020)
  (:mdichild #x00000040)
  (:toolwindow #x00000080)
  (:windowedge #x00000100)
  (:clientedge #x00000200)
  (:contexthelp #x00000400)
  (:right #x00001000)
  (:left #x00000000)
  (:rtlreading #x00002000)
  (:ltrreading #x00000000)
  (:leftscrollbar #x00004000)
  (:rightscrollbar #x00000000)
  (:controlparent #x00010000)
  (:staticedge #x00020000)
  (:appwindow #x00040000)
  (:layered #x00080000)
  (:noinheritlayout #x00100000)
  (:noredirectionbitmap #x00200000)
  (:layoutrtl #x00400000)
  (:composited #x02000000)
  (:noactivate #x08000000))

(cffi:defbitfield window-class-style
  (:vredraw #x0001)
  (:hredraw #x0002)
  (:dblclks #x0008)
  (:owndc #x0020)
  (:classdc #x0040)
  (:parentdc #x0080)
  (:noclose #x0200)
  (:savebits #x0800)
  (:bytealignclient #x1000)
  (:bytealignwindow #x2000)
  (:globalclass #x4000)
  (:ime #x00010000)
  (:dropshadow #x00020000))

(cffi:defcstruct (window-class :conc-name window-class-)
  (style window-class-style)
  (proc :pointer)
  (class-extra :int)
  (window-extra :int)
  (instance :pointer)
  (icon :pointer)
  (cursor :pointer)
  (background :pointer)
  (menu-name com:wstring)
  (class-name com:wstring))

(cffi:defcstruct (message :conc-name message-)
  (window :pointer)
  (type message-type)
  (wparameter :ssize)
  (lparameter :ssize)
  (time :uint32)
  (x :long)
  (y :long))

(cffi:defcstruct (bitmap-info :conc-name bitmap-info-)
  (size :uint32)
  (width :long)
  (height :long)
  (planes :int16)
  (bit-count :int16)
  (compression :uint32)
  (size-image :uint32)
  (x-per-meter :long)
  (y-per-meter :long)
  (clear-used :uint32)
  (clear-important :uint32)
  (red-mask :uint32)
  (green-mask :uint32)
  (blue-mask :uint32)
  (alpha-mask :uint32))

(cffi:defcstruct (rect :conc-name rect-)
  (left :long)
  (top :long)
  (right :long)
  (bottom :long))

(cffi:defcfun (adjust-window-rect "AdjustWindowRect") :boolean
  (rect :pointer)
  (style :uint32)
  (menu :boolean))

(cffi:defcfun (bit-blt "BitBlt") :bool
  (hdc :pointer)
  (x :int)
  (y :int)
  (cx :int)
  (cy :int)
  (hdc-src :pointer)
  (x1 :int)
  (y1 :int)
  (rop :uint32))

(cffi:defcfun (change-display-settings "ChangeDisplaySettingsW") :long
  (dev-mode :pointer)
  (flags :uint32))

(cffi:defcfun (create-window "CreateWindowExW") :pointer
  (ex-style window-style-ex)
  (class-name com:wstring)
  (window-name com:wstring)
  (style window-style)
  (x :int)
  (y :int)
  (w :int)
  (h :int)
  (parent :pointer)
  (menu :pointer)
  (instance :pointer)
  (param :pointer))

(cffi:defcfun (def-window-proc "DefWindowProcW") :size
  (window :pointer)
  (message :uint)
  (wparameter :size)
  (lparameter :size))

(cffi:defcfun (destroy-window "DestroyWindow") :boolean
  (window :pointer))

(cffi:defcfun (dispatch-message "DispatchMessageW") :size
  (message :pointer))

(cffi:defcfun (enable-non-client-dpi-scaling "EnableNonClientDpiScaling") :boolean
  (window :pointer))

(cffi:defcfun (enum-display-settings "EnumDisplaySettingsW") :boolean
  (device-name :pointer)
  (mode-num :uint32)
  (dev-mode :pointer))

(cffi:defcfun (get-dc "GetDC") :pointer
  (window :pointer))

(cffi:defcfun (get-dpi-for-monitor "GetDpiForMonitor") com:hresult
  (monitor :pointer)
  (dpi-type monitor-dpi-type)
  (x :pointer)
  (y :pointer))

(cffi:defcfun (get-dpi-for-window "GetDpiForWindow") :uint
  (window :pointer))

(cffi:defcfun (get-message-time "GetMessageTime") :long)

(cffi:defcfun (get-system-metrics "GetSystemMetrics") :int
  (index :int))

(cffi:defcfun (get-window "GetWindowLongPtrW") :ssize
  (window :pointer)
  (index :int))

(cffi:defcfun (invalidate-rect "InvalidateRect") :boolean
  (window :pointer)
  (rect :pointer)
  (erase :boolean))

(cffi:defcfun (peek-message "PeekMessageW") :boolean
  (message :pointer)
  (window :pointer)
  (message-filter-min :uint)
  (message-filter-max :uint)
  (remove-message :uint))

(cffi:defcfun (register-class "RegisterClassW") :int16
  (class :pointer))

(cffi:defcfun (unregister-class "UnregisterClassW") :bool
  (name com:wstring)
  (window :pointer))

(cffi:defcfun (release-dc "ReleaseDC") :int
  (window :pointer)
  (dc :pointer))

(cffi:defcfun (send-message "SendMessageW") :ssize
  (window :pointer)
  (message message-type)
  (wparameter :size)
  (lparameter :size))

(cffi:defcfun (set-process-dpi-aware "SetProcessDPIAware") :boolean)

(cffi:defcfun (set-process-dpi-awareness-context "SetProcessDpiAwarenessContext") :boolean
  (context dpi-awareness-context))

(cffi:defcfun (set-process-dpi-awareness "SetProcessDpiAwareness") com:hresult
  (awareness dpi-awareness))

(cffi:defcfun (set-window "SetWindowLongPtrW") :ssize
  (window :pointer)
  (index :int)
  (new-long :ssize))

(cffi:defcfun (set-window-pos "SetWindowPos") :boolean
  (window :pointer)
  (insert-after :pointer)
  (x :int)
  (y :int)
  (cx :int)
  (cy :int)
  (flags :uint))

(cffi:defcfun (show-window "ShowWindow") :boolean
  (window :pointer)
  (cmd-show :int))

(cffi:defcfun (stretch-di-bits"StretchDIBits") :int
  (window :pointer)
  (xdest :int)
  (ydest :int)
  (wdest :int)
  (hdest :int)
  (xsrc :int)
  (ysrc :int)
  (wsrc :int)
  (hsrc :int)
  (rop :uint32))

(cffi:defcfun (translate-message "TranslateMessage") :boolean
  (message :pointer))

(cffi:defcfun (validate-rect "ValidateRect") :boolean
  (window :pointer)
  (rect :pointer))

