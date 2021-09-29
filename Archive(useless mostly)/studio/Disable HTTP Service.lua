-- / This will attempt to disable the HTTP service, even through they try to enable it. :3
HTTP = game:GetService("HttpService")
HTTP.HttpEnabled = false
HTTP:GetPropertyChangedSignal("HttpEnabled"):Connect(function()
	if HTTP.HttpEnabled == true then
		HTTP.HttpEnabled = false
	end
end)
