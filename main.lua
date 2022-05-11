require("TSLib")
ts=require("ts")
require("TT数据")
require("AWZ数据")
require("爱新机数据")
require("界面")

------------全局变量---------------------
机器编码='0'
账号=''
密码=''
名字=''
全局变量1=0
全局登录变量1=0
获取验证码地址=''
token值=''
电话号码=''
上传网站=''
国家代码=''
激活ID=''
api_key值=''

------------中控自定义--------------
--域名=yuming
--批次编码=pcbh
--联众账号=lzzh
--联众密码=lzmm
--注册数量=zcsl-0
--防卡时间=fksj-0
--接口序=jkx
--电话号接口=dhhjk:atrim()
--电话号接口2=dhhjk2:atrim()
--脚本功能=jbgn
--使用软件=syrj
--脚本功能=jbgn
--使用软件=syrj
--上传登录=scdl
--使用软件=syrj
--指定密码=zdmm

------------调试--------------
--域名=yuming
--批次编码='AA1'
--联众账号=''
--联众密码=''
--注册数量=2000
--防卡时间=300
--接口序='0'
--电话号接口=''
--电话号接口2=''

--------------ShowUI--ID--------------------
local 图鉴账号 =  values.图鉴账号
local 图鉴密码 =  values.图鉴密码
local 接口序 = values.接口序
local 电话号接口 = values.电话号接口  
local 电话号接口2 = values.电话号接口2
local 电话号接口3 = values.电话号接口3
local 电话号接口4 = values.电话号接口4
local 电话号接口5 = values.电话号接口5
local 电话号接口6 = values.电话号接口6
local 注册数量 =  values.注册数量
local 防卡时间 =  values.防卡时间
local 指定密码 =  values.指定密码
local 文件路径 = values.文件路径
local 文件名称 = values.文件名称
local 注册间隔 = values.注册间隔
local 使用软件 = values.使用软件
local 是否开启抓包代理 = values.是否开启抓包代理
local 端口设置 = values.端口设置
local ip = values.ip
local 卸载安装 = values.卸载安装
local 是否备份 = values.是否备份
local 上传头像 = values.上传头像
---------登录操作ID----------
local 登录文件名称 = values.登录文件名称
local 账号密码接口 = values.账号密码接口
local 脚本功能 = values.脚本功能
local 软件版本 = values.软件版本
local 手动获取代理 = values.手动获取代理
local 代理链接 = values.代理链接
local 号码地区 = values.号码地区

require("基础函数")
require("功能函数")
require("逻辑函数")
---------------企业版加载插件---------------
--ts_enterprise_lib = require("ts_enterprise_lib")
--assert(ts_enterprise_lib,"无法引入企业专用库")
------------------------------------------
--require("群控函数")
json = ts.json--使用 JSON 模块前必须插入这一句
init(0,0)

local thread = require('thread')

--防锁屏
setAutoLockTime(0)

----------------打码设置--------------------------------------------------------------------------------------------------------------------------------------------
tt=require "tt"
tt.Info(values.图鉴账号,values.图鉴密码)	--　先初始化打码平台  代理模式必须改为配置  否则无法请求平台API　　必须导入tt.lua 和 ttjson.lua 文件
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

--ui设置
if UIret == 1 then
	mSleep(1000)
