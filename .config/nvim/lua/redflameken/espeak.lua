local config = {}

config.dir = "gmw"

config.language = "en"

config.voice_type = "female_whisper"

config.executable = "espeak-ng"

local function getSelected()
    local startPos = vim.fn.getpos "."
    local endPos = vim.fn.getpos "v"

    local strings = vim.fn.getregion(startPos, endPos, {type = vim.fn.mode()})
    return vim.fn.join(strings, " ")
end

local function buildVoice()
    return config.dir .. "/" .. config.language .. "+" .. config.voice_type;
end

function Speak()
    local read = getSelected()

    local obj = vim.system({
        config.executable,
        "-v",
        buildVoice(),
        "--punct",
        "--stdin"
    }, {stdin = true, detach = true})
    obj:write(read)
    obj:write(nil) -- close stdin
end

function StopSpeaking()
    vim.system({"killall", config.executable}):wait()
end
