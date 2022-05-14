-- function 切换VPN老方法()--启动小火箭  --判定打开VPN  --切换VPM  -- 判定有无网络
-- 	local 节点数量
-- 	打开应用('com.liguangming.Shadowrocket',3000)
-- 	for var= 1,100 do--说明启动了小火箭
-- 		x,y = findMultiColorInRegionFuzzy(0x2473bd, "301|-3|0x2473bd,444|-28|0xffffff,-217|-28|0xffffff,-180|-51|0xffffff,-191|-41|0x2473bd,-192|-18|0x2473bd,438|-12|0x2473bd,452|-19|0x2473bd,461|-29|0xffffff",90,30,60,714,115)
-- 		if x>0 then 
-- 			break
-- 		end
-- 		mSleep(2000)
-- 	end
-- 	for var= 1,10 do --小火箭开关开启
-- --		if (isColor( 643,  204, 0x2473bd, 85)) then  --旧版本
-- 		if (isColor( 612,  209, 0x2372bd, 85)) then
-- 			break
-- 		else
-- 			tap(622,205)
-- 			mSleep(2000)
-- 		end
-- 	end
-- 	for i= 0,7 do --判断节点数量
-- 		--x,y = findColorInRegionFuzzy(0x000000,100,118,558+i*88,219,589+i*88)   --旧版本不需要更改
-- 		x,y = findColorInRegionFuzzy(0xffffff ,100,649,628+i*88, 678,1096+i*88)
-- 		if x<0 then --说明没有节点了
-- 			节点数量=i
-- 			break
-- 		end
-- 	end
-- 	local 随机节点序
-- 	if 节点数量~=1 then
-- 		for var= 1,10 do
-- 			随机节点序=math.random(0,节点数量-1)  --去重复，万一随机的还是那个呢
-- --			if (isColor(13,581+随机节点序*88,0xff9400,85)) then      --旧版本
--             if (isColor(  43,  638+随机节点序*88, 0xff9400, 85)) then  --页面适配    
                
-- 			else
-- 				break
-- 			end
-- 		end 
-- --		tap(325,574+随机节点序*88)    --旧版本
-- 		tap(346,627+随机节点序*88) 
-- 		mSleep(2000) 
-- 	end
-- 	--新旧版本目前暂时不支持同时兼容，如果是ios12系统，则需要另起脚本！！！
-- end


function 切换VPN()--启动小火箭  --判定打开VPN  --切换VPM  -- 判定有无网络
	local 节点数量
	打开应用('com.liguangming.Shadowrocket',3000)
	for var= 1,100 do--说明启动了小火箭
		x,y = findMultiColorInRegionFuzzy(0x2473bd, "301|-3|0x2473bd,444|-28|0xffffff,-217|-28|0xffffff,-180|-51|0xffffff,-191|-41|0x2473bd,-192|-18|0x2473bd,438|-12|0x2473bd,452|-19|0x2473bd,461|-29|0xffffff",90,30,60,714,115)
		if x>0 then 
			break
		end
		mSleep(2000)
	end
	for var= 1,10 do --小火箭开关开启
	    local ios12 = isColor( 643,  204, 0x2473bd, 85)
	    local ios13 = isColor( 612,  209, 0x2372bd, 85)
	    if values.系统版本=='0' and ios12 then 
	        --dialog("123")
	        break
	    elseif values.系统版本=='1' and ios13 then
            break
        else
            touchDown(669,203)
            mSleep(500)
            touchUp(669,203)
    	    mSleep(2000) 
        end
	end
           
	for i= 0,7 do --判断节点数量
		--x,y = findColorInRegionFuzzy(0x000000,100,118,558+i*88,219,589+i*88)   --旧版本不需要更改
		x,y = findColorInRegionFuzzy(0xffffff ,100,649,628+i*88, 678,1096+i*88)
		if x<0 then --说明没有节点了
			节点数量=i
			--dialog(节点数量)
			break
		end
	end
	
	local 随机节点序
	if 节点数量~=1 then
		for var= 1,10 do
    		随机节点序=math.random(0,节点数量-1)--去重复，万一随机的还是那个呢
    	    local isios12 = isColor(13,581+随机节点序*88,0xff9400,85)
    	    local isios13 = isColor(43,638+随机节点序*88,0xff9400,85)
    		 if values.系统版本=='0' and isios12 then 
    		     toast("代理已切换-ios12")
    		 elseif values.系统版本=='1' and isios13 then 
    		     toast("代理已切换")
    		 else
    		    break
    		 end
		end 
		
		if values.系统版本 =='0' then
    		tap(368,645+随机节点序*88)    --旧版本 12系统
        	mSleep(2000)
		else
    		tap(346,627+随机节点序*88) 
    		mSleep(2000) 
		end
	end
end


function PyApp新机坐标版本()
	mSleep(500)
	关闭应用('com.hd.PyApp')
	toast("已经关闭新机")
	mSleep(1000)
	打开应用('com.hd.PyApp',2000)
	mSleep(3000)
	--tap(新机按钮X,新机按钮Y)
	touchDown(新机按钮X,新机按钮Y)
	mSleep(30)
	touchUp(新机按钮X,新机按钮Y)
	mSleep(3000)
	toast("点击新机 ")
	mSleep(1000)
	--tap(确定新机X,确定新机Y)
	touchDown(确定新机X,确定新机Y)
	mSleep(30)
	touchUp(确定新机X,确定新机Y)
	mSleep(3000)
	mSleep(3000)
	toast("确认新机 ")
	mSleep(6000)
end

--------------------ZL操作----------------------
function ZL一键新机()
	local 当前界面
	for var= 1,100 do
		当前界面=检索界面(ZL界面列表)
		if 当前界面=='ZL主界面' then
			break
		elseif 当前界面=='ZL备份界面' then
			向右滑动()
			mSleep(1000)
		else
			mSleep(1000)
		end
	end
	tap(ZL新机按钮X,ZL新机按钮Y)
	mSleep(5000)
	for var= 1,40 do----判断是否刷新完成
		if (isColor(422,657,0xe2e2e2,90)) then
			mSleep(1000)
		else
			break
		end
	end
