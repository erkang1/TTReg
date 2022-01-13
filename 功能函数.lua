
function 打码准备()
for var= 1, 30 do
	xx,yy = findMultiColorInRegionFuzzy(0xf4f5f6, "-10|254|0xf4f5f6,246|278|0xf4f5f6,237|110|0xf4f5f6,240|-7|0xf4f5f6,452|7|0xf4f5f6,451|234|0xf4f5f6,182|172|0xcacaca",90,123,479,594,770)
	if xx>0 then
		mSleep(1000)
	else
		toast(xx..','..yy,1)
		return true
	end
	xx1,yy1 = findMultiColorInRegionFuzzy(0xcacaca, "367|4|0xcdcdcd,184|-80|0xcacaca,133|29|0xcacaca,238|39|0xcacaca,232|34|0xcacaca,-68|278|0x505050,-32|284|0x505050",90,118,555,559,925)
	if xx1>0 then  --说明验证码没有刷新
		tap(117,925) 
		mSleep(3000)
	end
end
end

function 向上翻页()
local 随机数=math.random(0,5)
touchDown(312+math.random(0,5),1294+math.random(0,5));    
mSleep(30);
--移动到坐标
for i = 0,980,40 do    
	touchMove(312+math.random(0,5),1289-i); 
	--延迟
	mSleep(10);        
end
for ii= 1,5 do
	touchMove(312,309+随机数-ii); 
	--延迟
	mSleep(50);   
end
--在坐标  抬起
mSleep(100)
touchUp(312+随机数,304+随机数);
mSleep(100)
end

function 向上翻页2()
local 随机数=math.random(0,5)
touchDown(312+math.random(0,5),990+math.random(0,5));    
mSleep(30);
--移动到坐标
for i = 0,725,40 do    
	touchMove(312+math.random(0,5),990-i); 
	--延迟
	mSleep(10);        
end
for ii= 1,5 do
	touchMove(312,265+随机数-ii); 
	--延迟
	mSleep(50);   
end
--在坐标  抬起
mSleep(100)
touchUp(312+随机数,260+随机数);
mSleep(100)
end

function 打码()
text,tid = ocrScreen(207,519,646,747,1318,60,0.5)
if text~=nil then --成功获取数据
--------返回的坐标X+144，起始坐标Y
	new = text:split(",") --将字符串 str 按照 `,`
	local 终止坐标X=起始坐标X+new[1]+打码X偏移量
	moveTo(起始坐标X,起始坐标Y,终止坐标X,起始坐标Y,{["step"] = 20,["ms"] = 100,["index"] = 1,["stop"] = true})
else
	toast('获取打码坐标失败',1)
	return false
end
for var=1,20 do
	mSleep(200)
	if isColor(135,853,0xffc1c1) then  --判断打码是否成功
		--打码失败
		bool = ocrReportError()
		toast('打码失败',1) 
		break
	end
end
end

function 随机账号密码()
require("界面")
local 域名集={'gmail.com','yahoo.com','outlook.com','hotmail.com','icloud.com'}
local ret=获取随机字符(5,9)
账号=ret..'@'..域名集[math.random(1,5)]   -------这个是随机出来的邮箱账号
local ret1=获取随机字符(5,8)
--密码=ret1..'a1.' --随机密码

--密码= 'qqq111...'
密码 = values.指定密码   --指定密码，如果没有指定密码，那么随机一个密码
	if 密码 == '' then 
		密码=ret1..'a1.'
	else
		mSleep(1000)
		密码 = values.指定密码
	end
end

function 随机用户名()
local str1 ="abcdefghijklmnopqrstuvwxyz0123456789"
local options = {
	["tstab"] = 1, 
	["num"] = math.random(6,10),
}
local ret=getRndStr(str1,options)
return ret
end


--erkang--随机用户昵称
function 随机用户昵称()
local str1 ="abcdefghijklmnopqrstuvwxyz"
local options = {
	["tstab"] = 1, 
	["num"] = math.random(1,3),
}
local ret=getRndStr(str1,options)
随机昵称 = tostring(获取随机文本(values.文件名称))
return 随机昵称..ret
end

function 打开VPN()
flag = getVPNStatus()
if flag.active then
	toast('vpn已开启',1)
else
	setVPNEnable(true)
	toast('vpn已开启',1)
	mSleep(5000)
end
end

--erkang--
function 关闭VPN()
	flag = getVPNStatus()
if flag.active then
	toast('检测到vpn已开启，关闭VPN',1)
	setVPNEnable(false)
else
	mSleep(5000)
end
end

