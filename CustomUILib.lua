
function __CREATELIB__(nameLib, AnimStyle, TpPlayer)

	if game.CoreGui:FindFirstChild("ExploitGuiMenu") ~= nil then

		game.CoreGui['ExploitGuiMenu']:Destroy()

	end

	--DECLAIRING GLOBAL VARIABLE FUNCTIONS
	local mouse = game.Players.LocalPlayer:GetMouse()
	local OldMouseX = 0
	local OldMouseY = 0
	local toggleMovement = false
	local UIS = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")
	local tweenService = game:GetService("TweenService")
	local InfJSwitch = false
	local Players = game:GetService("Players")
	local AutoFarm = false
	local _VISIBLE = true
	local VERSION = "1.0.1"
	------------------------------------------------------

	local MainScreen = Instance.new("ScreenGui", game.CoreGui)
	MainScreen.Name = "ExploitGuiMenu"

	local Main = Instance.new("Frame", MainScreen)
	Main.Name = nameLib
	Main.Size = UDim2.new(0.001, 0, 0.001, 0)
	Main.BackgroundColor3 = Color3.fromRGB(54, 23, 23)
	Main.Position = UDim2.new(0.01, 0, 0.763, 0)
	Main.ClipsDescendants = true

	local ScriptLabelMain = Instance.new("TextLabel", Main)
	ScriptLabelMain.Size = UDim2.new(0.9, 0, 0.177, 0)
	ScriptLabelMain.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	ScriptLabelMain.Text = nameLib
	ScriptLabelMain.TextScaled = true
	ScriptLabelMain.Name = "TopBar"
	ScriptLabelMain.TextSize = 19
	ScriptLabelMain.Position = UDim2.new(0.1, 0, 0, 0)
	--ScriptLabelMain.FontFace = "Nunito"

	local SidePanelSelectorMain = Instance.new("ScrollingFrame", Main)
	SidePanelSelectorMain.Size = UDim2.new(0.365, 0, 0.75, 0)
	SidePanelSelectorMain.BackgroundColor3 = Color3.fromRGB(108, 37, 37)
	SidePanelSelectorMain.ScrollBarThickness = 5
	SidePanelSelectorMain.CanvasSize = UDim2.new(0, 0, 0, 0)
	SidePanelSelectorMain.Position = UDim2.new(0, 0, 0.177, 0)
	SidePanelSelectorMain.BorderSizePixel = 0
	SidePanelSelectorMain.AutomaticCanvasSize = "Y"


	local SideSelectionPanelMain = Instance.new("ScrollingFrame", Main)
	SideSelectionPanelMain.Size = UDim2.new(0.635, 0, 0.75, 0)
	SideSelectionPanelMain.BackgroundColor3 = Color3.fromRGB(54, 23, 23)
	SideSelectionPanelMain.ScrollBarThickness = 5
	SideSelectionPanelMain.CanvasSize = UDim2.new(0, 0, 0, 0)
	SideSelectionPanelMain.Position = UDim2.new(0.365, 0, 0.177, 0)
	SideSelectionPanelMain.BorderSizePixel = 0
	SideSelectionPanelMain.AutomaticCanvasSize = "Y"


	local ExitProgramButton = Instance.new("TextButton", Main)
	ExitProgramButton.Size = UDim2.new(0.098, 0, 0.177, 0)
	ExitProgramButton.Position = UDim2.new(0, 0, 0, 0)
	ExitProgramButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	ExitProgramButton.Text = "X"
	ExitProgramButton.TextScaled = true
	ExitProgramButton.TextSize = 5
	ExitProgramButton.Name = "Exit"

	--////////////////////////////////////////////////////////////////////--

	local ExitProgramButtonRoundUI = Instance.new("UICorner", ExitProgramButton)
	ExitProgramButtonRoundUI.CornerRadius = UDim.new(0, 10)

	local SidePanelSelectorMainRoundUI = Instance.new("UICorner", SidePanelSelectorMain)
	SidePanelSelectorMainRoundUI.CornerRadius = UDim.new(0, 10)

	local SideSelectionPanelMainListUI = Instance.new("UIListLayout", SideSelectionPanelMain)
	SideSelectionPanelMainListUI.Padding = UDim.new(0, 2)
	SideSelectionPanelMainListUI.SortOrder = Enum.SortOrder.LayoutOrder

	local SidePanelSelectorMainRoundUI = Instance.new("UIListLayout", SidePanelSelectorMain)
	SidePanelSelectorMainRoundUI.Padding = UDim.new(0, 2)
	SidePanelSelectorMainRoundUI.SortOrder = Enum.SortOrder.LayoutOrder

	local ScriptLabelMainRoundUI = Instance.new("UICorner", ScriptLabelMain)
	ScriptLabelMainRoundUI.CornerRadius = UDim.new(0, 10)

	local MainRoundUI = Instance.new("UICorner", Main)
	MainRoundUI.CornerRadius = UDim.new(0.08, 0)

	local AlertFolder = Instance.new("Folder", MainScreen)



	----INITIALIZE ANIMATIONS----
	function _INITIALIZEUI()
		SidePanelSelectorMainRoundUI:ApplyLayout()

		local MainTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
		local tween = tweenService:Create(Main, MainTweenInfo, {Size = UDim2.new(0.216, 0, 0., 0)} )
		tween:Play()
		wait(1)
		local MainTweenInfo2 = TweenInfo.new(2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
		local tween = tweenService:Create(Main, MainTweenInfo2, {Size = UDim2.new(0.216, 0, 0.226, 0)} )
		tween:Play()
		wait(2)
		--UDim2.new(0.216, 0, 0.226, 0)	
	end


	-------FUNCTIONS BEGIN HERE--------
	ScriptLabelMain.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1) then
			print("Input Started")
			--Main.Position = UDim2.new(0, mouse.X, 0, mouse.Y)
			OldMouseX = mouse.X
			OldMouseY = mouse.Y
			XposChange = Main.Position.X.Offset - OldMouseX
			YposChange = Main.Position.Y.Offset - OldMouseY
			print(OldMouseX)
			print(OldMouseY)
			toggleMovement = true
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End and toggleMovement then
			
					--Main.Position = UDim2.new(0, mouse.X, 0, mouse.Y)
					toggleMovement = false
					print("Input Ended")
				end
			end)
		end

	end)

	RunService.Heartbeat:Connect(function() -- RUNS EVERY FRAME///////////////////////////////////////////

		if toggleMovement then
			local MoveAnim = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
			--Main.Position = UDim2.new(0, mouse.X + XposChange, 0, mouse.Y + YposChange)
			local tween = tweenService:Create(Main, MoveAnim, { Position = UDim2.new(0, mouse.X + XposChange, 0, mouse.Y + YposChange) } )
			tween:Play()
		end	

		for i, v in pairs(AlertFolder:GetChildren()) do
			local tempValue = v:FindFirstChild("Time").Value
			if tempValue <= time() then
				local ShowAnim = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
				local tween = tweenService:Create(v, ShowAnim, {Position = UDim2.new(0.35, 0, 1, 0)})
				tween:Play()
				wait(0.2)
				v:Destroy()
			end
		end
	end)--////////////////////////////////////////////////////////////////////////////////////////////////

	ExitProgramButton.MouseButton1Click:Connect(function()
		local MainUIScale = Instance.new("UIScale", Main)
		local ShrinkAnim = TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.InOut)
		local tween = tweenService:Create(MainUIScale, ShrinkAnim, {Scale = 0} )
		tween:Play()
		wait(1.5)
		game.CoreGui.ExploitGuiMenu:Destroy()
	end)

	--////////CREATE UI HERE/////////////////--

	function CreatePanelButton(nameB, OrderNum)
		
		local CreateSidePanelButton = Instance.new("TextButton", SidePanelSelectorMain)
		CreateSidePanelButton.Size = UDim2.new(0.88, 0, 0.165, 0)
		--CreateSidePanelButton.Position = UDim2.new(0, 0, 0, 0)
		CreateSidePanelButton.BackgroundColor3 = Color3.fromRGB(54, 23, 23)
		CreateSidePanelButton.Text = nameB
		CreateSidePanelButton.TextScaled = true
		CreateSidePanelButton.TextSize = 5
		CreateSidePanelButton.Name = nameB
		CreateSidePanelButton.TextColor3 = Color3.fromRGB(200, 100, 100)
		CreateSidePanelButton.LayoutOrder = OrderNum

		local ScriptLabelMainRoundUI = Instance.new("UICorner", CreateSidePanelButton)
		ScriptLabelMainRoundUI.CornerRadius = UDim.new(0, 10)
		return CreateSidePanelButton

	end


	function CreateButton(nameB, OrderNum, Keypress, Function)
		
		local CreatePanelButton = Instance.new("TextButton", SideSelectionPanelMain)
		CreatePanelButton.Size = UDim2.new(0.88, 0, 0.165, 0)
		CreatePanelButton.Position = UDim2.new(0.062, 0, 0, 0)
		CreatePanelButton.BackgroundColor3 = Color3.fromRGB(108, 37, 37)
		CreatePanelButton.Text = nameB
		CreatePanelButton.TextScaled = true
		CreatePanelButton.TextSize = 5
		CreatePanelButton.Name = nameB
		CreatePanelButton.TextColor3 = Color3.fromRGB(200, 100, 100)
		CreatePanelButton.LayoutOrder = OrderNum

		local ScriptLabelMainRoundUI = Instance.new("UICorner", CreatePanelButton)
		ScriptLabelMainRoundUI.CornerRadius = UDim.new(0, 10)

		local temp = Instance.new("StringValue", CreatePanelButton)
		temp.Name = "FunctionValue"
		--temp.Value Function

		if Keypress ~= "" or Keypress == nil then
			local PanelButtonKeypressValue = Instance.new("StringValue", CreatePanelButton)
			PanelButtonKeypressValue.Value = Keypress
		end
		return CreatePanelButton

	end

	function CreateLabel(nameB, OrderNum)
		
		local CreatePanelLabel = Instance.new("TextLabel", SideSelectionPanelMain)
		CreatePanelLabel.Size = UDim2.new(0.88, 0, 0.165, 0)
		CreatePanelLabel.Position = UDim2.new(0.062, 0, 0, 0)
		CreatePanelLabel.BackgroundColor3 = Color3.fromRGB(208, 32, 35)
		CreatePanelLabel.Text = nameB
		CreatePanelLabel.TextScaled = true
		CreatePanelLabel.TextSize = 5
		CreatePanelLabel.Name = nameB
		CreatePanelLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
		CreatePanelLabel.LayoutOrder = OrderNum

		local ScriptLabelMainRoundUI = Instance.new("UICorner", CreatePanelLabel)
		ScriptLabelMainRoundUI.CornerRadius = UDim.new(0, 10)
		return CreatePanelLabel

	end

	function CreateAlert(nameB, OrderNum, Duration, Loudness)
		
		local CreateAlertText = Instance.new("TextLabel", AlertFolder)
		
		CreateAlertText.Size = UDim2.new(0.3, 0, 0.025, 0)
		CreateAlertText.Position = UDim2.new(0.35, 0, 1, 0)
		CreateAlertText.BackgroundColor3 = Color3.fromRGB(200, 70, 70)
		CreateAlertText.Text = nameB
		CreateAlertText.TextScaled = true
		CreateAlertText.TextSize = 5
		CreateAlertText.Name = nameB
		CreateAlertText.TextColor3 = Color3.fromRGB(54, 23, 23)
		CreateAlertText.LayoutOrder = OrderNum

		local TimeTillDestroyed = Instance.new("NumberValue", CreateAlertText)
		TimeTillDestroyed.Value = time() + Duration
		TimeTillDestroyed.Name = "Time"

		local ScriptLabelMainRoundUI = Instance.new("UICorner", CreateAlertText)
		ScriptLabelMainRoundUI.CornerRadius = UDim.new(0, 10)

		local SoundEffect = Instance.new("Sound", CreateAlertText)
		SoundEffect.Name = "Sound Effect"
		SoundEffect.SoundId = "rbxassetid://1788243907"
		SoundEffect.Volume = Loudness
		SoundEffect:Play()

		local ShowAnim = TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
		local tween = tweenService:Create(CreateAlertText, ShowAnim, {Position = UDim2.new(0.35, 0, 0.970, 0)})
		tween:Play()
		return CreateAlertText

	end

	function _ORGANIZEUI()
		
		SideSelectionPanelMainListUI:ApplyLayout()	

	end

	function _ClearCanvas()
		for i, v in pairs(SideSelectionPanelMain:GetChildren()) do
			if not v:IsA("UIListLayout") then
				v:Destroy()
			end
		end
	end

	CreateAlert("Current Version Running: " .. VERSION, 99999, 3, 0)
		
	local function TpPlayer()
		
		
		CreatePanelButton("Teleport To Players", 999, "").MouseButton1Click:Connect(function()
			_ClearCanvas()
			
			for i, v in pairs(game.Players:GetChildren()) do
				local player = game.Players.LocalPlayer
				if not v:IsA("Humanoid") then
						
					if player.UserId == v.UserId then

					else
						
						CreateButton(v.DisplayName .. " (".. v.Name .. ").", 2, "").MouseButton1Click:Connect(function()
							player.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild(v.Name).HumanoidRootPart.CFrame
							CreateAlert("Teleported to: " .. v.DisplayName.. ", ".. v.Name, 1, 1.5, 1)
						end)
					end
				end
			end
			_ORGANIZEUI()
		end)
	end

	if TpPlayer then
		TpPlayer()
	end

	CreatePanelButton("CREDITS", 99999999, "").MouseButton1Click:Connect(function()
		_ClearCanvas()
		
		CreateLabel("Library Created By: DigitalDemon", 1)
		CreateLabel("If bugs are found, Message me on discord! DigitalDemon#1099", 1)

		_ORGANIZEUI()
	end)

	UIS.InputBegan:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.Keyboard then
			for i, v in pairs(SideSelectionPanelMain:GetDescendants()) do
				
				if v:IsA("StringValue") then
					if UIS:GetStringForKeyCode(input.KeyCode) == v.Value then -- input.KeyCode
						--v.Parent.FunctionValue.Value
						--GetAndRunFunction()
						--print("Ran the press of: " .. v.Value)
					end
				end

			end


			if input.KeyCode == Enum.KeyCode.RightAlt then
				if _VISIBLE then
					_VISIBLE = false
					game.CoreGui:FindFirstChild("ExploitGuiMenu").Enabled = false
				else
					_VISIBLE = true
					game.CoreGui:FindFirstChild("ExploitGuiMenu").Enabled = true
				end
			end
		end

	end)


	Players.PlayerAdded:Connect(onPlayerAdded)
	--function GetAndRunFunction(FUNCTION)
		
	
		
	--_INITIALIZEUI() -- AT THE END OF UI. DOES NOT NEED TO BE AT THE END OF ALL SCRIPTS
end