end

function ZL切备份包()
	local 当前界面
	for var= 1, 100 do
		当前界面=检索界面(ZL界面列表)
		if 当前界面=='ZL主界面' then
			tap(ZL备份包按钮X,ZL备份包按钮Y)
			mSleep(1000)
		elseif 当前界面=='ZL备份界面' then
			break
		else
			mSleep(1000)
		end
	end
	tap(ZL下一个按钮X,ZL下一个按钮Y)
	mSleep(5000)
	for var= 1,40 do----判断是否刷新完成
		if (isColor( 370,572, 0x333333,90)) then
			mSleep(1000)
		else
			break
		end
	end
	mSleep(1500)
	if (isColor(693,182,0x007aff,90)) then ---判断是选中原始备份包
		toast('任务完成',10)
		lua_exit()
	end
end

function AWZ一键新机()
	local 当前界面
	for var= 1,100 do
		当前界面=检索界面(AWZ界面)
		if 当前界面=='AWZ主界面' then
			break
		elseif 当前界面=='AWZ备份管理界面' then
			touch():Step(50):on(200,1000):move(200,500):off()
			mSleep(1000)
		else
			mSleep(1000)
		end
	end
	tap(AWZ一键新机X,AWZ一键新机Y)
	mSleep(5000)
	for var= 1,40 do----判断是否刷新完成
		if (isColor( 372,582,0xe4e4e5,90)) then
			mSleep(1000)
		else
			break
		end
	end
end

function HB新机()
	if values.使用软件 == '2' then
		打开应用('xoxo.heibao',3000)
	elseif values.使用软件 == '5' then
		打开应用('xoxo.superman',3000)
	else
	end

	local 当前界面
	while (true) do
		当前界面=检索界面(HB界面列表)
		if 当前界面=='HB主界面' or 当前界面=='SM主界面' then
			tap(新机按钮X,新机按钮Y)
			mSleep(1000)
		elseif 当前界面=='HB广告界面' then
			tap(我知道了按钮X,我知道了按钮Y)
			mSleep(1000)
		elseif 当前界面=='HB提示1界面' or 当前界面=='SM提示1界面' then		--新机提示
			tap(提示1确定按钮X,提示1确定按钮Y)
			mSleep(1500)  
		elseif 当前界面=='HB提示2界面' then
			tap(提示失败确定按钮X,提示失败确定按钮Y)
			mSleep(1000)
			--erkang--
		elseif 当前界面=='HB提示4界面' or 当前界面=='SM提示4界面' then
			tap(提示失败确定按钮2X,提示失败确定按钮2Y)
			mSleep(1000)
		elseif 当前界面=='HB刷新界面' or 当前界面=='SM刷新界面' then
			for var= 1, 200 do
				if isColor(293,558,0x1e1f22) then		--判断是否刷新完成
					mSleep(1000)
				else
					mSleep(5000)
					if 检索界面(HB界面列表)=='HB提示2界面' or 当前界面=='SM提示4界面' then
						toast('新机失败',1)
						return false
					else
						toast('新机完成',3)
						return true
					end
				end
			end

		else
			mSleep(1000)	
		end
	end
end

--function HB新机()
--	打开应用('xoxo.heibao',3000)
--	local 当前界面
--	while (true) do
--		当前界面=检索界面(HB界面列表)
--		if 当前界面=='HB主界面' then
--			for var= 1,20 do
--				dialog('1')
--				local webdata = httpGet("http://127.0.0.1:8888/api/start?bid=com.zhiliaoapp.musically&app=TikTok")
--				dialog('2')
--				local tmp = json.decode(webdata)
--				dialog(tmp.code)
--				if tmp.code==1 then
--					toast('新机成功',1)
--					return true
--				elseif tmp.code==0 then
--					toast('新机失败,准备再次新机',1)
--					mSleep(10000)
--				else
--					toast('未知错误',1)
--				end
--			end
--		elseif 当前界面=='HB广告界面' then
--			tap(我知道了按钮X,我知道了按钮Y)
--			mSleep(1000)
--		elseif 当前界面=='HB提示1界面' then--新机提示
--			tap(提示1确定按钮X,提示1确定按钮Y)
--			mSleep(1500)  
--		elseif 当前界面=='HB提示2界面' then
--			tap(提示失败确定按钮X,提示失败确定按钮Y)
--			mSleep(1000)
--		else
--			mSleep(1000)	
--		end
--	end
--end

function HB切换备份包()
	if values.使用软件 == '2' then
		打开应用('xoxo.heibao',3000)
	elseif values.使用软件 == '5' then
		打开应用('xoxo.superman',3000)
	else
	end
	local 当前界面
	while (true) do
		当前界面=检索界面(HB界面列表)
		if 当前界面=='HB主界面' then
			tap(备份按钮X,备份按钮Y)
			mSleep(1000) 
		elseif 当前界面=='HB备份界面' then
			x,y = findColorInRegionFuzzy(0x3aa190,90,38,132,114,1009)
			if x>0 then
				-------------------------判断是否为最后一个包------------------------
				--判断是否到底  判断最后一个包是否为绿色
				x1,y1 = findMultiColorInRegionFuzzy( 0x3aa190, "48|1|0x3aa190,250|175|0x5a5a5a,280|183|0x5a5a5a,405|175|0x5a5a5a,424|183|0x5a5a5a,424|191|0x5a5a5a,323|185|0xffffff",90,35,1006,465,1203)
				if x1>0 then
					toast('任务结束',5)
					lua_exit()
				end
				---------------------------------------------------------------------
				tap(68,y+163)
				mSleep(1000)
			else--向上拉
				向上翻页2()
				mSleep(2000)
			end
		elseif 当前界面=='HB备份刷新界面' then
			mSleep(1000)
		elseif 当前界面=='HB备份管理界面' then
			tap(还原按钮X,还原按钮Y)
			mSleep(1000) 
		elseif 当前界面=='HB提示还原界面' then
			tap(511,746)--确定按钮
			mSleep(10000) --暂时不做判定
			return true
		else
			mSleep(1000) 
		end
	end