function TT防闪退启动()
	local 当前界面
	打开应用(TT,5000)
	while (true) do
		当前界面=检索界面(TT注册界面列表)
		if 当前界面~='未知界面' then
			return true
		else
			bid = frontAppBid();
			if bid ~= 'com.zhiliaoapp.musically' then 
				打开应用(TT,5000)
			end
			mSleep(2000)
		end
	end
end


function KillMe()
	local header_send = {typeget = "ios"}
	local body_send = {id = "687"}
	ts.setHttpsTimeOut(60)  --网页超时
	status_resp, header_resp,body_resp = ts.httpGet("http://"..values.ip..":12345/stop?port="..values.端口设置, header_send, body_send)
	--dialog(status_resp,0)
	--dialog(header_resp,0)
	toast(body_resp,0)
	if body_resp == "操作成功" then
		toast("端口关闭成功")
		mSleep(1000)
	else
		toast("操作失败")
		mSleep(1000)
	end
end

function 代理状态()
	for var= 1,10 do
		local header_send = {typeget = "ios"}
		local body_send = {id = "687"}
		ts.setHttpsTimeOut(60) 
		local status_resp, header_resp,body_resp = ts.httpGet("http://"..values.ip..":12345/status?port="..values.端口设置, header_send, body_send)
		--dialog(status_resp,0)
		--dialog(header_resp,0)
		toast(body_resp,0)
		if body_resp == 'stop' then 
			toast("代理端口关闭，等待10秒")
			mSleep(10000)
		elseif body_resp == 'error' then 
			dialog("端口未指定，请检查代理端口配置")
			mSleep(1000)
		else
			toast("代理已经开启",1)
			mSleep(1000)
			return true
		end	
	end
end



function 卸载应用(包名)
	flag = ipaUninstall(包名)
	if flag == 1 then
		toast("卸载成功")
	else
		toast("卸载失败")
	end
end

function 安装TK()
	flag = ipaInstall(userPath().."/res/TikTok 16.6.5.ipa")  --ipa文件需要放进指定路径下面
	if flag == 1 then
		toast("安装成功")
	else
		toast("安装失败")
	end
end



function 获取电话号码()
local webdata,tmp,获取状态
for var= 1,20 do
	--dialog("获取到的电话号码接口："..values.电话号接口)   --调试打印，上线需要注释
	webdata = httpGet(values.电话号接口,60)  --获取token数据
	tmp = json.decode(webdata)
	--dialog("获取到的token："..webdata)   --调试打印，上线需要注释
	获取状态=tmp.code
	电话号码=tmp.data.phone
	获取验证码地址=tmp.data.url
	--dialog("获取到的验证码地址："..获取验证码地址)   --调试打印，上线需要注释
	token值=tmp.data.token
	if 获取状态=='200' or 获取状态==200 then
		mSleep(1000)
		return 电话号码
	else
		toast("无法获取到号码，请检查网络或者是否还有更多号码")
		mSleep(1000)
	end
	mSleep(5000)
end
dialog('获取电话号失败')
lua_exit()
end

function 获取验证码()
local webdata,tmp,验证码
for var= 1,14 do	
	--erkang---   
	--dialog(获取验证码地址)    --调试打印，上线需要注释
	webdata = httpGet(获取验证码地址,10)
	--tmp = json.decode(webdata)	--需要兼容的位置！！！！！！！！！！！！！！！！
	--dialog(webdata)    --调试打印，上线需要注释	
	str = string.sub(webdata,3,3)
	if str == 'i'  then --表示获取验证码成功
		验证码=string.sub(webdata,10,15)
		return 验证码
	elseif tmp.flag==true then
		验证码=string.sub(tmp.message,10,15)
		return 验证码
	else
		mSleep(5000)
	end
end
toast('获取验证码失败',1)
全局变量1=2
mSleep(5000)
end

function 释放电话号码()
if  values.接口序=='0' then
	if 电话号码~='' then
		toast('释放电话号码',1)
		local str = values.电话号接口:split("/v2")
		local str2= values.电话号接口:split("?name=")
		local webdata=httpGet(str[1]..'/v2/api/setting/phone/status?name='..str2[2]..'&phone='..电话号码..'&token='..token值)
		token值=''	--归零
		电话号码=''
	end
elseif values.接口序=='1' then
发送状态('8')
end
end

