local MarketplaceService = game:GetService("MarketplaceService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local CoreGui = (gethui and gethui()) or game:GetService("CoreGui")

local redzlib = {
	Themes = {
		Darker = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(15, 15, 19)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(22, 22, 28)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(15, 15, 19))
			}),
			["Color Hub 2"] = Color3.fromRGB(24, 24, 30),
			["Color Element"] = Color3.fromRGB(30, 30, 38),
			["Color Stroke"] = Color3.fromRGB(48, 48, 60),
			["Color Theme"] = Color3.fromRGB(88, 101, 242),
			["Color Text"] = Color3.fromRGB(245, 245, 250),
			["Color Dark Text"] = Color3.fromRGB(160, 160, 175)
		},
		Midnight = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(10, 14, 24)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(16, 22, 38)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(10, 14, 24))
			}),
			["Color Hub 2"] = Color3.fromRGB(18, 24, 40),
			["Color Element"] = Color3.fromRGB(24, 32, 52),
			["Color Stroke"] = Color3.fromRGB(40, 56, 88),
			["Color Theme"] = Color3.fromRGB(56, 189, 248),
			["Color Text"] = Color3.fromRGB(240, 248, 255),
			["Color Dark Text"] = Color3.fromRGB(145, 170, 200)
		},
		Purple = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 14, 26)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(28, 20, 38)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(20, 14, 26))
			}),
			["Color Hub 2"] = Color3.fromRGB(28, 20, 38),
			["Color Element"] = Color3.fromRGB(36, 26, 48),
			["Color Stroke"] = Color3.fromRGB(60, 44, 80),
			["Color Theme"] = Color3.fromRGB(168, 85, 247),
			["Color Text"] = Color3.fromRGB(245, 240, 255),
			["Color Dark Text"] = Color3.fromRGB(175, 160, 195)
		},
		Crimson = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 13, 16)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(30, 18, 22)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(22, 13, 16))
			}),
			["Color Hub 2"] = Color3.fromRGB(30, 18, 22),
			["Color Element"] = Color3.fromRGB(40, 24, 30),
			["Color Stroke"] = Color3.fromRGB(68, 40, 50),
			["Color Theme"] = Color3.fromRGB(244, 63, 94),
			["Color Text"] = Color3.fromRGB(255, 240, 245),
			["Color Dark Text"] = Color3.fromRGB(190, 155, 165)
		},
		Emerald = {
			["Color Hub 1"] = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(12, 22, 18)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(18, 32, 26)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(12, 22, 18))
			}),
			["Color Hub 2"] = Color3.fromRGB(18, 32, 26),
			["Color Element"] = Color3.fromRGB(24, 42, 34),
			["Color Stroke"] = Color3.fromRGB(42, 70, 58),
			["Color Theme"] = Color3.fromRGB(16, 185, 129),
			["Color Text"] = Color3.fromRGB(240, 255, 248),
			["Color Dark Text"] = Color3.fromRGB(150, 190, 172)
		}
	},
	Info = { Version = "3.0.0 Pro" },
	Save = {
		UISize = {600, 420},
		TabSize = 170,
		Theme = "Darker",
		ToggleKey = Enum.KeyCode.RightControl
	},
	Settings = {},
	Connection = {},
	Instances = {},
	Elements = {},
	Options = {},
	Flags = {},
	Tabs = {},
	Icons = {
		["home"] = "rbxassetid://10723407389",
		["settings"] = "rbxassetid://10734950309",
		["user"] = "rbxassetid://10747373176",
		["users"] = "rbxassetid://10747373426",
		["shield"] = "rbxassetid://10734951847",
		["sword"] = "rbxassetid://10734975486",
		["swords"] = "rbxassetid://10734975692",
		["target"] = "rbxassetid://10734977012",
		["eye"] = "rbxassetid://10723346959",
		["search"] = "rbxassetid://10734943674",
		["bell"] = "rbxassetid://10709775704",
		["star"] = "rbxassetid://10734966248",
		["zap"] = "rbxassetid://10723345749",
		["flame"] = "rbxassetid://10723376114",
		["gamepad"] = "rbxassetid://10723395457",
		["sliders"] = "rbxassetid://10734963400",
		["terminal"] = "rbxassetid://10734982144",
		["code"] = "rbxassetid://10709810463",
		["folder"] = "rbxassetid://10723387563",
		["info"] = "rbxassetid://10723415903",
		["check"] = "rbxassetid://10709790644",
		["x"] = "rbxassetid://10747384394",
		["palette"] = "rbxassetid://10734910430",
		["keyboard"] = "rbxassetid://10723416765",
		["compass"] = "rbxassetid://10709811445",
		["crosshair"] = "rbxassetid://10709818534",
		["crown"] = "rbxassetid://10709818626",
		["gem"] = "rbxassetid://10723396000",
		["heart"] = "rbxassetid://10723406885",
		["lock"] = "rbxassetid://10723434711",
		["map"] = "rbxassetid://10734886202",
		["rocket"] = "rbxassetid://10734934585",
		["sparkles"] = "rbxassetid://10747376565",
		["trophy"] = "rbxassetid://10747363809",
		["wrench"] = "rbxassetid://10747383470",
		["layers"] = "rbxassetid://10723424505"
	}
}

local ViewportSize = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1280, 720)
local UIScale = math.clamp(ViewportSize.Y / 480, 0.75, 1.35)

local Settings = redzlib.Settings
local Flags = redzlib.Flags

local function VerifyTheme(ThemeName)
	return redzlib.Themes[ThemeName] ~= nil
end

local function SaveJson(FileName, save)
	if writefile then
		pcall(function()
			local copy = table.clone(save)
			if typeof(copy.ToggleKey) == "EnumItem" then copy.ToggleKey = copy.ToggleKey.Name end
			writefile(FileName, HttpService:JSONEncode(copy))
		end)
	end
end

local SetProps, SetChildren, InsertTheme, Create do
	InsertTheme = function(Instance, Type)
		table.insert(redzlib.Instances, { Instance = Instance, Type = Type })
		return Instance
	end
	SetChildren = function(Instance, Children)
		if Children then for _, Child in pairs(Children) do Child.Parent = Instance end end
		return Instance
	end
	SetProps = function(Instance, Props)
		if Props then for prop, value in pairs(Props) do Instance[prop] = value end end
		return Instance
	end
	Create = function(...)
		local args = {...}
		local new = Instance.new(args[1])
		if type(args[2]) == "table" then
			SetProps(new, args[2]); SetChildren(new, args[3])
		elseif typeof(args[2]) == "Instance" then
			new.Parent = args[2]; SetProps(new, args[3]); SetChildren(new, args[4])
		end
		return new
	end
	local function LoadConfig(file)
		if readfile and isfile and isfile(file) then
			local decode = HttpService:JSONDecode(readfile(file))
			if type(decode) == "table" then
				if rawget(decode, "UISize") then redzlib.Save["UISize"] = decode["UISize"] end
				if rawget(decode, "TabSize") then redzlib.Save["TabSize"] = decode["TabSize"] end
				if rawget(decode, "Theme") and VerifyTheme(decode["Theme"]) then redzlib.Save["Theme"] = decode["Theme"] end
				if rawget(decode, "ToggleKey") and Enum.KeyCode[decode["ToggleKey"]] then
					redzlib.Save["ToggleKey"] = Enum.KeyCode[decode["ToggleKey"]]
				end
			end
		end
	end
	pcall(LoadConfig, "redz_library_ultra_pro.json")
