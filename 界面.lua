--ui设置
local cjson = ts.json
w,h = getScreenSize();
MyTable = {
    ["style"]  = "default",
    ["width"] = w,          
    ["height"] = h,            
    ["cancelname"] = "取消",  
    ["okname"] = "同意条款并运行", 
    ["title"] = "TK四合一脚本", --标题栏文字
    ["titlealign"] = "left", --title 对齐方式，默认左对齐
    ["align"] = "center", --
    ["titlesize"] = 15,  
    ["titles"] = "参数设置,其他设置,免责声明", 
    ["pagetype"]= "multi",   --多页模式
    ["selpage"] = 1,    --多页模式下指定默认停留的页面
    ["orient"] = 0,  --指定 UI 界面显示方向
    ["btnbkcolor"] = "255,255,255",         
    ["bgcolor"] = "255,255,255",
    ["pagenumtype"] = "tab", --页码样式，dot - 小圆点， number - 数字， default - 不显示，tab - 底部不显示页码样式，
    ["config"] = "peizhi.txt",  
    --["timer"] = 120,   --倒计时时间
    ["rettype"] = "table",
    ["bg"] = "tkbg.png",
    pages       =
    {
        {
            {
                ["type"] = "Label",
                ["align"] = "center",
                ["text"] = "系统版本:",
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,
            },
            {
                ["type"] = "RadioGroup",            
                -- 必填，控件类型，单选组合
                ["id"] = "系统版本",                      
                -- 选填，无，控件 ID，以 table 格式返回返回值时必填,否则无法获取返回值
                ["list"] = "IOS-12,其他版本",      -- 必填，无，多选组合内容
                ["select"] = "1",                   -- 选填，0，默认选中项 id
                --["images"] = "test1.png,test1.png,test1.png,test1.png", 
                -- 选填，无， 单选组合选项显示图片
                ["scale"] = 0.4,                    -- 选填，1，图片缩放比例
                ["countperline"] = 0,
            },
			{
                ["type"] = "Label",
                ["align"] = "center",
                ["text"] = "脚本功能:",
                ["size"] = 15, 
                ["align"] = "left",
                ["valign"] = "center",
                ["color"] = "0,0,0",
                ["width"] = -1,
                ["nowrap"] = 1,
            },
            {
                ["type"] = "RadioGroup",            
                -- 必填，控件类型，单选组合
                ["id"] = "脚本功能",                      
                -- 选填，无，控件 ID，以 table 格式返回返回值时必填,否则无法获取返回值
                ["list"] = "登录,注册,OP还原并上传",      -- 必填，无，多选组合内容
                ["select"] = "1",                   -- 选填，0，默认选中项 id
                --["images"] = "test1.png,test1.png,test1.png,test1.png", 
                -- 选填，无， 单选组合选项显示图片
                ["scale"] = 0.4,                    -- 选填，1，图片缩放比例
                ["countperline"] = 0,
            },
			{
                ["type"] = "Label",
                ["align"] = "center",
                ["text"] = "软件版本:",
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,
            },
            {
                ["type"] = "RadioGroup",            
                ["id"] = "软件版本",                      
                ["list"] = "TK-16.6.5,TK-其他版本",      -- 必填，无，多选组合内容
                ["select"] = "0",                   -- 选填，0，默认选中项 id
                ["scale"] = 0.4,                    -- 选填，1，图片缩放比例
                ["countperline"] = 0,
            },
			{
                ["type"] = "Label",
                ["align"] = "center",
                ["text"] = "打码类型:",
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,
            },
            {
                ["type"] = "RadioGroup",            
                ["id"] = "打码类型",                      
                ["list"] = "滑动滑块打码,点击相同形状打码",      -- 必填，无，多选组合内容
                ["select"] = "0",                   -- 选填，0，默认选中项 id
                ["scale"] = 0.4,                    -- 选填，1，图片缩放比例
                ["countperline"] = 0,
            },        
			{
                ["type"] = "Label",
                ["align"] = "center",
                ["text"] = "使用软件:",
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "top", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,
            },
			{
                ["type"] = "ComboBox",               
                ["id"] = "使用软件",                  
                --["prompt"] = "300毫秒", 
				["list"] = "AWZ,AXJ,黑豹,PyApp,OnePress,SuperMan,内部清理软件",
				["select"] = 4,
				--["list"] = "地址1:http://45.207.44.6:12345/v2/api/get/phone?name=,地址2:sms-activate.ru/cn",
                ["color"] = "0,0,0",
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 500,
                ["nowrap"] = 0,
            }, 
						{
                ["type"] = "Label",
                ["align"] = "center",
                ["text"] = "号码地区:",
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "top", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,
            },
			{
                ["type"] = "ComboBox",               
                ["id"] = "号码地区",                  
				["list"] = "美国+1,俄罗斯+7,印尼+62,印度+91,越南+84,爱沙尼亚+372,吉尔吉斯斯坦+996,巴西+55,马来西亚+60,英格兰+44",
				["select"] = 1,
                ["color"] = "0,0,0",
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 500,
                ["nowrap"] = 0,
            }, 
			{
                ["type"] = "Label",
                ["align"] = "center",
                ["text"] = "是否备份:",
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,
            },
			{
                ["type"] = "Switch",
                ["id"] = "是否备份",
                ["size"] = "m",
                ["align"] = "left",
                ["valign"] = "top",
                ["state"] = "off",
                ["width"] = -1,
                ["nowrap"] = 1,
            },
			{
                ["type"] = "Label",
                ["align"] = "center",
                ["text"] = "是否卸载重装:",
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,
            },
			{
                ["type"] = "Switch",
                ["id"] = "卸载安装",
                ["size"] = "m",
                ["align"] = "left",
                ["valign"] = "top",
                ["state"] = "off",
                ["width"] = -1,
                ["nowrap"] = 0,
            },
			{
                ["type"] = "Label",
                ["align"] = "center",
                ["text"] = "上传头像:",
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,
            },
			{
                ["type"] = "Switch",
                ["id"] = "上传头像",
                ["size"] = "m",
                ["align"] = "left",
                ["valign"] = "top",
                ["state"] = "off",
                ["width"] = -1,
                ["nowrap"] = 1,
            },
-- 			{
--                 ["type"] = "Label",
--                 ["align"] = "center",
--                 ["text"] = "手动获取代理:",
--                 ["size"] = 15, 
--                 ["align"] = "left",          
--                 ["valign"] = "center", 
--                 ["color"] = "0,0,0",           
--                 ["width"] = -1,
--                 ["nowrap"] = 1,
--             },
-- 			{
--                 ["type"] = "Switch",
--                 ["id"] = "手动获取代理",
--                 ["size"] = "m",
--                 ["align"] = "left",
--                 ["valign"] = "top",
--                 ["state"] = "off",
--                 ["width"] = -1,
--                 ["nowrap"] = 0,
--             },
            {
                ["type"] = "Label",
                ["align"] = "center",
                ["text"] = "在线代理：",
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,
            },
            {
                ["type"] = "ComboBox",               
                ["id"] = "手动获取代理",                  
                ["list"] = "账密格式,北鲲云,无账密格式",
                ["color"] = "0,0,0",
                ["align"] = "",
                ["valign"] = "top",   
                ["width"] = 180,
                ["nowrap"] = 0,
            }, 
			{
                ["type"] = "Label", 
--                ["text"] = "联众密码:",        
                ["text"] = "代理链接:",        
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,--下个控件不换行
            },
			 {
                ["type"] = "Edit",               
                ["id"] = "代理链接",                  
                ["prompt"] = "你的代理链接", 
				--["text"] = "http://20.122.103.3:51515/api/v1/getIP?type=text&username=test_99641&protocol=0&region=RU&count=1",
                ["kbtype"] = "default",  
                ["color"] = "0,0,0",   
                ["size"] = 15,           
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 500,
                ["nowrap"] = 0,
            },        
			{
                ["type"] = "Label", 
                ["text"] = "接口登录:",        
--                ["text"] = "接口地址1:",        
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,
            },
			 {
                ["type"] = "Edit",               
                ["id"] = "账号密码接口",
				["prompt"] = "", 
				--["text"]="denglu",
                ["kbtype"] = "default", 
                ["color"] = "0,0,0",   
                ["size"] = 15,           
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 500,
                ["nowrap"] = 0,
            },
			{
				["type"] = "Label", 
				["text"] = "本地登录:",        
				["size"] = 15, 
				["align"] = "left",          
				["valign"] = "center", 
				["color"] = "0,0,0",           
				["width"] = -1,
				["nowrap"] = 1,--下个控件不换行
			},			
			{
				["type"] = "Edit",               
				["id"] = "登录文件名称",  
				["text"] = "/private/var/mobile/Media/账号密码.txt",
				["prompt"] = "/private/var/mobile/Media/账号密码.txt", 
				["kbtype"] = "default",  
				["color"] = "0,0,0",   
				["size"] = 15,           
				["align"] = "",           
				["valign"] = "top",   
				["width"] = 500,
				["nowrap"] = 0,
			},
            {
                ["type"] = "Label", 
--                ["text"] = "联众账号:", 
				["text"] = "图鉴账号:", 
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,--下个控件不换行
            },
			 {
                ["type"] = "Edit",               
                ["id"] = "图鉴账号",                  
                ["prompt"] = "你的图鉴账号", 
				--["text"] = "erkang",
                ["kbtype"] = "default",  
                ["color"] = "0,0,0",   
                ["size"] = 15,           
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 500,
                ["nowrap"] = 0,
            }, 
			{
                ["type"] = "Label", 
--                ["text"] = "联众密码:",        
                ["text"] = "图鉴密码:",        
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,--下个控件不换行
            },
			 {
                ["type"] = "Edit",               
                ["id"] = "图鉴密码",                  
                ["prompt"] = "你的图鉴密码", 
				--["text"] = "naZRrWx5OksGGZWw",
                ["kbtype"] = "default",  
                ["color"] = "0,0,0",   
                ["size"] = 15,           
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 500,
                ["nowrap"] = 0,
            },

			{
                ["type"] = "Label", 
                ["text"] = "注册数量:",        
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,--下个控件不换行
            },
			 {
                ["type"] = "Edit",               
                ["id"] = "注册数量",                 
                --["prompt"] = "2000", 
				["text"] = "2000",
                ["kbtype"] = "number",  
                ["color"] = "0,0,0",   
                ["size"] = 15, 
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 150,
                ["nowrap"] = 1,
            },
			{
                ["type"] = "Label", 
                ["text"] = "注册间隔:",        
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,--下个控件不换行
            },
			 {
                ["type"] = "Edit",               
                ["id"] = "注册间隔",                 
                --["prompt"] = "120", 
				["text"] = "120",
                ["kbtype"] = "number",  
                ["color"] = "0,0,0",   
                ["size"] = 15, 
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 170,
                ["nowrap"] = 0,
            },
			{
                ["type"] = "Label", 
                ["text"] = "防卡秒数:",        
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,--下个控件不换行
            },
			{
                ["type"] = "Edit",               
                ["id"] = "防卡时间",                  
                --["prompt"] = "300毫秒", 
				["text"] = "900",
                ["kbtype"] = "number",
                ["color"] = "0,0,0",   
                ["size"] = 15,           
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 150,
                ["nowrap"] = 1,
            },
			{
                ["type"] = "Label", 
                ["text"] = "注册接口:",        
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,--下个控件不换行
            },
			 {
                ["type"] = "ComboBox",               
                ["id"] = "接口序",                  
                --["prompt"] = "300毫秒", 
				["list"] = "地址1,地址2,地址3,地址4,地址5,地址6",
				--["list"] = "地址1:http://45.207.44.6:12345/v2/api/get/phone?name=,地址2:sms-activate.ru/cn",
                ["color"] = "0,0,0",
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 170,
                ["nowrap"] = 0,
            }, 
			{
                ["type"] = "Label", 
                ["text"] = "指定密码:",        
                ["size"] = 15, 
                ["align"] = "left", 
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,
            },
			 {
                ["type"] = "Edit",               
                ["id"] = "指定密码",
				["prompt"] = "设置指定密码", 
				--["text"] = "qqq111...",
                ["kbtype"] = "default", 
                ["color"] = "0,0,0",   
                ["size"] = 15,           
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 500,
                ["nowrap"] = 0,
            },
			{
                ["type"] = "Label", 
                ["text"] = "地  址  1  :",        
--                ["text"] = "接口地址1:",        
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,
            },
			 {
                ["type"] = "Edit",               
                ["id"] = "电话号接口",
				["prompt"] = "http://45.207.44.6:12345/v2/api/get/phone?name=", 
				--["text"]="http://45.207.44.6:12345/v2/api/get/phone?name=",
                ["kbtype"] = "default", 
                ["color"] = "0,0,0",   
                ["size"] = 15,           
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 500,
                ["nowrap"] = 0,
            },
			{
                ["type"] = "Label", 
                ["text"] = "地  址  2  :",        
 --               ["text"] = "接口地址2:",        
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,
            },
			 {
                ["type"] = "Edit",               
                ["id"] = "电话号接口2",
				["prompt"] = "https://api.sms-activate.org/stubs/handler_api.php?api_key=", 
				--["text"]="https://api.sms-activate.org/stubs/handler_api.php?api_key=",
                ["kbtype"] = "default", 
                ["color"] = "0,0,0",   
                ["size"] = 15,           
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 500,
                ["nowrap"] = 0,
            },
			{
                ["type"] = "Label", 
                ["text"] = "地  址  3  :",        
 --               ["text"] = "接口地址2:",        
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,
            },
			 {
                ["type"] = "Edit",               
                ["id"] = "电话号接口3",
				["prompt"] = "http://20.122.103.3:11223/api/v1/sms/getPhone?token=$token&itemId=$id", 
				--["text"]="http://20.122.103.3:11223/api/v1/sms/getPhone?token=b0633c54509bb534feef5968625acbea&itemId=1",
                ["kbtype"] = "default", 
                ["color"] = "0,0,0",   
                ["size"] = 15,           
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 500,
                ["nowrap"] = 0,
            },
			{
                ["type"] = "Label", 
                ["text"] = "地  址  4  :",        
 --               ["text"] = "接口地址2:",        
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,
            },
			 {
                ["type"] = "Edit",               
                ["id"] = "电话号接口4",
				["prompt"] = "http://api1.5sim.net/stubs/handler_api.php?api_key=&api_key&action=getNumber&service=lf&country=0", 
                ["kbtype"] = "default", 
                ["color"] = "0,0,0",   
                ["size"] = 15,
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 500,
                ["nowrap"] = 0,
            },
            {
                ["type"] = "Label", 
                ["text"] = "地  址  5  :",        
 --               ["text"] = "接口地址2:",        
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,
            },
			 {
                ["type"] = "Edit",               
                ["id"] = "电话号接口5",
				["prompt"] = "http://richpva.com/api.ashx?action=getnumber&token=&API&application_id=51&country_id=1", 
                ["kbtype"] = "default", 
                ["color"] = "0,0,0",   
                ["size"] = 15,
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 500,
                ["nowrap"] = 0,
            },
            {
                ["type"] = "Label", 
                ["text"] = "地  址  6  :",        
 --               ["text"] = "接口地址2:",        
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,
            },
			 {
                ["type"] = "Edit",               
                ["id"] = "电话号接口6",
				["prompt"] = "https://smspool.net/api/purchase/sms?key=&API&country=4&service=924", 
                ["kbtype"] = "default", 
                ["color"] = "0,0,0",   
                ["size"] = 15,
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 500,
                ["nowrap"] = 0,
            },
        
			{
                ["type"] = "Label", 
                ["text"] = "说明：\n 1、适配6/6s/7/8，IOS12.5.5系统以上，默认使用【随机邮箱】和【随机密码】，接口地址仅允许同时填写一项\n 2、软件适配版本 16.6.5，21.1.0，22.0.0，22.5.0，22.8.0\n 3、登陆仅支持22.5.0\n 4、卸载重新安装需要在文件夹内修改文件名称为 TikTok.ipa \n 5、备份只针对awz，axj，one_press1.5.3-1",        
                ["size"] = 12, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "255,140,0",           
                --["width"] = -1,
                ["nowrap"] = 0,
            },
        },
		{
			{
                ["type"] = "Label", 
                ["text"] = "抓包代理设置",        
                ["size"] = 18, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 0,--下个控件换行
            },	
			{
                ["type"] = "Label",
                ["align"] = "center",
                ["text"] = "是否开启抓包代理:",
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,
            },
            {
                ["type"] = "RadioGroup",            
                -- 必填，控件类型，单选组合
                ["id"] = "是否开启抓包代理",                      
                -- 选填，无，控件 ID，以 table 格式返回返回值时必填,否则无法获取返回值
                ["list"] = "是,否",      -- 必填，无，多选组合内容
                ["select"] = "1",                   -- 选填，0，默认选中项 id
                --["images"] = "test1.png,test1.png,test1.png,test1.png", 
                -- 选填，无， 单选组合选项显示图片
                ["scale"] = 0.4,                    -- 选填，1，图片缩放比例
                ["countperline"] = 0,
            },
			{
				["type"] = "Label", 
                ["text"] = "IP设    置:",        
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,--下个控件换行
			},
			{
                ["type"] = "Edit",               
                ["id"] = "ip", 
				--["text"] = "5000", 
                ["prompt"] = "192.168.8.8", 
                ["kbtype"] = "default",  
                ["color"] = "0,0,0",   
                ["size"] = 15,           
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 500,
                ["nowrap"] = 0,
            },
			{
				["type"] = "Label", 
                ["text"] = "端口设置:",        
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,--下个控件换行
			},
			{
                ["type"] = "Edit",               
                ["id"] = "端口设置", 
				--["text"] = "5000", 
                ["prompt"] = "5000", 
                ["kbtype"] = "number",  
                ["color"] = "0,0,0",   
                ["size"] = 15,           
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 500,
                ["nowrap"] = 0,
            },
			{
				["type"] = "Label", 
                ["text"] = "此功能是 16.6.5 和 21.1.0 版本抓包使用，\n 不做其他处理 ",        
                ["size"] = 15, 
                ["align"] = "center",          
                ["valign"] = "center", 
                ["color"] = "220,20,60",           
                --["width"] = -1,
                ["nowrap"] = 0 ,
			},
			{
                ["type"] = "Line",                    
                ["color"] = "0,0,0",                    
                ["align"] = "center",  
                ["valign"] = "top",              
                ["height"] = 5, 
                --["width"] = 500,   
            },
			{
                ["type"] = "Label", 
                ["text"] = "用户名自定义",        
                ["size"] = 18, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 0,--下个控件换行
            },				
			{
                ["type"] = "Label", 
                ["text"] = "文件路径：",        
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,--下个控件不换行
            },			
			{
                ["type"] = "Edit",               
                ["id"] = "文件路径", 
				["text"] = "/var/mobile/Media/", 
                ["prompt"] = "/var/mobile/Media/", 
                ["kbtype"] = "default",  
                ["color"] = "0,0,0",   
                ["size"] = 15,           
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 500,
                ["nowrap"] = 0,
            },
			{
                ["type"] = "Label", 
                ["text"] = "默认路径/var/mobile/Media/",        
                ["size"] = 12, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "220,20,60",           
                ["width"] = -1,
                ["nowrap"] = 0,
            },
			{
                ["type"] = "Label", 
                ["text"] = "文件名称：",        
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                ["width"] = -1,
                ["nowrap"] = 1,--下个控件不换行
            },			
			{
                ["type"] = "Edit",               
                ["id"] = "文件名称",                  
                ["prompt"] = "用户名.txt", 
                ["kbtype"] = "default",  
                ["color"] = "0,0,0",   
                ["size"] = 15,           
                ["align"] = "",           
                ["valign"] = "top",   
                ["width"] = 500,
                ["nowrap"] = 0,
            },
			{
                ["type"] = "Label", 
                ["text"] = "文件名称需要填写【完整文件名】以及【扩展类型】，例如：test.txt",        
                ["size"] = 12, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "220,20,60",           
                ["width"] = -1,
                ["nowrap"] = 0,
            },	
			{
                ["type"] = "Label", 
                ["text"] = "\n 不填文件名称 【默认随机】\n\n\n\n\n",        
                ["size"] = 15, 
                ["align"] = "left",          
                ["valign"] = "center", 
                ["color"] = "255,140,0",           
                ["width"] = -1,
                ["nowrap"] = 1,--下个控件不换行
            },	
			
		},

		{			
--			{
--                ["type"] = "Image", 
--                ["src"] = "https://pic.imgdb.cn/item/61bad28e2ab3f51d91c62ddc.png",  -----外站图标
--				  ["scale"] = 1, 
--                ["align"] = "center",
--                ["valign"] = "center",
--				  ["nowrap"] = 0,
--            },
			{
                ["type"] = "Label", 
                ["text"] = "⚠️",        
                ["size"] = 70, 
                ["align"] = "center",          
                ["valign"] = "center", 
                ["color"] = "220,20,60",           
                --["width"] = -1,
                ["nowrap"] = 0,
            },
			{
                ["type"] = "Label", 
                ["text"] = "禁止使用脚本做违反国家法律法规的行为",        
                ["size"] = 18, 
                ["align"] = "center",          
                ["valign"] = "center", 
                ["color"] = "220,20,60",           
                --["width"] = -1,
                ["nowrap"] = 0,
            },
			{
                ["type"] = "Label", 
                ["text"] = "若使用者使用脚本实施违反当地法律法规或道德风俗的行为",        
                ["size"] = 15, 
                ["align"] = "center",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                --["width"] = -1,
                ["nowrap"] = 0,
            },
			{
                ["type"] = "Label", 
                ["text"] = "【使用者应当为此独立承担责任】",        
                ["size"] = 15, 
                ["align"] = "center",          
                ["valign"] = "center", 
                ["color"] = "220,20,60",           
                --["width"] = -1,
                ["nowrap"] = 0 ,
            },
			{
                ["type"] = "Label", 
                ["text"] = "脚本不承担任何责任。\n\n\n",        
                ["size"] = 15, 
                ["align"] = "center",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                --["width"] = -1,
                ["nowrap"] = 0,
            },
			{
                ["type"] = "Label", 
                ["text"] = "软件仅供学习与交流，请于24小时内删除本软件！！！",        
                ["size"] = 12, 
                ["align"] = "center",          
                ["valign"] = "center", 
                ["color"] = "0,0,0",           
                --["width"] = -1,
                ["nowrap"] = 0,
				
            },
-- 			{
--                 ["type"] = "Label", 
--                 ["text"] = "本软件【不会进行收费】，请悉知，避免上当受骗！！！",        
--                 ["size"] = 12, 
--                 ["align"] = "center",          
--                 ["valign"] = "center", 
--                 ["color"] = "0,0,0",           
--                 --["width"] = -1,
--                 ["nowrap"] = 0,
--             }
            
		},
    }   
}
local MyJsonString = cjson.encode(MyTable);
UIret,values = showUI(MyJsonString)