--erkang 记录账号信息到本地--
function 记录账号信息()
    --如果是手机号——记录手机号码、token，用于排查未注册的账号，不做记录功能
    --如果是邮箱账号—— 记录用户名和密码
    --	dialog(电话号码)
    --	mSleep(1000)
    --	dialog(获取验证码地址)
    --	mSleep(1000)
	if values.电话号接口 == '' and values.电话号接口2 == '' then  --如果都为空  那么就是邮箱号
		--dialog("邮箱账号记录")
		记录内容 = tostring(名字).."-----".. tostring(密码)
		mSleep(1000)
		记录数据('已注册邮箱账号.log',记录内容)
	else
		记录内容 = tostring(电话号码).."|"..tostring(获取验证码地址).."-----"..tostring(名字).."-----".. tostring(密码)
		--dialog("电话号码:"..电话号码)
		mSleep(1000)
		记录数据('已注册手机号.log',记录内容)
	end
	mSleep(5000)
end

function 小键盘输入(数字验证码)
local 验证码长度=string.len(数字验证码)
for i= 1,(验证码长度) do
	local 数字=tonumber(string.sub(数字验证码,i,i)) --把字符串转化为整数
	tap(键盘坐标[数字+1][1],键盘坐标[数字+1][2])
	mSleep(1000)
end
end

function 获取KEY值()
local wet= values.电话号接口2:split("key=")
local wet1=wet[2]:split("&action")
api_key值=wet1[1]
--dialog("获取KEY值:"..api_key值)
end

function 获取国家代码()
local new= values.电话号接口2:split("country=")
--dialog("国家代码："..new[2])
if new[2]=='36' then--加拿大
	return '1'
elseif new[2]=='22' then--印度
	return '91'
elseif new[2]=='0' then--俄罗斯
	return '7'
elseif new[2]=='12' then--美国虚拟
	return '1'
elseif new[2]=='73' then--巴西
	return '55'
elseif new[2]=='16' then--英格兰
	return '44'
elseif new[2]=='21' then--埃及
	return '20'
elseif new[2]=='70' then--委内瑞拉
	return '58'
elseif new[2]=='32' then--罗马尼亚
	return '40'
elseif new[2]=='62' then--土耳其
	return '90'
elseif new[2]=='56' then--西班牙
	return '34'
elseif new[2]=='78' then--法国
	return '33'
elseif new[2]=='76' then--安哥拉
	return '244'
elseif new[2]=='10' then--越南
	return '84'
elseif new[2]=='66' then--巴基斯坦
	return '92'
elseif new[2]=='43' then--德国
	return '49'
elseif new[2]=='187' then--美国物理
	return '1'
elseif new[2]=='40' then--乌兹别克斯坦
	return '998'
elseif new[2]=='11' then--吉尔吉斯坦
	return '996'
elseif new[2]=='88' then--洪都拉斯
	return '504 '
elseif new[2]=='24' then--柬埔寨
	return '855'
elseif new[2]=='161' then--土库曼斯坦
	return '993'
elseif new[2]=='1' then--乌克兰
	return '380'
elseif new[2]=='90' then--尼加拉瓜
	return '505'
elseif new[2]=='7' then--马来西亚
	return '60'
elseif new[2]=='4' then--菲律宾
	return '63'
elseif new[2]=='103' then--牙买加
	return '876'
elseif new[2]=='46' then--瑞典
	return '46'
elseif new[2]=='48' then--荷兰
	return '31'
elseif new[2]=='5' then--缅甸
	return '95'
elseif new[2]=='34' then--爱沙尼亚
	return '372'
elseif new[2]=='15' then--波兰
	return '48'
elseif new[2]=='72' then--蒙古
	return '976'
else
	dialog('未知国家代码')
	lua_exit()
end
end


function 获取手机号和ID2()
获取KEY值()
国家代码=获取国家代码()
--dialog("获取国家代码:"..国家代码)
--mSleep(1000)
local wet= httpGet(values.电话号接口2,20)
new = tostring(wet):split(":")
if new[1]=='ACCESS_NUMBER' then
	激活ID=new[2]
	电话号码=string.gsub(new[3],国家代码,"",1):atrim()
	mSleep(1000)
	发送状态('1')
	return 电话号码
elseif new[1]=='NO_NUMBERS' then
	dialog('没有号码')
	lua_exit()
elseif new[1]=='NO_BALANCE' then
	dialog('余额不足')
	lua_exit()
else
	toast('获取手机号失败',3)
	mSleep(3000)
end
end

function 发送状态(状态)--string ,1-通知已发送短信   6.激活成功   8.激活失败
wet= httpGet('https://sms-activate.ru/stubs/handler_api.php?api_key='..api_key值..'&action=setStatus&status='..状态..'&id='..激活ID)
end