end


------------------------------------------------

function 选择生日()
moveTo(选择月[1],选择月[2]+math.random(0,30) ,选择月[3],选择月[4]+math.random(0,30))
mSleep(1000)
moveTo(选择日[1],选择日[2]+math.random(0,30) ,选择日[3],选择日[4]+math.random(0,30))
mSleep(1000)
--erkang--3次
for var=1,3 do
	moveTo(选择年[1],选择年[2],选择年[3],选择年[4])
	mSleep(2000)
end
moveTo(选择年[1],选择年[2]+math.random(50,100)+50 ,选择年[3],选择年[4]+math.random(0,50)-50)
mSleep(3000)
end

function 打开再关闭()
--  dialog("222")
	打开应用(TT,1000)
	mSleep(2000)
	toast("准备关闭")
	mSleep(1000)
	关闭应用("com.zhiliaoapp.musically")
	mSleep(1000)
	打开应用(TT,3000)
end

function TT注册()
	--打开TT应用  自动进入到了TT注册主界面  点击电话及邮箱注册按钮   进入到注册生日界面  输入年月日  点击NEXT按钮  进入到注册电话界面  点击邮箱按钮  
	--进入到注册邮箱界面  输入邮箱账号  点击NEXT按钮 打码 进入设置密码界面 输入密码  点击NEXT按钮 打码 
	while (true) do
		local 当前界面=检索界面(TT注册界面列表)---TT注册界面,TT设置生日界面,TT注册电话界面,TT注册邮箱界面,TT注册密码界面		
		------------1665版本通知类弹框-----------------
		if values.卸载安装 == '0' then 
			mSleep(2000)
			tap(222+math.random(1,10),792+math.random(1,10)) --1665版本授权通知
			mSleep(1000)
		else 
			mSleep(500)
		end
		
		if 当前界面=='TT注册界面1' or 当前界面=='TT注册界面2' or 当前界面=='TT注册界面3' or 当前界面=='TT注册界面4' or 当前界面=='TT注册界面5' then
			tap(邮箱及电话按钮X,邮箱及电话按钮Y)
			mSleep(1000)
		elseif 当前界面=='TT注册225界面login点击1' or  当前界面=='TT注册225界面login点击2' then  --遮罩点击
			mSleep(500)
			tap(TT注册225界面login点击1X+math.random(0,5),TT注册225界面login点击1X+math.random(0,5))
			mSleep(1000)
		elseif 当前界面=='TT注册225界面login4' then  --登录界面4 如果选项过多就滑动一次
			moveTo(556+math.random(1,10),726+math.random(1,10),574+math.random(1,10),494+math.random(1,10)) 
			mSleep(1000)
			toast("当前界面是登录界面")
			mSleep(1000)
			tap(点击225signup按钮X,点击225signup按钮Y)
			mSleep(3000)		
		elseif 当前界面=='TT注册225界面login2' or 当前界面=='TT注册225界面login3' or 当前界面=='TT注册225界面login' then   ----适配22.5.0版本
			toast("当前界面是登录界面")
			mSleep(1000)
			tap(点击225signup按钮X,点击225signup按钮Y)
			mSleep(3000)
			
		-----------------1665版本适配----------------------
		elseif 当前界面 == '注册1665主页授权界面' then
			tap(248+math.random(0,5),788+math.random(0,5))  --点击 不允许
			mSleep(1000)
		elseif 当前界面 == '注册1665主页界面' or 当前界面 == 'TT主界面无视频' then
			mSleep(500)
			moveTo(556+math.random(1,10),726+math.random(1,10),574+math.random(1,10),494+math.random(1,10)) --滑动遮罩
			mSleep(1000)
			tap(670+math.random(0,5),1286+math.random(0,5))  --点击 我c'v
			mSleep(1000)
			tap(372+math.random(0,5),745+math.random(0,5))   --点击 注册按钮
			mSleep(1000)
			tap(328+math.random(0,10),492+math.random(0,10))  -- 点击手机号邮箱注册
			mSleep(1000)
		elseif 当前界面 == '注册1665主页界面2' or 当前界面 == '注册1665视频提示界面' then
			mSleep(500)
			tap(670+math.random(0,5),1286+math.random(0,5))  --点击 我
			mSleep(1000)
			tap(372+math.random(0,5),745+math.random(0,5))   --点击 注册按钮
			mSleep(1000)	
		elseif 	当前界面=='注册1665signup界面' then
			tap(364+math.random(0,5),494+math.random(0,5))
			mSleep(1000)		
		elseif 	当前界面=='注册1665生日界面' then	
			选择生日()
			tap(注册1665生日X,注册1665生日Y)   --适配1665版本
			mSleep(6000)
		elseif 当前界面 == '注册1665已选择生日界面' then
			tap(275+math.random(0,5),553+math.random(0,5))
			mSleep(1000)
		elseif 当前界面 == 'TT注册弹框提示界面' then
--			tap(371+math.random(0,5),810+math.random(0,5))
            tap(361,808,100,"click_point_5_2.png",1)
			mSleep(1000)

		-----------------------------------------------------
		
		elseif 当前界面=='TT设置生日界面' then
			选择生日()
			tap(生日界面next按钮X,生日界面next按钮Y)
			tap(生日界面next2按钮X,生日界面next2按钮Y)   --适配22.0版本
			if (isColor( 277,  563, 0xfe2c55, 85)) then  --网络不好就重新点击
				tap(生日界面next按钮X,生日界面next按钮Y)
			else
			end
			mSleep(3000)
			判断是否离开该界面(TT注册界面列表,'TT设置生日界面')
		elseif 当前界面=='TT注册电话界面' or 当前界面=='TT注册211手机号界面' then