end

local Funcs = {} do
	function Funcs:InsertCallback(tab, func) if type(func) == "function" then table.insert(tab, func) end return func end
	function Funcs:FireCallback(tab, ...) for _, v in ipairs(tab) do if type(v) == "function" then task.spawn(v, ...) end end end
	function Funcs:ToggleVisible(Obj, Bool) Obj.Visible = Bool ~= nil and Bool or not Obj.Visible end
	function Funcs:GetCallback(Configs, index)
		local func = Configs[index] or Configs.Callback or function() end
		if type(func) == "table" then return {function(Val) func[1][func[2]] = Val end} end
		return {func}
	end
end

local Connections, Connection = {}, redzlib.Connection do
	local function NewConnectionList(List)
		for _, CoName in ipairs(List) do
			local ConnectedFuncs, Connect = {}, {}
			Connection[CoName] = Connect; Connections[CoName] = ConnectedFuncs; Connect.Name = CoName
			function Connect:Connect(func)
				if type(func) == "function" then
					table.insert(ConnectedFuncs, func)
					return {
						Disconnect = function(self)
							local idx = table.find(ConnectedFuncs, func)
							if idx then table.remove(ConnectedFuncs, idx) end
						end
					}
				end
			end
		end
	end
	NewConnectionList({"FlagsChanged", "ThemeChanged", "FileSaved"})
	function Connection:FireConnection(CoName, ...)
		local Conn = Connections[CoName]
		if Conn then for _, Func in pairs(Conn) do task.spawn(Func, ...) end end
	end
end

local GetFlag, SetFlag, CheckFlag do
	CheckFlag = function(Name) return type(Name) == "string" and Flags[Name] ~= nil end
	GetFlag = function(Name) return type(Name) == "string" and Flags[Name] end
	SetFlag = function(Flag, Value)
		if Flag and (Value ~= Flags[Flag] or type(Value) == "table") then
			Flags[Flag] = Value
			Connection:FireConnection("FlagsChanged", Flag, Value)
		end
	end
	local db
	Connection.FlagsChanged:Connect(function()
		local ScriptFile = Settings.ScriptFile
		if not db and ScriptFile and writefile then
			db = true; task.wait(0.15); db = false
			local Success, Encoded = pcall(function() return HttpService:JSONEncode(Flags) end)
			if Success then
				local ok = pcall(writefile, ScriptFile, Encoded)
				if ok then Connection:FireConnection("FileSaved", "Script-Flags", ScriptFile, Encoded) end
			end
		end
	end)
end

local ScreenGui = Create("ScreenGui", CoreGui, {
	Name = "redz-library-ultra-pro",
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling
}, {
	Create("UIScale", { Scale = UIScale, Name = "Scale" })
})

local ScreenFind = CoreGui:FindFirstChild(ScreenGui.Name)
if ScreenFind and ScreenFind ~= ScreenGui then ScreenFind:Destroy() end

local function GetStr(val) if type(val) == "function" then return val() end return val end

local function CreateTween(Configs)
	local Inst = Configs[1] or Configs.Instance
	local Prop = Configs[2] or Configs.Prop
	local NewVal = Configs[3] or Configs.NewVal
	local Time = Configs[4] or Configs.Time or 0.3
	local TweenWait = Configs[5] or Configs.wait or false
	local Style = Configs[6] or Enum.EasingStyle.Quint
	local Tween = TweenService:Create(Inst, TweenInfo.new(Time, Style, Enum.EasingDirection.Out), {[Prop] = NewVal})
	Tween:Play()
	if TweenWait then Tween.Completed:Wait() end
	return Tween
end

local function PlayRipple(Button, X, Y)
	task.spawn(function()
		local Ripple = Create("Frame", Button, {
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.85,
			ZIndex = Button.ZIndex + 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromOffset(X - Button.AbsolutePosition.X, Y - Button.AbsolutePosition.Y),
			Size = UDim2.fromOffset(0, 0)
		})
		Create("UICorner", Ripple, { CornerRadius = UDim.new(1, 0) })
		local MaxSize = math.max(Button.AbsoluteSize.X, Button.AbsoluteSize.Y) * 2.2
		CreateTween({Ripple, "Size", UDim2.fromOffset(MaxSize, MaxSize), 0.45})
		CreateTween({Ripple, "BackgroundTransparency", 1, 0.45, true})
		Ripple:Destroy()
	end)
end

local function MakeDrag(Instance, DragTarget)
	DragTarget = DragTarget or Instance
	task.spawn(function()
		local Dragging, DragStart, StartPos
		Instance.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true; DragStart = Input.Position; StartPos = DragTarget.Position
				local conn
				conn = Input.Changed:Connect(function()
					if Input.UserInputState == Enum.UserInputState.End then Dragging = false; conn:Disconnect() end
				end)
			end
		end)
		UserInputService.InputChanged:Connect(function(Input)
			if Dragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
				local delta = Input.Position - DragStart
				CreateTween({DragTarget, "Position", UDim2.new(StartPos.X.Scale, StartPos.X.Offset + delta.X / UIScale, StartPos.Y.Scale, StartPos.Y.Offset + delta.Y / UIScale), 0.1})
			end
		end)
	end)
end

local Theme = redzlib.Themes[redzlib.Save.Theme]
local function AddEle(Name, Func) redzlib.Elements[Name] = Func end
local function Make(Ele, Instance, props, ...) return redzlib.Elements[Ele](Instance, props, ...) end

