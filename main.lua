local Model = workspace:WaitForChild("Model"):Clone()
Model.Parent = workspace
Model.Name = "Image"

img_exists = true

local Buffer = game:GetService("HttpService"):GetAsync('') -- inside the getasync you should have your ngrok's link (eg: GetAsync('https://4805-41-109-150-155.ngrok-free.app/v1/get_image')
local Image = PNG.new(Buffer)
local partTable = {}

for x = 1, Image.Width do
   partTable[x] = {}
   for y = 1, Image.Height do
        task.spawn(function()
	    local part = Model:WaitForChild("example"):Clone()
	    part.CFrame = CFrame.new(Vector3.new(x*part.Size.Z+10, (1-y)*part.Size.Z+15, 0))
            partTable[x][y] = part
	    part.Parent = Model
            part.Name = "Pixel "..tostring(x).."/"..tostring(y)
	end)	
   end

   if x % 20 == 0 then
      task.wait() -- to avoid run exhaust
   end
end

for x = 1, Image.Width do
    for y = 1, Image.Height do
      partTable[x][y].Color = Image:GetPixel(x, y)
    end
end
