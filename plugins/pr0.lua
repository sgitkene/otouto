-- pr0gramm.com plugin for otouto
-- Man programmiert nicht über das Pr0gramm!
local command = 'pr0'
local doc = [[```
/pr0 [url]: Man pasted nicht über das pr0 in telegram.
/benis [fag]: Zeigt benis.
/pr0 [filter] [tag]: Zufälliges Bild mit Filter [sfw, nsfw, nsfl], kein Filter -> [all], Tag optional.
```]]

--returns: FALSE if any error, TRUE if data sent off
local function get_Pr0_image(msg,id)
    local b,status = http.request("http://pr0gramm.com/api/items/get?id="..id.."&flags=7")
    if status ~= 200 then -- 200 = OK
        return false
    end
    local img_data = json:decode(b)
    
    if img_data.error == "notFound" then --IMG not found
        return false
    end

    local img_url = "http://img.pr0gramm.com/"..img_data.items[1].image
    if(string.find(img_url, ".jpg") or string.find(img_url, ".png")) then -- JPG/PNG
        return img_url
    else --WEBM/GIF
        return img_url
    end
end

--Calls api, returns number(benis)
local function get_benis(user)
    local url = "http://pr0gramm.com/api/profile/info?name="..user.."&self=true%20HTTP/1.1"
    local b,status = http.request(url)
    if status ~= 200 then --200 = OK
        return nil 
    end
    
    local user_data = json:decode(b)
    if user_data.error == "notFound" then --User not found
        return nil 
    end
    return user_data.user.score --Benis return
end

local function get_random_image(msg, f, t) --filter, tag
    local tag = ""
    local flag = "&flags="
    local f_set = false
    
    if f=="sfw" then       --SFW
        flag = flag.."1"
        f_set = true
    elseif f=="nsfw" then  --NSFW
        flag = flag.."2"
        f_set = true
    elseif f=="nsfl" then  --NFSL
        flag = flag.."4"
        f_set = true 
    else                   --ALL
        flag = flag.."7"
    end
    
    if f_set then
        if t~=nil then
            tag = "&tags="..URL.escape(t)
        end --else tag stays empty
    else --f becomes tag
        if f~=nil then
            tag = "&tags="..URL.escape(f) 
        end --else tag stays empty 
    end

    local url = "http://pr0gramm.com/api/items/get?promoted=1"..tag..flag
    local b,status = http.request(url)
    if status ~= 200 then --200 = OK
        return 2
    end
    
    local img_data = json:decode(b)
    while true do
        if #img_data.items == 0 then
            return 1   
        end  

        i = math.random(#img_data.items)
        if(string.find(img_data.items[i].image,".jpg") or
            string.find(img_data.items[i].image,".png")) then
            break
        end
        table.remove(img_data.items, i)
    end
    local img_url = "http://img.pr0gramm.com/"..img_data.items[i].image
    return img_url 
end

local action = function(msg)   
    local input = msg.text:input()
    if (msg.text_lower:match('/benis['..bot.username..']*')) then
        input = msg.text:input()
        if not input then
            output = config.errors.argument
        else
            score = get_benis()
            if not score then 
                output = config.errors.result --return "Sorry, der User existiert nicht."
            else
                output = 'user ' .. get_word(input, 1) .. ' has ' .. score .. ' benis.'
            end
        end
    
    elseif (msg.text_lower:match('/pr0['..bot.username..']*')) then
        ret_val = get_random_image(msg, get_word(input,2), get_word(input, 3))
        if not ret_val then
            output = 'error'
        elseif ret_val == 1 then
            output = config.errors.result
        elseif ret_val == 2 then
            output = 'error2'
        else
            output = '[image]('..ret_val..')'
        end
            
    
    else
        ret_val = get_Pr0_image(msg, input)
        if not ret_val then
            output = config.errors.result --return "Sorry, der gewünschte Content existiert nicht."
        else
            output = '[image]('..ret_val..')'
        end
    end
    sendMessage(msg.chat.id, output, true, nil, true)

end

return{
    action=action,
    doc=doc,
    command=command
    triggers = {
        -- Urls, second block include search keywords
        '^/benis*$",
        '^/pr0*$"
    },
}