AddEle("Corner", function(parent, Radius) return Create("UICorner", parent, { CornerRadius = Radius or UDim.new(0, 8) }) end)
AddEle("Stroke", function(parent, props, ...)
	local args = {...}
	return InsertTheme(SetProps(Create("UIStroke", parent, {
		Color = args[1] or Theme["Color Stroke"],
		Thickness = args[2] or 1,
		Transparency = args[3] or 0.4,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	}), props), "Stroke")
end)
AddEle("Button", function(parent, props, ...)
	local args = {...}
	local New = InsertTheme(SetProps(Create("TextButton", parent, {
		Text = "", Size = UDim2.fromScale(1, 1), BackgroundColor3 = Theme["Color Element"], AutoButtonColor = false, ClipsDescendants = true
	}), props), "Element")
	local Stroke = Make("Stroke", New, nil, nil, 1, 0.6)
	New.MouseEnter:Connect(function()
		CreateTween({New, "BackgroundTransparency", 0.2, 0.2})
		CreateTween({Stroke, "Transparency", 0.2, 0.2})
	end)
	New.MouseLeave:Connect(function()
		CreateTween({New, "BackgroundTransparency", 0, 0.2})
		CreateTween({Stroke, "Transparency", 0.6, 0.2})
	end)
	New.InputBegan:Connect(function(Input) if Input.UserInputType == Enum.UserInputType.MouseButton1 then PlayRipple(New, Input.Position.X, Input.Position.Y) end end)
	if args[1] then New.Activated:Connect(args[1]) end
	return New
end)
AddEle("Gradient", function(parent) return InsertTheme(Create("UIGradient", parent, { Color = Theme["Color Hub 1"] }), "Gradient") end)

local function GetColorProp(Instance)
	if Instance:IsA("Frame") or Instance:IsA("TextButton") then return "BackgroundColor3"
	elseif Instance:IsA("ImageLabel") then return "ImageColor3"
	elseif Instance:IsA("TextLabel") or Instance:IsA("TextBox") then return "TextColor3"
	elseif Instance:IsA("ScrollingFrame") then return "ScrollBarImageColor3"
	elseif Instance:IsA("UIStroke") then return "Color" end
	return ""
end

function redzlib:GetIcon(index)
	if type(index) ~= "string" or index:find("rbxassetid://") or #index == 0 then return index end
	index = string.lower(index):gsub("lucide", ""):gsub("-", "")
	return self.Icons[index] or index
end

function redzlib:SetTheme(NewTheme)
	if not VerifyTheme(NewTheme) then return end
	redzlib.Save.Theme = NewTheme
	SaveJson("redz_library_ultra_pro.json", redzlib.Save)
	Theme = redzlib.Themes[NewTheme]
	Connection:FireConnection("ThemeChanged", NewTheme)
	for _, Val in pairs(redzlib.Instances) do
		if Val.Instance and Val.Instance.Parent then
			local t = Val.Type
			if t == "Gradient" then Val.Instance.Color = Theme["Color Hub 1"]
			elseif t == "Frame" then Val.Instance.BackgroundColor3 = Theme["Color Hub 2"]
			elseif t == "Element" then Val.Instance.BackgroundColor3 = Theme["Color Element"]
			elseif t == "Stroke" or t == "Theme" or t == "Text" or t == "DarkText" or t == "ScrollBar" then
				local prop = GetColorProp(Val.Instance)
				if prop ~= "" then
					if t == "Theme" then Val.Instance[prop] = Theme["Color Theme"]
					elseif t == "Text" then Val.Instance[prop] = Theme["Color Text"]
					elseif t == "DarkText" then Val.Instance[prop] = Theme["Color Dark Text"]
					elseif t == "Stroke" then Val.Instance[prop] = Theme["Color Stroke"]
					elseif t == "ScrollBar" then Val.Instance[prop] = Theme["Color Theme"] end
				end
			end
		end
	end
end