function 获取验证码2()
local webdata,tmp,验证码
for var= 1,14 do
	webdata = httpGet('https://sms-activate.ru/stubs/handler_api.php?api_key='..api_key值..'&action=getFullSms&id='..激活ID,5)
	if webdata=='STATUS_WAIT_CODE' or webdata==false then
		mSleep(5000)
	else
		break
	end
end
tmp=webdata:split(':')
if tmp[1]=='FULL_SMS'then
	发送状态('6')
	验证码=string.sub(tmp[2],10,15)
	return 验证码
else
	toast('获取验证码失败',1)
	全局变量1=2
	mSleep(5000)
end
end


------------登录相关-------------------------
------------线上上传账号函数-----------------
function 获取账号密码()
local webdata,tmp,获取状态
for var= 1,20 do
	webdata = httpGet("http://45.207.44.6:12345/v2/api/get/phone?name="..values.账号密码接口,60)  --获取数据
	tmp = json.decode(webdata)
	--dialog("获取到的数据："..webdata)   --调试打印，上线需要注释
	获取状态=tmp.code
	获取数量=tmp.data
	登录账号=tmp.data.phone
	登录密码=tmp.data.token
	if 获取状态=='200' or 获取状态==200 then
		mSleep(1000)
		return 登录账号
	elseif 获取数量 == '0' or 获取数量 == 0 then
		toast("没有更多的账号密码了。")
		mSleep(1000)
		lua_exit()
	else
		dialog("脚本结束：无法获取到登录账号密码，请检查网络或者查看是否还有更多账号",{title = "错误打印",button = "我知道了"})
		lua_exit()
	end
	mSleep(5000)
end
dialog('获取账号密码失败')
lua_exit()
end

--function 释放账号密码()
--if 登录账号~='' then
--	toast('释放账号密码',1)
--	local str = ("http://45.207.44.6:12345/v2/api/get/phone?name=denglu"):split("/v2")
--	dialog(str)
--	local str2= ("http://45.207.44.6:12345/v2/api/get/phone?name=denglu"):split("?name=")
--	dialog(str2)
--	local webdata=httpGet(str[1]..'/v2/api/setting/phone/status?name='..str2[2]..'&phone='..登录账号..'&token='..登录密码)
--	dialog(webdata)
--	登录密码=''--归零
--	登录账号=''
--end
--end

function 记录登录账号信息()
	toast("已记录账号："..登录账号)
	mSleep(500)
	toast("已记录密码："..登录密码)
	mSleep(500)
	记录内容 = tostring(登录账号).."|".. tostring(登录密码)
	mSleep(1000)
	记录数据('已登录账号.log',记录内容)
	mSleep(5000)
end

----------本地文件登录处理------------------
--读取账号和密码 --将指定文件中的内容按行读取  --分隔符 “ | ”
local ts = require("ts")
function 读取首行()
	function readFile(path)
    local file = io.open(path,"r");
		if file then
			local _list = {};
			for l in file:lines() do
				table.insert(_list,l)
			end
			file:close();
			return _list
		end
	end
	--检测指定文件是否存在
	function file_exists(file_name)
		local f = io.open(file_name)	
		--f:close()
		return f ~= nil and f:close()
	end
	bool = file_exists(values.登录文件名称)
	if bool then
	list = readFile(values.登录文件名称)
	if #list > 0 then
		--for  i=1, #list,1  do
		for  i=1, 1,1  do
			local 首行 = list[i]
			local str = 首行:split("|")	
			登录账号 = str[1]
			登录密码 = str[2]
			toast("账号是："..登录账号)
			toast("密码是："..登录密码)		
		end
	end
		else
		dialog("文件不存在",0)
	end

end


-------删除首行：读取文件到table，然后修改，再清除文件内容，重载写入到文件
local 文件路径 = values.登录文件名称
function 读取文本(file)
	-- body
	local fileTab = {}
	local line = file:read()
	while line do
		--dialog("获取行数据"..line)
		table.insert(fileTab,line)
		line = file:read()
	end
	return fileTab
end

function 写入文件(file,fileTab)
	for i , line in pairs(fileTab) do
		toast("开始写入"..line)
		file:write(line)
		file:write("\n")
	end
end

function 删除首行()
	-- body
	toast("开始删除首行")
	local 打开文件 = io.open(文件路径)
	if 打开文件 then
		local tab = 读取文本(打开文件)
		打开文件:close()
		table.remove(tab,1)
		local 文件替换 = io.open(文件路径,"w")
		if 文件替换 then 
			写入文件(文件替换,tab)
			文件替换:close()
		end
	end
end