function table长度(t) --参数table 返回值 长度
	local leng=0
	for k, v in pairs(t) do
		leng=leng+1
	end
	return leng;
end

function 打开应用(包名,打开时间)
while (true) do
	r = runApp(包名) 
	mSleep(打开时间)
	if r == 0 then
		toast("打开成功",1)
		return 0
	end
end
end

function 关闭应用(包名)
closeApp(包名);
mSleep(1000) 
os.execute("su mobile -c uicache")
mSleep(2000)
end

function 是否包含元素(value, tab)
for k,v in ipairs(tab) do
	if v== value then
		return true
	end
end
return false
end

function 检索界面(界面列表)--返回界面名字(文本)
for k,v in pairs(界面列表) do
	x, y = findMultiColorInRegionFuzzy(v.界面特征[2],v.界面特征[3],v.界面特征[4],v.界面特征[5],v.界面特征[6],v.界面特征[7],v.界面特征[8])
	if x>-1 or y>-1 then
		toast(v.界面特征[1],1)
		return v.界面特征[1]
	end
end
toast('未知界面',1)
return '未知界面'
end

function 是否到达界面(目的界面,等待时间)--目的界面为table，等待时间单位是S
for var= 1, 等待时间 do
	local 当前界面=检索界面(目的界面)
	if 当前界面~='未知界面' then 
		return true
	end
	mSleep(1000)
end
return false
end

function 判断是否离开该界面(指定列表,指定界面) -- 指定界面必须是一个文本格式
while (true) do
	local 获取的界面=检索界面(指定列表)
	if 获取的界面~=指定界面 then
		return true
	else
		toast('未离开',1)
		mSleep(1000)
	end
end
end

function 输入文本(输入框X,输入框Y,输入内容)--会先清空文本，内容必须为文本
touchDown(输入框X,输入框Y); 
mSleep(30)
touchUp(输入框X,输入框Y)
--延迟 1 秒以便获取焦点，注意某些应用不获取焦点无法输入
mSleep(1000)
inputStr(输入内容);
mSleep(500)
return true
end

function 输入文本2(输入框X,输入框Y,输入内容)
touchDown(输入框X,输入框Y);       
mSleep(30)
touchUp(输入框X,输入框Y);
--延迟 1 秒以便获取焦点，注意某些应用不获取焦点无法输入
mSleep(1000);             
--在输入框中输入字符串 "Welcome." 并回车；此函数在某些应用中无效，如支付宝、密码输入框等位置，甚至可能会导致目标应用闪退
--inputText(输入内容);
inputKey(输入内容);
mSleep(800)
end

-----------------------------下面是文件处理---------------------------
function findFile(path)
	local a = io.popen("find "..path.." -prune");
	local f = {};
	for l in a:lines() do
		table.insert(f,l)
	end
	a:close()
	return f
end

function 判断文件是否存在(信息文件) --该参数为文本格式,返回true 或者 false
--file = findFile('/var/mobile/Media'..信息文件)
file = findFile(values.文件路径..信息文件)
if #file > 0 then
	for  i=1,#file,1  do
		toast("找到文件"..file[i])
		return true
	end
else
	dialog("文件路径不存在")
	luaExit()
	mSleep(1000)
	return false
end
end

function 读取信息(信息文件)
--	file = '/var/mobile/Media'..信息文件
	file = values.文件路径..信息文件
	txt = readFileString(file)
	if txt then
		dialog("文件内容"..txt)
		mSleep(1000)
	else
		dialog("文件不存在")
	end
end

function 读取配置(路径,键) --路径和键都是文本   返回读取到的内容 文本
ts.config.open('/var/mobile/Media'..路径)
v=ts.config.get(键)
ts.config.close(true)
return v
end

function 写入配置(路径,键,值)  --路径和键为 文本          值可以是文本也可以是数字
ts.config.open('/var/mobile/Media'..路径)
ts.config.save(键,值)
ts.config.close(true)
end

function 获取随机文本(信息文件) --返回 一行随机的文本
--local tab=readFile('/var/mobile/Media/'..信息文件)
local tab=readFile(values.文件路径..信息文件)
if tab then 
	--local 随机获取值=tab[math.random(1,table长度(tab))]
	local 随机获取值=tab[math.random(1,table长度(tab))]
	toast ("获取到的随机值："..随机获取值)
	mSleep(1000)
	return  随机获取值:rtrim()
else
	dialog("没有可用的数据了")
	luaExit()
	mSleep(1000)
end
end

function 记录数据(记录路径,记录内容)--都为字符串格式
local bool = writeFileString('/var/mobile/Media/'..记录路径,记录内容,"a",1) --将 string 内容存入文件，成功返回 true
if bool then	
	toast('账户信息已经成功记录',1)
	--dialog("手机号已记录")
end
end

function 获取随机字符(数量起,数量止)
local v='',随机位置, vv
local str1 ="abcdefghijklmnopqrstuvwxyz0123456789"
local sj=ts.ms()
math.randomseed(sj*10000) -- 随机种子初始化真随机数
local num = math.random(数量起,数量止)
for var= 1,num do
	随机位置=math.random(1,36)
	vv=string.sub(str1,随机位置,随机位置)
	v=v..vv --拼接名字
end
return v
end

function 向右滑动()
touchDown(125+math.random(0,5),267+math.random(0,5));    
mSleep(30);
--移动到坐标 (150, 600)，注意一次滑动的坐标间隔不要太大，不宜超过 50 像素
touchMove(587+math.random(0,5),267+math.random(0,5));    
mSleep(30);
--在坐标 (150, 600) 抬起
touchUp(587+math.random(0,5),267+math.random(0,5));
end


--function 获取读取登录文本(信息文件) --返回 一行随机的文本
----local tab=readFile('/var/mobile/Media/'..信息文件)
--local tab=readFile(values.登录文件路径..信息文件)
--if tab then 
--	--local 随机获取值=tab[math.random(1,table长度(tab))]
--	local 随机获取值=tab[math.random(1,table长度(tab))]
--	toast ("获取到的随机值："..随机获取值)
--	mSleep(1000)
--	return  随机获取值:rtrim()
--else
--	dialog("没有可用的数据了")
--	luaExit()
--	mSleep(1000)
--end
--end