function 全局设置()
	---判断是否开启卸载安装--------	
	if values.卸载安装 == 'on' then
		toast("准备卸载",1)
		卸载应用(TT)
		mSleep(1000)
		toast("准备安装",1)
		安装TK()
		mSleep(1000)
	else
		mSleep(500)
	end

	--- 判断代理是否填写  VPN操作 ---
	if  values.是否开启抓包代理 =='0' and values.代理设置 == '' then
		dialog("已打开代理配置，请填写正确的端口")
		mSleep(1000)
	elseif values.是否开启抓包代理 =='0' and values.代理设置 ~= '' then 
		KillMe()
		代理状态()
		打开VPN()
		toast("代理已经切换")
		 
	--------  手动设置S5代理  ------
	elseif values.手动获取代理 == 'on' then 
		toast("手动设置代理已经开启")
		mSleep(500)
		关闭VPN()
		删除手动设置的代理()
		获取S5代理()
		手动设置代理()
		切换VPN()
		打开VPN()
	else
		关闭VPN()
		切换VPN()
		打开VPN()
	end				
	-------------2、软件适配------------
	if values.使用软件 == '0' then  		--AWZ
		启动AWZ()
		if	values.是否备份 == 'off' then
			删除备份包()
		else
			mSleep(500)
		end
		mSleep(1000)
		一键新机()
		mSleep(5000)
	elseif values.使用软件 == '1' then  	--AXJ
		启动爱新机()
		if	values.是否备份 == 'off' then
			删除备份包()
		else
			mSleep(500)
		end
		mSleep(1000)
		一键新机()
		mSleep(5000)
	elseif values.使用软件 == '2' or values.使用软件 == '5'  then  	--HB  /  SuperMan
		for var= 1,20 do
			if HB新机()== false then
				切换VPN()
			else
				break
			end
		end
	elseif values.使用软件 == '3' then 		--PyAPP
		PyApp新机坐标版本()
		mSleep(1000)
	elseif values.使用软件 == '4' then 		--OnePress
--		os.execute("/usr/local/bin/onepress_lite -b com.zhiliaoapp.musically -C -o")
		os.execute("/usr/local/bin/onepress_lite -b com.zhiliaoapp.musically -C -o")
		mSleep(1000)
		打开再关闭()
		toast("等待2分钟")
		mSleep(120000)
	else
		mSleep(1000)
	end
end

-----登录上传接口是否合法------
if values.账号密码接口 == '' and values.登录文件名称 == '' then    ---判断接口地址是否合法
	dialog("请填写正确的账号密码文件接口或者本地路径",{title = "登录接口错误",button = "重新填写"})
	return false
elseif values.账号密码接口 ~= '' and values.登录文件名称 ~= '' then
	dialog("请检查文件的接口地址是否正确\n登录地址二选一",{title = "登录接口错误",button = "重新填写"})
	return false
else	
	mSleep(1000)
end


function 流程()
	if values.脚本功能 == '0' then 		---以下是登录账号的主要流程-------适配22.5.0---
		toast("当前功能为登录",1)
		mSleep(500)
		----进行登录功能		
		while (true) do
			全局设置()
			打开再关闭()
			账号登录()
		end
	else
		toast("未知错误")
	end


	if values.脚本功能 == '1' then 		----以下是注册账号的主要流程----------
		toast("当前功能为注册",1)
		mSleep(500)
		----判断间隔时间是否大于等于60------
		if tonumber(values.注册间隔) < 60 then
--			dialog("为保证流程正常运行，间隔时间应该大于等于【60】秒",{title = "参数设置错误",button = "退出重新设置"})
--			lua_exit()
            toast("为了保证流程正常运行，脚本建议间隔时长超过60秒",1)
            mSleep(2000)
		else
			mSleep(100)
		end
		----判断放卡时间是否大于等于300------
		if tonumber(values.防卡时间) < 300 then
			dialog("为保证流程正常运行，防卡时间应该大于等于 5 分钟",{title = "参数设置错误",button = "退出重新设置"})
