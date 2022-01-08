


function 获取机器编码() --机器编码为全局变量
机器编码=getDeviceAlias()
end

function 上传账号()--中控
local time = ts.ms() 
local 时间=os.date("%Y年%m月%d日%H点%M分%S秒",time)
local category = "账号"
local data = 账号..'----'..密码..'----'..名字..'----'..机器编码..'----'..时间..'----'..批次编码
local ok,ret1,ret2 = ts_enterprise_lib:plugin_api_call("DataCenter","insert_data",category,data)
for var= 1,10 do
	if ok then
		if ret1 then
			toast('账号上传成功',1)
			return true
		else
			toast('上传账号失败，再次尝试上传中...',1)
		end
	else
		toast('上传账号失败，再次尝试上传中...',1)
	end
	mSleep(5000)
end
toast('上传账号失败',5)
end