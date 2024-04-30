local M = {}

local get_file_name = function(file)
    return file:match("^.+/(.+)$")
end

local file_exists = function(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

M.config = {
    template_dir = vim.fs.dirname(debug.getinfo(1).source:sub(2)) .. "/../../templates",
    doc_dir = 'docs',
}

M.setup = function(config)
    if config['template_dir'] ~= nil then
        M.config.template_dir = config['template_dir']
    end
    if config['doc_dir'] ~= nil then
        M.config.doc_dir = config['doc_dir']
    end
end

M.create_from_template = function()
    local cwd_content = vim.split(
        vim.fn.glob(M.config.template_dir .. '/*'),
        '\n',
        {
            trimempty=true
        }
    )

    local templates = vim.tbl_map(get_file_name, cwd_content)

    vim.ui.select(
        templates,
        {
            prompt = "Select template",
        },
        function(selected)
            if selected == nil then
                return
            end

            M.write_selected_to_path(
                M.config.template_dir .. '/' .. selected
            )
        end
    )
end

M.write_selected_to_path = function(template_name)
    vim.ui.input(
        {
            prompt = "File name",
        },
        function(file_name)
            M.write_to_path(template_name, file_name)
        end
    )
end

M.write_to_path = function(template_name, file_name)
    local template = vim.fn.readfile(template_name)

    if vim.fn.isdirectory(vim.fn.getcwd() .. M.config.doc_dir) == 0 then
        vim.fn.mkdir(vim.fn.getcwd() .. M.config.doc_dir, 'p')
    end

    local file = vim.fn.getcwd() .. M.config.doc_dir .. '/' .. file_name .. '.md'
    if not file_exists(file) then
        vim.fn.writefile(template, file)
    end
    vim.cmd('edit ' .. file)
end

return M