--			return false
			lua_exit()
		else
			mSleep(100)
		end
		---判断手机号接口的填写是否合法--------
		if values.电话号接口4 ~= '' and values.电话号接口2 ~= '' then
			dialog("接口地址填写有误，请确保两项四选一,脚本退出",{title = "地址设置错误",button = "退出重新编辑"})
			lua_exit()
		else
			mSleep(1000)
		end

		----判断密码是否随机----
		if values.指定密码 == '' then 
			toast("密码随机",1)
			mSleep(1000)
		else 
			toast("已设置指定密码"..values.指定密码,1)
			mSleep(1000)
		end
		----判断昵称文件是否指定----
		if values.文件名称 == '' then
			toast("昵称随机",1)
			mSleep(500)
		else 
			toast("指定本地昵称文件",1)
			mSleep(500)
		end		
		-----------3、注册主要逻辑程序-----------	
		全局设置()
		打开再关闭()
		mSleep(1000)
		--TT防闪退启动()
		TT注册()
		--上传账号()
		if values.使用软件 == '4' then
			打开再关闭()
			mSleep(3000)
			tap(675,1287)    --点击 我的
			mSleep(500)
			--1.1.2_onepress_旧版本无需添加此项----------------
-- 			for var=1,24 do
--     			toast("等待2分钟，账号上传中...")
--     			mSleep(5000)   --等待2分钟并上传
-- 			end
-- 			toast("账号上传完成")
			------------------------------------
		else
			mSleep(1000)
		end	
		
        ------------------------------------备份包------------------------------------------------------
		if 	values.是否备份 == 'on' then 
		  toast("正在备份...")
		  mSleep(1000)
		  local 名字 = 随机用户名()
		  os.execute("/usr/local/bin/onepress_lite -b com.zhiliaoapp.musically --backup "..名字)
		  打开再关闭()
		  toast("数据已经备份")
		  mSleep(1500)
		  --/var/mobile/Library/onepress/Documents/com.zhiliaoapp.musically/
		 else
		  toast("未开启备份功能，流程继续")
		end
		全局变量1=1     --注册成功
		记录账号信息()  --记录注册成功的账号到本地
		设置资料()
		
		if values.上传头像 == 'on' then
			设置头像()
		else
			mSleep(1000)
		end
		
	else
		--判断脚本功能结束
	end
end


-------------防卡-------------------------
for var = 1, 注册数量 do
	local thread_id = thread.create(
		function()
			流程()
			--主程序()
		end,{
			callBack = function()
				--协程结束会调用，不论是错误、异常、正常结束
				--toast("i am done!")
			end,
			catchBack = function(exp)
				--协程异常结束,异常是脚本调用了 throw 激发的，exp 是 table,exp.message 是异常原因
				toast("超时或者异常")
			end
		})
	mSleep(1000)
	
	---------------------下面是倒计时，通过全局变量1调用------------------
	local 防卡倒计时
	local 注册等待 = values.注册间隔 * 1000
	for  ii= 1,values.防卡时间/10,1 do
		防卡倒计时=(60-ii+1)*10
		--toast('防卡倒计时：'..防卡倒计时..'秒',1)
		mSleep(5000)
		if 全局变量1==1 then
			toast('注册成功，重新计时',1)
			--停止脚本
			--lua_exit()
			toast('注册成功等待'..((注册等待/1000)/60)..'分钟')
			mSleep(注册等待)   --erkang 注册完成等待
			break
		elseif 全局变量1==2 then
			toast('注册异常，重新开始',1)
			break
		elseif 全局变量1==3 then
			toast('退出注册，脚本重新开始',1)
			break
		elseif 全局登录变量1==1 then
			toast('登录成功',1)
			mSleep(1000)
			break
		elseif 全局登录变量1==2 then
			toast('登录异常，重新开始',1)
			break
		end
		mSleep(5000)
		if ii==防卡时间/10 then
			toast('流程超时',1)
			全局变量1=2
			全局登录变量1=2
		end
	end
	mSleep(500)
	thread.setTimeout(1000,thread_id)
	--等待所有协程结束
	thread.waitAllThreadExit()
	mSleep(1000)
	if 全局变量1==2 then
		释放电话号码()
		--切换VPN()
	end
	全局变量1=0
	全局登录变量1=0
	mSleep(500)
end

else
	toast("取消操作")
	return false
end

