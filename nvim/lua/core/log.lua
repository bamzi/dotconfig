-- local Log = {}

-- --- Creates a log handle based on Plenary.log
-- ---@param opts these are passed verbatim to Plenary.log
-- ---@return log handle
-- function Log:new(opts)
--   local status_ok, _ = pcall(require, "plenary.log")
--   if not status_ok then
--     return nil
--   end

--   local obj = require("plenary.log").new(opts)
--   local path = string.format("%s/%s.log", vim.api.nvim_call_function("stdpath", { "cache" }), opts.plugin)

--   obj.get_path = function()
--     return path
--   end

--   return obj
-- end

-- --- Creates or retrieves a log handle for the default logfile
-- --- based on Plenary.log
-- ---@return log handle
-- function Log:get_default()
--   return Log:new { plugin = "lunarvim", level = "warn" }
-- end

-- return Log

local Log = {}

local logfile = string.format("%s/%s.log", "~/.local", "my_nvim")

Log.levels = {
  TRACE = 1,
  DEBUG = 2,
  INFO = 3,
  WARN = 4,
  ERROR = 5,
}

vim.tbl_add_reverse_lookup(Log.levels)

function Log:init()
  local status_ok, structlog = pcall(require, "structlog")
  if not status_ok then
    return nil
  end

  local notify_handler = require "core.notify"

  ---Check if notify is available
  ---@return boolean
  local is_notify_available = function()
    local in_headless = #vim.api.nvim_list_uis() == 0
    --We can't rely on builtin.notify.active since this can be used before the config loader
    local has_notify_plugin = pcall(require, "notify")
    if not in_headless and has_notify_plugin then
      return true
    end
    return false
  end

  local log_level = Log.levels[(log.level):upper() or "ERROR"]
  local myvim_log = {
    myvim = {
      sinks = {
        structlog.sinks.Console(log_level, {
          async = false,
          processors = {
            structlog.processors.Namer(),
            structlog.processors.StackWriter({ "line", "file" }, { max_parents = 0, stack_level = 2 }),
            structlog.processors.Timestamper "%H:%M:%S",
          },
          formatter = structlog.formatters.FormatColorizer( --
            "%s [%-5s] %s: %-30s",
            { "timestamp", "level", "logger_name", "msg" },
            { level = structlog.formatters.FormatColorizer.color_level() }
          ),
        }),
        structlog.sinks.File(Log.levels.TRACE, logfile, {
          processors = {
            structlog.processors.Namer(),
            structlog.processors.StackWriter({ "line", "file" }, { max_parents = 3, stack_level = 2 }),
            structlog.processors.Timestamper "%H:%M:%S",
          },
          formatter = structlog.formatters.Format( --
            "%s [%-5s] %s: %-30s",
            { "timestamp", "level", "logger_name", "msg" }
          ),
        }),
      },
    },
  }

  if is_notify_available() then
    table.insert(
      myvim_log.sinks,
      structlog.sinks.NvimNotify(Log.levels.ERROR, {
        processors = {
          notify_handler.default_namer,
          notify_handler.params_injecter,
        },
        formatter = structlog.formatters.Format( --
          "%s",
          { "msg" },
          { blacklist_all = true }
        ),
        params_map = {
          icon = "icon",
          keep = "keep",
          on_open = "on_open",
          on_close = "on_close",
          timeout = "timeout",
          title = "title",
        },
      })
    )
  end

  structlog.configure(myvim_log)

  local logger = structlog.get_logger "myvim"

  if log.override_notify then
    logger:log(Log.levels.ERROR, "Ignoring request to override vim.notify with structlog due to instabilities")
  end

  return logger
end

--- Adds a log entry using Plenary.log
---@fparam msg any
---@param level string [same as vim.log.log_levels]
function Log:add_entry(level, msg, event)
  if self.__handle then
    self.__handle:log(level, vim.inspect(msg), event)
    return
  end

  local logger = self:init()
  if not logger then
    return
  end

  self.__handle = logger
  self.__handle:log(level, vim.inspect(msg), event)
end

---Retrieves the path of the logfile
---@return string path of the logfile
function Log:get_path()
  return logfile
end

---Add a log entry at TRACE level
---@param msg any
---@param event any
function Log:trace(msg, event)
  self:add_entry(self.levels.TRACE, msg, event)
end

---Add a log entry at DEBUG level
---@param msg any
---@param event any
function Log:debug(msg, event)
  self:add_entry(self.levels.DEBUG, msg, event)
end

---Add a log entry at INFO level
---@param msg any
---@param event any
function Log:info(msg, event)
  self:add_entry(self.levels.INFO, msg, event)
end

---Add a log entry at WARN level
---@param msg any
---@param event any
function Log:warn(msg, event)
  self:add_entry(self.levels.WARN, msg, event)
end

---Add a log entry at ERROR level
---@param msg any
---@param event any
function Log:error(msg, event)
  self:add_entry(self.levels.ERROR, msg, event)
end

setmetatable({}, Log)

return Log