--				mSleep(1000)
--				tap(email按钮X,email按钮Y)
--				erkang 如果有手机号接口，那么继续操作，如果没有，则使用随机邮箱注册
				mSleep(3000)
				if (isColor( 114,  429, 0xff4c3a, 85)) then
					mSleep(1000)
					toast("toomany，重新运行")
					全局变量1=2
				else
					mSleep(1000)
				end				
				mSleep(3000)  --延时3秒
				
				if values.电话号接口 == '' and values.电话号接口2 == '' and values.电话号接口3 == '' and values.电话号接口4 == '' and values.电话号接口5 == '' and values.电话号接口6 == '' then
					toast("未获取到手机号接口，执行邮箱注册")
					mSleep(1000)
					tap(email按钮X,email按钮Y)
					mSleep(1000)
				else 
					toast("获取到手机号接口,执行手机号注册")
					mSleep(1000)
					local 电话号码
					tap(503,351)  --先点击空位置 才会出现X
					mSleep(math.random(500,1000))
					tap(666, 347) --点击X  清空内容
					mSleep(math.random(500,1000))
                ----------------选择国家代号-------------
                    if values.系统版本 == "1" then
                        if values.号码地区 == '0' then     --美国号   +1
                            tap(108,345)
                            mSleep(1000)
                            touchDown( 732,  978); 
                            mSleep(500)
                            touchUp( 732,  978)
                            mSleep(1000)
                            tap(311,  767)
                            mSleep(500)
                        elseif values.号码地区 == '2' then  --印尼 +62
                            tap(108,345)
                            mSleep(1000)
                            touchDown( 735,  642) 
                            mSleep(500)
                            touchUp( 735,  642)
                            mSleep(1000)
                            tap(309,  474)
                            mSleep(500)
                        elseif values.号码地区 == '3' then  --印度 +91
                            tap(108,345)
                            mSleep(1000)
                            touchDown(737, 641) 
                            mSleep(1000)
                            touchUp(737,  641)
                            mSleep(500)
                            tap(350,  381)
                            mSleep(500)
                        elseif values.号码地区 == '4' then  --越南 +84
                            tap(108,345)
                            mSleep(1000)
                            touchDown(733, 1005) 
                            mSleep(1000)
                            touchUp(733, 1005)
                            mSleep(500)
                            tap(377,  656)
                            mSleep(500)		
                            --elseif 号码地区 == '1' and 使用软件~='4' then  ---- 俄罗斯号 +7   (默认)
                        elseif values.号码地区 == '1' then  ---- 俄罗斯号 +7   (默认)
                            --dialog("13")
                            tap(108,345)
                            mSleep(1000)
                            touchDown(735,  894) 
                            mSleep(1000)
                            touchUp(735,  894)
                            mSleep(500)
                            tap(309,  481)
                            mSleep(500)
                        elseif values.号码地区=='5' then  ---- 爱沙尼亚 +372
                            tap(108,345)
                            mSleep(1000)
                            touchDown( 735,  529) 
                            mSleep(1000)
                            touchUp( 735,  529)
                            mSleep(500)
                            tap(310,  760)
                            mSleep(500)	
                        elseif values.号码地区=='6' then  ---- 吉尔吉斯斯坦+996
                            tap(108,345)
                            mSleep(1000)
                            touchDown(734,  701) 
                            mSleep(1000)
                            touchUp(734,  701)
                            mSleep(500)
                            tap(328, 857)
                            mSleep(500)
                        elseif values.号码地区=='7' then  ---- 巴西 +55
                            tap(108,345)
                            mSleep(1000)
                            touchDown(735,  447) 
                            mSleep(1000)
                            touchUp(735,  447)
                            mSleep(500)
                            moveTo(500+math.random(1,10),1038+math.random(1,10),516+math.random(1,10),390+math.random(1,10)) --滑动到 巴西 +55
                            mSleep(3000)
                            tap(372, 532)
                            mSleep(500)		
                        elseif values.号码地区=='8' then  ---- 马来西亚 +60
                            tap(108,345)
                            mSleep(1000)
                            touchDown(735,  755) 
                            mSleep(1000)
                            touchUp(735,  755)
                            mSleep(500)
                            tap(308,  575)
                            mSleep(500)
                        elseif values.号码地区=='9' then  ---- 英格兰 +44
                            tap(108,345)
                            mSleep(1000)
                            touchDown( 733,  585) 
                            mSleep(1000)
                            touchUp( 733,  585)
                            mSleep(500)
                            moveTo(500,1038,516,390) --滑动到 根西岛 +44
                            mSleep(3000)
                            tap( 283,  410)
                            mSleep(500)							
                        else						
                            mSleep(500)
                        end
                    elseif values.系统版本 == "0" then    --12系统
                        if values.号码地区 == '1' then  ---- 俄罗斯号 +7   (默认)  
                            --dialog("12")
                            tap(108,345)
                            mSleep(1000)
                            touchDown(733,874) 
                            mSleep(1000)
                            touchUp(733,874)
                            mSleep(500)
                            tap(332,438)
                            mSleep(500)  
                        end
                    else
   
                    end
			    
                    if values.接口序=='0' then
                        电话号码 = 获取电话号码()
                        --电话号码 = '3438659922'     -- 调试
                    elseif values.接口序=='1' then
                        电话号码 = 获取手机号和ID2()
                    elseif values.接口序=='2' then
                        电话号码 = 获取电话号码3()
                    elseif values.接口序=='3' then
                        电话号码 = 获取手机号和ID4()
                    elseif values.接口序=='4' then
                        电话号码 = 获取手机号和ID5()
                    elseif values.接口序=='5' then
                        电话号码 = 获取手机号和ID6()
                    end
					输入文本2(邮箱输入框X2,邮箱输入框Y2,电话号码)  --inputText 版本
					mSleep(1000)
					tap(372,660)--send 按钮
					mSleep(5000)
					判断是否离开该界面(TT注册界面列表,'TT注册电话界面')
				end
		elseif 	当前界面=='注册1665频繁界面' then
				mSleep(1000)
				toast("新机环境异常或者节点频繁，流程结束")
				全局变量1=2
		elseif 	当前界面=='TT注册网络异常界面' or 当前界面=='TT注册网络异常界面2' then
				mSleep(1000)
				toast("网络异常，流程结束")
				全局变量1=2
		elseif 当前界面=='TT验证码等待界面' then 
				mSleep(3000)
				toast("正在等待验证码刷新")
		elseif 当前界面=='TT注册电话验证码界面' or 当前界面=='注册1665手机验证号' then
			local 验证码
			local x, y = findColorInRegionFuzzy(0xfe2c55,90,69,435,106,573)
			if x>0 then
				toast("Resend code -- 重新发送验证码",1)
				mSleep(1000)
				tap(x+10,y+5)
				mSleep(15000)
			end
			
			local x, y = findMultiColorInRegionFuzzy( 0xff4c3a, "-129|15|0xff4c3a,210|8|0xff4c3a,217|11|0xff4c3a", 90, 53, 440, 444, 484)
			if x>0 then
				toast("TK 注册 -- time out ! ，重新运行脚本")
				mSleep(1000)
				全局变量1=3		
			end
			
			local x, y = findMultiColorInRegionFuzzy( 0xff4c3a, "219|-7|0xff4c3a,370|-6|0xff4c3a,57|25|0xff513f", 90, 29, 343, 688, 529)
			if x>0 then
				toast("TK 注册 -- verification failed，重新运行脚本")
				mSleep(1000)
				全局变量1=3
			end
			
			for var= 1,7 do
				tap(630,1276)
				mSleep(500)
			end
			
			mSleep(1000)	
			if values.接口序=='0' then
				验证码=获取验证码()  --兼容 json 和  文本
			elseif values.接口序=='1' then
				验证码=获取验证码2()
			elseif values.接口序=='2' then
				验证码=获取验证码3()
			elseif values.接口序=='3' then
				验证码=获取验证码4()
			elseif values.接口序=='4' then
				验证码=获取验证码5()
			elseif values.接口序=='5' then
				验证码=获取验证码6()
			else
				mSleep(1000)
			end
			mSleep(1000)
