:: - Versions 1.0.8 -
:: - LastEditTime 2023/06/22 18:20 -
@echo off
chcp 65001 >nul 2>&1
%1 %2
ver|find "5.">nul&&goto :Admin
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :Admin","","runas",1)(window.close)&goto :eof
:Admin

:: 菜單首頁
:menu
color BC

:: 文字效果 : 1m(粗體) 3m(斜體) 23m(正體) 4m(底線) 53m(上划線) 22m(雙底線) 9m(刪除線) 7m(背景色與文字色反轉) 27m(復原背景色與文字色)
:: 文字色 : 30m(灰黑色) 31m(紅色) 32m(綠色) 33m(黃色) 34m(藍色) 35m(紫色) 36m(青藍色) 37m(白色)
:: 背景色 : 40m(黑底) 41m(紅底) 43m(黃底) 44m(藍底) 45m(紫底) 46m(青藍底) 49m(透明底)

:: 檢查防火牆狀態
for /f "tokens=2 delims=: " %%i in ('netsh advfirewall show allprofiles state ^| find "State"') do set "firewall_status=%%i"
if "%firewall_status%"=="ON" (
    set "display=啟用"
) else (
    set "display=禁用"
)

cls

@ ECHO [1m
@ ECHO [94m======================================================================================================================
@ ECHO                                       - 工具箱 Versions 1.0.8 2023/06/14 -
@ ECHO ======================================================================================================================[91m
@ ECHO.
@ ECHO [3m[94m   Windows系統開關機 :[91m[23m
@ ECHO.
@ ECHO    [1] 睡眠    [2] 重啟    [3] 關機
@ ECHO.
@ ECHO [3m[94m   Windows防火牆開關 :[91m[23m
@ ECHO.
@ ECHO    [4] 開啟防火牆    [5] 關閉防火牆    [3m[7m 防火牆當前狀態 [95m[23m [%display%] [91m[27m
@ ECHO.
@ ECHO [3m[94m   Surfshark服務操作 :[91m[23m
@ ECHO.
@ ECHO    [6] 開啟服務 (Surfshark運行)    [7] 關閉服務 (Surfshark終止)
@ ECHO.
@ ECHO [3m[94m   瀏覽器操作 :[91m[23m
@ ECHO.
@ ECHO    [8] Edge 啟用右上AI圖示    [9] Edge 關閉右上AI圖示
@ ECHO.
@ ECHO    [10] Google 變更緩存位置    [11] Google 一鍵優化設置    [12] Google 修復受機構管理 (重置優化設置)
@ ECHO.
@ ECHO    [13] Edge 變更緩存位置    [14] Edge 一鍵優化設置    [15] Edge 修復受組織管理 (重置優化設置)
@ ECHO.
@ ECHO [3m[94m   重置功能 :[91m[23m
@ ECHO.
@ ECHO    [16] 網路重置    [17] R:/ 重置
@ ECHO.
@ ECHO    [18] Google 結束進程    [19] Edge 結束進程    [20] Adobe 結束進程      [21] AnLink 結束進程     
@ ECHO.
@ ECHO [3m[94m   授權功能 :[91m[23m
@ ECHO.   
@ ECHO    [22] RAR授權     [23] IDM授權    [24] Windows 啟用授權    [25] Office 啟用授權
@ ECHO.
@ ECHO [3m[94m   特別功能 :[91m[23m
@ ECHO.
@ ECHO    [26] 關閉UAC安全通知    [27] Visual C++ (x64)安裝    [28] .NET安裝    [29] Windows 一鍵優化設置
@ ECHO.
@ ECHO [3m[97m----------------------------------------------------------------------------------------------------------------------
@ ECHO                                           - 系統指令操作 (不分大小寫) -
@ ECHO ----------------------------------------------------------------------------------------------------------------------[91m[23m
@ ECHO.
@ ECHO    [CT] 系統控制台    [GP] 本機群組原則    [RD] 登入編輯程式    [UG] 使用者群組    [DX] DX診斷工具    [MF] 系統開機設置
@ ECHO.
@ ECHO    [WS] 電腦啟用狀態    [SI] 查看系統資訊    [MSI] 查看完整系統資訊    [NV] 查看顯卡驅動版本    [HW] 查看電腦機器碼
@ ECHO.
@ ECHO    [IP] 查看電腦IP位置    [RS] 查看遠端分享    [MC] MAC地址查詢    [SV] 查看運行中的服務    [MRT] 惡意軟體移除工具    
@ ECHO.
@ ECHO    [WF] 顯示已連接過的wifi    [DV] 修復驅動安裝問題    [SR] 系統錯誤修復            
@ ECHO.
@ ECHO [94m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@ ECHO                                   [H] 工具說明    [0] 離開程式    [V] 更新資訊
@ ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~[91m
@ ECHO.

:: ========================================================================================================================

set /p choice="選擇功能 - 輸入按下(Enter) : "

:: 選擇後清除
cls

:: ========================================================================================================================

if %choice% equ 0 (
    exit

) else if /I "%choice%"=="h" (
    call :Help&goto menu

) else if /I "%choice%"=="v" (
    call :UB&goto menu

) else if %choice% equ 1 (
    call :Sleep&goto menu

) else if %choice% equ 2 (
    call :Reboot&goto menu

) else if %choice% equ 3 (
    call :Shutdown&goto menu

) else if %choice% equ 4 (
    call :DE&goto menu

) else if %choice% equ 5 (
    call :DD&goto menu

) else if %choice% equ 6 (
    call :SE&goto menu

) else if %choice% equ 7 (
    call :SD&goto menu

) else if %choice% equ 8 (
    call :EdgeAIE&goto menu

) else if %choice% equ 9 (
    call :EdgeAID&goto menu

) else if %choice% equ 10 (
    call :GoogleCC&goto menu

) else if %choice% equ 11 (
    call :GoogleOp&goto menu

) else if %choice% equ 12 (
    call :GoogleR&goto menu

) else if %choice% equ 13 (
    call :EdgeCC&goto menu

) else if %choice% equ 14 (
    call :EdgeOp&goto menu

) else if %choice% equ 15 (
    call :EdgeR&goto menu

) else if %choice% equ 16 (
    call :NR&goto menu

) else if %choice% equ 17 (
    call :Rdisk&goto menu

) else if %choice% equ 18 (
    call :GR&goto menu

) else if %choice% equ 19 (
    call :ER&goto menu

) else if %choice% equ 20 (
    call :ADE&goto menu

) else if %choice% equ 21 (
    call :ALE&goto menu

) else if %choice% equ 22 (
    call :Authorization&goto menu

) else if %choice% equ 23 (
    call :Idm&goto menu

) else if %choice% equ 24 (
    call :windows&goto menu

) else if %choice% equ 25 (
    call :office&goto menu

)  else if %choice% equ 26 (
    call :UACd&goto menu

) else if %choice% equ 27 (
    call :VSC&goto menu

) else if %choice% equ 28 (
    call :NETInstall&goto menu

) else if %choice% equ 29 (
    call :winop&goto menu

) else if /I "%choice%"=="ct" (
    Control
    goto menu

) else if /I "%choice%"=="gp" (
    gpedit.msc
    goto menu

) else if /I "%choice%"=="rd" (
    regedit
    goto menu

) else if /I "%choice%"=="ug" (
    lusrmgr.msc
    goto menu

) else if /I "%choice%"=="dx" (
    dxdiag
    goto menu

) else if /I "%choice%"=="mf" (
    msconfig
    goto menu

) else if /I "%choice%"=="ws" (
    slmgr.vbs -xpr
    goto menu

) else if /I "%choice%"=="si" (
    ECHO 請稍後...
    systeminfo
    pause
    goto menu

) else if /I "%choice%"=="msi" (
    MSInfo32
    goto menu

) else if /I "%choice%"=="nv" (
    nvidia-smi
    pause
    goto menu

) else if /I "%choice%"=="hw" (
    call :Hwid&goto menu

) else if /I "%choice%"=="ip" (
    ipconfig /all
    pause
    goto menu

) else if /I "%choice%"=="rs" (
    net share
    pause
    goto menu

) else if /I "%choice%"=="mc" (
    getmac /fo table /v
    pause
    goto menu

) else if /I "%choice%"=="sv" (
    net start
    pause
    goto menu

) else if /I "%choice%"=="mrt" (
    mrt
    goto menu

) else if /I "%choice%"=="wf" (
    netsh wlan show profiles
    pause
    goto menu

) else if /I "%choice%"=="dv" (
    msdt.exe -id DeviceDiagnostic
    goto menu

) else if /I "%choice%"=="sr" (
    call :SystemRepair&goto menu

) else (
    echo 無效的選項
    timeout /t 2 >nul
    goto menu
)

:: ========================================================================================================================

:: ~~~~~ 電腦睡眠 ~~~~~
:Sleep

start rundll32.exe powrprof.dll,SetSuspendState 0,1,0 >nul

exit

:: ~~~~~ 電腦重啟 ~~~~~
:Reboot

shutdown /r /t 0 >nul

exit

:: ~~~~~ 電腦關機 ~~~~~
:Shutdown

shutdown /s /t 0 >nul

exit

:: ========================================================================================================================

:: ~~~~~ 啟用防火牆 ~~~~~
:DE

ECHO.
ECHO 防火牆 啟用中...
ECHO.

netsh advfirewall set allprofiles state on >nul

timeout /t 1 >nul

exit /b

:: ~~~~~ 禁用防火牆 ~~~~~
:DD

ECHO.
ECHO 防火牆 關閉中...
ECHO.

netsh advfirewall set allprofiles state off >nul

timeout /t 1 >nul

exit /b

:: ========================================================================================================================

:: ~~~~~ 啟動Surfshark ~~~~~
:SE

ECHO.
ECHO Surfshark 啟動中...
ECHO.

sc config "Surfshark Service" start= demand >nul
net start "Surfshark WireGuard" >nul
net start "Surfshark Service" >nul
start C:\"Program Files (x86)"\Surfshark\Surfshark.exe >nul

exit /b

:: ~~~~~ 關閉Surfshark ~~~~~
:SD

ECHO.
ECHO Surfshark 關閉中...
ECHO.

wmic process where name="Surfshark.exe" delete >nul
sc config "Surfshark Service" start= demand >nul
net stop "Surfshark WireGuard" >nul
net stop "Surfshark Service" >nul

exit /b

:: ========================================================================================================================

:: ~~~~~ 啟用edge AI圖示 ~~~~~
:EdgeAIE

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HubsSidebarEnabled" /t REG_DWORD /d 1 /f

ECHO.
ECHO 請自行重啟瀏覽器...
ECHO.

pause

exit /b

:: ~~~~~ 關閉edge AI圖示 ~~~~~
:EdgeAID

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HubsSidebarEnabled" /t REG_DWORD /d 0 /f

ECHO.
ECHO 請自行重啟瀏覽器...
ECHO.

pause

exit /b

:: ~~~~~ google 變更緩存位置 ~~~~~
:GoogleCC
setlocal

set "folderPath="
set "vbsScript=%temp%\folderSelection.vbs"

ECHO.
ECHO 這將會改變Google的緩存位置
ECHO.
ECHO 請選擇要設置的路徑位置...
ECHO.
timeout /t 1 >nul

:: 選擇窗口(VBScript)
>"%vbsScript%" echo set shellApp = CreateObject("Shell.Application") : set folder = shellApp.BrowseForFolder(0, "Select path", 0, 64) : if not folder is nothing then WScript.Echo folder.Self.Path

for /f "delims=" %%I in ('cscript //nologo "%vbsScript%"') do set "folderPath=%%I"
del "%vbsScript%"

if defined folderPath (
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "DiskCacheDir" /t REG_SZ /d "%folderPath%GoogleCache" /f
    echo.
    echo 修改成功！緩存目錄已設置為："%folderPath%GoogleCache"
) else (
    echo 未選擇任何路徑，修改取消。
)

endlocal
timeout /t 2 >nul
exit /b

:: ~~~~~ google 一鍵功能優化 ~~~~~
:GoogleOp

:: 原則說明文件
:: https://admx.help/?Category=Chrome&Language=zh-tw

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "DiskCacheSize" /t REG_SZ /d "2000000000" /f
:: 安全瀏覽功能防護等級 0 關閉 1 預設 2強化防護
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "SafeBrowsingProtectionLevel" /t REG_DWORD /d 2 /f
:: 將這項政策設為 Disabled，則表示除非使用者停用 PDF 外掛程式，否則系統一律會使用 PDF 外掛程式開啟 PDF 檔案
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "AlwaysOpenPdfExternally" /t REG_DWORD /d 0 /f
:: 下載檔案安全限制 0 ~ 4 , 0 無特別限制
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "DownloadRestrictions" /t REG_DWORD /d 0 /f
:: 拼音檢查功能
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "SpellCheckServiceEnabled" /t REG_DWORD /d 0 /f
:: 0 無論使用任何網路連線，皆預測網路動作
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "NetworkPredictionOptions" /t REG_DWORD /d 0 /f
:: 首次啟動時從預設瀏覽器匯入已儲存的密碼
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "ImportSavedPasswords" /t REG_DWORD /d 1 /f
:: 首次啟動時從預設瀏覽器匯入搜尋引擎
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "ImportSearchEngine" /t REG_DWORD /d 1 /f
:: 首次啟動時從預設瀏覽器匯入搜尋書籤
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "ImportBookmarks" /t REG_DWORD /d 1 /f
:: 首次啟動時從預設瀏覽器匯入表單資料
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "ImportAutofillFormData" /t REG_DWORD /d 1 /f
:: 顯示完整網址
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "ShowFullUrlsInAddressBar" /t REG_DWORD /d 1 /f
:: Quic通訊
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "QuicAllowed" /t REG_DWORD /d 1 /f
:: 允許音訊程式在 Windows 系統上以高於一般優先順序的次序執行
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "AudioProcessHighPriorityEnabled" /t REG_DWORD /d 1 /f
:: 禁止顯示侵入式廣告
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "AdsSettingForIntrusiveAdsSites" /t REG_DWORD /d 2 /f
:: 匿名收集數據功能
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "UrlKeyedAnonymizedDataCollectionEnabled" /t REG_DWORD /d 0 /f
:: 啟用視窗遮蔽功能
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "WindowOcclusionEnabled" /t REG_DWORD /d 1 /f
:: YouTube 嚴格篩選模式
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "ForceYouTubeRestrict" /t REG_DWORD /d 0 /f
:: 允許使用無頭
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "HeadlessMode" /t REG_DWORD /d 1 /f
:: 加入進階保護計畫的使用者啟用額外防護功能
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "AdvancedProtectionAllowed" /t REG_DWORD /d 1 /f
:: 設定單一 Chrome 例項可以使用的記憶體大小限制
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "TotalMemoryLimitMb REG_DWORD" /t REG_DWORD /d 1024 /f
:: 顯示完整網址
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "ShowFullUrlsInAddressBar" /t REG_DWORD /d 1 /f

ECHO.
ECHO 優化完成
ECHO.
ECHO 請自行重啟瀏覽器...
ECHO.

pause
exit /b

:: ~~~~~ 修復 Google 瀏覽器受管理 ~~~~~
:GoogleR

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /f

ECHO.
ECHO 請自行重啟瀏覽器...
ECHO.

pause

exit /b

:: ~~~~~ edge 變更緩存位置 ~~~~~
:EdgeCC
setlocal

set "folderPath="
set "vbsScript=%temp%\folderSelection.vbs"

ECHO.
ECHO 這將會改變Edge的緩存位置
ECHO.
ECHO 請選擇要設置的路徑位置...
ECHO.
timeout /t 1 >nul

:: 選擇窗口(VBScript)
>"%vbsScript%" echo set shellApp = CreateObject("Shell.Application") : set folder = shellApp.BrowseForFolder(0, "Select path", 0, 64) : if not folder is nothing then WScript.Echo folder.Self.Path

for /f "delims=" %%I in ('cscript //nologo "%vbsScript%"') do set "folderPath=%%I"
del "%vbsScript%"

if defined folderPath (
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DiskCacheDir" /t REG_SZ /d "%folderPath%EdgeCache" /f
    echo.
    echo 修改成功！緩存目錄已設置為："%folderPath%EdgeCache"
) else (
    echo 未選擇任何路徑，修改取消。
)

endlocal
timeout /t 2 >nul
exit /b

:: ~~~~~ edge 一鍵功能優化 ~~~~~
:EdgeOp

:: 原則說明文件
:: https://admx.help/?Category=EdgeChromium&Language=zh-tw
:: 功能查詢
:: https://learn.microsoft.com/zh-tw/DeployEdge/microsoft-edge-policies

:: 設置快取大小
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DiskCacheSize" /t REG_SZ /d "2000000000" /f
:: 可讓螢幕助讀程式使用者取得網頁上未標記影像的描述
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AccessibilityImageLabelsEnabled" /t REG_DWORD /d 1 /f
:: 搜尋不到時 , 提供類似頁面
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AlternateErrorPagesEnabled" /t REG_DWORD /d 1 /f
:: 可讓啟用應用程式防護的 Microsoft Edge 電腦/裝置將我的最愛從主機同步處理到容器
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ApplicationGuardFavoritesSyncEnabled" /t REG_DWORD /d 1 /f
:: 啟用此原則，使用者將無法在應用程式防護中上傳檔案
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ApplicationGuardUploadBlockingEnabled" /t REG_DWORD /d 0 /f
:: 允許音訊處理程式在 Windows 上以高於正常優先順序執行
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AudioProcessHighPriorityEnabled" /t REG_DWORD /d 1 /f
:: 允許匯入表單資訊
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ImportAutofillFormData" /t REG_DWORD /d 1 /f
:: 允許匯入瀏覽器設定
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ImportBrowserSettings" /t REG_DWORD /d 1 /f
:: 允許匯入 Cookie
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ImportCookies" /t REG_DWORD /d 1 /f
:: 允許匯入擴充功能
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ImportExtensions" /t REG_DWORD /d 1 /f
:: 允許匯入 [我的最愛]
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ImportFavorites" /t REG_DWORD /d 1 /f
:: 允許匯入歷史紀錄
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ImportHistory" /t REG_DWORD /d 1 /f
:: 允許匯入首頁設定
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ImportHomepage" /t REG_DWORD /d 1 /f
:: 允許匯入已開啟的索引標籤
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ImportOpenTabs" /t REG_DWORD /d 1 /f
:: 允許匯入付款資訊
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ImportPaymentInfo" /t REG_DWORD /d 1 /f
:: 允許匯入已儲存的密碼
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ImportSavedPasswords" /t REG_DWORD /d 1 /f
:: 允許匯入搜尋引擎設定
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ImportSearchEngine" /t REG_DWORD /d 1 /f
:: 允許匯入捷徑
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ImportShortcuts" /t REG_DWORD /d 1 /f
:: 允許匯入設置
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ImportStartupPageSettings" /t REG_DWORD /d 1 /f
:: 允許執行音訊沙箱
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AudioSandboxEnabled" /t REG_DWORD /d 1 /f
:: 如果您啟用此原則，使用者就可以看到 edge://compat 頁面上的 Enterprise Mode Site List Manager 的瀏覽按鈕，以瀏覽到該工具並加以使用。
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EnterpriseModeSiteListManagerAllowed" /t REG_DWORD /d 0 /f
:: 可用時便使用硬體加速
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HardwareAccelerationModeEnabled" /t REG_DWORD /d 1 /f
::  封鎖含有干擾廣告的網站上的廣告
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AdsSettingForIntrusiveAdsSites" /t REG_DWORD /d 2 /f
:: 自動完成地址資訊
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AutofillAddressEnabled" /t REG_DWORD /d 1 /f
:: 自動完成信用卡資訊
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AutofillCreditCardEnabled" /t REG_DWORD /d 1 /f
:: 首次執行時，自動匯入其他瀏覽器的資料和設定 (0) = 從預設的瀏覽器自動匯入 , (1) = 從 Internet Explorer 自動匯入 , (2) = 從 Google Chrome 自動匯入 , (3) = 從 Safari 自動匯入 , (4) = 已停用自動匯入 , (5) = 從 Mozilla Firefox 自動匯入
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AutoImportAtFirstRun" /t REG_DWORD /d 2 /f
:: 關閉後繼續執行背景應用程式
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /t REG_DWORD /d 0 /f
:: 封鎖 Bing 搜尋結果中的所有廣告
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "BingAdsSuppression" /t REG_DWORD /d 1 /f
:: 使用內建 DNS 用戶端
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "BuiltInDnsClientEnabled" /t REG_DWORD /d 1 /f
:: 封鎖使用者的網頁瀏覽活動追蹤 (0) = 關閉 , (1) = 基本 , (2) = 平衡 , (3) = 嚴格
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "TrackingPrevention" /t REG_DWORD /d 3 /f
:: 傳送不要追蹤
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ConfigureDoNotTrack" /t REG_DWORD /d 1 /f
:: 防止 Microsoft 收集使用者的 Microsoft Edge 瀏覽歷程記錄
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d 0 /f
:: (1) = 允許網站追蹤使用者的實體位置 , (2) = 不允許任何網站追蹤使用者的實體位置 , (3) = 每當網站想要追蹤使用者的實體位置時詢問
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DefaultGeolocationSetting" /t REG_DWORD /d 2 /f
:: 關閉家長監護
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "FamilySafetySettingsEnabled" /t REG_DWORD /d 0 /f
:: 設置是否可以利用「線上文字轉語音」語音字型
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ConfigureOnlineTextToSpeech" /t REG_DWORD /d 1 /f
:: 移轉時刪除舊版瀏覽器資料
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DeleteDataOnMigration" /t REG_DWORD /d 1 /f
:: 設定 Microsoft Edge 是否可以自動增強影像
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeEnhanceImagesEnabled" /t REG_DWORD /d 1 /f
:: 啟用工作區功能
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeWorkspacesEnabled" /t REG_DWORD /d 1 /f
:: 啟用效率模式 (主要是筆電)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EfficiencyModeEnabled" /t REG_DWORD /d 1 /f
:: 啟用密碼顯示按紐
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PasswordRevealEnabled" /t REG_DWORD /d 1 /f
:: 啟用儲存密碼
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PasswordManagerEnabled" /t REG_DWORD /d 1 /f
:: 啟用性能檢測
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PerformanceDetectorEnabled" /t REG_DWORD /d 1 /f
:: 啟動提昇 (啟用了話 , 會在關閉程式後 , 背景進程繼續運行)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "StartupBoostEnabled" /t REG_DWORD /d 0 /f
:: 啟用睡眠標籤
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SleepingTabsEnabled" /t REG_DWORD /d 1 /f
:: 禁止新分頁頁面上的 Microsoft 新聞內容
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageContentEnabled" /t REG_DWORD /d 0 /f
:: 新的索引標籤頁面隱藏預設熱門網站
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageHideDefaultTopSites" /t REG_DWORD /d 1 /f
:: 啟用域名檢測器
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "TyposquattingCheckerEnabled" /t REG_DWORD /d 1 /f
:: 可讓使用者比較他們所查看的產品價格、從所在網站獲得優待卷，或在結帳時自動套用優待卷。
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeShoppingAssistantEnabled" /t REG_DWORD /d 1 /f
:: 啟用搜尋建議
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SearchSuggestEnabled" /t REG_DWORD /d 1 /f
:: 視窗閉塞 偵測視窗是否被其他視窗覆蓋，而且將暫停工作繪製像素。
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "WindowOcclusionEnabled" /t REG_DWORD /d 1 /f
:: 控制 DNS 預先擷取、TCP 和 SSL 預先連線和預先轉譯網頁 (0) = 預測任何網路連線上的網路動作 , (2) = 不要預測任何網路連線的網路動作
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NetworkPredictionOptions" /t REG_DWORD /d 0 /f
:: 將不相容的網站從 Internet Explorer 重新導向至 Microsoft Edge
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "RedirectSitesFromInternetExplorerRedirectMode" /t REG_DWORD /d 1 /f
:: 允許來自裝置上建議提供者 (本地提供者) 的建議，例如 Microsoft Edge 的網址列和自動建議清單中的 [我的最愛] 和 [瀏覽歷程記錄]。
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "LocalProvidersEnabled" /t REG_DWORD /d 1 /f
:: 下載限制 (0) = 沒有特殊限制 , (1) = 封鎖危險下載內容 , (2) = 封鎖有潛在危險或垃圾下載項目 , (3) = 封鎖所有下載
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DownloadRestrictions" /t REG_DWORD /d 0 /f
:: 啟動時動作 (5) = 開啟新索引標籤 , (1) = 還原上次工作階段 , (4) = 開啟 URL 清單
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "RestoreOnStartup" /t REG_DWORD /d 5 /f
:: 檢查下載源安全性
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenForTrustedDownloadsEnabled" /t REG_DWORD /d 0 /f
:: 是否可以接收 Microsoft 服務的自訂背景影像和文字、建議、通知及提示
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SpotlightExperiencesAndRecommendationsEnabled" /t REG_DWORD /d 0 /f
:: 啟用 Microsoft Defender SmartScreen
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenEnabled" /t REG_DWORD /d 1 /f
:: 允許使用者從 HTTPS 警告頁面繼續
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SSLErrorOverrideAllowed" /t REG_DWORD /d 1 /f
:: 在 Microsoft Edge 沈浸式閱讀程式內啟用文法工具功能
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ImmersiveReaderGrammarToolsEnabled" /t REG_DWORD /d 1 /f
:: Microsoft Edge 中沈浸式閱讀程式內的圖片字典功能
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ImmersiveReaderPictureDictionaryEnabled" /t REG_DWORD /d 1 /f
:: 控制是否允許網站對更多私人網路端點提出要求
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "InsecurePrivateNetworkRequestsAllowed" /t REG_DWORD /d 1 /f
:: 啟用新索引標籤頁面的預先載入
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPagePrerenderEnabled" /t REG_DWORD /d 1 /f
:: 禁用限制可在密碼管理員中儲存的密碼長度
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PasswordManagerRestrictLengthEnabled" /t REG_DWORD /d 1 /f
:: 啟用密碼不安全的提示
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PasswordMonitorAllowed" /t REG_DWORD /d 1 /f
:: 啟用此設定，則使用者將無法忽略 Microsoft Defender SmartScreen 警告，且會讓使用者無法繼續瀏覽該網站。
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PreventSmartScreenPromptOverride" /t REG_DWORD /d 0 /f
:: 如果啟用此原則，則您組織中的使用者將無法忽略 Microsoft Defender SmartScreen 警告，且會讓使用者無法完成未驗證的下載。
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PreventSmartScreenPromptOverrideForFiles" /t REG_DWORD /d 0 /f
:: 允許 QUIC 通訊協定
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "QuicAllowed" /t REG_DWORD /d 1 /f
:: 顯示微軟獎勵
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ShowMicrosoftRewards" /t REG_DWORD /d 0 /f
:: 顯示使用edge作為默認pdf開啟
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ShowPDFDefaultRecommendationsEnabled" /t REG_DWORD /d 0 /f
:: 允許來自 Microsoft Edge 的功能建議和瀏覽器協助通知
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ShowRecommendationsEnabled" /t REG_DWORD /d 0 /f
:: 允許從進程管理關閉edge
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "TaskManagerEndProcessEnabled" /t REG_DWORD /d 1 /f
:: 限制 WebRTC 暴露本地 IP 位址
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "WebRtcLocalhostIpHandling" /t REG_SZ /d "default_public_interface_only" /f

ECHO.
ECHO 優化完成
ECHO.
ECHO 請自行重啟瀏覽器...
ECHO.

pause
exit /b

:: ~~~~~ 修復 edge 瀏覽器受管理 ~~~~~
:EdgeR

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge" /f
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Edge" /f
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\MicrosoftEdge" /f

ECHO.
ECHO 請自行重啟瀏覽器...
ECHO.

pause

exit /b

:: ========================================================================================================================

:: ~~~~~ 網路重置 ~~~~~
:NR

ECHO.
ECHO 網路重置中...
ECHO.

ipconfig /release >nul
ipconfig /flushdns >nul
netsh int ip reset >nul
netsh int tcp reset >nul
netsh winsock reset >nul
netsh advfirewall reset >nul
ipconfig /renew >nul

timeout /t 1 >nul

exit /b

:: ~~~~~ R盤重置 ~~~~~
:Rdisk

ECHO.
ECHO 開始重置...
ECHO.

RD /s /q R:\

timeout /t 1 >nul

exit /b

:: ~~~~~ Google重置 ~~~~~
:GR

ECHO.
ECHO Google結束中...
ECHO.

wmic process where name="chrome.exe" delete >nul

timeout /t 1 >nul

exit /b

:: ~~~~~ Edge重置 ~~~~~
:ER

ECHO.
ECHO Edge結束中...
ECHO.

wmic process where name="msedge.exe" delete >nul

timeout /t 1 >nul

exit /b

:: ~~~~~ Adobe結束背景 ~~~~~
:ADE

ECHO.
ECHO Adobe結束背景...
ECHO.

wmic process where name="AdobeIPCBroker.exe" delete >nul
wmic process where name="CCLibrary.exe" delete >nul
wmic process where name="node.exe" delete >nul
wmic process where name="OfficeClickToRun.exe" delete >nul

timeout /t 1 >nul

exit /b

:: ~~~~~ AnLink結束背景 ~~~~~
:ALE

ECHO.
ECHO AnLink結束背景...
ECHO.

:loop

tasklist /fi "imagename eq ald.exe" | find /i "ald.exe" > nul
if %errorlevel% equ 0 (
    wmic process where name="ald.exe" delete >nul
    goto loop
)

tasklist /fi "imagename eq AnLink.exe" | find /i "AnLink.exe" > nul
if %errorlevel% equ 0 (
    wmic process where name="AnLink.exe" delete >nul
    goto loop
)

tasklist /fi "imagename eq dllhost.exe" | find /i "dllhost.exe" > nul
if %errorlevel% equ 0 (
    wmic process where name="dllhost.exe" delete >nul
    goto loop
)

tasklist /fi "imagename eq ApplicationFrameHost.exe" | find /i "ApplicationFrameHost.exe" > nul
if %errorlevel% equ 0 (
    wmic process where name="ApplicationFrameHost.exe" delete >nul
    goto loop
)

timeout /t 1 >nul

exit /b

:: ~~~~~ RAR授權 ~~~~~
:Authorization

ECHO.
ECHO 授權中請稍後...
ECHO.

if not exist "C:\Program Files\WinRAR\Rarreg.key" (
    certutil -urlcache -split -f "https://raw.githubusercontent.com/TenshinoOtoKafu/Implementation-Project/Main/Command Prompt/Rar/Rarreg.key" Rarreg.key >nul
    move Rarreg.key "C:\Program Files\WinRAR" >nul
    ECHO 授權完成...
) else (
    ECHO 已存在授權...
)

timeout /t 2 >nul

exit /b

:: ~~~~~ IDM授權 ~~~~~
:Idm

if not exist "%Temp%\IDM.cmd" (
    ECHO.
    ECHO 授權程式下載中請稍後...
    ECHO.

    certutil -urlcache -split -f "https://raw.githubusercontent.com/TenshinoOtoKafu/Implementation-Project/Main/Command Prompt/Idm/IDM.tar" IDM.tar >nul
    
    tar -xf IDM.tar >nul
    del /f /s /q IDM.tar >nul
    move IDM.cmd "%Temp%" >nul

    ECHO 下載完成...
)

ECHO.
ECHO 啟動程式...

cd %Temp%
start IDM.cmd

timeout /t 2 >nul

exit /b

:: ~~~~~ windows啟用 ~~~~~
:windows

ECHO.
ECHO 獲取授權程式最新版本
ECHO.
ECHO 下載中請稍後...
ECHO.

:: 確保最新版本
certutil -urlcache -split -f "https://raw.githubusercontent.com/massgravel/Microsoft-Activation-Scripts/master/MAS/All-In-One-Version/MAS_AIO.cmd" MAS_AIO.cmd >nul
move MAS_AIO.cmd "%Temp%" >nul

ECHO 下載完成...
ECHO.
ECHO 啟動程式...

cd %Temp%
start MAS_AIO.cmd

timeout /t 2 >nul

exit /b

:: ~~~~~ office啟用 ~~~~~
:office

ECHO.
ECHO 獲取授權程式最新版本
ECHO.
ECHO 下載中請稍後...
ECHO.

certutil -urlcache -split -f "https://raw.githubusercontent.com/abbodi1406/KMS_VL_ALL_AIO/master/KMS_VL_ALL_AIO.cmd" KMS_VL_ALL_AIO.cmd >nul
move KMS_VL_ALL_AIO.cmd "%Temp%" >nul

ECHO 下載完成...
ECHO.
ECHO 啟動程式...

cd %Temp%
start KMS_VL_ALL_AIO.cmd

timeout /t 2 >nul

exit /b

:: ************************************************************************************************************************

:: ~~~~~ 關閉UAC通知 ~~~~~
:UACd

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f

ECHO.
ECHO 電腦重啟後生效
ECHO.

timeout /t 2 >nul
exit /b

:: ~~~~~ windows系統優化 ~~~~~
:winop

ECHO.
ECHO 開始優化設置
ECHO.
ECHO 有些功能不支援會跳出錯誤訊息
ECHO.

:: 關機時是否清除分頁文件
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d 1 /f
:: 是否禁用對執行文件（executable files）的分頁
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d 1 /f
:: 否使用大型系統高速緩存
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f
:: 設置記憶體使用大小 1920x1080 / 6 | 2560x1440 / 12 | 3840x2160 / 24
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d 12 /f

:: 設為1，那麼當您使用遊戲列(Win+G)來錄製全螢幕模式下的遊戲時，系統會自動將遊戲切換到全螢幕視窗化模式，以提高錄製的效能和品質
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d 1 /f
:: 設定全螢幕模式下的遊戲錄製品質。可能的值有0、1或2，分別代表高、中或低品質
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d 2 /f
:: 設定全螢幕模式下的遊戲錄製行為。可能的值有0、1或2，分別代表停用、全螢幕視窗化或全螢幕專屬模式
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d 2 /f
:: 螢幕錄製功能啟用
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 2 /f
:: 啟用全螢幕錄製行為
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d 1 /f

:: 動畫效果設置自訂
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 3 /f
:: 設置動畫效果
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "90 12 03 80" /f

:: 記憶體相關設置
powershell -command "Enable-MMAgent -ApplicationLaunchPrefetching"
powershell -command "Enable-MMAgent -OperationAPI"
powershell -command "Set-MMAgent -MaxOperationAPIFiles 2048"
powershell -command "Enable-MMAgent -PageCombining"

ECHO.
ECHO 電腦重啟後生效
ECHO.

timeout /t 2 >nul
exit /b

:: ~~~~~ 安裝.NET ~~~~~
:NETInstall

winget install Microsoft.DotNet.SDK.6
winget install Microsoft.DotNet.SDK.7

timeout /t 2 >nul
exit /b

:: ~~~~~ 安裝 Visual C++ ~~~~~
:: https://learn.microsoft.com/zh-tw/cpp/windows/latest-supported-vc-redist?view=msvc-170
:: https://www.techpowerup.com/download/visual-c-redistributable-runtime-package-all-in-one/
:VSC

if not exist "%Temp%\Visual.tar" (

    ECHO.
    ECHO 檔案較大請稍後 - 安裝包日期 : 2023 年 5 月 
    ECHO.
    ECHO Visual C++ 下載中...
    ECHO.

    certutil -urlcache -split -f "https://raw.githubusercontent.com/TenshinoOtoKafu/Implementation-Project/Main/Command Prompt/Visual C++/Visual.tar" Visual.tar >nul
    move Visual.tar "%Temp%" >nul

    ECHO 下載完成...
    ECHO.

    cd %Temp%

    ECHO 解壓中...
    tar -xf Visual.tar >nul

) else (
    cd %Temp%
)

ECHO.
ECHO 開始安裝...

start /wait vcredist2005_x64.exe /q
start /wait vcredist2008_x64.exe /qb
start /wait vcredist2010_x64.exe /passive /norestart
start /wait vcredist2012_x64.exe /passive /norestart
start /wait vcredist2013_x64.exe /passive /norestart
start /wait vcredist2015_2017_2019_2022_x64.exe /passive /norestart

timeout /t 1 >nul

exit /b

:: ************************************************************************************************************************

:: ~~~~~ 查看機器碼 ~~~~~
:Hwid

Color 06

echo [92m===============================[93m
echo [91m        作業系統
echo [92m===============================[93m
wmic Os get caption

echo [95m===============================[93m
echo [91m      主機板資訊
echo [95m===============================[93m
wmic baseboard get product,manufacturer,serialnumber

echo [94m===============================[93m
echo [91m       CPU資訊
echo [94m===============================[93m
wmic cpu get name,processorid,serialnumber

echo [97m===============================[93m
echo [91m       硬碟資訊
echo [97m===============================[93m
wmic diskdrive get model,serialnumber,size

echo [95m===============================[93m
echo [91m       RAM資訊
echo [95m===============================[93m
wmic memorychip get PartNumber, SerialNumber,speed

echo [92m===============================[93m
echo [91m       GPU資訊
echo [92m===============================[93m
wmic Path win32_videocontroller get name,Description,PNPDeviceID

echo [96m===============================[93m
echo [91m       BIOS資訊
echo [96m===============================[93m
wmic bios get serialnumber,Manufacturer,Name

echo [92m===============================[93m
echo [91m       BIOS資訊 UUID
echo [92m===============================[93m
wmic csproduct get uuid

echo [97m===============================[93m
echo [91m       網路卡資訊
echo [97m===============================[93m 
wmic Nic get caption

getmac
ECHO 上面為MAC序號列

ECHO **********************************
ECHO       serialnumber為序號列
ECHO **********************************
ECHO.
pause

exit /b

:: ~~~~~ 系統修復 ~~~~~
:SystemRepair

color 02

ECHO.
ECHO 準備修復 請稍後...
ECHO.

Dism /Online /Cleanup-Image /ScanHealth
Dism /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-image /RestoreHealth
sfc /scannow

pause

exit /b

:: ========================================================================================================================

:: ~~~~~ 使用說明 ~~~~~
:Help

color 07

@ ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@ ECHO.
@ ECHO  - 使用說明:
@ ECHO.
@ ECHO 1. 請注意某些特別的設置(優化之類的) , 這是以本人的電腦製作的 , 不一定適用於所有人
@ ECHO.
@ ECHO 2. 需操作的程式 , 必須都安裝在預設的路徑上 , 才可成功運行
@ ECHO.
@ ECHO 3. 主要是自用的工具 , 所以不是所有功能 , 所有人都用的到
@ ECHO.
@ ECHO 4. Window 和 Office 的啟用工具 , 是下載網路資源的 , 並非本人所寫 (有時候下載比較慢)
@ ECHO.
@ ECHO 5. 此程式是以個人使用為主去寫的 , 無考慮不同平台差異
@ ECHO.
@ ECHO 6. 如需要某些特定功能(或修復修改) , 可到 Discord 聯絡 NUS_apm#6830 , (可能)會嘗試製作
@ ECHO.
@ ECHO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pause
exit /b

:: ~~~~~ 更新資訊 ~~~~~
::
:UB

color 07

@ ECHO ------------------------------------
@ ECHO.
@ ECHO   Versions 1.0.8 更新:
@ ECHO.
@ ECHO    [+] 增加功能 , .NET安裝
@ ECHO.
@ ECHO    [+] 增加功能 , Visual C++ 安裝
@ ECHO.
@ ECHO    [+] 增加功能 , windows 優化功能
@ ECHO.
@ ECHO ------------------------------------

pause
exit /b