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
local 联众账号 =  values.联众账号
local 联众密码 =  values.联众密码
local 接口序 = values.接口序
local 电话号接口 = values.电话号接口  
local 电话号接口2 = values.电话号接口2
local 注册数量 =  values.注册数量
local 防卡时间 =  values.防卡时间
local 指定密码 =  values.指定密码
local 文件路径 = values.文件路径
local 文件名称 = values.文件名称
local 注册间隔 = values.注册间隔
local 使用软件 = values.使用软件
local 是否开启抓包代理 = values.是否开启抓包代理
local 端口设置 = values.端口设置
local 卸载安装 = values.卸载安装
local 是否备份 = values.是否备份

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

--ui设置
if UIret == 1 then
--	toast("开始运行",1)
--	mSleep(100)
	----判断间隔时间是否大于等于60------
	if tonumber(values.注册间隔) < 60 then
		dialog("为保证流程正常，间隔时间应该大于等于60秒")
		return false
	else
		mSleep(100)
	end
	----判断放卡时间是否大于等于300------
	if tonumber(values.防卡时间) < 300 then
		dialog("为保证流程正常，防卡时间应该大于等于5分钟")
		return false
	else
		mSleep(100)
	end
	---判断手机号接口的填写是否合法--------
	if values.电话号接口 ~= '' and values.电话号接口2 ~= '' then
		dialog("接口地址填写有误，请确保两项二选一,脚本退出")
		lua_exit()
	else
		mSleep(1000)
	end
	---判断是否开启卸载安装--------	
	if values.卸载安装 == '0' then
		toast("准备卸载",1)
		卸载应用(TT)
		mSleep(1000)
		toast("准备安装",1)
		安装TK()
		mSleep(1000)
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

	----------------打码设置--------------------------
	ocrInfo('lianzhong',values.联众账号,values.联众密码) --先初始化打码平台
	--------------------------------------------------

	--主程序
	function 主程序()
		mSleep(1000)
	-------------1、VPN操作------------
--		关闭VPN()
--		切换VPN()
	---判断代理是否填写---
		if  values.是否开启抓包代理 =='0' and values.代理设置 == '' then
			dialog("已打开代理配置，请填写正确的端口")
			mSleep(1000)
		elseif values.是否开启抓包代理 =='0' and values.代理设置 ~= '' then 
			KillMe()
			代理状态()
			打开VPN()
			toast("代理已经切换")
		else
			关闭VPN()
			切换VPN()
			打开VPN()
		end				
	-------------2、软件适配------------
		if values.使用软件 == '0' then  		--AWZ
			启动AWZ()
			删除备份包()
			mSleep(2000)
			一键新机()
			mSleep(5000)
		elseif values.使用软件 == '1' then  	--AXJ
			启动爱新机()
			if	values.是否备份 == '1' then
				删除备份包()
			else
				mSleep(500)
			end
			mSleep(1000)
			一键新机()
			mSleep(5000)
		elseif values.使用软件 == '2' then  	--HB
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
		else
			mSleep(1000)
		end
		
--		获取机器编码()
			
	-----------3、主要逻辑程序-----------			
		打开再关闭()
		mSleep(1000)
--		TT防闪退启动()
		TT注册()
		--上传账号()
		全局变量1=1     --注册成功
		记录账号信息()  --记录已经获取到的号码到本地
		设置资料()
		设置头像()
	end
else
	toast("取消操作",1)
	return false
end

-------------防卡-------------------------
for var = 1, 注册数量 do
	local thread_id = thread.create(function()
			主程序()
		end,{
			callBack = function()
				--协程结束会调用，不论是错误、异常、正常结束
				--toast("我结束了")
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
	for  ii= 1,防卡时间/10,1 do
		防卡倒计时=(40-ii+1)*10
		--toast('防卡倒计时：'..防卡倒计时..'秒',1)
		mSleep(5000)
		if 全局变量1==1 then
			toast('注册成功，重新计时',1)
			--停止脚本
			--lua_exit()
			toast('注册成功等待'..((注册等待/1000)/60)..'分钟')
			mSleep(注册等待)   --erkang 注册完成等待
			--mSleep(60000)   --erkang 注册完成等待1分钟
			break
		elseif 全局变量1==2 then
			toast('注册异常，重新开始',1)
			break
		end
		mSleep(5000)
		if ii==防卡时间/10 then
			toast('注册超时',1)
			全局变量1=2
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
	mSleep(500)
end