--			dialog("获取到的验证码："..验证码) 
			小键盘输入(验证码) -- 注意接码API的变化和更新，同时注意　软件版本验证码长度
			mSleep(14000)
		elseif 当前界面=='TT注册老号界面' then
			mSleep(2000)
			toast("该手机号是老号")
			tap( 196,  864)
			mSleep(1000)
		elseif 当前界面=='TT注册邮箱界面' or 当前界面=='注册1665邮箱注册界面2'  then
			tap(456,348)  --先点击空位置 才会出现X
			mSleep(math.random(500,1000))
			tap(666, 347) --点击X  清空内容
			mSleep(math.random(500,1000))
				--dialog(随机账号密码)
			随机账号密码()
			输入文本2(邮箱输入框X,邮箱输入框Y,账号)
			mSleep(1000)
			tap(邮箱界面next按钮X,邮箱界面next按钮Y)
			mSleep(8000)
			判断是否离开该界面(TT注册界面列表,'TT注册邮箱界面')
		elseif 当前界面=='TT注册账号重复界面' then
			向右滑动()
			mSleep(1000)
		elseif 当前界面=='TT注册打码界面' then
			tap(170,924)  --先点击刷新
			mSleep(3000)
			打码准备()
			toast('验证码已刷新',1)
			mSleep(500)
--			打码()
			图鉴打码()
			mSleep(12000)
			判断是否离开该界面(TT注册界面列表,'TT注册邮箱界面')
		elseif 	当前界面=='注册1665验证码未刷新界面' then
			toast('刷新验证码中...',1)
			mSleep(500)
			tap(154+math.random(0,10),832+math.random(0,10))
			mSleep(1000)
		elseif 当前界面=='TT验证码验证失败2' then  --绿色滑块失败界面
			toast("验证失败，重新验证")
			mSleep(1000)
			tap(166,926)
			mSleep(1000)
		elseif 当前界面=='TT注册邮箱验证码界面' then --出现验证码就重头来
			toast('请输入验证码',5)
			mSleep(10000)
			
		elseif 当前界面=='TT注册频繁界面' then
			mSleep(15000)
	
		elseif 当前界面 == '注册1665密码界面' or 当前界面 == 'TT注册密码界面' then
			mSleep(1000)
			随机账号密码()
			--dialog(密码)
			mSleep(100)
			输入文本(密码输入框X,密码输入框Y,密码)
			mSleep(1000)
			tap(密码界面next按钮X,密码界面next按钮Y)
			tap(298+math.random(0,10),524+math.random(0,10))  --1665版本
			mSleep(6000)
			
		elseif 当前界面=='TT注册用户名界面' or 当前界面=='TT注册用户名界面2' then
			mSleep(3000)
			while (true) do
					--erkang--先清除文本框，然后再输入用户昵称，有文件就随机文件内容，没有就字母随机
					mSleep(500)
					for var= 1,20 do
						tap(703,1182)
						mSleep(50)
					end
					mSleep(500)				
					if values.文件名称 == '' then
						toast("未指定昵称文件，昵称字母随机")
						mSleep(500)
						名字 = 随机用户名()
					else
						toast("获取到文件！")
						名字 = 随机用户昵称()
					end
					tap(657,373)
					mSleep(800)
					输入文本(用户名输入框X,用户名输入框Y,名字)
					mSleep(5000)
				if multiColor({{用户名对勾X,用户名对勾Y,对勾的颜色}},90,false) == true  then--说明用户名可以用	
					tap(用户名确认按钮X,用户名确认按钮Y)
					mSleep(8000)
					return true
				else
					mSleep(500)
					tap(657,372) --点击 × 清除输入框
				end
			end
		elseif 当前界面=='未知界面' then
            mSleep(1000)
        
		--erkang-- 针对于手机号  注册完之后，判断当前界面是哪个 未知界面就等待  如果都不是以下界面  则表示是老号，流程结束继续下一个流程，脚本继续
