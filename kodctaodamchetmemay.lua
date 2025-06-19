repeat wait() until game:IsLoaded()

-- Hiển thị thông báo loading
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Phạm Nghĩa IOS",
    Text = "Đang tải script riêng của bạn...",
    Duration = 5
})

-- Tải script GUI chính với đầy đủ tính năng như Min Gaming nhưng giao diện riêng
local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/anhteo94/PhamNghiaIOS-BloxFruit/main/CoreScript.lua"))()
end)

if not success then
    warn("Không thể tải script:", err)
end

-- Sau khi GUI hình thành, tiến hành thay đổi giao diện
spawn(function()
    wait(5)
    local gui = game:GetService("CoreGui"):FindFirstChildWhichIsA("ScreenGui", true)
    if gui then
        -- Thay tên
        for _, v in pairs(gui:GetDescendants()) do
            if v:IsA("TextLabel") and string.find(v.Text, "Min") then
                v.Text = v.Text:gsub("Min Gaming", "Phạm Nghĩa IOS")
            end
        end
        -- Thay ảnh
        for _, v in pairs(gui:GetDescendants()) do
            if v:IsA("ImageLabel") and string.find(v.Image, "Min") then
                v.Image = "https://i.imgur.com/JrgPMTO.jpeg"
            end
        end
    end
end)
