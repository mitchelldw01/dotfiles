return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		local timer = vim.loop.new_timer()
		local last_notified_hash = nil

		local function get_current_branch(callback)
			vim.system({ "git", "rev-parse", "--abbrev-ref", "HEAD" }, { text = true }, callback)
		end

		local function get_remote_hash(branch, callback)
			vim.system({ "git", "rev-parse", "origin/" .. branch }, { text = true }, callback)
		end

		local function fetch_origin(callback)
			vim.system({ "git", "fetch", "--quiet", "origin" }, { text = true }, callback)
		end

		local function get_unpulled_commit_count(branch, callback)
			vim.system({ "git", "rev-list", "HEAD..origin/" .. branch, "--count" }, { text = true }, callback)
		end

		local function maybe_send_notification(unpulled_commits, current_remote_hash, current_branch)
			if unpulled_commits and unpulled_commits > 0 then
				last_notified_hash = current_remote_hash
				notify(unpulled_commits .. " unpulled commit(s) on " .. current_branch, "info", {
					title = "Git",
				})
			end
		end

		local function check_unpulled_commits()
			get_current_branch(function(branch_result)
				if branch_result.code ~= 0 then
					return
				end

				local current_branch = branch_result.stdout:match("^%s*(.-)%s*$")
				get_remote_hash(current_branch, function(result)
					if result.code ~= 0 then
						return
					end

					local current_remote_hash = result.stdout:match("^%s*(.-)%s*$")
					if last_notified_hash == current_remote_hash then
						return
					end

					fetch_origin(function(fetch_result)
						if fetch_result.code ~= 0 then
							return
						end

						get_unpulled_commit_count(current_branch, function(rev_result)
							if rev_result.code ~= 0 then
								return
							end

							local unpulled_commits = tonumber(rev_result.stdout)
							maybe_send_notification(unpulled_commits, current_remote_hash, current_branch)
						end)
					end)
				end)
			end)
		end

		timer:start(0, 10000, vim.schedule_wrap(check_unpulled_commits))
	end,
}
