sz = require("sz") 
http = require("szocket.http")
-----------------------------------------------AWZ数据------------------------------------------
AWZ主界面={
	界面特征={'AWZ主界面',0xb2b2b2, "319|0|0xb2b2b2,-60|57|0x000000,241|53|0x000000,132|292|0x6f7179",90,178,125,563,423}
}
AWZ备份管理界面={
	界面特征={'AWZ备份管理界面',0x007aff, "-513|-1|0x007aff,-261|29|0xf9f9f9,-261|30|0xb2b2b2,-261|31|0xffffff",90,114,94,633,132}
}
AWZ弹窗界面={
	界面特征={'AWZ弹窗界面',0x000000, "0|20|0x000000,136|3|0x000000,333|0|0x000000,333|20|0x000000,174|116|0x007aff",90,205,609,544,731}
}
AWZ界面={AWZ主界面,AWZ备份管理界面,AWZ弹窗界面}
-------------------------------------------------------------------------------------------------------

function 一键新机()
local res, code = http.request("http://127.0.0.1:1688/cmd?fun=newrecord")
if code == 200 then        
	local resJson = sz.json.decode(res)     
	local result = resJson.result     
	if result == 3 then
		-- IP地址重复        
	end       
	-- ....其他代码  
else
	toast('一键新机报错')
end
end;

function 删除备份包()
local res, code = http.request("http://127.0.0.1:1688/cmd?fun=deleteallrecords")
if code == 200 then        
	toast('删除所有备份包成功',2) 
else
	toast('删除备份包报错')
end 
end

function 下一条记录() --最后一条记录，返回false
local res, code = http.request("http://127.0.0.1:1688/cmd?fun=nextrecord")
if code == 200 then        
	local resJson = sz.json.decode(res)     
	local result = resJson.result   
	toast('切换备份记录成功',2)
	if result == 4 then 
		return false   
	else
		return true
	end       
	-- ....其他代码  
else
	dialog('切换备份记录报错')
end 
end

function 生效第一条记录()
local res, code = http.request("http://127.0.0.1:1688/cmd?fun=activefirstrecord")
if code == 200 then         
	toast('切换原始记录成功',2)     
	-- ....其他代码  
else
	dialog('切换原始记录报错')
end 
end

function 启动AWZ()
local 当前界面
runApp('AWZ')
mSleep(3000)
while (true) do
	当前界面=检索界面(AWZ界面)
	if  当前界面== 'AWZ主界面' or 当前界面== 'AWZ备份管理界面' or 当前界面== 'AWZ弹窗界面' then
		mSleep(1000)
		return true
	end
	mSleep(1000)	
end
end





