--		elseif 当前界面 ~= 'TT注册界面1' or
--			   当前界面 ~= 'TT注册界面2' or
--			   当前界面 ~= 'TT注册界面3' or
--			   当前界面 ~= 'TT注册界面4' or
--			   当前界面 ~= 'TT注册界面5' or
--			   当前界面 ~= 'TT注册225界面login点击1' or   
--			   当前界面 ~= 'TT注册225界面login点击2' or   
--			   当前界面 ~= 'TT注册225界面login' or   
--			   当前界面 ~= 'TT注册225界面login2' or   
--			   当前界面 ~= 'TT注册225界面login3' or   
--			   当前界面 ~= 'TT注册225界面login4' or  
--			   当前界面 ~= 'TT注册225界面login5' or
--			   当前界面 ~= 'TT设置生日界面' or
--			   当前界面 ~= 'TT注册电话界面' or   
--			   当前界面 ~= 'TT注册电话验证码界面' or
--			   当前界面 ~= 'TT注册邮箱界面' or
--			   当前界面 ~= 'TT注册账号重复界面' or
--			   当前界面 ~= 'TT注册打码界面' or
--			   当前界面 ~= 'TT注册邮箱验证码界面' or
--			   当前界面 ~= 'TT注册用户名界面' or
--			   当前界面 ~= 'TT注册用户名界面2' or
--			   当前界面 ~= 'TT注册频繁界面' or
--			   当前界面 ~= '注册1665主页界面' or
--			   当前界面 ~= '注册1665主页界面2' or
--			   当前界面 ~= '注册1665signup界面' or
--			   当前界面 ~= '注册1665生日界面' or
--			   当前界面 ~= '注册1665密码界面' or  
--			   当前界面 ~= 'TT注册密码界面' then				   
--			mSleep(100)
--			toast("该账号是老帐号")
--			mSleep(1000)
--			return true
		elseif 当前界面 == 'TT注册进入粉丝界面' then   --仅适配 onepress 1665版本   去除视频版本
			mSleep(1000)
			toast("该账号是老帐号")
			mSleep(1000)
			return true	
		else

		end
		mSleep(1000)
	end
end