local function ButtonFrame(Instance, Title, Description, HolderSize)
	local TitleL = InsertTheme(Create("TextLabel", {
		Font = Enum.Font.GothamSemibold, TextColor3 = Theme["Color Text"], Size = UDim2.new(1, -10, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, Text = "", RichText = true
	}), "Text")
	local DescL = InsertTheme(Create("TextLabel", {
		Font = Enum.Font.Gotham, TextColor3 = Theme["Color Dark Text"], Size = UDim2.new(1, -10, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, TextWrapped = true, TextSize = 9, TextXAlignment = Enum.TextXAlignment.Left, Text = "", RichText = true
	}), "DarkText")

	local Frame = Make("Button", Instance, { Size = UDim2.new(1, 0, 0, 34), AutomaticSize = Enum.AutomaticSize.Y, Name = "Option" })
	Make("Corner", Frame, UDim.new(0, 7))

	Create("Frame", Frame, {
		AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, Size = HolderSize or UDim2.new(1, -20, 0, 0),
		Position = UDim2.new(0, 12, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5)
	}, {
		Create("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center, Padding = UDim.new(0, 2) }),
		Create("UIPadding", { PaddingBottom = UDim.new(0, 8), PaddingTop = UDim.new(0, 8) }),
		TitleL, DescL
	})

	local Label = {}
	function Label:SetTitle(T) if T then TitleL.Text = T; Frame:SetAttribute("SearchText", string.lower(T .. " " .. DescL.Text)) end end
	function Label:SetDesc(D)
		if D and D ~= "" then DescL.Visible = true; DescL.Text = D else DescL.Visible = false end
		Frame:SetAttribute("SearchText", string.lower(TitleL.Text .. " " .. DescL.Text))
	end
	Label:SetTitle(Title); Label:SetDesc(Description)
	return Frame, Label
end

function redzlib:MakeWindow(Configs)
	local WTitle = Configs[1] or Configs.Name or Configs.Title or "redz Library Pro"
	local WMiniText = Configs[2] or Configs.SubTitle or "v3.0"
	Settings.ScriptFile = Configs[3] or Configs.SaveFolder or false

	local function LoadFile()
		local File = Settings.ScriptFile
		if type(File) ~= "string" or not readfile or not isfile then return end
		local s, r = pcall(isfile, File)
		if s and r then
			local ok, _Flags = pcall(readfile, File)
			if ok and type(_Flags) == "string" then
				local parsed, res = pcall(function() return HttpService:JSONDecode(_Flags) end)
				Flags = parsed and res or {}
			end
		end
	end
	LoadFile()

	local UISizeX, UISizeY = unpack(redzlib.Save.UISize)
	local MainFrame = InsertTheme(Create("Frame", ScreenGui, {
		Size = UDim2.fromOffset(UISizeX, UISizeY), Position = UDim2.new(0.5, -UISizeX/2, 0.5, -UISizeY/2),
		BackgroundColor3 = Theme["Color Hub 2"], BackgroundTransparency = 0.02, Name = "Hub"
	}), "Frame")
	Make("Gradient", MainFrame); Make("Corner", MainFrame, UDim.new(0, 10)); Make("Stroke", MainFrame, nil, nil, 1.2, 0.2)

	local NotifyHolder = Create("Frame", ScreenGui, {
		Size = UDim2.new(0, 280, 1, -20), Position = UDim2.new(1, -15, 1, -15), AnchorPoint = Vector2.new(1, 1), BackgroundTransparency = 1
	}, { Create("UIListLayout", { VerticalAlignment = Enum.VerticalAlignment.Bottom, HorizontalAlignment = Enum.HorizontalAlignment.Right, Padding = UDim.new(0, 8) }) })

	local DropdownHolder = Create("Folder", ScreenGui, { Name = "Dropdown" })

	local TopBar = Create("Frame", MainFrame, { Size = UDim2.new(1, 0, 0, 36), BackgroundTransparency = 1, Name = "TopBar" })
	MakeDrag(TopBar, MainFrame)

	InsertTheme(Create("Frame", TopBar, { Size = UDim2.new(1, 0, 0, 1), Position = UDim2.new(0, 0, 1, 0), BackgroundColor3 = Theme["Color Stroke"], BackgroundTransparency = 0.5, BorderSizePixel = 0 }), "Stroke")
	local Dot = InsertTheme(Create("Frame", TopBar, { Size = UDim2.fromOffset(8, 8), Position = UDim2.new(0, 14, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = Theme["Color Theme"] }), "Theme")
	Make("Corner", Dot, UDim.new(1, 0))

	Create("TextLabel", TopBar, {
		Position = UDim2.new(0, 28, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), AutomaticSize = Enum.AutomaticSize.XY,
		Text = WTitle, TextSize = 13, TextColor3 = Theme["Color Text"], BackgroundTransparency = 1, Font = Enum.Font.GothamBold
	}, {
		Create("TextLabel", {
			Size = UDim2.fromScale(0, 1), AutomaticSize = Enum.AutomaticSize.X, Position = UDim2.new(1, 6, 0, 0),
			Text = WMiniText, TextColor3 = Theme["Color Dark Text"], BackgroundTransparency = 1, TextSize = 9, Font = Enum.Font.GothamMedium
		})
	})

	local SideBar = InsertTheme(Create("Frame", MainFrame, {
		Size = UDim2.new(0, redzlib.Save.TabSize, 1, -36), Position = UDim2.new(0, 0, 1, 0), AnchorPoint = Vector2.new(0, 1),
		BackgroundColor3 = Theme["Color Hub 2"], BackgroundTransparency = 0.4, BorderSizePixel = 0
	}), "Frame")

	InsertTheme(Create("Frame", SideBar, { Size = UDim2.new(0, 1, 1, 0), Position = UDim2.new(1, 0, 0, 0), BackgroundColor3 = Theme["Color Stroke"], BackgroundTransparency = 0.5 }), "Stroke")

	local MainScroll = InsertTheme(Create("ScrollingFrame", SideBar, {
		Size = UDim2.fromScale(1, 1), ScrollBarThickness = 2, BackgroundTransparency = 1, ScrollBarImageColor3 = Theme["Color Theme"],
		AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollingDirection = Enum.ScrollingDirection.Y, CanvasSize = UDim2.new()
	}, { Create("UIPadding", { PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10), PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 10) }), Create("UIListLayout", { Padding = UDim.new(0, 5) }) }), "ScrollBar")

	local Containers = Create("Frame", MainFrame, {
		Size = UDim2.new(1, -SideBar.Size.X.Offset, 1, -36), AnchorPoint = Vector2.new(1, 1), Position = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, ClipsDescendants = true
	})

	local SearchHolder = InsertTheme(Create("Frame", Containers, {
		Size = UDim2.new(1, -24, 0, 28), Position = UDim2.new(0, 12, 0, 10), BackgroundColor3 = Theme["Color Element"]
	}), "Element")
	Make("Corner", SearchHolder, UDim.new(0, 6)); Make("Stroke", SearchHolder, nil, nil, 1, 0.5)

	InsertTheme(Create("ImageLabel", SearchHolder, { Size = UDim2.fromOffset(13, 13), Position = UDim2.new(0, 10, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), BackgroundTransparency = 1, Image = redzlib.Icons["search"], ImageColor3 = Theme["Color Dark Text"] }), "DarkText")

	local SearchBox = InsertTheme(Create("TextBox", SearchHolder, {
		Size = UDim2.new(1, -34, 1, 0), Position = UDim2.new(0, 28, 0, 0), BackgroundTransparency = 1, Font = Enum.Font.Gotham,
		TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left, TextColor3 = Theme["Color Text"], PlaceholderColor3 = Theme["Color Dark Text"], PlaceholderText = "Pesquisar ferramentas...", Text = ""
	}), "Text")

	local TabPages = Create("Frame", Containers, { Size = UDim2.new(1, 0, 1, -44), Position = UDim2.new(0, 0, 1, 0), AnchorPoint = Vector2.new(0, 1), BackgroundTransparency = 1 })

	local CloseButton = Create("ImageButton", TopBar, { Size = UDim2.fromOffset(14, 14), Position = UDim2.new(1, -14, 0.5, 0), AnchorPoint = Vector2.new(1, 0.5), BackgroundTransparency = 1, Image = "rbxassetid://10747384394", ImageColor3 = Color3.fromRGB(220, 90, 90), AutoButtonColor = false })
	local MinimizeButton = Create("ImageButton", TopBar, { Size = UDim2.fromOffset(14, 14), Position = UDim2.new(1, -38, 0.5, 0), AnchorPoint = Vector2.new(1, 0.5), BackgroundTransparency = 1, Image = "rbxassetid://10734896206", ImageColor3 = Theme["Color Dark Text"], AutoButtonColor = false })

	local Minimized, SaveSize = false, nil
	UserInputService.InputBegan:Connect(function(Input, GP)
		if not GP and Input.KeyCode == redzlib.Save.ToggleKey then MainFrame.Visible = not MainFrame.Visible end
	end)

	local Window = {}
	function Window:Notify(Configs)
		local Card = InsertTheme(Create("Frame", NotifyHolder, { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Theme["Color Hub 2"], ClipsDescendants = true }), "Frame")
		Make("Corner", Card, UDim.new(0, 8)); Make("Stroke", Card, nil, nil, 1, 0.25)
		local Inner = Create("Frame", Card, { Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1 }, { Create("UIPadding", { PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 12), PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12) }) })
		InsertTheme(Create("ImageLabel", Inner, { Size = UDim2.fromOffset(16, 16), BackgroundTransparency = 1, Image = redzlib:GetIcon(Configs.Icon or "bell"), ImageColor3 = Theme["Color Theme"] }), "Theme")
		InsertTheme(Create("TextLabel", Inner, { Size = UDim2.new(1, -24, 0, 16), Position = UDim2.new(0, 24, 0, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, TextColor3 = Theme["Color Text"], Text = Configs.Title or "Aviso" }), "Text")
		InsertTheme(Create("TextLabel", Inner, { Size = UDim2.new(1, -24, 0, 0), Position = UDim2.new(0, 24, 0, 18), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, Font = Enum.Font.Gotham, TextSize = 9, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left, TextColor3 = Theme["Color Dark Text"], Text = Configs.Text or "" }), "DarkText")
		local Bar = InsertTheme(Create("Frame", Card, { Size = UDim2.new(1, 0, 0, 2), Position = UDim2.new(0, 0, 1, -2), BackgroundColor3 = Theme["Color Theme"], BorderSizePixel = 0 }), "Theme")
		task.spawn(function()
			CreateTween({Bar, "Size", UDim2.new(0, 0, 0, 2), Configs.Duration or 4, true, Enum.EasingStyle.Linear})
			CreateTween({Card, "BackgroundTransparency", 1, 0.25, true}); Card:Destroy()
		end)
	end

	function Window:MinimizeBtn()
		if Minimized then
			MinimizeButton.Image = "rbxassetid://10734896206"; SideBar.Visible = true; Containers.Visible = true
			CreateTween({MainFrame, "Size", SaveSize, 0.28, true}); Minimized = false
		else
			MinimizeButton.Image = "rbxassetid://10734924532"; SaveSize = MainFrame.Size
			CreateTween({MainFrame, "Size", UDim2.fromOffset(MainFrame.Size.X.Offset, 36), 0.28, true})
			SideBar.Visible = false; Containers.Visible = false; Minimized = true
		end
	end

	function Window:AddMinimizeButton(Configs)
		local Button = MakeDrag(Create("ImageButton", ScreenGui, {
			Size = UDim2.fromOffset(40, 40), Position = UDim2.fromScale(0.12, 0.15),
			BackgroundColor3 = Theme["Color Hub 2"], AutoButtonColor = false
		}))
		Make("Corner", Button, UDim.new(0, 10)); Make("Stroke", Button, nil, nil, 1.2, 0.2)
		if Configs and Configs.Button then SetProps(Button, Configs.Button) end
		Button.Activated:Connect(function() MainFrame.Visible = not MainFrame.Visible end)
		return { Button = Button }
	end

	CloseButton.Activated:Connect(function() ScreenGui:Destroy() end)
	MinimizeButton.Activated:Connect(function() Window:MinimizeBtn() end)

	local ContainerList = {}
	local ActiveContainer = nil

	SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
		local Q = string.lower(SearchBox.Text)
		if not ActiveContainer then return end
		for _, Child in ipairs(ActiveContainer:GetChildren()) do
			if Child:IsA("GuiObject") and Child.Name == "Option" then
				local Data = Child:GetAttribute("SearchText") or ""
				Child.Visible = Q == "" or Data:find(Q, 1, true) ~= nil
			end
		end
	end)

	local function AttachElements(TabObj, TargetContainer)
		function TabObj:AddSection(Name)
			local Sec = Create("Frame", TargetContainer, { Size = UDim2.new(1, 0, 0, 24), BackgroundTransparency = 1, Name = "Section" })
			InsertTheme(Create("TextLabel", Sec, { Font = Enum.Font.GothamBold, Text = string.upper(GetStr(Name) or ""), TextColor3 = Theme["Color Theme"], Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 2, 0, 2), BackgroundTransparency = 1, TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left }), "Theme")
		end

		function TabObj:AddParagraph(Configs)
			local F, L = ButtonFrame(TargetContainer, Configs[1] or Configs.Title, Configs[2] or Configs.Text, UDim2.new(1, -24))
			return { Set = function(_, V1, V2) if V1 then L:SetTitle(V1) end if V2 then L:SetDesc(V2) end end, Destroy = function() F:Destroy() end }
		end

		function TabObj:AddButton(Configs)
			local F, L = ButtonFrame(TargetContainer, Configs[1] or Configs.Name or Configs.Title, Configs.Desc or Configs.Description, UDim2.new(1, -36))
			InsertTheme(Create("ImageLabel", F, { Size = UDim2.fromOffset(14, 14), Position = UDim2.new(1, -12, 0.5, 0), AnchorPoint = Vector2.new(1, 0.5), BackgroundTransparency = 1, ImageColor3 = Theme["Color Dark Text"], Image = "rbxassetid://10709791437" }), "DarkText")
			F.Activated:Connect(function() Funcs:FireCallback(Funcs:GetCallback(Configs, 2)) end)
		end

		function TabObj:AddToggle(Configs)
			local TName = Configs[1] or Configs.Name or Configs.Title or "Toggle"
			local Callback = Funcs:GetCallback(Configs, 3)
			local Flag = Configs[4] or Configs.Flag
			local State = CheckFlag(Flag) and GetFlag(Flag) or Configs[2] or Configs.Default or false

			local Button, L = ButtonFrame(TargetContainer, TName, Configs.Desc or Configs.Description, UDim2.new(1, -56))
			local Track = InsertTheme(Create("Frame", Button, { Size = UDim2.fromOffset(38, 20), Position = UDim2.new(1, -12, 0.5, 0), AnchorPoint = Vector2.new(1, 0.5), BackgroundColor3 = Theme["Color Stroke"] }), "Stroke")
			Make("Corner", Track, UDim.new(1, 0))
			local Knob = Create("Frame", Track, { Size = UDim2.fromOffset(14, 14), Position = UDim2.new(0, 3, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = Color3.fromRGB(255, 255, 255) })
			Make("Corner", Knob, UDim.new(1, 0))

			local function SetState(Val)
				State = Val; SetFlag(Flag, State); Funcs:FireCallback(Callback, State)
				CreateTween({Track, "BackgroundColor3", State and Theme["Color Theme"] or Theme["Color Stroke"], 0.2})
				CreateTween({Knob, "Position", State and UDim2.new(1, -17, 0.5, 0) or UDim2.new(0, 3, 0.5, 0), 0.2})
			end
			task.spawn(SetState, State)
			Button.Activated:Connect(function() SetState(not State) end)
			return { Set = function(_, v) SetState(v) end }
		end

		function TabObj:AddSlider(Configs)
			local SName = Configs[1] or Configs.Name or Configs.Title or "Slider"
			local Min, Max = Configs[2] or Configs.Min or 0, Configs[3] or Configs.Max or 100
			local Inc = Configs[4] or Configs.Increase or 1
			local Flag = Configs[7] or Configs.Flag
			local Default = CheckFlag(Flag) and GetFlag(Flag) or Configs[5] or Configs.Default or Min
			local Callback = Funcs:GetCallback(Configs, 6)

			local Button, L = ButtonFrame(TargetContainer, SName, Configs.Desc or Configs.Description, UDim2.new(1, -200))
			local RightBox = Create("Frame", Button, { Size = UDim2.new(0, 180, 1, 0), Position = UDim2.new(1, -12, 0, 0), AnchorPoint = Vector2.new(1, 0), BackgroundTransparency = 1 })
			local ValueLbl = InsertTheme(Create("TextLabel", RightBox, { Size = UDim2.fromOffset(42, 20), Position = UDim2.new(1, 0, 0.5, 0), AnchorPoint = Vector2.new(1, 0.5), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Right, TextColor3 = Theme["Color Theme"], Text = tostring(Default) }), "Theme")
			local TrackHitbox = Create("TextButton", RightBox, { Size = UDim2.new(1, -48, 0, 22), Position = UDim2.new(0, 0, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), BackgroundTransparency = 1, Text = "" })
			local Track = InsertTheme(Create("Frame", TrackHitbox, { Size = UDim2.new(1, 0, 0, 5), Position = UDim2.fromScale(0, 0.5), AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = Theme["Color Stroke"] }), "Stroke")
			Make("Corner", Track, UDim.new(1, 0))
			local Fill = InsertTheme(Create("Frame", Track, { Size = UDim2.fromScale(0, 1), BackgroundColor3 = Theme["Color Theme"], BorderSizePixel = 0 }), "Theme")
			Make("Corner", Fill, UDim.new(1, 0))
			local Thumb = Create("Frame", Track, { Size = UDim2.fromOffset(13, 13), Position = UDim2.fromScale(0, 0.5), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(255, 255, 255) })
			Make("Corner", Thumb, UDim.new(1, 0))

			local function SetSlider(Val)
				Val = math.clamp(math.floor((Val - Min) / Inc + 0.5) * Inc + Min, Min, Max)
				local P = (Val - Min) / math.max((Max - Min), 0.0001)
				ValueLbl.Text = tostring(Val)
				CreateTween({Fill, "Size", UDim2.fromScale(P, 1), 0.1})
				CreateTween({Thumb, "Position", UDim2.fromScale(P, 0.5), 0.1})
				SetFlag(Flag, Val); Funcs:FireCallback(Callback, Val)
			end
			SetSlider(Default)

			local Sliding = false
			TrackHitbox.InputBegan:Connect(function(Input)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
					Sliding = true
					SetSlider(Min + (Max - Min) * math.clamp((Input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1))
				end
			end)
			UserInputService.InputChanged:Connect(function(Input)
				if Sliding and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
					SetSlider(Min + (Max - Min) * math.clamp((Input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1))
				end
			end)
			UserInputService.InputEnded:Connect(function(Input)
				if Sliding and (Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch) then
					Sliding = false
				end
			end)
			return { Set = function(_, v) SetSlider(v) end }
		end

		function TabObj:AddDropdown(Configs)
			local DName = Configs[1] or Configs.Name or Configs.Title or "Dropdown"
			local DOptions = Configs[2] or Configs.Options or {}
			local OpDefault = Configs[3] or Configs.Default
			local Callback = Funcs:GetCallback(Configs, 4)
			local Flag = Configs[5] or Configs.Flag
			local MultiSelect = Configs.MultiSelect or false

			local Button, L = ButtonFrame(TargetContainer, DName, Configs.Desc or Configs.Description, UDim2.new(1, -175))
			local SelectedBox = InsertTheme(Create("Frame", Button, { Size = UDim2.fromOffset(150, 22), Position = UDim2.new(1, -12, 0.5, 0), AnchorPoint = Vector2.new(1, 0.5), BackgroundColor3 = Theme["Color Hub 2"] }), "Frame")
			Make("Corner", SelectedBox, UDim.new(0, 5)); Make("Stroke", SelectedBox, nil, nil, 1, 0.4)

			local ActiveLabel = InsertTheme(Create("TextLabel", SelectedBox, { Size = UDim2.new(1, -24, 1, 0), Position = UDim2.fromOffset(8, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, TextColor3 = Theme["Color Text"], Text = "Selecionar..." }), "Text")
			local Arrow = InsertTheme(Create("ImageLabel", SelectedBox, { Size = UDim2.fromOffset(12, 12), Position = UDim2.new(1, -6, 0.5, 0), AnchorPoint = Vector2.new(1, 0.5), Image = "rbxassetid://10709790948", ImageColor3 = Theme["Color Dark Text"], BackgroundTransparency = 1 }), "DarkText")

			local Blocker = Create("TextButton", DropdownHolder, { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Visible = false, Text = "" })
			local DropMenu = InsertTheme(Create("Frame", Blocker, { Size = UDim2.fromOffset(150, 0), BackgroundColor3 = Theme["Color Hub 2"], ClipsDescendants = true }), "Frame")
			Make("Corner", DropMenu, UDim.new(0, 6)); Make("Stroke", DropMenu, nil, nil, 1, 0.25)

			local DropScroll = InsertTheme(Create("ScrollingFrame", DropMenu, { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ScrollBarThickness = 2, ScrollBarImageColor3 = Theme["Color Theme"], AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollingDirection = Enum.ScrollingDirection.Y, BorderSizePixel = 0, CanvasSize = UDim2.new() }, { Create("UIPadding", { PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6), PaddingTop = UDim.new(0, 6), PaddingBottom = UDim.new(0, 6) }), Create("UIListLayout", { Padding = UDim.new(0, 4) }) }), "ScrollBar")

			local Selected = MultiSelect and {} or (CheckFlag(Flag) and GetFlag(Flag) or OpDefault)
			local OptionButtons = {}
			local function RefreshLabel()
				if MultiSelect then
					local list = {}; for k, v in pairs(Selected) do if v then table.insert(list, tostring(k)) end end
					ActiveLabel.Text = #list > 0 and table.concat(list, ", ") or "Nenhum"
				else ActiveLabel.Text = Selected ~= nil and tostring(Selected) or "Selecionar..." end
			end
			local function CloseDrop() CreateTween({Arrow, "Rotation", 0, 0.2}); CreateTween({DropMenu, "Size", UDim2.fromOffset(150, 0), 0.2, true}); Blocker.Visible = false end
			local function OpenDrop()
				local AbsPos, AbsSize = SelectedBox.AbsolutePosition, SelectedBox.AbsoluteSize
				local Count = math.clamp(#DropScroll:GetChildren() - 2, 1, 7)
				DropMenu.Position = UDim2.fromOffset(AbsPos.X / UIScale, (AbsPos.Y + AbsSize.Y + 4) / UIScale)
				Blocker.Visible = true; CreateTween({Arrow, "Rotation", 180, 0.2}); CreateTween({DropMenu, "Size", UDim2.fromOffset(150, (Count * 26) + 10), 0.22})
			end
			local function BuildOptions(List)
				for _, btn in pairs(OptionButtons) do btn:Destroy() end; table.clear(OptionButtons)
				for _, Val in ipairs(List) do
					local OptBtn = Make("Button", DropScroll, { Size = UDim2.new(1, 0, 0, 22), Text = "  " .. tostring(Val), Font = Enum.Font.GothamMedium, TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left, TextColor3 = Theme["Color Text"] })
					Make("Corner", OptBtn, UDim.new(0, 4))
					OptBtn.Activated:Connect(function()
						if MultiSelect then Selected[Val] = not Selected[Val]; SetFlag(Flag, Selected); Funcs:FireCallback(Callback, Selected); RefreshLabel()
						else Selected = Val; SetFlag(Flag, Selected); Funcs:FireCallback(Callback, Selected); RefreshLabel(); CloseDrop() end
					end)
					table.insert(OptionButtons, OptBtn)
				end
				RefreshLabel()
			end
			BuildOptions(DOptions)
			Button.Activated:Connect(function() if Blocker.Visible then CloseDrop() else OpenDrop() end end)
			Blocker.Activated:Connect(CloseDrop)
			return { Set = function(_, NewList) if type(NewList) == "table" then BuildOptions(NewList) end end }
		end

		function TabObj:AddTextBox(Configs)
			local TName = Configs[1] or Configs.Name or Configs.Title or "Input"
			local Callback = Funcs:GetCallback(Configs, 4)
			local Button, L = ButtonFrame(TargetContainer, TName, Configs.Desc or Configs.Description, UDim2.new(1, -175))
			local InputFrame = InsertTheme(Create("Frame", Button, { Size = UDim2.fromOffset(150, 22), Position = UDim2.new(1, -12, 0.5, 0), AnchorPoint = Vector2.new(1, 0.5), BackgroundColor3 = Theme["Color Hub 2"] }), "Frame")
			Make("Corner", InputFrame, UDim.new(0, 5))
			local Box = InsertTheme(Create("TextBox", InputFrame, { Size = UDim2.new(1, -14, 1, 0), Position = UDim2.fromOffset(7, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left, TextColor3 = Theme["Color Text"], PlaceholderColor3 = Theme["Color Dark Text"], PlaceholderText = Configs.PlaceholderText or "Digite...", Text = tostring(Configs[2] or Configs.Default or "") }), "Text")
			Box.FocusLost:Connect(function() Funcs:FireCallback(Callback, Box.Text) end)
			return { Set = function(_, v) Box.Text = tostring(v) end }
		end

		function TabObj:AddKeybind(Configs)
			local KName = Configs[1] or Configs.Name or Configs.Title or "Keybind"
			local DefaultKey = Configs[2] or Configs.Default or Enum.KeyCode.E
			local Callback = Funcs:GetCallback(Configs, 3)
			local Flag = Configs[4] or Configs.Flag

			local Button, L = ButtonFrame(TargetContainer, KName, Configs.Desc or Configs.Description, UDim2.new(1, -110))
			local KeyBadge = InsertTheme(Create("Frame", Button, { Size = UDim2.fromOffset(80, 22), Position = UDim2.new(1, -12, 0.5, 0), AnchorPoint = Vector2.new(1, 0.5), BackgroundColor3 = Theme["Color Hub 2"] }), "Frame")
			Make("Corner", KeyBadge, UDim.new(0, 5)); Make("Stroke", KeyBadge, nil, nil, 1, 0.4)
			local KeyLabel = InsertTheme(Create("TextLabel", KeyBadge, { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 10, TextColor3 = Theme["Color Theme"], Text = DefaultKey.Name }), "Theme")

			local CurrentKey, Listening = DefaultKey, false
			Button.Activated:Connect(function() Listening = true; KeyLabel.Text = "..." end)
			UserInputService.InputBegan:Connect(function(Input, GP)
				if Listening and Input.UserInputType == Enum.UserInputType.Keyboard then
					CurrentKey = Input.KeyCode; KeyLabel.Text = CurrentKey.Name; Listening = false; SetFlag(Flag, CurrentKey.Name)
				elseif not Listening and not GP and Input.KeyCode == CurrentKey then
					Funcs:FireCallback(Callback, CurrentKey)
				end
			end)
		end

		-- Color Picker RGB Real Completo
		function TabObj:AddColorPicker(Configs)
			local CName = Configs[1] or Configs.Name or Configs.Title or "Color Picker"
			local Default = Configs[2] or Configs.Default or Color3.fromRGB(88, 101, 242)
			local Callback = Funcs:GetCallback(Configs, 3)

			local Button, L = ButtonFrame(TargetContainer, CName, Configs.Desc or Configs.Description, UDim2.new(1, -65))
			local Preview = Create("Frame", Button, { Size = UDim2.fromOffset(40, 22), Position = UDim2.new(1, -12, 0.5, 0), AnchorPoint = Vector2.new(1, 0.5), BackgroundColor3 = Default })
			Make("Corner", Preview, UDim.new(0, 5)); Make("Stroke", Preview, nil, nil, 1, 0.3)

			local PickerFrame = InsertTheme(Create("Frame", ScreenGui, { Size = UDim2.fromOffset(190, 150), BackgroundColor3 = Theme["Color Hub 2"], Visible = false, ZIndex = 50 }), "Frame")
			Make("Corner", PickerFrame, UDim.new(0, 8)); Make("Stroke", PickerFrame, nil, nil, 1.2, 0.2)

			local H, S, V = Color3.toHSV(Default)
			local SVBox = Create("TextButton", PickerFrame, { Size = UDim2.fromOffset(145, 130), Position = UDim2.fromOffset(10, 10), BackgroundColor3 = Color3.fromHSV(H, 1, 1), AutoButtonColor = false, Text = "", ZIndex = 51 })
			Make("Corner", SVBox, UDim.new(0, 5))
			local WhiteGrad = Create("Frame", SVBox, { Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(1, 1, 1), ZIndex = 52 })
			Make("Corner", WhiteGrad, UDim.new(0, 5))
			Create("UIGradient", WhiteGrad, { Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)}) })

			local BlackGrad = Create("Frame", SVBox, { Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(0, 0, 0), ZIndex = 53 })
			Make("Corner", BlackGrad, UDim.new(0, 5))
			Create("UIGradient", BlackGrad, { Rotation = 90, Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0)}) })

			local HueBar = Create("TextButton", PickerFrame, { Size = UDim2.fromOffset(16, 130), Position = UDim2.fromOffset(164, 10), BackgroundColor3 = Color3.new(1, 1, 1), AutoButtonColor = false, Text = "", ZIndex = 51 })
			Make("Corner", HueBar, UDim.new(0, 5))
			Create("UIGradient", HueBar, { Rotation = 90, Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
				ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
				ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
				ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
				ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
			}) })

			local function UpdateColor()
				local Col = Color3.fromHSV(H, S, V)
				SVBox.BackgroundColor3 = Color3.fromHSV(H, 1, 1)
				Preview.BackgroundColor3 = Col
				Funcs:FireCallback(Callback, Col)
			end

			local DragSV, DragH = false, false
			SVBox.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then DragSV = true end end)
			HueBar.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then DragH = true end end)
			UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then DragSV = false; DragH = false end end)
			UserInputService.InputChanged:Connect(function(i)
				if i.UserInputType == Enum.UserInputType.MouseMovement then
					if DragSV then
						S = math.clamp((i.Position.X - SVBox.AbsolutePosition.X) / SVBox.AbsoluteSize.X, 0, 1)
						V = 1 - math.clamp((i.Position.Y - SVBox.AbsolutePosition.Y) / SVBox.AbsoluteSize.Y, 0, 1)
						UpdateColor()
					elseif DragH then
						H = math.clamp((i.Position.Y - HueBar.AbsolutePosition.Y) / HueBar.AbsoluteSize.Y, 0, 1)
						UpdateColor()
					end
				end
			end)

			Button.Activated:Connect(function()
				PickerFrame.Visible = not PickerFrame.Visible
				if PickerFrame.Visible then
					local Abs = Preview.AbsolutePosition
					PickerFrame.Position = UDim2.fromOffset((Abs.X - 150) / UIScale, (Abs.Y + 28) / UIScale)
				end
			end)
		end

		-- Accordion / Seção Recolhível
		function TabObj:AddAccordion(Configs)
			local Title = Configs[1] or Configs.Title or "Accordion"
			local Frame = InsertTheme(Create("Frame", TargetContainer, { Size = UDim2.new(1, 0, 0, 36), AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Theme["Color Element"], ClipsDescendants = true, Name = "Option" }), "Element")
			Make("Corner", Frame, UDim.new(0, 8)); Make("Stroke", Frame, nil, nil, 1, 0.5)

			local TopBtn = Create("TextButton", Frame, { Size = UDim2.new(1, 0, 0, 36), BackgroundTransparency = 1, Text = "" })
			InsertTheme(Create("TextLabel", TopBtn, { Size = UDim2.new(1, -36, 1, 0), Position = UDim2.fromOffset(12, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamBold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, TextColor3 = Theme["Color Text"], Text = Title }), "Text")
			local Arrow = InsertTheme(Create("ImageLabel", TopBtn, { Size = UDim2.fromOffset(14, 14), Position = UDim2.new(1, -12, 0.5, 0), AnchorPoint = Vector2.new(1, 0.5), Image = "rbxassetid://10709790948", ImageColor3 = Theme["Color Dark Text"], BackgroundTransparency = 1 }), "DarkText")

			local Content = Create("Frame", Frame, { Size = UDim2.new(1, 0, 0, 0), Position = UDim2.fromOffset(0, 36), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, Visible = false }, { Create("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }), Create("UIPadding", { PaddingBottom = UDim.new(0, 10), PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10) }) })

			local Open = false
			TopBtn.Activated:Connect(function()
				Open = not Open
				CreateTween({Arrow, "Rotation", Open and 180 or 0, 0.2})
				Content.Visible = Open
			end)

			local SubTab = {}
			AttachElements(SubTab, Content)
			return SubTab
		end
	end

	function Window:MakeTab(paste, Configs)
		if type(paste) == "table" then Configs = paste end
		local TName = Configs[1] or Configs.Title or "Aba"
		local TIcon = redzlib:GetIcon(Configs[2] or Configs.Icon or "")

		local TabSelect = InsertTheme(Create("TextButton", MainScroll, { Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = Theme["Color Element"], BackgroundTransparency = (#ContainerList == 0) and 0.2 or 1, AutoButtonColor = false, Text = "" }), "Element")
		Make("Corner", TabSelect, UDim.new(0, 7))

		local LabelTitle = InsertTheme(Create("TextLabel", TabSelect, { Size = UDim2.new(1, -34, 1, 0), Position = UDim2.fromOffset(32, 0), BackgroundTransparency = 1, Font = Enum.Font.GothamSemibold, Text = TName, TextColor3 = Theme["Color Text"], TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, TextTransparency = (#ContainerList == 0) and 0 or 0.45 }), "Text")
		local LabelIcon = InsertTheme(Create("ImageLabel", TabSelect, { Position = UDim2.new(0, 10, 0.5, 0), Size = UDim2.fromOffset(14, 14), AnchorPoint = Vector2.new(0, 0.5), Image = TIcon, Visible = TIcon ~= "", BackgroundTransparency = 1, ImageColor3 = (#ContainerList == 0) and Theme["Color Theme"] or Theme["Color Dark Text"] }), (#ContainerList == 0) and "Theme" or "DarkText")
		local SelectedBar = InsertTheme(Create("Frame", TabSelect, { Size = (#ContainerList == 0) and UDim2.new(0, 3, 0, 16) or UDim2.new(0, 3, 0, 0), Position = UDim2.new(0, 2, 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = Theme["Color Theme"], BackgroundTransparency = (#ContainerList == 0) and 0 or 1 }), "Theme")
		Make("Corner", SelectedBar, UDim.new(1, 0))

		local Container = InsertTheme(Create("ScrollingFrame", {
			Size = UDim2.fromScale(1, 1), ScrollBarThickness = 2, BackgroundTransparency = 1, ScrollBarImageTransparency = 0.25, ScrollBarImageColor3 = Theme["Color Theme"],
			AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollingDirection = Enum.ScrollingDirection.Y, BorderSizePixel = 0, CanvasSize = UDim2.new()
		}, { Create("UIPadding", { PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12), PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 12) }), Create("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }) }), "ScrollBar")

		table.insert(ContainerList, Container)
		if #ContainerList == 1 then Container.Parent = TabPages; ActiveContainer = Container end

		local Tab = {}
		function Tab:Enable()
			for _, Frame in pairs(ContainerList) do Frame.Parent = nil end
			Container.Parent = TabPages; ActiveContainer = Container; SearchBox.Text = ""
			for _, T in pairs(redzlib.Tabs) do T.func:Disable() end
			CreateTween({TabSelect, "BackgroundTransparency", 0.2, 0.25})
			CreateTween({LabelTitle, "TextTransparency", 0, 0.25})
			CreateTween({LabelIcon, "ImageColor3", Theme["Color Theme"], 0.25})
			CreateTween({SelectedBar, "Size", UDim2.new(0, 3, 0, 16), 0.25})
			CreateTween({SelectedBar, "BackgroundTransparency", 0, 0.25})
		end
		function Tab:Disable()
			Container.Parent = nil
			CreateTween({TabSelect, "BackgroundTransparency", 1, 0.25})
			CreateTween({LabelTitle, "TextTransparency", 0.45, 0.25})
			CreateTween({LabelIcon, "ImageColor3", Theme["Color Dark Text"], 0.25})
			CreateTween({SelectedBar, "Size", UDim2.new(0, 3, 0, 0), 0.25})
			CreateTween({SelectedBar, "BackgroundTransparency", 1, 0.25})
		end

		TabSelect.Activated:Connect(function() Tab:Enable() end)
		table.insert(redzlib.Tabs, { func = Tab, Cont = Container })
		AttachElements(Tab, Container)
		return Tab
	end

	return Window
end

return redzlib