function 设置资料()
while (true) do   --修改链接
	local 当前界面=检索界面(TT界面列表) --TT主界面,TT个人主页界面,TT管理账户界面,TT设置和隐私界面,TT企业设置界面,TT选择企业类型界面,TT弹窗欢迎光临界面,TT弹窗访问照片权限界面,TT个人资料设置界面,TT设置个性签名界面,TT设置链接界面
	if 当前界面 == 'TT主界面3' then
		mSleep(1000)
		randomTap(225,1257)
		mSleep(1000)
	elseif 当前界面=='TT主界面' or 当前界面=='TT主界面2' then --点ME按钮
		tap(me按钮X+math.random(0,5),me按钮Y+math.random(0,5))
		mSleep(1000)	
	elseif 当前界面=='TT个人主页界面' then--点右上角三个点 ，如果不设置链接的话 点击EDIT PROFILE按钮
		tap(个人主页edit按钮X,个人主页edit按钮Y)
		mSleep(2000)
		break
	elseif 当前界面=='TT弹窗界面1' then
		tap(TT弹窗退出按钮X,TT弹窗退出按钮Y)
	elseif 当前界面=='TT弹窗欢迎光临界面' or 当前界面=='TT弹窗欢迎光临界面2' then  --ID点击EDIT PROFILE 这个按钮
		tap(弹窗欢迎光临edit按钮X+math.random(0,5),弹窗欢迎光临edit按钮Y+math.random(0,5))
		mSleep(2000)
	elseif 当前界面=='TT选择兴趣界面' or 当前界面=='TT选择兴趣界面2' then
		tap(选择兴趣skip按钮X,选择兴趣skip按钮Y)
		mSleep(3000)
		
		--erkang--
	elseif 当前界面=='TT选择兴趣界面3' then
		tap(TT选择兴趣3按钮X,TT选择兴趣3按钮Y)
		--tap(TT选择兴趣4按钮X,TT选择兴趣4按钮Y)
		mSleep(1000)
		tap(TT选择兴趣4按钮X,TT选择兴趣4按钮Y)
		mSleep(1000)
		tap(TT选择兴趣5按钮X,TT选择兴趣5按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT选择兴趣界面4' then
		tap(TT选择兴趣4按钮X,TT选择兴趣4按钮Y)
		mSleep(3000)
		
	elseif 当前界面=='TT选择兴趣界面5' then
		tap(TT选择兴趣5按钮X,TT选择兴趣5按钮Y)
		mSleep(3000)
		
	elseif 当前界面=='TT开始看界面' or 当前界面=='TT开始看界面2' then
		tap(开始看界面start按钮X,开始看界面start按钮Y)
		mSleep(2000)
	elseif 当前界面=='TT进入主页界面' then
		for var= 1,math.random(2,3) do
			moveTo(370+math.random(1,10),988+math.random(1,10),374+math.random(1,10),461+math.random(1,10)) --这里用的选择头像的时候的坐标
			mSleep(1000)
		end
	elseif 当前界面=='TT个人资料设置界面' or 当前界面=='TT个人资料设置界面2' then 
		return true
		--		tap(资料设置bio按钮X+math.random(0,5),资料设置bio按钮Y+math.random(0,5))
		--		mSleep(2000)
	elseif 当前界面=='TT弹窗界面2' then
		tap(TT弹窗界面2按钮X,TT弹窗界面2按钮Y)
		mSleep(1000)	
	elseif 当前界面=='TT弹窗界面3' then
		tap(TT弹窗界面3按钮X,TT弹窗界面3按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面4' then
		tap(TT弹窗界面4按钮X,TT弹窗界面4按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面5' then
		tap(TT弹窗界面5按钮X,TT弹窗界面5按钮Y)
		mSleep(1000)

	elseif 当前界面=='TT弹窗界面6' then
		tap(TT弹窗界面6按钮X,TT弹窗界面6按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面7' then
		tap(TT弹窗界面7按钮X,TT弹窗界面7按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面8' then
		tap(TT弹窗界面8按钮X,TT弹窗界面8按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面9' then
		tap(TT弹窗界面9按钮X,TT弹窗界面9按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面10' then
		tap(TT弹窗界面10按钮X,TT弹窗界面10按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面11' then
		tap(TT弹窗界面11按钮X,TT弹窗界面11按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面12' then
		tap(TT弹窗界面12按钮X,TT弹窗界面12按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面13' then
		tap(TT弹窗界面13按钮X,TT弹窗界面13按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面14' then
		tap(TT弹窗界面14按钮X,TT弹窗界面14按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面15' then
		tap(TT弹窗界面15按钮X,TT弹窗界面15按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面16' then
		tap(TT弹窗界面16按钮X,TT弹窗界面16按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面17' then
		tap(TT弹窗界面17按钮X,TT弹窗界面17按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面18' then
		tap(TT弹窗界面18按钮X,TT弹窗界面18按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面19' then
		tap(TT弹窗界面19按钮X,TT弹窗界面19按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面20' then
		tap(TT弹窗界面20按钮X,TT弹窗界面20按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面21' then
		tap(TT弹窗界面21按钮X,TT弹窗界面21按钮Y)
		mSleep(1000)
		
		--erkang--
	elseif 当前界面=='TT弹窗界面22' then
		tap(TT弹窗界面22按钮X,TT弹窗界面22按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面23' then
		tap(TT弹窗界面23按钮X,TT弹窗界面23按钮Y)
		mSleep(1000)	
	elseif 当前界面=='TT弹窗界面24' then
		tap(TT弹窗界面24按钮X,TT弹窗界面24按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面25' then
		tap(TT弹窗界面25按钮X,TT弹窗界面25按钮Y)
		mSleep(1000)	
	elseif 当前界面=='TT弹窗界面26' then
		tap(TT弹窗界面26按钮X,TT弹窗界面26按钮Y)
		mSleep(1000)	
		-----
		
	elseif 当前界面=='TT设置个性签名界面' then --开始输入个性签名
		mSleep(500)
		输入文本(个性签名输入框X,个性签名输入框Y,个性签名)
		mSleep(2000)
		tap(个性签名设置save按钮X,个性签名设置save按钮Y)
		mSleep(3000)
		return true
	elseif 当前界面=='未知界面' then

	end
	mSleep(1000)
end
end

function 设置头像()
while (true) do
	local 当前界面=检索界面(TT界面列表)--TT主界面,TT个人主页界面,TT管理账户界面,TT设置和隐私界面,TT企业设置界面,TT选择企业类型界面,TT弹窗欢迎光临界面,TT弹窗访问照片权限界面,TT个人资料设置界面,TT设置个性签名界面,TT设置链接界面
	
	if 当前界面=='TT个人主页界面' then--点右上角三个点 ，如果不设置链接的话 点击EDIT PROFILE按钮
		tap(个人主页edit按钮X,个人主页edit按钮Y)
		mSleep(2000)
	
	elseif 当前界面=='TT个人资料设置界面' then
		tap(资料设置头像按钮X+math.random(0,5),资料设置头像按钮Y+math.random(0,5))
		mSleep(2000)
	
	-------------1665----------------------
	elseif 当前界面=='注册1665相册界面' then 
		tap(376+math.random(0,5),286+math.random(0,5))
		mSleep(1000)
	elseif 当前界面=='注册1665选择相册界面' or  当前界面=='注册1665选择相册界面2' then
		tap(354+math.random(0,5),272+math.random(0,5))
		mSleep(1000)
		
	---------------------------------------	
	elseif 当前界面 == 'TT选择相册225' then
		tap(383+math.random(0,5),273)
		mSleep(3000)
		
	elseif 当前界面 == 'TT个人资料设置界面2' then  -----erkang ---老帐号重新设置
		toast("该账号是老帐号,重新设置头像资料")
		tap(资料设置头像按钮2X+math.random(0,10),资料设置头像按钮2Y+math.random(0,10))
		mSleep(2000)
		
	elseif 当前界面=='TT打开相册界面' then 
		tap(选择相册按钮X+math.random(0,5),选择相册按钮Y)
		mSleep(3000)
	
	elseif 当前界面=='TT相册授权界面' then
		tap(TT相册授权按钮X,TT相册授权按钮Y)
		mSleep(1000)
	
	elseif 当前界面 == '注册1665授权相册界面' or 当前界面 == '注册1665授权相册界面2' then
		tap(500+math.random(0,5),794+math.random(0,5))
		mSleep(1000)
		
	elseif 当前界面=='TT相册授权界面4' then
		tap(422,1014)
		mSleep(1000)	
	elseif 当前界面=='TT相册界面' or 当前界面=='注册1665选择照片界面' or 当前界面=='注册1665选择照片界面2' or 当前界面=='TT相册界面5' then --开始选择照片
		moveTo(370+math.random(1,10),988+math.random(1,10),374+math.random(1,10),461+math.random(1,10))
		mSleep(2000)
		tap(math.random(64,649),math.random(410,1191))
		--tap(相册初始位置X+math.random(0,4)*相册间隔,相册初始位置Y+math.random(0,5)*相册间隔)
		mSleep(3000)
	elseif 当前界面=='TT确认头像界面' then --点击SAVE
		for var= 1,5 do
			tap(头像save按钮X,头像save按钮Y)
			mSleep(3000)
			--判定是否离开这个页面
			x,y = findMultiColorInRegionFuzzy(TT确认头像界面.界面特征[2],TT确认头像界面.界面特征[3],TT确认头像界面.界面特征[4],TT确认头像界面.界面特征[5],TT确认头像界面.界面特征[6],TT确认头像界面.界面特征[7],TT确认头像界面.界面特征[8])
			if x<0 then
				toast('注册流程完成',10)
				return true
			end
			mSleep(8000)
		end

	elseif 当前界面=='TT弹窗访问照片权限界面' then --点击OK
		tap(弹窗访问照片权限ok按钮X,弹窗访问照片权限ok按钮Y)
		mSleep(2000)
	elseif 当前界面=='TT弹窗界面1' then
		tap(TT弹窗界面1按钮X,TT弹窗界面1按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面2' then
		tap(TT弹窗界面2按钮X,TT弹窗界面2按钮Y)
		mSleep(1000)	
	elseif 当前界面=='TT弹窗界面3' then
		tap(TT弹窗界面3按钮X,TT弹窗界面3按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面4' then
		tap(TT弹窗界面4按钮X,TT弹窗界面4按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面5' then
		tap(TT弹窗界面5按钮X,TT弹窗界面5按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面6' then
		tap(TT弹窗界面6按钮X,TT弹窗界面6按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面7' then
		tap(TT弹窗界面7按钮X,TT弹窗界面7按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面8' then
		tap(TT弹窗界面8按钮X,TT弹窗界面8按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面9' then
		tap(TT弹窗界面9按钮X,TT弹窗界面9按钮Y)
		mSleep(1000)	
	elseif 当前界面=='TT弹窗界面10' then
		tap(TT弹窗界面10按钮X,TT弹窗界面10按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面11' then
		tap(TT弹窗界面11按钮X,TT弹窗界面11按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面12' then
		tap(TT弹窗界面12按钮X,TT弹窗界面12按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面13' then
		tap(TT弹窗界面13按钮X,TT弹窗界面13按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面14' then
		tap(TT弹窗界面14按钮X,TT弹窗界面14按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面15' then
		tap(TT弹窗界面15按钮X,TT弹窗界面15按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面16' then
		tap(TT弹窗界面16按钮X,TT弹窗界面16按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面17' then
		tap(TT弹窗界面17按钮X,TT弹窗界面17按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面18' then
		tap(TT弹窗界面18按钮X,TT弹窗界面18按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面19' then
		tap(TT弹窗界面19按钮X,TT弹窗界面19按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面20' then
		tap(TT弹窗界面20按钮X,TT弹窗界面20按钮Y)
		mSleep(1000)
	elseif 当前界面=='TT弹窗界面21' then
		tap(TT弹窗界面21按钮X,TT弹窗界面21按钮Y)
		mSleep(1000)	
	elseif 当前界面=='未知界面' then 
		mSleep(1000)

	else
		mSleep(1000)
	end
end
end

function 账号登录()
while (true) do
	local 当前界面=检索界面(TT注册界面列表)
	if 当前界面=='注册1665主页授权界面' then
		tap(248+math.random(0,5),788+math.random(0,5))  --点击 不允许
		mSleep(1000)
	elseif 当前界面 == 'TT注册界面2' then 
		tap(543+math.random(0,5),1264+math.random(0,5))
		mSleep(1000)
	elseif 当前界面=='TT注册225界面login点击1' or  当前界面=='TT注册225界面login点击2' then  --遮罩点击
		mSleep(500)
		tap(TT注册225界面login点击1X+math.random(0,5),TT注册225界面login点击1X+math.random(0,5))
		mSleep(1000)
	elseif 当前界面=='TT注册225界面login4' then
		tap(点击225login按钮X+math.random(0,5),点击225login按钮Y+math.random(0,5))
		mSleep(1000)
	elseif 当前界面 == 'TT注册电话界面' then
		toast("当前界面是电话登录")
		tap(登录225邮箱按钮X+math.random(0,5),登录225邮箱按钮Y+math.random(0,5))
	elseif 当前界面 == 'TT登录225界面邮箱' then 
		tap(456,348)  --先点击空位置 才会出现X
		mSleep(math.random(500,1000))
		tap(666, 347) --点击 X 清空内容
		mSleep(math.random(500,1000))
		----如果是上传登录方式 那么就调用线上获取的方式
		----反之，调用本地获取的函数——先获取首行数据，登录成功删除首行
		if values.账号密码接口 ~= '' and values.登录文件名称 == '' then
			获取账号密码()
		elseif values.账号密码接口 == '' and values.登录文件名称 ~= '' then
			读取首行()
		end
		输入文本2(129,338,登录账号)
		mSleep(1000)
		输入文本(145,472,登录密码)
		mSleep(1000)
		if 当前界面 == 'TT登录225界面邮箱' then 
			for var= 1,math.random(2,5) do
				tap(296+math.random(0,5),683+math.random(0,5))
				mSleep(8000)
			end	
		end
		判断是否离开该界面(TT注册界面列表,'TT注册邮箱界面')
	elseif 当前界面=='TT注册打码界面' then
		mSleep(3000)
		打码准备()
		toast('验证码已刷新',1)
		mSleep(500)
		打码()
		mSleep(12000)
		判断是否离开该界面(TT注册界面列表,'TT注册邮箱界面')
	elseif 	当前界面=='注册1665验证码未刷新界面' then
		toast('刷新验证码中...',1)
		mSleep(500)
		tap(154+math.random(0,10),832+math.random(0,10))
		mSleep(1000)
	elseif 	当前界面=='TT登录225界面toomany' or	当前界面=='TT登录225界面验证码' then
		toast('账号节点或者新机环境异常,登录结束',1)
		mSleep(500)
		--释放账号密码()
		return true
	elseif 当前界面 == 'TT登录授权弹框' then 
		tap(TT登录授权弹框X,TT登录授权弹框Y)
		mSleep(1000)
	elseif 当前界面 == 'TT登录主页滑动' or 当前界面 == '注册1665主页界面' then 
		for var= 1,math.random(2,3) do
			moveTo(370+math.random(1,10),988+math.random(1,10),374+math.random(1,10),461+math.random(1,10)) --这里用的选择头像的时候的坐标
			mSleep(1000)
		end
		tap(524+math.random(1,10),1272+math.random(1,10))    --点击主页
	elseif 当前界面 == 'TT登录消息界面' then 
		记录登录账号信息()
		删除首行()
		全局登录变量1=1
		return true
	else		
	end
end
end






